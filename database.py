import firebase_admin
from firebase_admin import firestore
from firebase_admin import credentials
import json
import os
from firebase_admin import storage
import datetime
from dotenv import load_dotenv
import urllib.request

def writeFoodtoDB(db, data):
    for li in data:
        data_list = json.loads(li)
        data_dict = data_list[0]

        db.collection("nutrition_facts").document("0vKBjNWrrBitRDv0d3pM").set(data_dict)

def writeTotaltoDB(db):
    users_ref = db.collection("users")
    users_docs = users_ref.stream()

    nutrition_ref = db.collection("nutrition_facts")
    nutrition_docs = nutrition_ref.stream()

    for doc in nutrition_docs:
        data_dict = doc.to_dict()
        del data_dict["name"]

        summed_dict = {}
        for total in users_docs:
            doc_dict = total.to_dict()

            print(data_dict)
            print(doc_dict)
            summed_dict = {key: doc_dict[key] + data_dict[key] for key in doc_dict.keys()}

            db.collection("users").document("ApQhowngBK0mGVw5Ld3h").set(summed_dict)

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
