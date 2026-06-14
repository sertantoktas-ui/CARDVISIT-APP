# RMK Mekatronik — Kurumsal Web Sitesi / Corporate Website

Endüstriyel otomasyon ve hareket kontrol ürünlerinde dünya markalarının çözüm ortağı
**RMK Mekatronik A.Ş.** için hazırlanmış, **iki dilli (TR/EN)**, koyu temalı ve infografik
ağırlıklı kurumsal tanıtım sitesi. İçerik [rmkmekatronik.com](https://www.rmkmekatronik.com)
verileri esas alınarak hazırlanmıştır.

A **bilingual (TR/EN)**, dark-themed, infographic-oriented corporate website for
**RMK Mekatronik A.Ş.**, a solution partner for world-leading industrial automation
and motion-control brands.

## Özellikler / Features

- 🌐 **İki dilli** — TR/EN dil değiştirici (tercih `localStorage`'da saklanır)
- 🎨 **Marka teması** — siyah arka plan, beyaz yazı, kırmızı vurgu (logo paletine uygun)
- 📊 **İnfografik** — animasyonlu sayaçlar, 5 adımlı süreç zaman çizelgesi, ikonlu çözüm kartları
- 🧩 **3B redüktör** — Three.js ile prosedürel dişli kutusu modeli; sayfa kaydırıldıkça döner, dişliler hızlanır ve giriş/çıkış devri verileri canlı güncellenir (Three.js `assets/vendor/` altında yereldir, CDN gerekmez)
- 📱 **Tam duyarlı** — mobil, tablet ve masaüstü
- ⚡ **Build gerektirmez** — saf HTML/CSS/JS, doğrudan tarayıcıda açılır

## Bölümler / Sections

Hero · Rakamlar (Stats) · Hakkımızda (About) · Çözümler (Solutions) · Süreç (Process) ·
Sektörler (Industries) · Ekip (Team) · İletişim (Contact) · Footer

## Çalıştırma / Running

```bash
python3 -m http.server 8000
# tarayıcıda: http://localhost:8000
```

Ya da `index.html` dosyasını doğrudan tarayıcıda açın.

## Dosya Yapısı / Structure

```
index.html            # Sayfa içeriği ve yapısı
css/styles.css        # Koyu tema (siyah/beyaz/kırmızı) stiller
js/main.js            # Etkileşimler + TR/EN çeviriler + sektör verisi
assets/logo-white.png # Siyah zemin için beyaz logo (kırmızı R)
assets/logo.png       # Orijinal logo
assets/favicon.svg    # Favicon
```

## İçeriği Düzenleme / Editing Content

- Metinler ve çeviriler: `js/main.js` içindeki `I18N` nesnesi.
- Sektörler: `js/main.js` içindeki `SECTORS` dizisi · Markalar: `BRANDS` dizisi.
- İletişim bilgileri: `index.html` içindeki iletişim bölümü.
- Renkler: `css/styles.css` içindeki `:root` değişkenleri (`--red`, `--black` vb.).

> Not: Şirket bilgileri (ürünler, markalar, ofisler, telefon, e-posta) rmkmekatronik.com
> sitesinden alınmıştır. İstatistik rozetleri (13+ marka, 13 kategori vb.) sitedeki ürün
> listelerinden türetilmiş yaklaşık değerlerdir.
