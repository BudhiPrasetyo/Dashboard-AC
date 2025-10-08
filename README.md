<h1 align="center">🌬️ IoT Dashboard AC Control – Full Monitoring & Automation System</h1>

<p align="center">
  <b>Smart Air Conditioner Control with ESP32, Node-RED, and Real-Time Dashboard</b><br>
  Dashboard | Node-RED | MySQL | ESP32 | WebSocket
</p>

---

## 🧠 Overview

Proyek ini adalah sistem **IoT terintegrasi** untuk memantau dan mengontrol unit pendingin ruangan (**AC**) secara real-time.  
Dibangun menggunakan **Node-RED** sebagai backend, **MySQL** untuk penyimpanan data, **ESP32** untuk kontrol perangkat, dan **Dashboard Web Interaktif** untuk antarmuka pengguna.

Sistem ini dapat digunakan di jaringan lokal maupun di-deploy ke server publik menggunakan WebSocket.

---

## 🧩 Project Structure

| File | Deskripsi |
|------|------------|
| `dashboard_ac_config1.html` | Dashboard web berbasis TailwindCSS & Chart.js |
| `flow_nodered_ac.json` | Flow Node-RED untuk logic backend |
| `database_ac_control.sql` | Struktur & data awal database MySQL |
| `esp32_ac_control.ino` | Kode ESP32 untuk komunikasi WebSocket |
| `platformio.ini` | Konfigurasi Project PlatformIO |
| `README.md` | Dokumentasi proyek |
| `assets/Denah.svg` *(opsional)* | Denah lokasi AC untuk visualisasi interaktif |

---

## ⚙️ System Architecture

```text
[ Dashboard HTML ]
        │  (WebSocket)
        ▼
[ Node-RED Server ]
        │  (MySQL Query)
        ▼
[ Database: ac_control ]
        │  (Status update)
        ▼
[ ESP32 Device ]
```

**Alur kerja:**
1. Dashboard mengirim perintah ON/OFF ke Node-RED melalui WebSocket  
2. Node-RED memproses perintah, memperbarui database, dan meneruskan aksi ke ESP32  
3. ESP32 mengaktifkan atau mematikan AC  
4. ESP32 mengirim status balik ke Node-RED → Dashboard menampilkan status real-time

---

## 🌐 Dashboard (Frontend)

**File:** `dashboard_ac_config1.html`

### ✨ Fitur:
- Denah interaktif lokasi AC  
- Status visual: 🟢 ON | 🔴 OFF  
- Popup detail (suhu, daya, arus, tegangan, estimasi biaya)  
- Tombol kontrol langsung (ON/OFF)  
- Responsif (mobile dan desktop)

### 🔌 Contoh Koneksi WebSocket
```js
const ws = new WebSocket("ws://192.168.12.92:1880/ac-control");

function toggleACStatus(zone) {
  ws.send(JSON.stringify({
    device_id: zone,
    action: "ON"
  }));
}
```

> 💡 Bisa dijalankan langsung di browser tanpa server tambahan  
> atau di-host melalui **GitHub Pages**.

---

## 🧰 Backend – Node-RED

**File:** `flow_nodered_ac.json`

### 📦 Fungsi Utama:
- **WebSocket In (`/ac-control`)** menerima perintah dari dashboard  
- **Function Node “Update + History”**:
  - Update status di tabel `unit_ac`
  - Tambahkan data ke `ac_history`
  - Kirim perintah ke ESP32  
- **MySQL Node** untuk koneksi database  
- **Debug Node** untuk monitoring log aktivitas  

### 🧾 Contoh Output Node-RED ke ESP32:
```json
{
  "device_id": "standbatik4",
  "action": "ON",
  "timestamp": "2025-10-07T04:50:00Z"
}
```

---

## 🗃️ Database – MySQL

**File:** `database_ac_control.sql`

### 📊 Struktur Tabel
#### `unit_ac`
| Kolom | Tipe | Deskripsi |
|--------|------|-----------|
| id | INT | Primary key |
| zona | VARCHAR(100) | Nama area/unit |
| status_ac | ENUM('ON','OFF') | Status AC |
| suhu | FLOAT | Suhu (°C) |
| daya | FLOAT | Daya (Watt) |
| voltage | FLOAT | Tegangan (Volt) |
| arus | FLOAT | Arus (Ampere) |
| last_update | TIMESTAMP | Update terakhir |

#### `ac_history`
| Kolom | Tipe | Deskripsi |
|--------|------|-----------|
| id | INT | Primary key |
| ac_unit_id | INT | ID unit dari `unit_ac` |
| status_ac | ENUM('ON','OFF') | Status saat itu |
| suhu, daya, voltage, arus | FLOAT | Data kondisi |
| timestamp | DATETIME | Waktu pencatatan |

---

## 🧠 ESP32 Device

**File:** `esp32_ac_control.ino`

### 🔧 Fungsi Utama:
- Terhubung ke WiFi  
- Tersambung ke Node-RED via WebSocket  
- Menerima perintah `ON/OFF`  
- Mengontrol pin Transmitter 
- Mengirim balik status ke Node-RED  

### ⚙️ Contoh Konfigurasi
```cpp
#define Transmitter_PIN 26
#define DEVICE_ID "standbatik4"

const char* ssid = "NAMA_WIFI";
const char* password = "PASSWORD_WIFI";
const char* ws_server = "192.168.12.92"; // Node-RED IP
const int ws_port = 1880;
const char* ws_path = "/ac-control";
```

### 📦 Library yang Digunakan
- `WiFi.h`
- `WebSocketsClient.h`
- `ArduinoJson.h`

Contoh `platformio.ini`:
```ini
[env:esp32doit-devkit-v1]
platform = espressif32
board = esp32doit-devkit-v1
framework = arduino

lib_deps =
  links2004/WebSockets
  bblanchon/ArduinoJson
```

---

## 🚀 Deployment Guide

### 1️⃣ Setup Database
Import `database_ac_control.sql` ke MySQL:
```bash
mysql -u root -p < database_ac_control.sql
```

### 2️⃣ Jalankan Node-RED
1. Import `flow_nodered_ac.json`
2. Ubah host database & WebSocket path sesuai server kamu
3. Klik **Deploy**

### 3️⃣ Jalankan ESP32
1. Upload `esp32_ac_control.ino`
2. Pastikan WiFi & server IP benar
3. Buka Serial Monitor → pastikan koneksi WebSocket sukses

### 4️⃣ Jalankan Dashboard
- Buka `dashboard_ac_config1.html` di browser  
  atau buka GitHub Pages:  
  `https://BudhiPrasetyo.github.io/dashboard-ac/`

---

## 🧩 Teknologi yang Digunakan

| Komponen | Teknologi |
|-----------|------------|
| Frontend | HTML5, TailwindCSS, Chart.js |
| Backend | Node-RED (Function, MySQL, WebSocket) |
| Database | MySQL |
| IoT Device | ESP32 (WiFi + WebSocket) |

---

## 👨‍💻 Pengembang

**Author:** Budhi Prasetyo  
🌐 GitHub: [https://github.com/BudhiPrasetyo](https://github.com/BudhiPrasetyo)  
📧 Email: *budhiprasetyoo28@gmail.com*  

---

## 🪪 Lisensi

Proyek ini dirilis di bawah lisensi **MIT**, dan bebas digunakan, dimodifikasi, serta dikembangkan dengan mencantumkan kredit pembuat aslinya.

---

<p align="center">📡 Smart Control • 💡 Energy Efficient • 🌍 Open Source</p>
