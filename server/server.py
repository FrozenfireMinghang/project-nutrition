import os
from flask import Flask, request, jsonify, make_response, send_file
from flask_cors import CORS
from werkzeug.security import generate_password_hash, check_password_hash
from functools import wraps
import jwt
import secrets
import datetime
from db.user import add_new_user, find_user, update_avatar, find_user_avatar, find_user_by_id, find_latest_body_record, add_body_record

app = Flask(__name__)
CORS(app)
secret_key = secrets.token_hex(16)
# example output, secret_key = 000d88cd9d90036ebdd237eb6b0db000
app.config['SECRET_KEY'] = '000d88cd9d90036ebdd237eb6b0db000'
app.config['AVATAR_PATH']='images/avatars'


def token_required(f):
    @wraps(f)
    def decorator(*args, **kwargs):

        token = None
        if 'x-access-tokens' in request.headers:
            token = request.headers['x-access-tokens']

        if not token:
            return jsonify({'message': 'a valid token is missing'})
        
        try:
            data = jwt.decode(token, app.config['SECRET_KEY'], algorithms=["HS256"])
            current_user = find_user(data['email'])
        except:
            return jsonify({'message': 'token is invalid'})

        return f(current_user, *args, **kwargs)
    return decorator

@app.route('/api/auth/register', methods=['POST'])
def signup_user(): 
    data = request.get_json() 
    hashed_password = generate_password_hash(data['password'], method='sha256')
    add_new_user(username = data['username'], email=data['email'], password=hashed_password)
    return jsonify({'message': 'registered successfully'})



@app.route('/api/auth/login', methods=['POST']) 
def login_user():
   data = request.get_json()
   print(data['password'])
   if not data or not data['email'] or not data['password']: 
       return make_response('could not verify', 401, {'Authentication': 'login required"'})   
 
   # find user from db
   user = find_user(email=data['email'])
   if check_password_hash(user['password'], data['password']):
       token = jwt.encode({'email' : user['email'], 'exp' : datetime.datetime.utcnow() + datetime.timedelta(minutes=45)}, app.config['SECRET_KEY'], "HS256")
       print(token)
       return jsonify({'token' : token})
 
   return make_response('could not verify',  401, {'Authentication': '"login required"'})


@app.route('/api/avatar', methods = ['GET'])
@token_required
def get_user_avatar(current_user):
    user_id = current_user['id']
    path =  find_user_avatar(user_id)
    print(path)
    return send_file(path)

@app.route('/api/avatar', methods = ['POST'])
@token_required
def update_user_avatar(current_user):
    avatar = request.files['file']
    user_id = current_user['id']
    path = os.path.join(app.config["AVATAR_PATH"], str(user_id) + "_" + avatar.filename)
    avatar.save(path)
    
    update_avatar(user_id, path)
    return jsonify({'message': 'update successfully'})
   

@app.route('/api/profile', methods=['GET'])
@token_required
def get_user_profile(current_user):
    user_id = current_user['id']
    user_profile = find_user_by_id(user_id)
    return user_profile

@app.route('/api/record', methods=['GET'])
@token_required
def get_user_body_record(current_user):
    user_id = current_user['id']
    user_body_record = find_latest_body_record(user_id)
    if user_body_record:
        print(user_body_record)
        return user_body_record
    return make_response('no records found', 200, {'message': 'no records found'})

@app.route('/api/record', methods=['POST'])
@token_required
def add_user_body_record(current_user):
    user_id = current_user['id']
    request_data = request.get_json()
    weight = request_data['weight']
    height = request_data['height']
    updated_body_record = add_body_record(user_id, height=height, weight=weight)
    return updated_body_record

@app.route('/api/image', methods=['GET'])
def get_image():
    url = request.args.get('url')
    if url:
        try:
            print(url)

            return send_file(url)
        except Exception as e:
            return make_response('no image found with url', 500)
    return make_response('no url', 400)

if __name__ == '__main__':
    app.run(debug=True, port=8080)
