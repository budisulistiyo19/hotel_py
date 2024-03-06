from flask import Flask, render_template, request, redirect, url_for, flash, session
import os,hashlib
from flask_mysqldb import MySQL
from werkzeug.security import check_password_hash, generate_password_hash
from werkzeug.utils import secure_filename
from datetime import datetime

app = Flask(__name__)


#connected to database
app.secret_key ='cs50xIndonesia'
app.config['MYSQL_HOST'] ='localhost'
app.config['MYSQL_USER']='root'
app.config['MYSQL_PASSWORD']=''
app.config['MYSQL_DB']='hotel_py'
mysql =MySQL(app)


@app.route('/')
def home():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM kamar ORDER BY id DESC")
    datakamars= cur.fetchall()
    cur.close
    #return render_template('index.html', datakamar = datatampil)

    curr = mysql.connection.cursor()
    curr.execute("SELECT * FROM kamar ORDER BY id DESC")
    datakomen = cur.fetchall()
    cur.close
    return render_template('index.html', datakamar = datakamars, datakomens=datakomen)

@app.route('/login',methods= ("GET","POST"))
def login():
     if request.method == "POST":
        mail = request.form["email"]
        password = request.form["password"]
        # cek username / email
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM user WHERE email = %s",(mail, ))
        akun = cur.fetchone()
        if akun is None: 
            flash("Login Gagal, Cek email anda","danger")
        elif not check_password_hash(akun[2], password):
            flash("Login Gagal, password anda kurang tepat","danger")
        else :
            session["loggedin"] = True
            session["id"] =akun[0]
            session["email"] =akun[3]
            session["username"] = akun[1]
            session["level"] = akun[4]
            return redirect(url_for("menu"))
     
     return render_template("login.html")


@app.route('/registrasi', methods= ['GET','POST'])
def registrasi():
    if request.method=='POST':
        username =request.form['username']
        email =request.form['email']
        password =request.form['password']
        level =request.form['level']

        # cek username / email
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM user WHERE username = %s OR email = %s",(username,email, ))
        akun = cur.fetchone()
        if akun is None: 
            cur.execute("INSERT INTO user(username,email,password,level) VALUES (%s, %s, %s, %s)",(username, email, generate_password_hash(password), level))
            mysql.connection.commit()
            flash("Registrasi Berhasil..")
        else:
            flash("Username atau Email Sudah ada!")

    return render_template('registrasi.html')

# view data bookng
@app.route('/datacustomer')
def customertampildata():
    if 'loggedin' in session:
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM customer ORDER BY id DESC")
        datatampil = cur.fetchall()
        cur.close
        return render_template('datacustomer.html',datapemesan = datatampil)

# view data user
@app.route('/datauser')
def datauser():
    if 'loggedin' in session:
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM user ORDER BY id DESC")
        datatampil = cur.fetchall()
        cur.close
        return render_template('datauser.html',datapengguna = datatampil)
    flash("Harap login dulu","danger")
    return redirect(url_for("login"))


# change password
@app.route("/gantipassword",methods =["POST","GET"])
def gantipassword():
    if 'loggedin' in session:
        if request.method == "GET":
            return render_template("gantipassword.html")
        else:
            email = session["email"]
            #passwordlama = request.form["passwordlama"]
            passwordbaru = request.form["passwordbaru"]
            passwordkonfirmasi = request.form["konfirmasi"]
            
            
            #result = cur.execute("SELECT * FROM user WHERE email= %s",[email])
            #hashed_password = result[3]
            #if check_password_hash(hashed_password,passwordlama):
            if passwordbaru != passwordkonfirmasi :
                flash("Konfirmasi password harus sama dengan Password baru")
            cur = mysql.connection.cursor()
            cur.execute("UPDATE user SET password=%s WHERE email = %s", (generate_password_hash(passwordbaru), email))
            flash("Password changed successfully")
            mysql.connection.commit()
            return render_template("gantipassword.html") 


@app.route('/userhapus/<int:id>', methods =['GET'])
def userhapus(id):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM user WHERE id = %s",(id,))
    mysql.connection.commit()
    flash("Data Berhasil di Hapus.")
    return redirect(url_for('datauser'))

@app.route('/userupdate', methods =['POST'])
def userupdate():
    if request.method =='POST':
        id = request.form['id']
        username = request.form['username']
        #password = request.form['password']
        #email = request.form['email']
        level = request.form['level']
        
        cur = mysql.connection.cursor()
        cur.execute("UPDATE user set username = %s,level  = %s WHERE id=%s",
                    (username,level,id))
        mysql.connection.commit()
        flash("Data Berhasil di Update..")
        return redirect(url_for('datauser'))    

#menu utama admin
@app.route('/menu')
def menu():
    if 'loggedin' in session:
        return render_template('baseadmin.html')
    flash("Harap login dulu","danger")
    return redirect(url_for("login"))


#Logout
@app.route('/logout')
def logout():
    session.pop("loggedin",None)
    session.pop("username",None)
    session.pop("level",None)
    return redirect(url_for("login"))

# Insert into table customer
#@app.route('/', methods =['POST'])
#def customerinsert():
#    if request.method =='POST':
#        nama = request.form['nama']
#       email = request.form['email']
#        phone = request.form['phone']
#       tipe = request.form['tipe']
#        checkin = request.form['checkin']
#        checkout = request.form['checkout']
#        jumlah = request.form['jumlah']
#        keterangan = request.form['keterangan']
        
#        cur = mysql.connection.cursor()
#        cur.execute("INSERT INTO customer (nama,email,phone,tipe,checkin,checkout,jumlah,keterangan) VALUES (%s, %s ,%s, %s, %s, %s, %s, %s)",(nama,email,phone,tipe,checkin,checkout,jumlah,keterangan))
#        mysql.connection.commit()
#        flash("Booking Kamar Berhasil..")
#        return redirect(url_for('home'))
    
# Update table customer
@app.route('/customerupdate', methods =['POST'])
def customerupdate():
    if request.method =='POST':
        id = request.form['id']
        nama = request.form['nama']
        email = request.form['email']
        phone = request.form['phone']
        tipe = request.form['tipe']
        checkin = request.form['checkin']
        checkout = request.form['checkout']
        jumlah = request.form['jumlah']
        status = request.form['status']
        
        cur = mysql.connection.cursor()
        cur.execute("UPDATE customer set nama = %s,email = %s,phone = %s,tipe = %s,checkin = %s,checkout = %s,jumlah = %s,status  = %s WHERE id=%s",(nama,email,phone,tipe,checkin,checkout,jumlah,status,id))
        mysql.connection.commit()
        flash("Data Berhasil di Update..")
        return redirect(url_for('customertampildata'))    

# Hapur table customer
@app.route('/customerhapus/<int:id>', methods =['GET'])
def customerhapus(id):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM customer WHERE id = %s",(id,))
    mysql.connection.commit()
    flash("Data Berhasil di Hapus.")
    return redirect(url_for('menu'))

@app.route('/booking' , methods = ['POST', 'GET'])
def booking():
    if request.method =='GET':
        cur = mysql.connection.cursor()
        nama_kamar =cur.execute("SELECT nama FROM kamar")
        return render_template("bookingadd.html", kamars=[row["nama"]for row in nama_kamar])

    else :
        cur = mysql.connection.cursor()

        nama = session['username']
        email = session['email']
        phone = request.form['phone']
        tipe = request.form['tipe']
        checkin = request.form['checkin']
        checkout = request.form['checkout']
        jumlah = request.form['jumlah']
        keterangan = request.form['keterangan']
        
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO customer (nama,email,phone,tipe,checkin,checkout,jumlah,keterangan) VALUES (%s, %s ,%s, %s, %s, %s, %s, %s)",
                    (nama,email,phone,tipe,checkin,checkout,jumlah,keterangan))
        mysql.connection.commit()
        flash("Booking Kamar Berhasil..")
        return redirect(url_for('customertampilbooking'))

# view data booking
@app.route('/databooking', methods =['GET'])
def customertampilbooking():
    if 'loggedin' in session:
        mail = session['email']
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM customer WHERE email = %s",(mail, ))
        datatampil = cur.fetchall()
        cur.close
        return render_template('databooking.html',datapemesan = datatampil)
    
    flash("Harap login dulu","danger")
    return redirect(url_for("login"))


# Update table customer
@app.route('/databookingupdate', methods =['POST'])
def databookingupdate():
    if request.method =='POST':
        id = request.form['id']
        nama = request.form['nama']
        #email = request.form['email']
        phone = request.form['phone']
        tipe = request.form['tipe']
        checkin = request.form['checkin']
        checkout = request.form['checkout']
        jumlah = request.form['jumlah']
        #status = request.form['status']
        
        cur = mysql.connection.cursor()
        cur.execute("UPDATE customer SET nama = %s, phone = %s, tipe = %s, checkin = %s, checkout = %s, jumlah = %s WHERE id=%s",
                    (nama,phone,tipe,checkin,checkout,jumlah,id))
        mysql.connection.commit()
        flash("Data Berhasil di Update..")
        return redirect(url_for('customertampilbooking')) 


@app.route('/datakamar')
def datakamar():
    if 'loggedin' in session:
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM kamar ORDER BY id DESC")
        datatampil = cur.fetchall()
        cur.close
        return render_template('kamar.html', datakamar = datatampil)
    

@app.route('/tambahkamar' , methods = ['POST', 'GET'])
def tambahkamar():
    UPLOADS_PATH = 'static\img'

    if request.method == "POST":
        nama = request.form["nama"]
        harga = request.form["harga"]
        keterangan = request.form["keterangan"]
        gambar = request.files["gambar"]
        if gambar.filename != '':
                image = request.files['gambar']
                image.save(os.path.join(UPLOADS_PATH, secure_filename(image.filename)))

        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO kamar (nama,harga,keterangan,gambar) VALUES (%s, %s ,%s, %s)",(nama,harga,keterangan,gambar.filename))
        mysql.connection.commit()
        flash("Kamar Berhasil disimpan.")
        cur.close()
        return redirect(url_for('datakamar'))
    else:
        return redirect(url_for('datakamar'))

@app.route('/kamarupdate', methods =['POST'])
def kamarupdate():
    UPLOADS_PATH = 'static\img'
    if request.method =='POST':
        id = request.form["id"]
        nama = request.form["nama"]
        harga = request.form["harga"]
        keterangan = request.form["keterangan"]
        gambar = request.files["gambar"]
        if gambar.filename != '':
                image = request.files['gambar']
                image.save(os.path.join(UPLOADS_PATH, secure_filename(image.filename)))

        cur = mysql.connection.cursor()
        cur.execute("UPDATE kamar set nama = %s,harga = %s,keterangan = %s, gambar = %s WHERE id=%s",
                    (nama,harga,keterangan,gambar.filename, id))
        mysql.connection.commit()
        flash("Data Berhasil di Update..")
        return redirect(url_for('datakamar'))  

@app.route('/kamarhapus/<int:id>', methods =['GET'])
def kamarhapus(id):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM kamar WHERE id = %s",(id,))
    mysql.connection.commit()
    flash("Data Berhasil di Hapus.")
    return redirect(url_for('datakamar'))


@app.route('/komentar_pelanggan')
def komentar_pelanggan():
    if 'loggedin' in session:
        mail = session['email']
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM komentar WHERE email = %s",(mail, ))
        datatampil = cur.fetchall()
        cur.close
        return render_template('komentar_pelanggan.html',datapelanggan = datatampil)
    
    flash("Harap login dulu","danger")
    return redirect(url_for("login"))

@app.route('/komentaradd' , methods = ['POST', 'GET'])
def komentaradd():
    if request.method =='GET':
        cur = mysql.connection.cursor()
        nama_komentar =cur.execute("SELECT nama FROM komentar")
        return render_template("komentaradd.html", komentars=[row["nama"]for row in nama_komentar])

    else :
        cur = mysql.connection.cursor()

        nama = session['username']
        email = session['email']
        komentar = request.form['komentar']
        date = datetime.now()
            
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO komentar (email,nama,komentar_p,date_p) VALUES (%s, %s ,%s, %s)",
                    (email,nama,komentar,date))
        mysql.connection.commit()
        flash("Komentar Berhasil..")
        return redirect(url_for('komentar_pelanggan'))


@app.route('/komentarhapus/<int:id>', methods =['GET'])
def komentarhapus(id):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM komentar WHERE id = %s",(id,))
    mysql.connection.commit()
    flash("Data Berhasil di Hapus.")
    return redirect(url_for('komentar_pelanggan'))

@app.route('/komentarupdate', methods =['POST'])
def komentarupdate():
    UPLOADS_PATH = 'static\img'
    if request.method =='POST':
        id = request.form["id"]
        komentar = request.form["komentar"]

        cur = mysql.connection.cursor()
        cur.execute("UPDATE komentar set komentar_p = %s WHERE id=%s",
                    (komentar, id))
        mysql.connection.commit()
        flash("Data Berhasil di Update..")
        return redirect(url_for('komentar_pelanggan'))  

if __name__ == "__main__":
    app.run(debug=True)