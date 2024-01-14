from google.cloud import vision
from typing import Sequence
import firebase_admin
from firebase_admin import firestore
from firebase_admin import credentials
from firebase_admin import storage
import json
import os
import io
import datetime
from dotenv import load_dotenv
import urllib.request
import requests


# gets list of nutrition facts from foods in image
def get_nutrition_facts():
    image_path = os.path.join('./deltahacks24/image.png')
    features = [vision.Feature.Type.OBJECT_LOCALIZATION]

    response = analyze_image(prepare_image_local(image_path), features)
    nutrition_facts = get_foods(response)
    return nutrition_facts


# gets list of all the foods in the image
def get_foods(response: vision.AnnotateImageResponse):
    foods = []
    for obj in response.localized_object_annotations:
        nutrition = get_nutrition_from_food(obj.name);
        if len(nutrition) > 2 and "Fruit" not in obj.name and "fruit" not in obj.name:
            foods.append(nutrition)
    return foods


# applies object detection from Google Cloud Vision AI on the image
def analyze_image(image, feature_types: Sequence) -> vision.AnnotateImageResponse:
    client = vision.ImageAnnotatorClient()

    features = [vision.Feature(type_=feature_type) for feature_type in feature_types]
    request = vision.AnnotateImageRequest(image=image, features=features)

    response = client.annotate_image(request=request)

    return response


# gets the nutrition value of a food using Ninja's API
def get_nutrition_from_food(food):
    load_dotenv()
    api_url = 'https://api.api-ninjas.com/v1/nutrition?query={}'.format(food)
    response = requests.get(api_url, headers={'X-Api-Key': os.environ.get("NINJA_API_KEY")})
    if response.status_code == requests.codes.ok:
        return response.text
    else:
        return "Error:", response.status_code, response.text


# prepares image from local files
def prepare_image_local(image_path):
    with io.open(image_path, 'rb') as image_file:
        content = image_file.read()
    image = vision.Image(content=content)
    return image


# writes a food's nutrition facts to the database
def writeFoodtoDB(db, data):
    collection_ref = db.collection("nutrition_facts")
    docs = collection_ref.stream()

    for doc in docs:
        doc.reference.delete()

    for li in data:
        data_list = json.loads(li)
        data_dict = data_list[0]

        db.collection("nutrition_facts").document().create(data_dict)


# writes the total nutrition values the user has consumed to the database
def writeTotaltoDB(db):
    users_ref = db.collection("users")

    nutrition_ref = db.collection("nutrition_facts")
    nutrition_docs = nutrition_ref.stream()

    for doc in nutrition_docs:
        data_dict = doc.to_dict()
        del data_dict["name"]

        # print("food", data_dict)

        users_docs = users_ref.stream()
        for user in users_docs:
            doc_dict = user.to_dict()
            # print("user", doc_dict)

            summed_dict = {key: doc_dict[key] + data_dict[key] for key in doc_dict.keys()}
            # print("sum", summed_dict)

            db.collection("users").document("ApQhowngBK0mGVw5Ld3h").set(summed_dict)


# reads and downloads the image taken from the database
def readfromDB(img_name):
    env = os.path.join("./deltahacks24/firebase.json")
    cred = credentials.Certificate(env)
    app = firebase_admin.initialize_app(cred, {
        'storageBucket': 'nutriscan-database.appspot.com',
    }, name='storage')

    bucket = storage.bucket(app=app)
    blob = bucket.blob(img_name)

    url = blob.generate_signed_url(expiration=datetime.timedelta(seconds=300))

    urllib.request.urlretrieve(url, "./deltahacks24/image.png")


# initiate the Firebase database
def initiateDB():
    path = os.path.join("./deltahacks24/firebase.json")
    cred = credentials.Certificate(path)
    firebase_admin.initialize_app(cred)
    db = firestore.client()
    return db


# start Firebase database
db = initiateDB()

# read image from database
readfromDB("banapple.jpg")

# write food from image's nutrients to "nutrient_facts" database
writeFoodtoDB(db, get_nutrition_facts())

# write total nutrients added up to "users" database
writeTotaltoDB(db)