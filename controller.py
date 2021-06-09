import sys

from PySide6.QtCore import QObject, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

## THIS IS NOW HACK
import azure_vision

class Backend(QObject):

    @Slot(str, str)
    def analyse_image(self, image, service):
        print("This is Python speaking")
        client = azure_vision.init()

        image = image.replace('file://', '') ## clean these for Python use

        azure_vision.process_local( client , [ image ] )
        print( image, service )
        print("Python OK.")
