import sys
from robotremoteserver import RobotRemoteServer
from keywords import RemoteDemoLibrary
# from ExcelLibrary import ExcelLibrary

if __name__ == '__main__':
    RobotRemoteServer(RemoteDemoLibrary(), host="0.0.0.0", *sys.argv[1:])

