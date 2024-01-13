# program to capture single image from webcam in python

from cv2 import VideoCapture, imshow, imwrite, destroyWindow

def takePhoto():
    cam_port = 0
    cam = VideoCapture(cam_port)

    # reading the input using the camera
    result, image = cam.read()

    # If image will detected without any error,
    # show result
    if result:

        # showing result, it take frame name and image
        # output
        imshow("image", image)

        # saving image in local storage
        imwrite("./deltahacks24/image.png", image)

        destroyWindow("image")

    # If captured image is corrupted, moving to else part
    else:
        print("No image detected. Please! try again")