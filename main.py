# This Python file uses the following encoding: utf-8
import os
from pathlib import Path
import sys

from PySide6 import QtCore
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

import controller

application_path = (
    sys._MEIPASS
    if getattr(sys, "frozen", False)
    else os.path.dirname(os.path.abspath(__file__))
)

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)

    # QML ui setup
    engine = QQmlApplicationEngine()
    mainqml = os.path.join( application_path, "ui/MainApplication.qml" )
    print( application_path )
    print( mainqml )
    engine.load( QtCore.QUrl.fromLocalFile(mainqml) )

    ## add Python integrations
    backend = controller.Backend()
    engine.rootContext().setContextProperty("backend", backend )

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
