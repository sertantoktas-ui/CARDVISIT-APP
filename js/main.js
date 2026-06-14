/* ============================================================
   RMK Mechatronics — interactions & bilingual (TR/EN) content
   ============================================================ */
(function () {
  'use strict';

  /* ---------- Translations ---------- */
  const I18N = {
    tr: {
      'meta.desc': 'RMK Mechatronics; endüstriyel otomasyon, robotik sistemler ve özel makine çözümleri sunan bir mekatronik mühendislik firmasıdır.',
      'nav.about': 'Hakkımızda',
      'nav.solutions': 'Çözümler',
      'nav.model': 'Redüktör',
      'nav.robot': 'Robot',
      'nav.process': 'Süreç',
      'nav.sectors': 'Sektörler',
      'nav.team': 'Ekip',
      'nav.contact': 'İletişim',

      'model.eyebrow': '// 3B model',
      'model.title': 'Redüktörü her açıdan keşfedin',
      'model.intro': 'Sayfayı kaydırdıkça redüktör döner, dişliler hızlanır ve teknik veriler canlanır.',
      'model.s1k': 'Çevrim oranı',
      'model.s2k': 'Giriş devri',
      'model.s3k': 'Çıkış devri',
      'model.s4k': 'Çıkış torku',
      'model.rpm': 'dev/dk',

      'robot.eyebrow': '// Robotik',
      'robot.title': 'Ağır hizmet robotu, her açıdan',
      'robot.intro': 'Sayfayı kaydırdıkça robot 360° döner; her detayını inceleyin.',
      'robot.loading': 'Model yükleniyor…',

      'hero.eyebrow': '// Mekatronik mühendislik',
      'hero.title': 'Mühendislikle <span class="accent">hareket</span> veriyoruz',
      'hero.lead': 'Endüstriyel otomasyon, robotik sistemler ve özel makine çözümleriyle üretiminizi geleceğe taşıyoruz.',
      'hero.cta1': 'Çözümlerimiz',
      'hero.cta2': 'Teklif alın',
      'hero.scroll': 'Aşağı kaydır',

      'stats.years': 'Yıllık tecrübe',
      'stats.projects': 'Tamamlanan proje',
      'stats.engineers': 'Mühendis & teknisyen',
      'stats.countries': 'Ülkeye ihracat',

      'about.eyebrow': '// Hakkımızda',
      'about.title': 'Mekanik, elektronik ve yazılımı tek çatı altında birleştiriyoruz',
      'about.p1': 'RMK Mechatronics, endüstriyel otomasyon ve mekatronik alanında anahtar teslim çözümler geliştiren bir mühendislik firmasıdır. Mekanik tasarım, elektronik donanım ve kontrol yazılımını tek bir disiplinde buluşturuyoruz.',
      'about.p2': 'Konsept aşamasından devreye almaya kadar tüm süreci kendi bünyemizde yürüterek; verimli, güvenilir ve ölçeklenebilir üretim hatları kuruyoruz.',
      'about.link': 'Çözümlerimizi inceleyin',
      'about.v1t': 'Anahtar teslim',
      'about.v1p': 'Tasarımdan üretime ve devreye almaya kadar uçtan uca tek elden çözüm.',
      'about.v2t': 'Ar-Ge odaklı',
      'about.v2p': 'Kendi mühendislik ekibimizle özgün ve patentlenebilir çözümler üretiyoruz.',
      'about.v3t': 'Endüstri 4.0',
      'about.v3p': 'Veri, IoT ve akıllı kontrol sistemleriyle dijital fabrikalar kuruyoruz.',

      'solutions.eyebrow': '// Çözümler',
      'solutions.title': 'Uçtan uca otomasyon yetkinlikleri',
      'solutions.intro': 'İhtiyacınıza özel tasarlanan, ölçeklenebilir mekatronik sistemler.',
      'solutions.s1t': 'Endüstriyel Otomasyon',
      'solutions.s1p': 'Üretim hatları, montaj ve test sistemleri için komple otomasyon çözümleri.',
      'solutions.s2t': 'Robotik Sistemler',
      'solutions.s2p': 'Robot hücreleri, palletleme, kaynak ve malzeme taşıma uygulamaları.',
      'solutions.s3t': 'Özel Makine Tasarımı',
      'solutions.s3p': 'İhtiyaca özel makine ve aparatların mekanik tasarımı ve imalatı.',
      'solutions.s4t': 'PLC & Kontrol Yazılımı',
      'solutions.s4p': 'PLC, SCADA ve HMI programlama ile akıllı kontrol mimarileri.',
      'solutions.s5t': 'Ar-Ge & Prototipleme',
      'solutions.s5p': 'Konsept geliştirme, hızlı prototipleme ve doğrulama testleri.',
      'solutions.s6t': 'Teknik Servis & Bakım',
      'solutions.s6p': 'Devreye alma, periyodik bakım, yedek parça ve 7/24 teknik destek.',

      'process.eyebrow': '// Nasıl çalışıyoruz',
      'process.title': 'Konsepten devreye alıma',
      'process.intro': 'Her projeyi disiplinli ve şeffaf beş adımda hayata geçiriyoruz.',
      'process.p1t': 'Analiz & Danışmanlık',
      'process.p1p': 'İhtiyaçların belirlenmesi, fizibilite ve teknik danışmanlık.',
      'process.p2t': 'Tasarım & Mühendislik',
      'process.p2p': 'Mekanik, elektronik ve yazılım tasarımı; simülasyon.',
      'process.p3t': 'Üretim & Montaj',
      'process.p3p': 'İmalat, montaj ve fabrika içi test (FAT).',
      'process.p4t': 'Devreye Alma',
      'process.p4p': 'Sahada kurulum, devreye alma ve operatör eğitimi.',
      'process.p5t': 'Destek & Bakım',
      'process.p5p': 'Garanti, periyodik bakım ve sürekli teknik destek.',

      'sectors.eyebrow': '// Sektörler',
      'sectors.title': 'Hizmet verdiğimiz endüstriler',
      'sectors.intro': 'Farklı sektörlerin zorlu üretim ihtiyaçlarına çözüm üretiyoruz.',

      'team.eyebrow': '// Ekip',
      'team.title': 'Çözüm üreten mühendisler',
      'team.intro': 'Mekatronik, yazılım ve üretim disiplinlerinden deneyimli bir ekip.',
      'team.r1': 'Kurucu & Genel Müdür',
      'team.r2': 'Ar-Ge Direktörü',
      'team.r3': 'Otomasyon Müdürü',
      'team.r4': 'Proje & Satış Direktörü',

      'contact.eyebrow': '// İletişim',
      'contact.title': 'Projenizi konuşalım',
      'contact.intro': 'Otomasyon ihtiyaçlarınız, teklif talepleri ve iş birlikleri için bize ulaşın.',
      'contact.hq': 'Merkez',
      'contact.email': 'E-posta',
      'contact.phone': 'Telefon',
      'form.name': 'Ad Soyad',
      'form.email': 'E-posta',
      'form.subject': 'Konu',
      'form.message': 'Mesajınız',
      'form.submit': 'Gönder',
      'form.note': 'Teşekkürler! Mesajınız alındı, en kısa sürede dönüş yapacağız.',

      'footer.tag': 'Mühendislikle hareket veriyoruz.',
      'footer.rights': 'Tüm hakları saklıdır.',
      'footer.privacy': 'Gizlilik Politikası',
      'footer.terms': 'Kullanım Koşulları'
    },
    en: {
      'meta.desc': 'RMK Mechatronics is a mechatronics engineering company delivering industrial automation, robotic systems and custom machinery solutions.',
      'nav.about': 'About',
      'nav.solutions': 'Solutions',
      'nav.model': 'Reducer',
      'nav.robot': 'Robot',
      'nav.process': 'Process',
      'nav.sectors': 'Industries',
      'nav.team': 'Team',
      'nav.contact': 'Contact',

      'model.eyebrow': '// 3D model',
      'model.title': 'Explore the reducer from every angle',
      'model.intro': 'Scroll the page to rotate the reducer, spin up the gears and bring its technical data to life.',
      'model.s1k': 'Gear ratio',
      'model.s2k': 'Input speed',
      'model.s3k': 'Output speed',
      'model.s4k': 'Output torque',
      'model.rpm': 'rpm',

      'robot.eyebrow': '// Robotics',
      'robot.title': 'Heavy-duty robot, from every angle',
      'robot.intro': 'Scroll the page to spin the robot a full 360° and inspect every detail.',
      'robot.loading': 'Loading model…',

      'hero.eyebrow': '// Mechatronics engineering',
      'hero.title': 'Engineering <span class="accent">motion</span> into industry',
      'hero.lead': 'We move your production into the future with industrial automation, robotic systems and custom machinery.',
      'hero.cta1': 'Our solutions',
      'hero.cta2': 'Request a quote',
      'hero.scroll': 'Scroll down',

      'stats.years': 'Years of experience',
      'stats.projects': 'Completed projects',
      'stats.engineers': 'Engineers & technicians',
      'stats.countries': 'Export countries',

      'about.eyebrow': '// About us',
      'about.title': 'We unite mechanics, electronics and software under one roof',
      'about.p1': 'RMK Mechatronics is an engineering firm developing turnkey solutions in industrial automation and mechatronics. We bring mechanical design, electronic hardware and control software together into a single discipline.',
      'about.p2': 'By running the entire process in-house — from concept to commissioning — we build efficient, reliable and scalable production lines.',
      'about.link': 'Explore our solutions',
      'about.v1t': 'Turnkey delivery',
      'about.v1p': 'End-to-end solutions from design to manufacturing and commissioning.',
      'about.v2t': 'R&D driven',
      'about.v2p': 'We create original, patentable solutions with our own engineering team.',
      'about.v3t': 'Industry 4.0',
      'about.v3p': 'We build digital factories with data, IoT and smart control systems.',

      'solutions.eyebrow': '// Solutions',
      'solutions.title': 'End-to-end automation capabilities',
      'solutions.intro': 'Scalable mechatronic systems designed specifically for your needs.',
      'solutions.s1t': 'Industrial Automation',
      'solutions.s1p': 'Complete automation solutions for production lines, assembly and testing.',
      'solutions.s2t': 'Robotic Systems',
      'solutions.s2p': 'Robot cells, palletizing, welding and material-handling applications.',
      'solutions.s3t': 'Custom Machine Design',
      'solutions.s3p': 'Mechanical design and manufacturing of bespoke machines and fixtures.',
      'solutions.s4t': 'PLC & Control Software',
      'solutions.s4p': 'Smart control architectures with PLC, SCADA and HMI programming.',
      'solutions.s5t': 'R&D & Prototyping',
      'solutions.s5p': 'Concept development, rapid prototyping and validation testing.',
      'solutions.s6t': 'Service & Maintenance',
      'solutions.s6p': 'Commissioning, preventive maintenance, spare parts and 24/7 support.',

      'process.eyebrow': '// How we work',
      'process.title': 'From concept to commissioning',
      'process.intro': 'We deliver every project in five disciplined, transparent steps.',
      'process.p1t': 'Analysis & Consulting',
      'process.p1p': 'Requirement definition, feasibility and technical consulting.',
      'process.p2t': 'Design & Engineering',
      'process.p2p': 'Mechanical, electronic and software design; simulation.',
      'process.p3t': 'Manufacturing & Assembly',
      'process.p3p': 'Production, assembly and factory acceptance testing (FAT).',
      'process.p4t': 'Commissioning',
      'process.p4p': 'On-site installation, commissioning and operator training.',
      'process.p5t': 'Support & Maintenance',
      'process.p5p': 'Warranty, preventive maintenance and continuous technical support.',

      'sectors.eyebrow': '// Industries',
      'sectors.title': 'Industries we serve',
      'sectors.intro': 'We solve the demanding production needs of diverse industries.',

      'team.eyebrow': '// Team',
      'team.title': 'Engineers who deliver solutions',
      'team.intro': 'An experienced team across mechatronics, software and manufacturing.',
      'team.r1': 'Founder & General Manager',
      'team.r2': 'R&D Director',
      'team.r3': 'Automation Manager',
      'team.r4': 'Project & Sales Director',

      'contact.eyebrow': '// Contact',
      'contact.title': 'Let’s talk about your project',
      'contact.intro': 'Reach out for your automation needs, quote requests and partnerships.',
      'contact.hq': 'Headquarters',
      'contact.email': 'Email',
      'contact.phone': 'Phone',
      'form.name': 'Full name',
      'form.email': 'Email',
      'form.subject': 'Subject',
      'form.message': 'Your message',
      'form.submit': 'Send',
      'form.note': 'Thank you! Your message has been received and we will get back to you shortly.',

      'footer.tag': 'Engineering motion into industry.',
      'footer.rights': 'All rights reserved.',
      'footer.privacy': 'Privacy Policy',
      'footer.terms': 'Terms of Use'
    }
  };

  /* Allow limited inline markup (the <span class="accent">) for these keys */
  const HTML_KEYS = new Set(['hero.title']);

  /* Industries — bilingual name + short description */
  const SECTORS = [
    { tr: ['Otomotiv', 'Montaj hatları, kaynak ve test otomasyonu.'],
      en: ['Automotive', 'Assembly lines, welding and test automation.'] },
    { tr: ['Beyaz Eşya & Elektronik', 'Yüksek hacimli montaj ve son kontrol sistemleri.'],
      en: ['Appliances & Electronics', 'High-volume assembly and end-of-line control.'] },
    { tr: ['Gıda & İçecek', 'Hijyenik dolum, paketleme ve palletleme hatları.'],
      en: ['Food & Beverage', 'Hygienic filling, packaging and palletizing lines.'] },
    { tr: ['İlaç & Kimya', 'İzlenebilir, regülasyona uyumlu üretim hücreleri.'],
      en: ['Pharma & Chemical', 'Traceable, compliant production cells.'] },
    { tr: ['Savunma & Havacılık', 'Hassas üretim ve özel test düzenekleri.'],
      en: ['Defense & Aerospace', 'Precision manufacturing and custom test rigs.'] },
    { tr: ['Lojistik & Depo', 'Otomatik depolama, sıralama ve taşıma sistemleri.'],
      en: ['Logistics & Warehouse', 'Automated storage, sorting and handling systems.'] }
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
    const revealEls = document.querySelectorAll('.section, .stat, .sol-card, .team-card, .value-card, .proc-step');
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
