/* ============================================================
   RMK Group — interactions & bilingual (TR/EN) content
   ============================================================ */
(function () {
  'use strict';

  /* ---------- Translations ---------- */
  const I18N = {
    tr: {
      'meta.desc': 'RMK Group, enerji, gayrimenkul, teknoloji, sanayi ve finans alanlarında faaliyet gösteren çeşitlendirilmiş bir holding şirketidir.',
      'brand.sub': 'GROUP',
      'nav.about': 'Hakkımızda',
      'nav.sectors': 'Sektörler',
      'nav.portfolio': 'Portföy',
      'nav.leadership': 'Yönetim',
      'nav.sustainability': 'Sürdürülebilirlik',
      'nav.contact': 'İletişim',

      'hero.eyebrow': '1992’den bu yana',
      'hero.title': 'Büyümeye yön veriyoruz',
      'hero.lead': 'Enerji, gayrimenkul, teknoloji, sanayi ve finans alanlarında faaliyet gösteren çeşitlendirilmiş bir holding grubu.',
      'hero.cta1': 'Sektörlerimiz',
      'hero.cta2': 'Bize ulaşın',
      'hero.scroll': 'Keşfet',

      'stats.years': 'Yıllık tecrübe',
      'stats.companies': 'Grup şirketi',
      'stats.employees': 'Çalışan',
      'stats.countries': 'Ülkede faaliyet',

      'about.eyebrow': 'Hakkımızda',
      'about.title': 'Nesiller boyu değer üreten bir grup',
      'about.p1': 'RMK Group, 1992 yılında kurulduğu günden bu yana farklı sektörlerde faaliyet gösteren şirketleriyle Türkiye ve uluslararası pazarlarda sürdürülebilir büyümeye odaklanmaktadır.',
      'about.p2': 'Disiplinli sermaye yönetimi, uzun vadeli ortaklık anlayışı ve operasyonel mükemmellik ilkeleriyle; portföyümüzdeki şirketlerin potansiyelini açığa çıkarıyor, istihdam ve katma değer yaratıyoruz.',
      'about.link': 'Yönetim ekibimizle tanışın',
      'about.v1t': 'Uzun vadeli bakış',
      'about.v1p': 'Kısa vadeli kazançlar yerine kalıcı değer yaratmayı hedefliyoruz.',
      'about.v2t': 'Operasyonel güç',
      'about.v2p': 'Şirketlerimize sermayenin ötesinde stratejik ve operasyonel destek sağlıyoruz.',
      'about.v3t': 'Sorumlu büyüme',
      'about.v3p': 'Çevresel ve sosyal sorumluluğu iş modelimizin merkezine yerleştiriyoruz.',

      'sectors.eyebrow': 'Faaliyet alanlarımız',
      'sectors.title': 'Çeşitlendirilmiş bir portföy',
      'sectors.intro': 'Birbirini tamamlayan altı temel sektörde faaliyet göstererek riski dengeliyor ve sürdürülebilir büyümeyi destekliyoruz.',
      'sectors.s1t': 'Enerji',
      'sectors.s1p': 'Yenilenebilir enerji üretimi, dağıtım ve enerji verimliliği çözümleri.',
      'sectors.s2t': 'İnşaat & Gayrimenkul',
      'sectors.s2p': 'Karma kullanımlı projeler, altyapı ve gayrimenkul geliştirme.',
      'sectors.s3t': 'Teknoloji',
      'sectors.s3p': 'Yazılım, dijital platformlar ve teknoloji girişimlerine yatırım.',
      'sectors.s4t': 'Sanayi & Üretim',
      'sectors.s4p': 'İleri üretim, otomotiv tedarik ve endüstriyel ürünler.',
      'sectors.s5t': 'Finansal Hizmetler',
      'sectors.s5p': 'Varlık yönetimi, sigorta ve finansal teknoloji yatırımları.',
      'sectors.s6t': 'Turizm & Hizmet',
      'sectors.s6p': 'Konaklama, perakende ve hizmet sektöründe öncü markalar.',

      'portfolio.eyebrow': 'Portföyümüz',
      'portfolio.title': 'Birlikte büyüdüğümüz şirketler',
      'portfolio.intro': 'Her biri kendi alanında lider olan grup şirketlerimizden bazıları.',

      'leadership.eyebrow': 'Yönetim',
      'leadership.title': 'Deneyimli liderlik',
      'leadership.intro': 'Grubumuzu yöneten, farklı disiplinlerden gelen güçlü bir ekip.',
      'team.r1': 'Yönetim Kurulu Başkanı',
      'team.r2': 'İcra Kurulu Başkanı (CEO)',
      'team.r3': 'Mali İşler Direktörü (CFO)',
      'team.r4': 'Strateji ve Yatırımlar Direktörü',

      'sustain.eyebrow': 'Sürdürülebilirlik',
      'sustain.title': 'Geleceğe sorumlulukla yatırım',
      'sustain.p1': 'İklim hedeflerimiz, sosyal etki programlarımız ve şeffaf yönetişim ilkelerimizle (ESG) sadece bugünü değil yarını da inşa ediyoruz.',
      'sustain.l1': '2030’a kadar karbon nötr operasyonlar',
      'sustain.l2': 'Yenilenebilir enerji kapasitesinde sürekli artış',
      'sustain.l3': 'Toplumsal kalkınma ve eğitim programları',
      'sustain.l4': 'Şeffaf ve hesap verebilir kurumsal yönetişim',
      'sustain.m1': 'Yenilenebilir elektrik hedefi',
      'sustain.m2': 'Yıllık fidan dikimi',
      'sustain.m3': 'Kadın çalışan oranı',

      'contact.eyebrow': 'İletişim',
      'contact.title': 'Birlikte değer yaratalım',
      'contact.intro': 'İş birliği, yatırım ve kariyer fırsatları için bizimle iletişime geçin.',
      'contact.hq': 'Genel Merkez',
      'contact.email': 'E-posta',
      'contact.phone': 'Telefon',
      'form.name': 'Ad Soyad',
      'form.email': 'E-posta',
      'form.subject': 'Konu',
      'form.message': 'Mesajınız',
      'form.submit': 'Gönder',
      'form.note': 'Teşekkürler! Mesajınız alındı, en kısa sürede dönüş yapacağız.',

      'footer.tag': 'Büyümeye yön veriyoruz.',
      'footer.rights': 'Tüm hakları saklıdır.',
      'footer.privacy': 'Gizlilik Politikası',
      'footer.terms': 'Kullanım Koşulları'
    },
    en: {
      'meta.desc': 'RMK Group is a diversified holding company operating across energy, real estate, technology, industry and finance.',
      'brand.sub': 'GROUP',
      'nav.about': 'About',
      'nav.sectors': 'Sectors',
      'nav.portfolio': 'Portfolio',
      'nav.leadership': 'Leadership',
      'nav.sustainability': 'Sustainability',
      'nav.contact': 'Contact',

      'hero.eyebrow': 'Since 1992',
      'hero.title': 'Driving growth forward',
      'hero.lead': 'A diversified holding group operating across energy, real estate, technology, industry and finance.',
      'hero.cta1': 'Our sectors',
      'hero.cta2': 'Get in touch',
      'hero.scroll': 'Explore',

      'stats.years': 'Years of experience',
      'stats.companies': 'Group companies',
      'stats.employees': 'Employees',
      'stats.countries': 'Countries of operation',

      'about.eyebrow': 'About us',
      'about.title': 'A group creating value across generations',
      'about.p1': 'Since its founding in 1992, RMK Group has focused on sustainable growth in Turkey and international markets through companies operating across diverse sectors.',
      'about.p2': 'With disciplined capital management, a long-term partnership mindset and operational excellence, we unlock the potential of our portfolio companies while creating employment and lasting value.',
      'about.link': 'Meet our leadership team',
      'about.v1t': 'Long-term vision',
      'about.v1p': 'We aim to build enduring value rather than chase short-term gains.',
      'about.v2t': 'Operational strength',
      'about.v2p': 'We support our companies with strategic and operational expertise beyond capital.',
      'about.v3t': 'Responsible growth',
      'about.v3p': 'We place environmental and social responsibility at the heart of our model.',

      'sectors.eyebrow': 'What we do',
      'sectors.title': 'A diversified portfolio',
      'sectors.intro': 'Operating across six complementary core sectors, we balance risk and support sustainable growth.',
      'sectors.s1t': 'Energy',
      'sectors.s1p': 'Renewable power generation, distribution and energy-efficiency solutions.',
      'sectors.s2t': 'Construction & Real Estate',
      'sectors.s2p': 'Mixed-use developments, infrastructure and real estate development.',
      'sectors.s3t': 'Technology',
      'sectors.s3p': 'Investment in software, digital platforms and technology ventures.',
      'sectors.s4t': 'Industry & Manufacturing',
      'sectors.s4p': 'Advanced manufacturing, automotive supply and industrial products.',
      'sectors.s5t': 'Financial Services',
      'sectors.s5p': 'Asset management, insurance and fintech investments.',
      'sectors.s6t': 'Tourism & Services',
      'sectors.s6p': 'Leading brands in hospitality, retail and the service sector.',

      'portfolio.eyebrow': 'Our portfolio',
      'portfolio.title': 'Companies we grow together',
      'portfolio.intro': 'A selection of our group companies, each a leader in its field.',

      'leadership.eyebrow': 'Leadership',
      'leadership.title': 'Experienced leadership',
      'leadership.intro': 'A strong team from diverse disciplines leading our group.',
      'team.r1': 'Chairman of the Board',
      'team.r2': 'Chief Executive Officer (CEO)',
      'team.r3': 'Chief Financial Officer (CFO)',
      'team.r4': 'Director of Strategy & Investments',

      'sustain.eyebrow': 'Sustainability',
      'sustain.title': 'Investing responsibly in the future',
      'sustain.p1': 'Through our climate goals, social impact programs and transparent governance principles (ESG), we build not only today but tomorrow.',
      'sustain.l1': 'Carbon-neutral operations by 2030',
      'sustain.l2': 'Continuous growth in renewable energy capacity',
      'sustain.l3': 'Community development and education programs',
      'sustain.l4': 'Transparent and accountable corporate governance',
      'sustain.m1': 'Renewable electricity target',
      'sustain.m2': 'Trees planted annually',
      'sustain.m3': 'Female workforce ratio',

      'contact.eyebrow': 'Contact',
      'contact.title': 'Let’s create value together',
      'contact.intro': 'Reach out to us for collaboration, investment and career opportunities.',
      'contact.hq': 'Headquarters',
      'contact.email': 'Email',
      'contact.phone': 'Phone',
      'form.name': 'Full name',
      'form.email': 'Email',
      'form.subject': 'Subject',
      'form.message': 'Your message',
      'form.submit': 'Send',
      'form.note': 'Thank you! Your message has been received and we will get back to you shortly.',

      'footer.tag': 'Driving growth forward.',
      'footer.rights': 'All rights reserved.',
      'footer.privacy': 'Privacy Policy',
      'footer.terms': 'Terms of Use'
    }
  };

  /* Portfolio companies — name + sector tag key */
  const COMPANIES = [
    { name: 'RMK Enerji',    tagKey: 'sectors.s1t' },
    { name: 'RMK İnşaat',    tagKey: 'sectors.s2t' },
    { name: 'RMK Tech',      tagKey: 'sectors.s3t' },
    { name: 'RMK Sanayi',    tagKey: 'sectors.s4t' },
    { name: 'RMK Finans',    tagKey: 'sectors.s5t' },
    { name: 'RMK Turizm',    tagKey: 'sectors.s6t' },
    { name: 'RMK Lojistik',  tagKey: 'sectors.s4t' },
    { name: 'RMK Gayrimenkul', tagKey: 'sectors.s2t' }
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
      } else {
        el.textContent = dict[key];
      }
    });

    // language toggle active state
    document.querySelectorAll('.lang-opt').forEach(function (el) {
      el.classList.toggle('active', el.getAttribute('data-lang') === lang);
    });

    renderPortfolio();
    localStorage.setItem('rmk-lang', lang);
  }

  /* ---------- Portfolio rendering ---------- */
  function renderPortfolio() {
    const grid = document.getElementById('portfolioGrid');
    if (!grid) return;
    const dict = I18N[currentLang] || I18N.tr;
    grid.innerHTML = COMPANIES.map(function (c) {
      return '<div class="logo-cell">' +
             '<span class="logo-name">' + c.name + '</span>' +
             '<span class="logo-tag">' + (dict[c.tagKey] || '') + '</span>' +
             '</div>';
    }).join('');
  }

  /* ---------- Header scroll state ---------- */
  const header = document.getElementById('header');
  function onScroll() {
    if (window.scrollY > 40) header.classList.add('scrolled');
    else header.classList.remove('scrolled');
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
    const revealEls = document.querySelectorAll('.section, .stat, .sector-card, .team-card, .value-card');
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
