import firebase_admin
from firebase_admin import firestore
from firebase_admin import credentials
import json
import os
from firebase_admin import storage
import datetime
from dotenv import load_dotenv
import urllib.request

def writetoDB(data):
    db = initiateDB()

    for li in data:
        data_list = json.loads(li)
        db.collection("users").document("ApQhowngBK0mGVw5Ld3h").set(data_list[0])

def readfromDB():
    env = os.path.join("./deltahacks24/firebase.json")
    cred = credentials.Certificate(env)
    app = firebase_admin.initialize_app(cred, {
        'storageBucket': 'nutriscan-database.appspot.com',
    }, name='storage')

    bucket = storage.bucket(app=app)
    blob = bucket.blob("pizza.jpg")

    url = blob.generate_signed_url(expiration=datetime.timedelta(seconds=300))

    urllib.request.urlretrieve(url, "./deltahacks24/image.png")

def initiateDB():
    # load_dotenv()
    env = os.path.join("./deltahacks24/firebase.json")
    cred = credentials.Certificate(env)
    firebase_admin.initialize_app(cred)
    db = firestore.client()
    return db
