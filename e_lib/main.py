from flask import Flask, render_template, request, session, redirect, jsonify, flash, url_for
# from flask_mysqldb import MySQL
from flask_sqlalchemy import SQLAlchemy
from werkzeug.utils import secure_filename
from flask_mail import Mail
import os
import json
import hashlib
import datetime

with open('config.json', 'r') as c:
    params = json.load(c)['params']

# print(params['name'])

app = Flask(__name__)
app.secret_key = params['SECRET_KEY']
app.config['UPLOAD_BOOK_IMAGE_FOLDER'] = params['BOOK_IMAGE_FOLDER']
app.config['UPLOAD_BOOK_FILE_FOLDER'] = params['BOOK_FILE_FOLDER']
app.config['UPLOAD_VIDEO_FILE_FOLDER'] = params['VIDEO_FILE_FOLDER']
ALLOWED_EXTENSION = set(['png', 'jpg', 'jpeg', 'pdf', 'mp4'])

# app.config.update(
#     MAIL_SERVER='smtp.gmail.com',
#     MAIL_PORT='465',
#     MAIL_USE_SSL=True,
#     MAIL_USERNAME=params['username'],
#     MAIL_PASSWORD=params['password'],
# )
# mail=Mail(app)

if(params['local_server']):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)

class Contact_us(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), unique=False, nullable=False)
    email = db.Column(db.String(20), unique=False, nullable=False)
    phone = db.Column(db.String(13), unique=False, nullable=False)
    message = db.Column(db.String(120), unique=False, nullable=False)

class Videos(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    category_id = db.Column(db.Integer, unique=False, nullable=False)
    video_name = db.Column(db.String(500), unique=False, nullable=False)

class Users(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(25), unique=False, nullable=False)
    email = db.Column(db.String(50), unique=False, nullable=False)
    password = db.Column(db.String(100), unique=False, nullable=False)
    phone = db.Column(db.String(20), unique=False, nullable=False)
    role = db.Column(db.Integer, unique=False, nullable=False)
    # address = db.Column(db.String(200), unique=True, nullable=False)

class Subscribed_email(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(25), unique=False, nullable=False)

class Publishers(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    publisher_name = db.Column(db.String(50), unique=False, nullable=False)
    publisher_url = db.Column(db.String(50), unique=False, nullable=False)

class Authors(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    author_name = db.Column(db.String(50), unique=False, nullable=False)
    author_url = db.Column(db.String(50), unique=False, nullable=False)

class Category(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    category_name = db.Column(db.String(50), unique=False, nullable=False)
    category_url = db.Column(db.String(100), unique=False, nullable=False)
    category_description = db.Column(db.String(200), unique=False, nullable=False)

class Books(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    author_id = db.Column(db.Integer, unique=False, nullable=False)
    category_id = db.Column(db.Integer, unique=False, nullable=False)
    publisher_id = db.Column(db.Integer, unique=False, nullable=False)
    book_name = db.Column(db.String(100), unique=False, nullable=False)
    book_price = db.Column(db.String(50), unique=False, nullable=False)
    book_image = db.Column(db.String(50), unique=False, nullable=False)
    stock = db.Column(db.String(500), unique=False, nullable=False)
    book_description = db.Column(db.String(500), unique=False, nullable=False)
    book_url = db.Column(db.String(100), unique=False, nullable=False)
    book_file = db.Column(db.String(100), unique=False, nullable=False)
    is_downloadable = db.Column(db.Integer, unique=False, nullable=False)
    read_online = db.Column(db.Integer, unique=False, nullable=False)
    timestamp = db.Column(db.String(50), unique=False, nullable=False)

def allowed_file(filename):     
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSION

@app.context_processor
def utility_processor():
    def header_categories():
        header_category = Category.query.all()
        return header_category
    def footer_books():
        latest_books = Books.query.order_by(Books.id.desc()).limit(4).all()
        return latest_books
    def search_books():
        books = Books.query.all()
        return books
    def search_category():
        categorys = Category.query.all()
        return categorys
    def search_authors():
        authors = Authors.query.all()
        return authors
    def search_publishers():
        publishers = Publishers.query.all()
        return publishers
    return dict(header_categories=header_categories, footer_books=footer_books, search_books=search_books, search_category=search_category, search_authors=search_authors, search_publishers=search_publishers)

def calculate_md5(input_string):
    md5_hash = hashlib.md5(input_string.encode('utf-8')).hexdigest()
    return md5_hash

@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template('error-404.html'), 404

@app.route("/")
def index():
    # posts = Posts.query.filter_by().all()[0:5]
    # return render_template("index.html",params=params,posts=posts)
    category = Category.query.all()
    books = Books.query.all()
    return render_template("index.html", books = books, category = category)


@app.route("/subscribe-footer", methods=['POST'])
def subscribeFooter():

    email = request.form['email_val']
    
    entry = Subscribed_email(email=email)
    db.session.add(entry)
    db.session.commit()

    return "subscribed"

@app.route("/registration", methods=['POST'])
def registerUser():

    name = request.form['registerusername_val']
    email = request.form['registeruseremail_val']
    password = request.form['registeruserpass_val']
    phone = request.form['registeruserphone_val']
    
    encrypted_pass = calculate_md5(password)

    users = Users.query.filter_by(email = email).first()

    if users is not None:
        return "email registered"
    else:
        entry = Users(name = name, email = email, password = encrypted_pass, phone = phone)
        db.session.add(entry)
        db.session.commit()

    return "registered"

@app.route("/about-us")
def about():
    return render_template("about-us.html", params = params)

@app.route("/contact-us")
def contact():
    return render_template("contact-us.html", response = request.args.get('response'))


@app.route("/contact-submit", methods=['POST'])
def contactsubmit():

    name = request.form['name']
    email = request.form['email']
    phone = request.form['phone']
    message = request.form['message']
    
    entry = Contact_us(name = name, email = email, phone = phone, message = message)
    db.session.add(entry)
    db.session.commit()

    return redirect('/contact-us?response=success')

@app.route("/category/<string:cat_url>", methods=['GET'])
def category(cat_url):
    categorys = Category.query.filter_by(category_url=cat_url).first()
    videos = Videos.query.order_by(Videos.id.desc()).all()
    books = Books.query.all()
    publishers = Publishers.query.all()
    authors = Authors.query.all()
    return render_template("category.html", categorys = categorys, books = books, publishers = publishers, authors = authors, videos = videos)

@app.route("/all_books", methods=['GET'])
def all_books():
    books = Books.query.all()
    publishers = Publishers.query.all()
    authors = Authors.query.all()
    return render_template("books.html", books = books, publishers = publishers, authors = authors)

@app.route("/book/<string:book_url>", methods=['GET'])
def book_url(book_url):
    categorys = Category.query.all()
    books = Books.query.filter_by(book_url=book_url).first()
    publishers = Publishers.query.all()
    authors = Authors.query.all()
    return render_template("books-detail.html", categorys = categorys, books = books, publishers = publishers, authors = authors)

@app.route("/search", methods=['GET'])
def search():

    book_name = request.args.get('book_name')
    book_cat = request.args.get('book_category')
    publishers_name = request.args.get('publishers_name')
    authors_name = request.args.get('authors_name')

    if book_name and book_cat:
    
        search_book = "%{}%".format(book_name)
        publishers = Publishers.query.all()
        categorys = Category.query.filter_by(category_url=book_cat).first()
        searched_books = Books.query.filter(Books.book_name.like(search_book)).filter_by(category_id=categorys.id).all()

        return render_template("searched_books.html", searched_books = searched_books)

    elif publishers_name:

        publishers = Publishers.query.filter_by(publisher_url = publishers_name).first()
        searched_books = Books.query.filter_by(publisher_id=publishers.id).all()

        return render_template("searched_books.html", searched_books = searched_books)
    elif authors_name:

        authors = Authors.query.filter_by(author_url = authors_name).first()
        searched_books = Books.query.filter_by(publisher_id=authors.id).all()

        return render_template("searched_books.html", searched_books = searched_books)
    else:
        return "Wrong Search Data"

@app.route('/login')
def login():

    if 'user_name' in session:
        return redirect('/')

    return render_template('login.html')

@app.route('/user_authenticate', methods=['POST'])
def user_authenticate():

    user_email = request.form['loginuseremail_val']
    user_password = request.form['loginuserpass_val']
    
    users = Users.query.filter_by(email = user_email).first()

    encrypted_pass = calculate_md5(user_password)

    if users is None:
        # No record was found
        return "wrong email"
    elif users.password != encrypted_pass:
        # Record was found but Password is not correct
        return "wrong pass"
    else:
        # Record was found but Password is correct
        if 'user_name' in session:
            return redirect('/')
        else:
            session['user_name'] = users.name
            session['user_email'] = users.email
            
            return "successfully loggedin"

@app.route('/change_password')
def change_password():

    if 'user_name' not in session:
        return redirect('/')

    return render_template('reset_pass.html', response = request.args.get('response'))

@app.route('/update-user-pass', methods={'POST'})
def update_user_pass():

    new_pass = request.form['reset-user-pass']
    confirm_new_pass = request.form['confirm-reset-user-pass']

    if new_pass != confirm_new_pass:
        return redirect("/change_password?response=passwordDidn'tMatched")
    else:

        users = Users.query.filter_by(email = session['user_email']).first()

        encrypted_pass = calculate_md5(confirm_new_pass)

        users.password = encrypted_pass
        db.session.commit()

        return redirect("/change_password?response=passwordupdated")

@app.route('/logout')
def logout():
    if 'user_name' in session:
        session.pop('user_name',None)
        session.pop('user_email',None)
        return redirect('/')

@app.route('/admin', methods=['GET', 'POST'])
def admin_login():

    if request.method == 'POST':
        admin_email = request.form['admin_email']
        admin_pass = request.form['admin_password']

        admin_user = Users.query.filter_by(email=admin_email, role = 0).first()

        encrypted_pass = calculate_md5(admin_pass)

        if admin_user is None:
            # No record was found
            error = "Invalid Email"
            return render_template("admin/login.html", error=error)
        elif admin_user.password != encrypted_pass:
            # Record was found but Password is not correct
            error = "Wrong Password"
            return render_template("admin/login.html", error=error)
        else:
            # Record was found but Password is correct
            if 'admin_name' in session:
                return redirect('/admin/dashboard')
            else:
                session['admin_name'] = admin_user.name
                session['admin_email'] = admin_user.email


    if 'admin_name' in session:
        return redirect('/admin/dashboard')
    
    error = None
    return render_template('/admin/login.html', error = error)


@app.route('/admin/dashboard')
def admin_dashboard():

    if 'admin_name' not in session:
        return redirect('/admin')

    total_books = Books.query.count()
    total_users = Users.query.filter_by(role=1).count()
    total_categorys = Category.query.count()

    return render_template('/admin/dashboard.html', total_books=total_books, total_users=total_users, total_categorys=total_categorys)

@app.route('/admin_logout')
def admin_logout():
    if 'admin_name' in session:
        session.pop('admin_name',None)
        session.pop('admin_email',None)
        return redirect('/admin')


@app.route('/admin/category')
def admin_category():

    if 'admin_name' not in session:
        return redirect('/admin')

    categorys = Category.query.all()
    return render_template('/admin/admin_category.html', categorys=categorys, response = request.args.get('response'))

@app.route('/delete_category/<string:cat_id>')
def del_cat(cat_id):
    
    catData = Category.query.filter_by(id = cat_id).first()
    db.session.delete(catData)
    db.session.commit()

    return redirect('/admin/category?response=category_deleted')

@app.route('/admin/add_category', methods=['POST'])
def admin_add_category():

    category_name = request.form['category_name']
    category_description = request.form['category_description']
    category_url = category_name.lower().replace(' ', '_')

    data = Category(
        category_name=category_name,
        category_url=category_description,
        category_description=category_url
    )
    db.session.add(data)
    db.session.commit()

    return redirect('/admin/category?response=category_added')

@app.route('/admin/books')
def admin_book():

    if 'admin_name' not in session:
        return redirect('/admin')

    categorys = Category.query.all()
    authors = Authors.query.all()
    publishers = Publishers.query.all()
    books = Books.query.all()
    return render_template('/admin/admin_book.html', books=books, categorys=categorys, authors=authors, publishers=publishers, response = request.args.get('response'))

@app.route('/admin/add_book', methods=['POST'])
def admin_add_book():

    book_name = request.form['book_name']
    book_image = request.files['upload_book_image']
    book_author = request.form['book_author']
    book_publisher = request.form['book_publisher']
    book_category = request.form['book_category']
    book_file = request.files['upload_book']
    book_description = request.form['book_description']
    is_downloadable = request.form['is_downloadable']
    book_url = book_name.lower().replace(' ', '-')
    book_filename = book_name.lower().replace(' ', '_')

    if 'upload_book_image' in request.files:
        if book_image.filename != '': 
            if book_image and allowed_file(book_image.filename):
                filename = secure_filename(book_image.filename)

                book_image_name = book_filename + ".png"

                book_image.save(os.path.join(app.config['UPLOAD_BOOK_IMAGE_FOLDER'], book_image_name))
    
    if "upload_book" in request.files:
        if book_image.filename != '': 
            if book_file and allowed_file(book_file.filename):
                filename = secure_filename(book_file.filename)

                book_file_name = book_filename + ".pdf"

                book_file.save(os.path.join(app.config['UPLOAD_BOOK_FILE_FOLDER'], book_file_name))

    data = Books(
        author_id=book_author,
        category_id=book_category,
        publisher_id=book_publisher,
        book_name=book_name,
        book_image=book_image_name,
        book_file=book_file_name,
        book_description=book_description,
        book_url=book_url,
        is_downloadable=is_downloadable,
        read_online=1,
        timestamp=datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
    )
    db.session.add(data)
    db.session.commit()

    return redirect('/admin/books?response=book_added')

@app.route('/admin/edit_book/<string:book_id>/<string:book_url>',methods=['POST', 'GET'])
def admin_edit_book(book_id, book_url):

    if request.method == 'POST':

        book_name = request.form['book_name']
        book_image = request.files['upload_book_image']
        book_author = request.form['book_author']
        book_publisher = request.form['book_publisher']
        book_category = request.form['book_category']
        book_file = request.files['upload_book']
        book_description = request.form['book_description']
        is_downloadable = request.form['is_downloadable']
        book_url = book_name.lower().replace(' ', '-')
        book_filename = book_name.lower().replace(' ', '_')

        book = Books.query.filter_by(id=book_id).first()

        if 'upload_book_image' in request.files:
            if book_image.filename != '': 
                if book_image and allowed_file(book_image.filename):
                    filename = secure_filename(book_image.filename)

                    book_image_name = book_filename + ".png"

                    book_image.save(os.path.join(app.config['UPLOAD_BOOK_IMAGE_FOLDER'], book_image_name))
        
        if "upload_book" in request.files:
            if book_image.filename != '': 
                if book_file and allowed_file(book_file.filename):
                    filename = secure_filename(book_file.filename)

                    book_file_name = book_filename + ".pdf"

                    book_file.save(os.path.join(app.config['UPLOAD_BOOK_FILE_FOLDER'], book_file_name))

        if 'book_image_name' not in locals():
            book_image_name = book.book_image
        if 'book_file_name' not in locals():
            book_file_name = book.book_file

        book.author_id=book_author,
        book.category_id=book_category,
        book.publisher_id=book_publisher,
        book.book_name=book_name,
        book.book_image=book_image_name,
        book.book_file=book_file_name,
        book.book_description=book_description,
        book.book_url=book_url,
        book.is_downloadable=is_downloadable,
        book.read_online=1,
        book.timestamp=datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'),

        db.session.commit()

        return redirect('/admin/books?response=book_edited')

    elif request.method == "GET":

        categorys = Category.query.all()
        authors = Authors.query.all()
        publishers = Publishers.query.all()
        books = Books.query.filter_by(id=book_id).first()
        return render_template('/admin/admin_edit_book.html', books=books, categorys=categorys, authors=authors, publishers=publishers, response = request.args.get('response'))

@app.route('/admin/video')
def admin_video():

    if 'admin_name' not in session:
        return redirect('/admin')

    categorys = Category.query.all()
    videos = Videos.query.all()
    return render_template('/admin/admin_video.html', videos=videos, categorys=categorys, response = request.args.get('response'))

@app.route('/admin/add_video', methods=['POST'])
def admin_add_video():
    
    category_id = request.form['category_id']
    video_file = request.files['video_file']    
    
    categorys = Category.query.filter_by(id=category_id).first()
    
    video_name = categorys.category_name
    
    video_filename = video_name.lower().replace(' ', '_')  

    if "video_file" in request.files:
        if video_file.filename != '': 
            if video_file and allowed_file(video_file.filename):
                filename = secure_filename(video_file.filename)

                video_file_name = video_filename + ".mp4"

                video_file.save(os.path.join(app.config['UPLOAD_VIDEO_FILE_FOLDER'], video_file_name))

    data = Videos(
        video_name=video_file_name,
        category_id=category_id,
    )
    db.session.add(data)
    db.session.commit()

    return redirect('/admin/video?response=video_added')

@app.route('/admin/edit_video/<string:vid_id>',methods=['POST', 'GET'])
def admin_edit_video(vid_id):
    
    if request.method == 'POST':

        category_id = request.form['category_id']
        video_file = request.files['video_file']

        video = Videos.query.filter_by(id=vid_id).first()

        categorys = Category.query.filter_by(id=category_id).first()
        
        video_name = categorys.category_name
        
        video_filename = video_name.lower().replace(' ', '_')  

        if "video_file" in request.files:
            if video_file.filename != '': 
                if video_file and allowed_file(video_file.filename):
                    filename = secure_filename(video_file.filename)

                    video_file_name = video_filename + ".mp4"

                    video_file.save(os.path.join(app.config['UPLOAD_VIDEO_FILE_FOLDER'], video_file_name))

        video.category_id=category_id,
        video.video_name=video_file_name,

        db.session.commit()

        return redirect('/admin/video?response=video_edited')

    elif request.method == "GET":

        categorys = Category.query.all()
        video = Videos.query.filter_by(id=vid_id).first()
        return render_template('/admin/admin_edit_video.html', video=video, categorys=categorys, response = request.args.get('response'))


@app.route('/admin/generate_report')
def admin_generate_report():

    if 'admin_name' not in session:
        return redirect('/admin')

    categorys = Category.query.all()
    category_book_counts = []

    for category in categorys:
        book_count = Books.query.filter_by(category_id=category.id).count()
        category_book_counts.append((category, book_count))

    return render_template('/admin/admin_generate_report.html', category_book_counts=category_book_counts)


@app.route('/admin/reset_pass')
def admin_reset_pass():

    if 'admin_name' not in session:
        return redirect('/admin')

    users = Users.query.filter_by(email=session['admin_email']).first()

    return render_template('/admin/admin_reset_pass.html', users=users, response = request.args.get('response'))


@app.route('/admin/update_profile/<string:user_id>', methods=["POST"])
def admin_update_profile(user_id):
    
    admin_name = request.form['admin_name']
    admin_email = request.form['admin_email']
    admin_phone = request.form['admin_phone']

    user_new_pass = request.form['user_new_pass']
    confirm_user_pass = request.form['confirm_user_pass']

    encrypted_pass = calculate_md5(confirm_user_pass)

    if user_new_pass != confirm_user_pass:
        return redirect('/admin/reset_pass?response=no_pass_match')
    
    users = Users.query.filter_by(id = user_id).first()

    users.name = admin_name,
    users.email = admin_email,
    users.phone = admin_phone,
    users.password = encrypted_pass,

    db.session.commit()
    
    return redirect('/admin/reset_pass?response=data_updated')

app.run(debug=True)