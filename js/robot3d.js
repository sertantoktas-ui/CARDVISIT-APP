/* ============================================================
   RMK Mechatronics — scroll-driven 3D robot showcase
   Loads a glTF/GLB model (assets/models/robot.glb) and rotates
   it as you scroll through the #robot section. If the model or
   WebGL is unavailable, the whole section hides itself so the
   page never shows a broken block.
   ============================================================ */
import * as THREE from 'three';
import { GLTFLoader } from '../assets/vendor/GLTFLoader.js';
import { RoomEnvironment } from '../assets/vendor/RoomEnvironment.js';

(function () {
  'use strict';

  const MODEL_URL = 'assets/models/robot.glb';

  const canvas  = document.getElementById('robotCanvas');
  const section = document.getElementById('robot');
  const loading = document.getElementById('robotLoading');
  if (!canvas || !section) return;

  function hideSection() {
    section.style.display = 'none';
  }

  const reduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

  /* ---------- Renderer ---------- */
  let renderer;
  try {
    renderer = new THREE.WebGLRenderer({ canvas: canvas, antialias: true, alpha: true });
  } catch (e) {
    hideSection();
    return;
  }
  renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
  renderer.toneMapping = THREE.ACESFilmicToneMapping;
  renderer.toneMappingExposure = 1.25;

  const scene = new THREE.Scene();

  // Neutral studio reflections for the metallic PBR materials
  const pmrem = new THREE.PMREMGenerator(renderer);
  scene.environment = pmrem.fromScene(new RoomEnvironment(), 0.04).texture;

  const camera = new THREE.PerspectiveCamera(38, 1, 0.1, 100);
  camera.position.set(0, 0.6, 9);
  camera.lookAt(0, 0, 0);

  /* ---------- Lighting (strong direct light so metals read on black) ---------- */
  scene.add(new THREE.AmbientLight(0xffffff, 0.6));
  scene.add(new THREE.HemisphereLight(0xdfe8ff, 0x101015, 1.0));
  const key = new THREE.DirectionalLight(0xffffff, 3.2);
  key.position.set(5, 8, 6);
  scene.add(key);
  const fill = new THREE.DirectionalLight(0xbfd0ff, 1.4);
  fill.position.set(-6, 3, 4);
  scene.add(fill);
  const rim = new THREE.DirectionalLight(0xffffff, 1.6);
  rim.position.set(0, 4, -6);
  scene.add(rim);
  const front = new THREE.DirectionalLight(0xffffff, 1.2);
  front.position.set(0, 1, 9);
  scene.add(front);
  const redGlow = new THREE.PointLight(0xff2a32, 30, 40, 2);
  redGlow.position.set(-5, 2, 4);
  scene.add(redGlow);

  /* ---------- Groups ---------- */
  const pivot = new THREE.Group();
  scene.add(pivot);
  let mixer = null;
  let loaded = false;

  /* ---------- Load model ---------- */
  const loader = new GLTFLoader();
  loader.load(
    MODEL_URL,
    function (gltf) {
      const model = gltf.scene;
      model.updateWorldMatrix(true, true);

      // Box3.setFromObject() over-inflates SkinnedMesh bounds, so build the
      // box from each geometry's rest-pose bounding box instead.
      const box = new THREE.Box3();
      const tmp = new THREE.Box3();
      model.traverse(function (o) {
        if (o.isMesh && o.geometry) {
          if (!o.geometry.boundingBox) o.geometry.computeBoundingBox();
          tmp.copy(o.geometry.boundingBox).applyMatrix4(o.matrixWorld);
          box.union(tmp);
        }
      });

      const size = box.getSize(new THREE.Vector3());
      const center = box.getCenter(new THREE.Vector3());
      const maxDim = Math.max(size.x, size.y, size.z) || 1;

      // Wrap the model so we can centre and scale it without fighting the
      // model's own (possibly skinned) transforms.
      const holder = new THREE.Group();
      holder.add(model);
      model.position.sub(center);
      holder.scale.setScalar(4.2 / maxDim);
      holder.position.y = 0.3;
      pivot.add(holder);

      // Play an embedded animation if the model has one
      if (gltf.animations && gltf.animations.length) {
        mixer = new THREE.AnimationMixer(model);
        mixer.clipAction(gltf.animations[0]).play();
      }

      loaded = true;
      if (loading) loading.classList.add('hidden');
      computeProgress();
    },
    function (xhr) {
      if (loading && xhr.total) {
        const pct = Math.round((xhr.loaded / xhr.total) * 100);
        const label = loading.querySelector('[data-i18n]');
        if (label) label.textContent = label.textContent.replace(/\s*\d+%$/, '') + ' ' + pct + '%';
      }
    },
    function (err) {
      console.warn('[robot3d] model could not be loaded:', err);
      hideSection();
    }
  );

  /* ---------- Scroll progress ---------- */
  let progress = 0;
  function computeProgress() {
    const total = section.offsetHeight - window.innerHeight;
    const passed = Math.min(Math.max(-section.getBoundingClientRect().top, 0), Math.max(total, 1));
    progress = total > 0 ? passed / total : 0;
  }
  window.addEventListener('scroll', computeProgress, { passive: true });
  computeProgress();

  /* ---------- Sizing ---------- */
  function resize() {
    const w = canvas.clientWidth || section.clientWidth;
    const h = canvas.clientHeight || window.innerHeight;
    renderer.setSize(w, h, false);
    camera.aspect = w / h;
    camera.updateProjectionMatrix();
  }
  window.addEventListener('resize', resize);
  resize();

  /* ---------- Render loop (gated to viewport) ---------- */
  const clock = new THREE.Clock();
  let active = true;
  let idleAngle = 0;
  new IntersectionObserver(function (entries) {
    active = entries[0].isIntersecting;
    if (active) clock.getDelta();
  }, { threshold: 0 }).observe(section);

  function frame() {
    requestAnimationFrame(frame);
    if (!active || !loaded) return;

    const dt = clock.getDelta();
    if (mixer) mixer.update(dt);

    // gentle idle drift, plus a full turn driven by scroll
    idleAngle += reduced ? 0 : dt * 0.25;
    pivot.rotation.set(-0.05 + progress * 0.1, idleAngle + progress * Math.PI * 2, 0);

    camera.position.z = 9 - progress * 1.0;
    camera.lookAt(0, 0.2, 0);

    renderer.render(scene, camera);
  }
  frame();
})();
