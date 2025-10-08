<h1 align="center">🌬️ IoT Dashboard AC Control – Full Monitoring & Automation System</h1>

<p align="center">
  <b>Real-time Smart Air Conditioner Control</b><br>
  Dashboard | Node-RED | MySQL | ESP32 | WebSocket
</p>

---

## 🧠 Overview

Proyek ini adalah sistem **IoT terintegrasi** untuk memantau dan mengontrol unit pendingin ruangan (**AC**) secara real-time.  
Dibangun menggunakan **Node-RED** sebagai backend, **MySQL** untuk database, dan **HTML Dashboard** interaktif untuk antarmuka pengguna.  
ESP32 berfungsi sebagai perangkat eksekutor untuk perintah ON/OFF.

---

## 🧩 Project Structure

| File | Deskripsi |
|------|------------|
| `dashboard_ac_config1.html` | Dashboard web berbasis TailwindCSS & Chart.js |
| `flow_nodered_ac.json` | Flow Node-RED (backend logic) |
| `database_ac_control.sql` | Struktur & data awal database MySQL |
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
        │  (Update/Select)
        ▼
[ ESP32 Device ]
```

**Alur kerja singkat:**
1. Dashboard mengirim perintah ON/OFF → Node-RED via WebSocket  
2. Node-RED memperbarui status di MySQL (`unit_ac`, `ac_history`)  
3. Node-RED mengirim instruksi ke ESP32  
4. Dashboard menerima pembaruan status secara real-time

---

## 🌐 Dashboard (Frontend)

### ✨ Fitur:
- **Denah interaktif:** setiap titik merepresentasikan unit AC  
- **Status visual:** 🟢 ON | 🔴 OFF  
- **Popup info lengkap:** suhu, daya, tegangan, arus, estimasi biaya  
- **Control Button:** ON/OFF langsung dari browser  
- **Responsive design** (desktop & mobile)

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

> 💡 Dashboard ini dapat dijalankan langsung di browser tanpa server tambahan  
> atau di-host melalui **GitHub Pages**.

---

## 🧰 Backend – Node-RED

**File:** `flow_nodered_ac.json`

### 📦 Node Fungsi Utama
- **WebSocket In (`/ac-control`)** menerima perintah dari dashboard  
- **Function Node: "Update + History"**
  - Update status di tabel `unit_ac`
  - Tambah log ke `ac_history`
  - Kirim feedback ke ESP32  
- **MySQL Node:** mengelola koneksi & query  
- **Debug Node:** memonitor data dan log aktivitas  

### 🧾 Contoh Output ke ESP32
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

### 🏗️ Struktur Tabel

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
| ac_unit_id | INT | ID unit dari tabel `unit_ac` |
| status_ac | ENUM('ON','OFF') | Status saat itu |
| suhu, daya, voltage, arus | FLOAT | Parameter saat log dicatat |
| timestamp | DATETIME | Waktu pencatatan |

### 📊 Contoh Data Awal
| zona | status_ac | suhu | daya | voltage | arus |
|------|------------|------|------|----------|------|
| musholah1 | OFF | 24.5 | 120 | 220 | 0.5 |
| standbatik4 | ON | 23.5 | 150 | 220 | 0.7 |

---

## 🚀 Deployment Guide

### 🪶 1. Setup Database
Import file SQL:
```bash
mysql -u root -p < database_ac_control.sql
```

### 🔧 2. Jalankan Node-RED
1. Import `flow_nodered_ac.json`
2. Atur:
   - MySQL host → `192.168.12.92`
   - WebSocket path → `/ac-control`
3. Klik **Deploy**

### 💻 3. Jalankan Dashboard
- Buka `dashboard_ac_config1.html`  
  atau host via GitHub Pages:  
  `https://<username>.github.io/dashboard-ac/`

### 🔍 4. Uji Sistem
- Klik titik AC di dashboard → perintah dikirim ke Node-RED  
- Cek debug log dan update database

---

## 🧠 Teknologi yang Digunakan

| Komponen | Teknologi |
|-----------|------------|
| Frontend | HTML5, TailwindCSS, Chart.js |
| Backend | Node-RED (Function, MySQL, WebSocket) |
| Database | MySQL |
| IoT Device | ESP32 (WiFi + HTTP/WebSocket) |

---

## 👨‍💻 Pengembang

**Author:** Budhi Prasetyo  
🌐 GitHub: [https://github.com/BudhiPrasetyo](https://github.com/BudhiPrasetyo)  
📧 Email: budhiprasetyoo28@gmail.com

---

## 🪪 Lisensi

Lisensi **MIT** — bebas digunakan, dimodifikasi, dan dikembangkan dengan mencantumkan kredit pembuat aslinya.

---

<p align="center">📡 Smart Control • 💡 Energy Efficient • 🌍 Open Source</p>
