import argparse
import os
import sys



def runQML():
    # os.environ["QT_IM_MODULE"] = "qtvirtualkeyboard"
    app = QApplication(sys.argv)


if __name__ == "__main__":
    try:
        if not os.path.isdir("./logs"):
            os.makedirs("./logs")
        sys.exit(runQML())
    except KeyboardInterrupt:
        print("KeyboardInterrupt")
        sys.exit(0)
