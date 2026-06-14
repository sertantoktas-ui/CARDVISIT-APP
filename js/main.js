/* ============================================================
   RMK Mechatronics — interactions & bilingual (TR/EN) content
   ============================================================ */
(function () {
  'use strict';

  /* ---------- Translations ---------- */
  const I18N = {
    tr: {
      'meta.desc': 'RMK Mekatronik A.Ş.; doğrusal hareket sistemleri, redüktörler, servo motorlar, encoder ve endüstriyel otomasyon ürünlerinde dünya markalarının çözüm ortağı.',
      'nav.about': 'Hakkımızda',
      'nav.solutions': 'Ürünler',
      'nav.model': 'Redüktör',
      'nav.robot': 'Robot',
      'nav.process': 'Süreç',
      'nav.sectors': 'Sektörler',
      'nav.brands': 'Markalar',
      'nav.contact': 'İletişim',

      'model.eyebrow': '// 3B model',
      'model.title': 'Redüktörü her açıdan keşfedin',
      'model.intro': 'Güç aktarma ürün grubumuzdan bir örnek: kaydırdıkça redüktör döner, dişliler hızlanır ve teknik veriler canlanır.',
      'model.s1k': 'Çevrim oranı',
      'model.s2k': 'Giriş devri',
      'model.s3k': 'Çıkış devri',
      'model.s4k': 'Çıkış torku',
      'model.rpm': 'dev/dk',

      'robot.eyebrow': '// Robotik',
      'robot.title': 'Robot teknolojisini her açıdan keşfedin',
      'robot.intro': 'Kolaboratif ve endüstriyel robot çözümlerimizden bir örnek; kaydırdıkça robot 360° döner.',
      'robot.loading': 'Model yükleniyor…',

      'hero.eyebrow': '// Endüstriyel otomasyon & hareket kontrol',
      'hero.title': 'Çözüm odaklı <span class="accent">mühendislik</span>',
      'hero.lead': 'Doğrusal hareket sistemleri, redüktörler, servo motorlar ve endüstriyel otomasyon ürünlerinde dünya markalarının çözüm ortağı.',
      'hero.cta1': 'Ürünlerimiz',
      'hero.cta2': 'Teklif alın',
      'hero.scroll': 'Aşağı kaydır',

      'stats.brands': 'Global marka',
      'stats.categories': 'Ürün kategorisi',
      'stats.offices': 'Ofis · Bursa & İstanbul',
      'stats.support': 'Teknik destek',

      'about.eyebrow': '// Hakkımızda',
      'about.title': 'Makine ve elektroniğin olduğu her yerde en iyi çözüm',
      'about.p1': 'RMK Mekatronik, dünya lideri markaların global deneyimini yerel uzmanlıkla buluşturan, çözüm odaklı bir mühendislik firmasıdır. Endüstriyel otomasyon ve hareket kontrol ürünlerinde geniş bir yelpaze sunuyoruz.',
      'about.p2': 'Şeffaflık ve sosyal sorumluluk ilkeleriyle; sektörün ihtiyaçlarını belirleyip karşılayarak, hizmet kalitesini ürün çeşitliliği, verimlilik ve sadelikle birleştiriyoruz.',
      'about.link': 'Ürünlerimizi inceleyin',
      'about.v1t': 'Ürün çeşitliliği',
      'about.v1p': 'Dünya lideri markaların geniş ürün yelpazesiyle her ihtiyaca tek adres.',
      'about.v2t': 'Mühendislik desteği',
      'about.v2p': 'Doğru ürün seçiminden uygulamaya kadar çözüm odaklı teknik danışmanlık.',
      'about.v3t': 'Yetkili servis',
      'about.v3p': 'HSD Mechatronic yetkili servis merkezi ve sürekli teknik destek.',

      'solutions.eyebrow': '// Ürünler',
      'solutions.title': 'Hareket kontrol & otomasyon ürünleri',
      'solutions.intro': 'Dünya lideri markaların geniş ürün yelpazesiyle her ihtiyaca çözüm sunuyoruz.',
      'solutions.s1t': 'Doğrusal Hareket Sistemleri',
      'solutions.s1p': 'Lineer kızak, vidalı mil ve aktüatörler — THK, Nadella, Tolomatic.',
      'solutions.s2t': 'Kolaboratif Robotlar',
      'solutions.s2p': 'İş birlikçi robot (cobot) çözümleri — Dobot.',
      'solutions.s3t': 'Redüktörler & Güç Aktarma',
      'solutions.s3p': 'Planet, helisel ve servo redüktörler — Sumitomo, Neugart, Güdel.',
      'solutions.s4t': 'Servo Motor & Sürücüler',
      'solutions.s4p': 'Servo motor, sürücü ve hareket kontrol sistemleri — Yaskawa.',
      'solutions.s5t': 'Encoder & Ölçüm Sistemleri',
      'solutions.s5p': 'Artımsal ve mutlak enkoderler, ölçüm sistemleri — Kübler.',
      'solutions.s6t': 'Yetkili Servis & Teknik Destek',
      'solutions.s6p': 'HSD Mechatronic yetkili servisi, yedek parça ve uygulama desteği.',

      'process.eyebrow': '// Nasıl çalışıyoruz',
      'process.title': 'İhtiyaçtan teslimata',
      'process.intro': 'Doğru ürünü seçmekten devreye almaya kadar her adımda yanınızdayız.',
      'process.p1t': 'İhtiyaç Analizi',
      'process.p1p': 'Uygulamanın incelenmesi ve teknik danışmanlık.',
      'process.p2t': 'Ürün & Çözüm Seçimi',
      'process.p2p': 'Doğru marka ve ürünün mühendislik desteğiyle belirlenmesi.',
      'process.p3t': 'Teklif & Tedarik',
      'process.p3p': 'Hızlı teklif, stok ve zamanında tedarik.',
      'process.p4t': 'Devreye Alma',
      'process.p4p': 'Kurulum, devreye alma ve kullanıcı eğitimi.',
      'process.p5t': 'Servis & Destek',
      'process.p5p': 'Yetkili servis, yedek parça ve sürekli teknik destek.',

      'sectors.eyebrow': '// Sektörler',
      'sectors.title': 'Çözüm sunduğumuz sektörler',
      'sectors.intro': 'Hareket ve otomasyonun olduğu her alanda doğru ürünü sağlıyoruz.',

      'brands.eyebrow': '// Markalar',
      'brands.title': 'Temsil ettiğimiz dünya markaları',
      'brands.intro': 'Hareket kontrol ve otomasyon alanında dünya lideri üreticilerin çözüm ortağıyız.',

      'contact.eyebrow': '// İletişim',
      'contact.title': 'İhtiyacınızı konuşalım',
      'contact.intro': 'Ürün, teklif ve teknik destek talepleriniz için bize ulaşın.',
      'contact.hq': 'Merkez · Bursa',
      'contact.ist': 'İstanbul Ofisi',
      'contact.email': 'E-posta',
      'contact.phone': 'Telefon',
      'form.name': 'Ad Soyad',
      'form.email': 'E-posta',
      'form.subject': 'Konu',
      'form.message': 'Mesajınız',
      'form.submit': 'Gönder',
      'form.note': 'Teşekkürler! Mesajınız alındı, en kısa sürede dönüş yapacağız.',

      'footer.tag': 'Çözüm Odaklı Mühendislik.',
      'footer.rights': 'Tüm hakları saklıdır.',
      'footer.privacy': 'Gizlilik Politikası',
      'footer.terms': 'Kullanım Koşulları'
    },
    en: {
      'meta.desc': 'RMK Mekatronik is the solution partner for world-leading brands in linear motion systems, reducers, servo motors, encoders and industrial automation products.',
      'nav.about': 'About',
      'nav.solutions': 'Products',
      'nav.model': 'Reducer',
      'nav.robot': 'Robot',
      'nav.process': 'Process',
      'nav.sectors': 'Industries',
      'nav.brands': 'Brands',
      'nav.contact': 'Contact',

      'model.eyebrow': '// 3D model',
      'model.title': 'Explore the reducer from every angle',
      'model.intro': 'A sample from our power-transmission range: scroll to rotate the reducer, spin up the gears and reveal its technical data.',
      'model.s1k': 'Gear ratio',
      'model.s2k': 'Input speed',
      'model.s3k': 'Output speed',
      'model.s4k': 'Output torque',
      'model.rpm': 'rpm',

      'robot.eyebrow': '// Robotics',
      'robot.title': 'Explore robotics from every angle',
      'robot.intro': 'A sample of our collaborative and industrial robot solutions; scroll to spin it a full 360°.',
      'robot.loading': 'Loading model…',

      'hero.eyebrow': '// Industrial automation & motion control',
      'hero.title': 'Solution-focused <span class="accent">engineering</span>',
      'hero.lead': 'Your solution partner for world-leading brands in linear motion systems, reducers, servo motors and industrial automation products.',
      'hero.cta1': 'Our products',
      'hero.cta2': 'Request a quote',
      'hero.scroll': 'Scroll down',

      'stats.brands': 'Global brands',
      'stats.categories': 'Product categories',
      'stats.offices': 'Offices · Bursa & İstanbul',
      'stats.support': 'Technical support',

      'about.eyebrow': '// About us',
      'about.title': 'The best solution wherever machines and electronics exist',
      'about.p1': 'RMK Mekatronik is a solution-focused engineering firm that combines the global experience of world-leading brands with local expertise, offering a broad range of industrial automation and motion-control products.',
      'about.p2': 'With transparency and social responsibility, we identify and meet the needs of the sector — uniting service quality with product diversity, efficiency and simplicity.',
      'about.link': 'Explore our products',
      'about.v1t': 'Product diversity',
      'about.v1p': 'A single address for every need, with the broad range of world-leading brands.',
      'about.v2t': 'Engineering support',
      'about.v2p': 'Solution-focused technical consulting from product selection to application.',
      'about.v3t': 'Authorized service',
      'about.v3p': 'HSD Mechatronic authorized service center and continuous technical support.',

      'solutions.eyebrow': '// Products',
      'solutions.title': 'Motion-control & automation products',
      'solutions.intro': 'We meet every need with the broad range of world-leading brands.',
      'solutions.s1t': 'Linear Motion Systems',
      'solutions.s1p': 'Linear guides, ball screws and actuators — THK, Nadella, Tolomatic.',
      'solutions.s2t': 'Collaborative Robots',
      'solutions.s2p': 'Collaborative robot (cobot) solutions — Dobot.',
      'solutions.s3t': 'Reducers & Power Transmission',
      'solutions.s3p': 'Planetary, helical and servo reducers — Sumitomo, Neugart, Güdel.',
      'solutions.s4t': 'Servo Motors & Drives',
      'solutions.s4p': 'Servo motors, drives and motion-control systems — Yaskawa.',
      'solutions.s5t': 'Encoders & Measurement',
      'solutions.s5p': 'Incremental and absolute encoders, measurement systems — Kübler.',
      'solutions.s6t': 'Authorized Service & Support',
      'solutions.s6p': 'HSD Mechatronic authorized service, spare parts and application support.',

      'process.eyebrow': '// How we work',
      'process.title': 'From need to delivery',
      'process.intro': 'We are by your side at every step, from selecting the right product to commissioning.',
      'process.p1t': 'Needs Analysis',
      'process.p1p': 'Reviewing the application and technical consulting.',
      'process.p2t': 'Product & Solution Selection',
      'process.p2p': 'Choosing the right brand and product with engineering support.',
      'process.p3t': 'Quote & Supply',
      'process.p3p': 'Fast quotes, stock and on-time supply.',
      'process.p4t': 'Commissioning',
      'process.p4p': 'Installation, commissioning and user training.',
      'process.p5t': 'Service & Support',
      'process.p5p': 'Authorized service, spare parts and continuous technical support.',

      'sectors.eyebrow': '// Industries',
      'sectors.title': 'Industries we serve',
      'sectors.intro': 'We supply the right products wherever motion and automation exist.',

      'brands.eyebrow': '// Brands',
      'brands.title': 'The world brands we represent',
      'brands.intro': 'We are the solution partner of world-leading manufacturers in motion control and automation.',

      'contact.eyebrow': '// Contact',
      'contact.title': 'Let’s talk about your needs',
      'contact.intro': 'Reach out for product, quote and technical-support requests.',
      'contact.hq': 'Headquarters · Bursa',
      'contact.ist': 'İstanbul Office',
      'contact.email': 'Email',
      'contact.phone': 'Phone',
      'form.name': 'Full name',
      'form.email': 'Email',
      'form.subject': 'Subject',
      'form.message': 'Your message',
      'form.submit': 'Send',
      'form.note': 'Thank you! Your message has been received and we will get back to you shortly.',

      'footer.tag': 'Solution-Focused Engineering.',
      'footer.rights': 'All rights reserved.',
      'footer.privacy': 'Privacy Policy',
      'footer.terms': 'Terms of Use'
    }
  };

  /* Allow limited inline markup (the <span class="accent">) for these keys */
  const HTML_KEYS = new Set(['hero.title']);

  /* Industries — bilingual name + short description */
  const SECTORS = [
    { tr: ['Makine İmalatı', 'Takım tezgâhı ve özel makine üreticileri için bileşenler.'],
      en: ['Machine Building', 'Components for machine tool and special machine builders.'] },
    { tr: ['CNC & Talaşlı İmalat', 'Spindle, lineer kızak ve hassas hareket çözümleri.'],
      en: ['CNC & Machining', 'Spindles, linear guides and precision motion solutions.'] },
    { tr: ['Otomotiv', 'Montaj ve test hatları için servo ve hareket sistemleri.'],
      en: ['Automotive', 'Servo and motion systems for assembly and test lines.'] },
    { tr: ['Ambalaj & Paketleme', 'Yüksek hızlı hareket, vakum ve aktüatör çözümleri.'],
      en: ['Packaging', 'High-speed motion, vacuum and actuator solutions.'] },
    { tr: ['Robotik & Otomasyon', 'Kolaboratif robotlar, encoder ve kontrol bileşenleri.'],
      en: ['Robotics & Automation', 'Collaborative robots, encoders and control components.'] },
    { tr: ['Lojistik & Depo', 'Konveyör, tahrik ve hareket sistemleri.'],
      en: ['Logistics & Warehouse', 'Conveyor, drive and motion systems.'] }
  ];

  /* Brands we represent (authorized solution partner) */
  const BRANDS = [
    'THK', 'Sumitomo', 'Yaskawa', 'Kübler', 'HSD Mechatronics', 'Busch',
    'Nadella', 'Neugart', 'Güdel', 'Tolomatic', 'R+W', 'Dobot',
    'VIPA', 'Teltonika', 'Zimmer', 'Beka-Lube'
  ];

  let currentLang = localStorage.getItem('rmk-lang') || 'tr';

  /* ---------- Apply translations ---------- */
  function applyLang(lang) {
    currentLang = lang;
    const dict = I18N[lang] || I18N.tr;
    document.documentElement.lang = lang;

    document.querySelectorAll('[data-i18n]').forEach(function (el) {
      const key = el.getAttribute('data-i18n');
      if (!(key in dict)) return;
      if (key === 'meta.desc') {
        el.setAttribute('content', dict[key]);
      } else if (HTML_KEYS.has(key)) {
        el.innerHTML = dict[key];
      } else {
        el.textContent = dict[key];
      }
    });

    document.querySelectorAll('.lang-opt').forEach(function (el) {
      el.classList.toggle('active', el.getAttribute('data-lang') === lang);
    });

    renderSectors();
    localStorage.setItem('rmk-lang', lang);
  }

  /* ---------- Brands rendering ---------- */
  function renderBrands() {
    const grid = document.getElementById('brandGrid');
    if (!grid) return;
    grid.innerHTML = BRANDS.map(function (name) {
      return '<div class="brand-cell"><span>' + name + '</span></div>';
    }).join('');
  }

  /* ---------- Sectors rendering ---------- */
  function renderSectors() {
    const grid = document.getElementById('sectorGrid');
    if (!grid) return;
    grid.innerHTML = SECTORS.map(function (s, i) {
      const d = s[currentLang] || s.tr;
      const idx = String(i + 1).padStart(2, '0');
      return '<div class="sector-cell">' +
             '<span class="sector-idx">' + idx + '</span>' +
             '<h3>' + d[0] + '</h3>' +
             '<p>' + d[1] + '</p>' +
             '</div>';
    }).join('');
  }

  /* ---------- Header scroll state ---------- */
  const header = document.getElementById('header');
  function onScroll() {
    header.classList.toggle('scrolled', window.scrollY > 40);
  }

  /* ---------- Mobile menu ---------- */
  const menuBtn = document.getElementById('menuBtn');
  const nav = document.getElementById('nav');
  function closeMenu() {
    nav.classList.remove('open');
    menuBtn.setAttribute('aria-expanded', 'false');
  }

  /* ---------- Counter animation ---------- */
  function animateCount(el) {
    const target = parseInt(el.getAttribute('data-count'), 10);
    const suffix = el.getAttribute('data-suffix') || '';
    if (isNaN(target)) return;
    const dur = 1400;
    const start = performance.now();
    function fmt(n) { return n.toLocaleString(currentLang === 'tr' ? 'tr-TR' : 'en-US'); }
    function tick(now) {
      const p = Math.min((now - start) / dur, 1);
      const eased = 1 - Math.pow(1 - p, 3);
      el.textContent = fmt(Math.round(target * eased)) + suffix;
      if (p < 1) requestAnimationFrame(tick);
    }
    requestAnimationFrame(tick);
  }

  /* ---------- Reveal on scroll + counters ---------- */
  function setupObservers() {
    const revealEls = document.querySelectorAll('.section, .stat, .sol-card, .brand-cell, .value-card, .proc-step');
    revealEls.forEach(function (el) { el.classList.add('reveal'); });

    const io = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (!entry.isIntersecting) return;
        entry.target.classList.add('in');
        io.unobserve(entry.target);
      });
    }, { threshold: 0.12 });
    revealEls.forEach(function (el) { io.observe(el); });

    const counters = document.querySelectorAll('.stat-num[data-count]');
    const co = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (!entry.isIntersecting) return;
        animateCount(entry.target);
        co.unobserve(entry.target);
      });
    }, { threshold: 0.6 });
    counters.forEach(function (el) { co.observe(el); });
  }

  /* ---------- Contact form ---------- */
  function setupForm() {
    const form = document.getElementById('contactForm');
    const note = document.getElementById('formNote');
    if (!form) return;
    form.addEventListener('submit', function (e) {
      e.preventDefault();
      if (!form.checkValidity()) { form.reportValidity(); return; }
      note.hidden = false;
      form.reset();
      setTimeout(function () { note.hidden = true; }, 6000);
    });
  }

  /* ---------- Init ---------- */
  function init() {
    applyLang(currentLang);
    renderBrands();

    document.getElementById('langToggle').addEventListener('click', function () {
      applyLang(currentLang === 'tr' ? 'en' : 'tr');
    });

    window.addEventListener('scroll', onScroll, { passive: true });
    onScroll();

    menuBtn.addEventListener('click', function () {
      const open = nav.classList.toggle('open');
      menuBtn.setAttribute('aria-expanded', String(open));
    });
    nav.querySelectorAll('a').forEach(function (a) {
      a.addEventListener('click', closeMenu);
    });

    const yearEl = document.getElementById('year');
    if (yearEl) yearEl.textContent = new Date().getFullYear();

    setupObservers();
    setupForm();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }
})();
