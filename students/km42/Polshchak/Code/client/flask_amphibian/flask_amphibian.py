import os
import time
import random
from flask import Flask, url_for, session, redirect, escape, request, logging, flash
from flask_uploads import UploadSet, IMAGES
from flask.ext.session import Session
from flask import render_template
from flask_wtf import FlaskForm, Form
from flask_wtf.file import FileField, FileRequired, FileAllowed
from wtforms import Form, StringField, TextAreaField, PasswordField, DateField, DateTimeField, validators
from werkzeug.utils import secure_filename
from passlib.hash import sha256_crypt
from passlib.hash import md5_crypt
import cx_Oracle
os.environ['NLS_LANG'] = 'American_America.AL32UTF8'
UPLOAD_FOLDER = 'media/med_doc'
ALLOWED_EXTENSIONS = set(['pdf', 'png', 'jpg', 'jpeg', 'gif', 'pdf'])
db_user = os.environ.get('DBAAS_USER_NAME', 'POLSHCHAK')
db_password = os.environ.get('DBAAS_USER_PASSWORD', 'Qwer1234')
db_connect = os.environ.get('DBAAS_DEFAULT_CONNECT_DESCRIPTOR', "192.168.56.101:1521/xe")
images = UploadSet('images', IMAGES)
# SESSION_TYPE = 'cookie'

sess = Session()

INSERT_USER_VALUES = ('USER_ID', 'EMAIL', 'ROLE_NAME_FK', 'FIRST_NAME', 'SECOND_NAME', 'LAST_NAME', 'BIRTHDAY',
                        'REG_DAY', 'USER_ADDRESS', 'PHONE_NUMBER', 'MED_DOC', 'SPORT_RANK')

INSERT_USER_VALUES_DICT = {item.upper(): None for item in INSERT_USER_VALUES}


class ValuesDict:
    def __init__(self, *args, **kwargs):
        # do this shit on DATABASE asshole!
        self.user_dict = {}.update(INSERT_USER_VALUES_DICT)
        for name, value in kwargs:
            self.user_dict[name] = value

    def __call__(self, *args, **kwargs):
        return self.user_dict


class InsertGenerator(ValuesDict):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.table_name = kwargs['table_name']
        self.insert_names_map = kwargs.pop('insert_names_map')

    def generate_insert(self) ->str:
        values = ', '.join((str(self.user_dict[item]) for item in self.insert_names_map))
        params = ', '.join((item for item in self.insert_names_map))
        return "INSERT INTO {0} ({1}) VALUES ({2});".format(self.table_name, params, values)


class UserInsertGenerator(InsertGenerator):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs.update({'insert_names_map': INSERT_USER_VALUES}))


class UserCreation:
    def __enter__(self):
        # self.__db = cx_Oracle.Connection("hr/hrpwd@//localhost:1521/XE")
        self.__db = cx_Oracle.connect(db_user, db_password, db_connect)
        self.__cursor = self.__db.cursor()
        return self

    def __exit__(self, type=0, value=1, traceback=1):
        self.__cursor.close()
        self.__db.close()

    def get_user_login_data(self, login_candidate, password_candidate):
        h_password = ' '
        try:
            h_password = self.__cursor.callfunc("WORK_PACK.GETUSERLOGINDATA", cx_Oracle.STRING, [login_candidate])
        except cx_Oracle.DatabaseError:
            flash('ERROR')
        if sha256_crypt.verify(password_candidate, h_password):
            app.logger.info('PASSWORD MATCHED')
            return True
        else:
            app.logger.info('PASSWORD OR LOGIN NOT MATCHED')
            return False





    def add_user(self, email, password, first_name, second_name, last_name, address, phone, med_doc, sport_rank, birthday):
        # user_id = self.__cursor.var(cx_Oracle.NUMBER)
        # self.__cursor.callproc("WORK_PACK.createUser", [(0, email, password, first_name, second_name, last_name, address, phone, ' ', sport_rank, birthday, 1)])
        try:
            self.__db.commit()
            # print([email.replace("'", "''"), password.replace("'", "''"), first_name.replace("'", "''"), second_name.replace("'", "''"), last_name.replace("'", "''"), address.replace("'", "''"),
            #                                                    phone.replace("'", "''"), med_doc.replace("'", "''"), sport_rank.replace("'", "''"), birthday.isoformat()])
            # self.__cursor.callproc('WORK_PACK.REGISTERGUEST', [email.replace("'", "''"), password.replace("'", "''"), first_name.replace("'", "''"), second_name.replace("'", "''"), last_name.replace("'", "''"), address.replace("'", "''"),
            #                                                    phone.replace("'", "''"), med_doc.replace("'", "''"), sport_rank.replace("'", "''"), birthday.isoformat()])
            self.__cursor.callproc('WORK_PACK.REGISTERGUEST', [email, password,
                                                               first_name,
                                                               second_name,
                                                               last_name, address,
                                                               phone, med_doc,
                                                               sport_rank, birthday.isoformat()])
            # self.__cursor.callproc('WORK_PACK.REGISTERGUEST',
            #                  ['yellowbox@example.com', '111111111', 'Vasyl', 'Ivanovich', 'Bondarenco', 'Koval', '38000',
            #                   'images/1837647721/medDoc', 'Master', '25.10.1980'])
            self.__db.commit()
        except BaseException:
            flash('DB ERROR')
            pass

        # there are no OUT parameters in Python, regular return here
        # return user_id

    # def get_employee_count(self, p_department_id):
    #     l_count = self.__cursor.callfunc("PKG_HR.GET_EMPLOYEE_COUNT",
    #                                      cx_Oracle.NUMBER, [p_department_id])
    #     return l_count

    # def find_employees(self, p_query):
    #     # as it comes to all complex types we need to tell Oracle Client
    #     # what type to expect from an OUT parameter
    #     l_cur = self.__cursor.var(cx_Oracle.CURSOR)
    #     l_query, l_emp = self.__cursor.callproc("PKG_HR.FIND_EMPLOYEES", [p_query, l_cur])
    #     return list(l_emp)


uc = UserCreation()





def create_app():
    app = Flask(__name__)
    app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
    app.secret_key = 'A0Zr98j/3yX R~XHH!jmN]LWX/,?RT'
    app.debug = True
    sess.init_app(app)
    return app


app = create_app()


@app.route('/')
def index():
    return render_template('index.html')


def col_dict(dict_of_params: dict) -> dict:
    res_dict = {}
    for item in dict_of_params:
        res_dict[item.upper()] = dict_of_params[item]
    return res_dict


def allowed_file(file_name):
    return '.' in file_name and file_name.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


def register_of_user(dict_of_cols):
    list_of_cols = ['user_id', 'email', 'role_name_fk', 'first_name', 'second_name', 'last_name', 'birthday', 'reg_day',
                    'user_address', 'phone_number', 'med_doc', 'sport_rank', 'password']
    # """%(VALUE)s""" % ({'VALUE': value,})
    # do this shit on DATABASE asshole!
    user_id = random.randint(0, 2147483647)
    connection = cx_Oracle.connect(db_user, db_password, db_connect)
    cur = connection.cursor()
    # try:
    # cur.execute("""SELECT USER_ID FROM "User" WHERE USER_ID=%(_USER_ID)s""" % ({'_USER_ID': user_id}))
    # except
    user_id = random.randint(0, 2147483647)
    cur.commit()
    cur.close()
    connection.close()
    return True


@app.route('/test')
def test_page():
    # """%(VALUE)s""" % ({'VALUE': value,})
    connection = cx_Oracle.connect(db_user, db_password, db_connect)
    cur = connection.cursor()
    # cur.execute("SELECT 'Hello, World from Oracle DB!' FROM DUAL")
    cur.execute("SELECT * FROM \"User\"")
    col = cur.fetchone()[0]
    cur.close()
    connection.close()
    return render_template('test_page.html', info=col[0])


class RegisterForm(Form):
    email = StringField('Email', [validators.Length(min=1, max=254)])
    password = PasswordField('Password', [validators.DataRequired(),
                                          validators.EqualTo('confirm_password',
                                                             message='Passwords do not match')])
    confirm_password = PasswordField('Confirm Password')
    first_name = StringField('First Name', [validators.Length(min=1, max=256)])
    second_name = StringField('Second Name', [validators.Length(min=1, max=256)])
    last_name = StringField('Last Name', [validators.Length(min=1, max=256)])
    address = StringField('Address', [validators.Length(min=1, max=256)])
    phone = StringField('Phone Number', [validators.Length(min=2, max=15)])
    # med_doc = FileField('Medical document',
    #                     validators=[
    #                         FileRequired(),
    #                         FileAllowed(ALLOWED_EXTENSIONS, 'Only images like jpg png')])
    sport_rank = StringField('Sport Rank', [validators.Length(min=1, max=256)])
    birthday = DateField('Birthday', [validators.DataRequired(min(time.localtime()))])


@app.route('/registration', methods=['GET', 'POST'])
def registration():
    form = RegisterForm(request.form)
    if request.method == 'POST' and form.validate():
        email = form.email.data
        password = sha256_crypt.encrypt(str(form.password.data))
        confirm_password = form.confirm_password.data
        first_name = form.first_name.data
        second_name = form.second_name.data
        last_name = form.last_name.data
        address = form.address.data
        phone = form.phone.data
        # med_doc = form.med_doc.data
        # filename = secure_filename(med_doc.filename)
        # med_doc.save(os.path.join(
        #     UPLOAD_FOLDER, '/', filename
        # ))

        # Do something with it!!
        sport_rank = form.sport_rank.data
        birthday = form.birthday.data
        uc.__enter__()
        uc.add_user(email, password, first_name, second_name, last_name, address, phone, UPLOAD_FOLDER + '/empty', sport_rank, birthday)
        uc.__exit__()
        flash('You are now registered and can log in', 'success')
        return render_template('registration.html', form=form)
    return render_template('registration.html', form=form)


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method=='POST':
        user_name = request.form['username']
        password_candidate = request.form['password']
        uc.__enter__()
        if not uc.get_user_login_data(user_name, password_candidate):
            error = 'Username or password is wrong'
            return render_template('login.html', error=error)


if __name__ == '__main__':
    app.run(debug=True)