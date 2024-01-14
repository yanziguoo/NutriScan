from google.cloud import vision
from typing import Sequence
from singleImage import get_nutrition_from_food, prepare_image_local
from PIL import Image, ImageDraw, ImageFont
from camera import takePhoto
import os


def get_foods(response: vision.AnnotateImageResponse):
    print("=" * 80)
    pil_image = Image.open(os.path.join('./deltahacks24/image.png'));
    foods = []
    for obj in response.localized_object_annotations:
        nutrition = get_nutrition_from_food(obj.name);
        # print(obj.name, nutrition)
        if len(nutrition) > 2 and "Fruit" not in obj.name and "fruit" not in obj.name:
            nvertices = obj.bounding_poly.normalized_vertices
            # print(
            #     # f"{obj.score:4.0%}",
            #     f"{obj.name:15}",
            #     # f"{obj.mid:10}",
            #     # ",".join(f"({v.x:.1f},{v.y:.1f})" for v in nvertices),
            #     # sep=" | ",
            # )
            foods.append(nutrition)
            draw_boundary(pil_image, nvertices, obj.name)
    pil_image.save("./deltahacks24/processedImage.png")
    return foods

def analyze_image(image, feature_types: Sequence) -> vision.AnnotateImageResponse:
    client = vision.ImageAnnotatorClient()

    features = [vision.Feature(type_=feature_type) for feature_type in feature_types]
    request = vision.AnnotateImageRequest(image=image, features=features)

    response = client.annotate_image(request=request)

    # print(response)
    return response

def draw_boundary(pil_image, vertices, caption):
    font = ImageFont.truetype(os.path.join('./deltahacks24/OpenSansBold.ttf'), size=int(pil_image.size[0]/10))
    draw = ImageDraw.Draw(pil_image)
    xys = [(vertex.x * pil_image.size[0], vertex.y * pil_image.size[1]) for vertex in vertices]
    xys.append(xys[0])
    draw.line(xys, fill=(255, 255, 0), width=10)
    draw.text((xys[0][0], xys[0][1]), caption, (0,0,0), font=font)

def get_nutrition_facts_from_multiple_foods():
    takePhoto()
    image_path = os.path.join('./deltahacks24/image.png')
    # print(image_path)
    features = [vision.Feature.Type.OBJECT_LOCALIZATION]

    response = analyze_image(prepare_image_local(image_path), features)
    nutrition_facts = get_foods(response)
    return nutrition_facts
