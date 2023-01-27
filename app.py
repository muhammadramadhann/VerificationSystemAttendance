from flask import Flask, render_template, request, redirect, flash
from flaskext.mysql import MySQL
from werkzeug.utils import secure_filename
import os
import matplotlib.pyplot as plt
from deepface import DeepFace
import datetime
import pytz
import time

app = Flask(__name__)
mysql = MySQL()

app.config['MYSQL_DATABASE_HOST'] = 'localhost'
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = ''
app.config['MYSQL_DATABASE_DB'] = 'tugas_akhir'

app.secret_key = 'AHjkaIllq!@$%^&*()'
mysql.init_app(app)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/absensi')
def absensi():
    return render_template('absensi.html')

@app.route('/riwayat')
def riwayat():
    conn = mysql.connect()
    mycursor = conn.cursor()
    mycursor.execute("select a.id_mahasiswa, b.nama, b.kelas, b.jurusan, a.status_kehadiran, a.waktu_kehadiran "
                     " from absensi_log a "
                     " left join mahasiswa b on a.id_mahasiswa = b.id_mahasiswa "
                     " order by a.waktu_kehadiran desc ")
    absensi = mycursor.fetchall()

    return render_template('riwayat.html', absensi=absensi)

# @app.route('/recognition', methods=['GET', 'POST'])
# def recognition():
#     if request.method == 'POST':
#         conn = mysql.connect()
#         mycursor = conn.cursor()

#         id_mahasiswa = request.form['nim']
#         capture_result = request.files['file']

#         student = mycursor.execute("select * from mahasiswa where id_mahasiswa = '{}'".format(id_mahasiswa))
#         if (student == None or student == 0):
#             return "NIM yang kamu masukan tidak terdaftar"
#         else:
#             row = mycursor.fetchone()
#             verification_img = row[4]

#             filename = os.path.join('upload', capture_result.filename)
#             capture_result.save(filename)

#             result = DeepFace.verify(img1_path=filename, img2_path='./images/{}'.format(verification_img), model_name='SFace', detector_backend='mtcnn')
            
#             if result['verified'] == True:
#                 return 'Absensi berhasil'
#             else:
#                 return 'Absensi gagal, wajah tidak dikenali'

@app.route('/recognition', methods=['GET', 'POST'])
def face_recognition():
    if request.method == 'POST':
        id_mahasiswa = request.form['nim']
        capture_result = request.files['file']

        conn = mysql.connect()
        mycursor = conn.cursor()
        student = mycursor.execute("select * from mahasiswa where id_mahasiswa = '{}'".format(id_mahasiswa))
        if (student == None or student == 0):
            flash('NIM yang kamu masukan tidak terdaftar!')
            return redirect('/absensi')
        else:
            start_time = time.time()
            row = mycursor.fetchone()
            nim_mahasiswa = row[0]
            verification_img = row[4]
            current_time = datetime.datetime.now(pytz.timezone('Asia/Jakarta'))

            filename = os.path.join('upload', secure_filename(capture_result.filename))
            capture_result.save(filename)

            try:
                result = DeepFace.verify(img1_path=filename, img2_path='./images/{}'.format(verification_img), model_name='Facenet', detector_backend='mtcnn')

                if result['verified'] == True:
                    absensi_log = mycursor.execute("select * from absensi_log where id_mahasiswa = '{}'".format(id_mahasiswa))
                    if (absensi_log == None or absensi_log == 0):
                        mycursor.execute("""INSERT INTO `absensi_log` (`id_mahasiswa`, `status_kehadiran`, `waktu_kehadiran`) VALUES
                            ('{}', '{}', '{}')""".format(nim_mahasiswa, 'Sudah melakukan absen', current_time))
                        conn.commit()

                        end = time.time()
                        time_exec = end - start_time
                        print("time execution: %s" % (time_exec))

                        return render_template('success.html')
                    else:
                        mycursor.execute(""" UPDATE `absensi_log` SET `status_kehadiran` = '{}', `waktu_kehadiran` = '{}' WHERE `absensi_log`.`id_mahasiswa` = '{}' """.format('Sudah melakukan absen', current_time, nim_mahasiswa))
                        conn.commit()

                        end = time.time()
                        time_exec = end - start_time
                        print("time execution: %s" % (time_exec))

                        return render_template('success.html')
                else:
                    mycursor.execute("""INSERT INTO `absensi_log` (`id_mahasiswa`, `status_kehadiran`, `waktu_kehadiran`) VALUES
                        ('{}', '{}', '{}')""".format(nim_mahasiswa, 'Absensi tidak valid', current_time))
                    conn.commit()

                    end = time.time()
                    time_exec = end - start_time
                    print("time execution: %s" % (time_exec))

                    return render_template('failed.html')
            except:
                return render_template('failed.html')

if __name__ == '__main__':
    app.run(debug=True)