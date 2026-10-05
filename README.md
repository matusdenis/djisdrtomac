# DJI SDR Transmission → Mac (OBS)

Use the **DJI SDR Transmission** receiver as a live video source on a Mac – in OBS, and through OBS Virtual Camera in Zoom, Teams, Meet and others. No Windows, no HDMI capture card.

[Slovenská verzia nižšie](#slovensky)

> Not affiliated with or endorsed by DJI. DJI and DJI SDR Transmission are trademarks of SZ DJI Technology Co., Ltd.

## Why
In **PC streaming** mode the receiver sends H.264 video over USB. Windows can read it, macOS cannot. `dji2obs` reads the stream directly over USB and `dji-okno` shows it in a window that OBS captures (end-to-end latency about 0.3 s, measured).

## Requirements
- Mac with Apple Silicon (M1 or newer), macOS 12 or newer
- DJI SDR Transmission receiver with firmware **V01.02.07.05** or newer
- USB-C → USB-A cable (via a USB hub) into the receiver's data/video USB-C port
- OBS Studio

## Files
| File | Purpose |
|---|---|
| `Spustiť DJI → okno.command` | double-click to start |
| `dji2obs` | reads the video from the receiver over USB |
| `dji-okno` | shows the video in a window for OBS |
| `libusb-1.0.dylib` | USB library ([LGPL-2.1](THIRD_PARTY_NOTICES.txt)) |

Keep all files in the same folder.

## Setup
1. Download: **Code → Download ZIP**, unzip.
2. These programs are not signed by Apple, so macOS blocks them after download. Open Terminal in the folder and run:
   ```bash
   xattr -dr com.apple.quarantine . && chmod +x dji2obs dji-okno *.command
   ```
   Only do this if you trust the files.
3. Receiver menu: turn on **PC streaming**. It turns itself off after some menu changes or a restart, so check it if nothing appears.
4. Camera: HDMI output **1080p progressive** (not 1080i). The receiver sends over USB the same frame rate as the camera, for example Sony A7S II = 50p.

## Usage
1. Double-click **`Spustiť DJI → okno.command`** and enter your Mac password. Admin rights are needed to take the USB receiver over from the macOS camera driver.
2. A window "DJI SDR – 1920x1080, 50 fps" opens with the picture.
3. OBS: **Sources → + → macOS Screen Capture → Method: Window Capture → "DJI SDR"**. Keep the window behind OBS and don't minimize it.
4. OBS **Settings → Video → FPS** must match the receiver (for example 50).
5. Webcam for other apps: in OBS click **Start Virtual Camera**, then choose **OBS Virtual Camera** in the app.
6. To stop, press **Ctrl+C** in Terminal.

The FPS is set in the `.command` file (line `FPS=50`) and must match what the receiver shows.

## Troubleshooting
- **"Waiting for receiver"** → PC streaming is off, or there is a USB cable/hub problem.
- **Choppy picture** → check that the FPS matches the camera, and keep the Mac on its charger.
- **OBS shows no windows** → System Settings → Privacy & Security → Screen & System Audio Recording → enable OBS, then restart OBS.

---

<a name="slovensky"></a>
# Slovensky

Prijímač **DJI SDR Transmission** ako zdroj obrazu na Macu – v OBS a cez OBS Virtual Camera aj v Zoome, Teams či Meet. Bez Windows a bez HDMI capture karty.

> Projekt nie je spojený s DJI. DJI a DJI SDR Transmission sú ochranné známky SZ DJI Technology Co., Ltd.

## Požiadavky
- Mac s Apple čipom (M1 a novší), macOS 12 a novší
- prijímač DJI SDR Transmission s firmvérom **V01.02.07.05** alebo novším
- kábel USB-C → USB-A (cez USB hub) do dátového/video USB-C portu prijímača
- OBS Studio

## Príprava
1. Stiahni: **Code → Download ZIP** a rozbaľ.
2. Programy nie sú podpísané Apple, takže ich macOS po stiahnutí blokuje. V Termináli v priečinku spusti:
   ```bash
   xattr -dr com.apple.quarantine . && chmod +x dji2obs dji-okno *.command
   ```
   Urob to len vtedy, ak súborom dôveruješ.
3. Prijímač: v menu zapni **PC streaming**. Po niektorých zmenách v menu alebo po reštarte sa sám vypne, takže ak sa nič neobjaví, skontroluj ho.
4. Kamera: HDMI výstup **1080p progresívne** (nie 1080i). Prijímač posiela cez USB rovnaké fps ako kamera, napríklad Sony A7S II = 50p.

## Použitie
1. Dvojklik na **`Spustiť DJI → okno.command`** a zadaj heslo do Macu. Je potrebné na prevzatie USB prijímača.
2. Otvorí sa okno „DJI SDR – 1920x1080, 50 fps“ s obrazom.
3. OBS: **Zdroje → + → Zachytávanie obrazovky macOS → Metóda: Zachytávanie okna → „DJI SDR“**. Okno nechaj za OBS, neminimalizuj ho.
4. OBS **Nastavenia → Video → FPS** nastav rovnako ako na prijímači (napr. 50).
5. Webkamera pre iné aplikácie: v OBS **Spustiť virtuálnu kameru** a v aplikácii vyber **OBS Virtual Camera**.
6. Koniec: v Termináli stlač **Ctrl+C**.

FPS sa nastavuje v súbore `.command` (riadok `FPS=50`) a musí sedieť s tým, čo ukazuje prijímač.

## Keď niečo nejde
- **„Čakám na prijímač“** → PC streaming je vypnutý, alebo je problém s USB káblom či hubom.
- **Obraz trhá** → skontroluj, či fps sedí s kamerou, a maj Mac na nabíjačke.
- **OBS nevidí žiadne okná** → Systémové nastavenia → Súkromie a bezpečnosť → Nahrávanie obrazovky → zapni OBS a reštartuj ho.

## Licencie
Pozri [THIRD_PARTY_NOTICES.txt](THIRD_PARTY_NOTICES.txt) (libusb – LGPL-2.1, libuvc – BSD).
