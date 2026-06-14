/* ============================================================
   RMK Mechatronics — scroll-driven 3D reducer (gearbox)
   Procedural Three.js model. Scrolling through the #model
   section rotates the assembly, spins up the gear train and
   updates the live input/output speed readouts.
   ============================================================ */
import * as THREE from 'three';

(function () {
  'use strict';

  const canvas  = document.getElementById('reducerCanvas');
  const section = document.getElementById('model');
  if (!canvas || !section || typeof THREE === 'undefined') return;

  const reduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

  /* ---------- Renderer / scene / camera ---------- */
  const renderer = new THREE.WebGLRenderer({ canvas, antialias: true, alpha: true });
  renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
  renderer.toneMapping = THREE.ACESFilmicToneMapping;
  renderer.toneMappingExposure = 1.05;

  const scene = new THREE.Scene();

  const camera = new THREE.PerspectiveCamera(40, 1, 0.1, 100);
  camera.position.set(0, 0.4, 9.5);
  camera.lookAt(0, 0, 0);

  /* ---------- Lighting ---------- */
  scene.add(new THREE.AmbientLight(0xffffff, 0.55));
  scene.add(new THREE.HemisphereLight(0xcdddff, 0x080808, 0.7));

  const key = new THREE.DirectionalLight(0xffffff, 2.4);
  key.position.set(6, 9, 7);
  scene.add(key);

  const rim = new THREE.DirectionalLight(0xffffff, 0.7);
  rim.position.set(-7, 2, -5);
  scene.add(rim);

  const redGlow = new THREE.PointLight(0xff2a32, 26, 40, 2);
  redGlow.position.set(-5, 1.5, 5);
  scene.add(redGlow);

  /* ---------- Materials ---------- */
  const steel = new THREE.MeshStandardMaterial({ color: 0x52565f, metalness: 0.95, roughness: 0.34 });
  const steelLight = new THREE.MeshStandardMaterial({ color: 0x7b818b, metalness: 0.9, roughness: 0.3 });
  const steelDark = new THREE.MeshStandardMaterial({ color: 0x26282d, metalness: 0.75, roughness: 0.55 });
  const redMat = new THREE.MeshStandardMaterial({
    color: 0xd9262e, metalness: 0.6, roughness: 0.3,
    emissive: 0x350608, emissiveIntensity: 0.5
  });

  /* ---------- Gear builder ---------- */
  function makeGear(teeth, pitchR, depth, bore, material) {
    const toothH = pitchR * 0.16;
    const rOut = pitchR + toothH * 0.5;
    const rRoot = pitchR - toothH * 0.5;
    const shape = new THREE.Shape();
    const step = (Math.PI * 2) / teeth;

    for (let i = 0; i < teeth; i++) {
      const a = i * step;
      const pts = [
        [rRoot, a],
        [rOut,  a + step * 0.22],
        [rOut,  a + step * 0.40],
        [rRoot, a + step * 0.62],
        [rRoot, a + step]
      ];
      pts.forEach(function (p, idx) {
        const x = Math.cos(p[1]) * p[0];
        const y = Math.sin(p[1]) * p[0];
        if (i === 0 && idx === 0) shape.moveTo(x, y);
        else shape.lineTo(x, y);
      });
    }
    const hole = new THREE.Path();
    hole.absarc(0, 0, bore, 0, Math.PI * 2, true);
    shape.holes.push(hole);

    const geo = new THREE.ExtrudeGeometry(shape, {
      depth: depth, bevelEnabled: true,
      bevelThickness: depth * 0.08, bevelSize: depth * 0.08, bevelSegments: 2, curveSegments: 4
    });
    geo.center();
    const mesh = new THREE.Mesh(geo, material);

    // hub ring for a machined look
    const hub = new THREE.Mesh(
      new THREE.CylinderGeometry(bore * 1.7, bore * 1.7, depth * 1.25, 28),
      steelLight
    );
    hub.rotation.x = Math.PI / 2;
    mesh.add(hub);
    return mesh;
  }

  /* ---------- Assembly ---------- */
  const assembly = new THREE.Group();

  const teethA = 12, teethB = 36;
  const pitchA = 0.8;
  const pitchB = pitchA * teethB / teethA;     // keep teeth size equal -> meshing
  const ratio = teethB / teethA;               // 3  ->  i = 3 : 1
  const dist = pitchA + pitchB;                // centre distance

  const gearB = makeGear(teethB, pitchB, 0.7, 0.42, redMat);   // big output gear (accent)
  gearB.position.set(0, 0, 0);

  const ang = THREE.MathUtils.degToRad(138);
  const gearA = makeGear(teethA, pitchA, 0.62, 0.22, steel);   // small input gear
  gearA.position.set(Math.cos(ang) * dist, Math.sin(ang) * dist, 0);

  assembly.add(gearB, gearA);

  // Shafts (cylinders aligned to Z)
  function makeShaft(radius, length, mat) {
    const m = new THREE.Mesh(new THREE.CylinderGeometry(radius, radius, length, 24), mat);
    m.rotation.x = Math.PI / 2;
    return m;
  }
  const shaftB = makeShaft(0.26, 3.0, steelLight); shaftB.position.copy(gearB.position);
  const shaftA = makeShaft(0.15, 3.4, steelLight); shaftA.position.copy(gearA.position);
  assembly.add(shaftB, shaftA);

  // Red end caps on the front of each shaft
  function endCap(radius, mat, ref, z) {
    const c = new THREE.Mesh(new THREE.CylinderGeometry(radius, radius, 0.14, 24), mat);
    c.rotation.x = Math.PI / 2;
    c.position.set(ref.position.x, ref.position.y, z);
    return c;
  }
  assembly.add(endCap(0.30, redMat, gearB, 1.55));
  assembly.add(endCap(0.19, redMat, gearA, 1.75));

  // Bearings (torus) on the front face around each shaft
  function bearing(r, ref, z) {
    const t = new THREE.Mesh(new THREE.TorusGeometry(r, 0.07, 12, 32), steelDark);
    t.position.set(ref.position.x, ref.position.y, z);
    return t;
  }
  assembly.add(bearing(0.42, gearB, 0.42));
  assembly.add(bearing(0.28, gearA, 0.38));

  // Housing block behind the gear train
  const hbW = dist + pitchB + 1.1;
  const hbH = dist + pitchB + 0.6;
  const housing = new THREE.Mesh(new THREE.BoxGeometry(hbW, hbH, 0.7), steelDark);
  housing.position.set(
    (gearA.position.x + gearB.position.x) / 2,
    (gearA.position.y + gearB.position.y) / 2,
    -0.85
  );
  assembly.add(housing);

  // Bolt heads at housing corners
  const bx = hbW / 2 - 0.4, by = hbH / 2 - 0.4;
  [[-1, -1], [1, -1], [-1, 1], [1, 1]].forEach(function (s) {
    const bolt = new THREE.Mesh(new THREE.CylinderGeometry(0.13, 0.13, 0.16, 6), steelLight);
    bolt.rotation.x = Math.PI / 2;
    bolt.position.set(housing.position.x + s[0] * bx, housing.position.y + s[1] * by, -0.48);
    assembly.add(bolt);
  });

  // Centre the assembly between the two gears
  assembly.position.set(
    -(gearA.position.x + gearB.position.x) / 2,
    -(gearA.position.y + gearB.position.y) / 2,
    0
  );
  const pivot = new THREE.Group();
  pivot.add(assembly);
  pivot.rotation.x = -0.18;
  scene.add(pivot);

  /* ---------- Scroll progress ---------- */
  let progress = 0;
  function computeProgress() {
    const rect = section.getBoundingClientRect();
    const total = section.offsetHeight - window.innerHeight;
    const passed = Math.min(Math.max(-rect.top, 0), Math.max(total, 1));
    progress = total > 0 ? passed / total : 0;
  }
  window.addEventListener('scroll', computeProgress, { passive: true });
  computeProgress();

  /* ---------- Live spec readouts ---------- */
  const elIn = document.getElementById('spInput');
  const elOut = document.getElementById('spOutput');
  let lang = document.documentElement.lang === 'en' ? 'en-US' : 'tr-TR';
  const lObs = new MutationObserver(function () {
    lang = document.documentElement.lang === 'en' ? 'en-US' : 'tr-TR';
  });
  lObs.observe(document.documentElement, { attributes: true, attributeFilter: ['lang'] });

  function updateSpecs() {
    const inRpm = Math.round(1500 * progress);
    const outRpm = Math.round(500 * progress);   // 1500 / 3  (i = 3 : 1)
    if (elIn) elIn.textContent = inRpm.toLocaleString(lang);
    if (elOut) elOut.textContent = outRpm.toLocaleString(lang);
  }

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
  let spin = 0;

  new IntersectionObserver(function (entries) {
    active = entries[0].isIntersecting;
    if (active) clock.getDelta();       // drop accumulated time
  }, { threshold: 0 }).observe(section);

  function frame() {
    requestAnimationFrame(frame);
    if (!active) return;

    const dt = clock.getDelta();
    // gears spin up with scroll progress (scroll acts like a throttle)
    const speed = reduced ? 0 : (0.5 + progress * 6.0);
    spin += dt * speed;

    gearB.rotation.z = spin;
    gearA.rotation.z = -spin * ratio + Math.PI / teethA; // counter-rotate, phase for mesh
    shaftB.rotation.y = spin;          // (visual flair on shafts)
    shaftA.rotation.y = -spin * ratio;

    // whole assembly sweeps like a turntable as you scroll, keeping the
    // gear train facing the viewer the whole time
    pivot.rotation.y = -0.6 + progress * 1.25;   // ~ -34° to +38°
    pivot.rotation.x = -0.18 + progress * 0.12;
    camera.position.z = 9.5 - progress * 1.6;
    camera.lookAt(0, 0, 0);

    updateSpecs();
    renderer.render(scene, camera);
  }
  frame();
})();
