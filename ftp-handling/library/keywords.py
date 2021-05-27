import os
from FtpLibrary import FtpLibrary

class RemoteDemoLibrary(FtpLibrary):
    """Class extends Ftplibrary and OperatingSystem 
    """

    def get_filesize(self, path):
        return os.path.getsize(path)

    def read_file(self, path):
        f = open(path, 'r')
        txt = f.read()
        f.close()
        return txt
    