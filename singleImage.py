from google.cloud import vision
import requests
from camera import takePhoto
import io
import os
from dotenv import load_dotenv


def analyze_image(image) -> vision.EntityAnnotation:
    # Instantiates a client
    client = vision.ImageAnnotatorClient()

    # Performs label detection on the image file
    response = client.label_detection(image=image)
    labels = response.label_annotations

    print("Labels:")
    for label in labels:
        if len(get_nutrition_from_food(label.description)) > 2 and "Fruit" not in label.description and "fruit" not in label.description:
            print(label.description, label.score)
            break

    return get_nutrition_from_food(label.description)


def get_nutrition_from_food(food):
    load_dotenv()
    api_url = 'https://api.api-ninjas.com/v1/nutrition?query={}'.format(food)
    response = requests.get(api_url, headers={'X-Api-Key': os.environ.get("NINJA_API_KEY")})
    if response.status_code == requests.codes.ok:
        return response.text
    else:
        return "Error:", response.status_code, response.text

def prepare_image_local(image_path):
    with io.open(image_path, 'rb') as image_file:
        content = image_file.read()
    image = vision.Image(content=content)
    return image

def get_nutrition_facts_from_image():
    takePhoto()
    image_path = os.path.join('./deltahacks24/image.png')
    nutrition_facts = analyze_image(prepare_image_local(image_path))
    return nutrition_facts
