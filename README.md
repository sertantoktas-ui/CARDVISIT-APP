# RMK Group — Kurumsal Web Sitesi / Corporate Website

Çeşitlendirilmiş bir holding grubu olan **RMK Group** için, [Tres Mares Capital](https://www.tresmarescapital.com/en/)
sitesinden ilham alınarak hazırlanmış modern, duyarlı (responsive) ve **iki dilli (TR/EN)** kurumsal tanıtım sitesi.

A modern, responsive, **bilingual (TR/EN)** corporate website for **RMK Group**, a diversified holding company,
inspired by the Tres Mares Capital site.

## Özellikler / Features

- 🌐 **İki dilli** — TR/EN dil değiştirici (tercih `localStorage`'da saklanır)
- 📱 **Tam duyarlı** — mobil, tablet ve masaüstü
- ⚡ **Build gerektirmez** — saf HTML/CSS/JS, doğrudan tarayıcıda açılır
- ✨ Kaydırmada beliren animasyonlar, sayaç animasyonu, sabit (sticky) başlık
- 🎨 Lacivert + altın renk paleti, zarif tipografi (Manrope + Fraunces)

## Bölümler / Sections

Hero · Rakamlar (Stats) · Hakkımızda (About) · Sektörler (Sectors) · Portföy (Portfolio) ·
Yönetim (Leadership) · Sürdürülebilirlik (Sustainability) · İletişim (Contact) · Footer

## Çalıştırma / Running

Herhangi bir derleme adımı yoktur. Yerelde görüntülemek için:

```bash
# Basit bir statik sunucu (Python)
python3 -m http.server 8000
# ardından tarayıcıda: http://localhost:8000
```

Ya da `index.html` dosyasını doğrudan tarayıcıda açın.

## Dosya Yapısı / Structure

```
index.html        # Sayfa içeriği ve yapısı
css/styles.css    # Tüm stiller
js/main.js        # Etkileşimler + TR/EN çeviriler + içerik
assets/           # favicon vb.
```

## İçeriği Düzenleme / Editing Content

- Metinler ve çeviriler: `js/main.js` içindeki `I18N` nesnesi.
- Portföy şirketleri: `js/main.js` içindeki `COMPANIES` dizisi.
- Renkler: `css/styles.css` içindeki `:root` değişkenleri.

> Not: Şirket bilgileri (kuruluş yılı, çalışan sayısı, iletişim, yönetici isimleri) örnek/placeholder
> niteliğindedir; gerçek RMK Group verileriyle güncellenmelidir.
