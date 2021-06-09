import sys

from PySide6.QtCore import QObject, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

class Backend(QObject):

    @Slot(str)
    def setText(self, text):
        print("This is Python speaking")
        print( text )
        print("Python OK.")
