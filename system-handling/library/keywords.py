import os

class RemoteDemoLibrary(object):

    def exec(self, commandline):
        return os.system(commandline)
    