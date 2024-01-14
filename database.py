import firebase_admin
from firebase_admin import firestore
from firebase_admin import credentials
import json
import os
from dotenv import load_dotenv

def writetoDB(data):
    db = initiateDB()

    for li in data:
        data_list = json.loads(li)
        db.collection("users").document("ApQhowngBK0mGVw5Ld3h").set(data_list[0])

def readfromDB():
    db = initiateDB()

    users_ref = db.collection("users")
    docs = users_ref.stream()

    for doc in docs:
        print(f"{doc.id} => {doc.to_dict()}")

def initiateDB():
    # load_dotenv()
    env = os.path.join("./deltahacks24/firebase.json")
    cred = credentials.Certificate(env)
    firebase_admin.initialize_app(cred)
    db = firestore.client()
    return db