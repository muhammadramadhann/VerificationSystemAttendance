## <div align="center">Verification System in Student Attendance Case Study</div>

<div align="center">
  <img src="https://i.ibb.co/HgNL1Cf/app-logo.png" alt="app-logo" border="0" width="150px">
</div>

<br/>

Repository ini berisi implementasi proyek tugas akhir yang berjudul "Perancangan Arsitektur Sistem Verifikasi Berbasis Face Recognition dalam Studi Kasus Absensi Mahasiswa".
Sistem ini dikembangkan menggunakan bahasa pemrograman [python](https://www.python.org/), framework [flask](https://flask.palletsprojects.com/en/2.2.x/) dan [deepface](https://github.com/serengil/deepface) 
dengan model yang digunakan adalah [`Facenet`](https://sefiks.com/2018/09/03/face-recognition-with-facenet-in-keras/) dan detector [`MTCNN`](https://sefiks.com/2020/09/09/deep-face-detection-with-mtcnn-in-python/).

## Architectural Design

![Arsitektur Sistem Absensi Facenet](https://user-images.githubusercontent.com/83332442/218424379-ace1b7ad-3126-4965-963c-505644ac4581.png)

## Database Design

![ERD Sistem Absensi@1 1](https://user-images.githubusercontent.com/83332442/218428686-57167ac9-1f77-4889-944f-19a32939bfcc.png)

## How to Run Project

Untuk menjalankan projek dapat mengikuti langkah-langkah berikut.
- Buat direktori baru untuk menyimpan projek
- Buka direktori tersebut melalui IDE Visual Studio Code atau code editor favorit
- Buka terminal, clone repository terlebih dahulu dengan menjalankan:
```shell
$ git clone https://github.com/muhammadramadhann/VerificationSystemAttendance.git
```
- Buat virtual environment
```shell
$ python -m venv venv
```
- Mengaktifkan virtual environment
```shell
$ cd venv/Scripts && activate
```
- Kembali ke path awal projek
```shell
$ cd .. && cd ..
```
- Menginstall seluruh requirement project dan tunggu hingga proses install semua library selesai
```shell
$ pip install -r requirements.txt
```

## Import Sample Data

Projek ini terintegrasi dengan database MySQL menggunakan xampp phpmyadmin. Adapun cara untuk melakukan import tabel dan sampel data yang digunakan dalam projek ini
adalah sebagai berikut:
- Jalankan xampp dan buka http://localhost/phpmyadmin/index.php
- Buat sebuah database dengan nama yang diinginkan
- Buka database tersebut lalu pilih import, pilih file `mahasiswa.sql` dan `absensi_log.sql`, tunggu hingga proses import selesai
- Buka file `app.py` pada projek dan ubah line ke 14-17 seperti berikut:
```shell
app.config['MYSQL_DATABASE_HOST'] = 'localhost'
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'nama_db_kamu'
```
- Jika semua sudah oke, mari jalankan projek
```shell
$ python app.py
```
- FYI, dataset wajah mahasiswa yang digunakan dapat dilihat pada gambar berikut.

![database](https://user-images.githubusercontent.com/83332442/218424676-014f028d-00a5-454f-9170-95f2a4150049.jpg)

## Run Project in Smartphone (Mobile)

Untuk mencoba aplikasi alangkah baiknya dijalankan melalui smartphone agar fitur dapat berjalan secara optimal. Cara yang bisa digunakan adalah dengan menggunakan
[`Ngrok`](https://ngrok.com/).
- Download dan install Ngrok melalui https://ngrok.com/download
- Jangan lupa login akun Ngrok untuk dapat masuk kedalam https://dashboard.ngrok.com/
- Jalankan terminal Ngrok dan masukkan auth token yang diperoleh setelah login
```shell
$ ngrok config add-authtoken xxxxxxxxxxxx-xxxxxxxxxxxxx
```
- Pastikan projek sudah berjalan dan ketik pada terminal Ngrok:
```shell
$ ngrok http 5000
```
- Copy url yang di generate dan jalankan melalui smartphone

## Modification
- Mengubah model, face detector atau similarity metrics dapat mengubah kode dalam `app.py` line 65 dengan beberapa pilihan berikut.
```python
models = ["VGG-Face", "Facenet", "Facenet512", "OpenFace", "DeepFace", "DeepID", "ArcFace", "Dlib", "SFace",]
backends = ["opencv", "ssd", "dlib", "mtcnn", "retinaface", "mediapipe"]
metrics = ["cosine", "euclidean", "euclidean_l2"]

DeepFace.verify(img1_path = "img1.jpg", 
                img2_path = "img2.jpg", 
                model_name = models[1], 
                detector_backend = backends[3]
                distance_metric = metrics[1])
```
- <strong>Modifikasi dataset</strong> --> menambah gambar wajah pada folder /images dengan diberi nama file berupa NIM mahasiswa, dataset harus diselaraskan dengan data mahasiswa dalam database MySQL yaitu kolom foto.
- <strong>Modifikasi user interface</strong> --> merubah file yang terdapat dalam folder /templates
- Apabila membutuhkan <strong>API</strong> saja, dapat menggunakan file `app.py`.
