# This Python file uses the following encoding: utf-8
import os
from pathlib import Path
import sys

from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine

import controller

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)

    # QML ui setup
    engine = QQmlApplicationEngine()
    engine.load(os.fspath(Path(__file__).resolve().parent / "ui/MainApplication.qml"))

    ## add Python integrations
    backend = controller.Backend()
    engine.rootContext().setContextProperty("backend", backend )

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
