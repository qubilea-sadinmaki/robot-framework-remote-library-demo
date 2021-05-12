import os
# from BuiltIn import BuiltIn
from ExcelLibrary import ExcelLibrary
from DateTimeTZ import DateTimeTZ
from robot.libraries.OperatingSystem import OperatingSystem

class RemoteDemoLibrary(ExcelLibrary, DateTimeTZ, OperatingSystem):
    """Class inherits keywords from ExcelLibrary, DateTimeTZ, OperatingSystem classes.
       Class is used hosted by Robot Framework RemoteLibrary. 
    """

    excel_path = "/opt/rfserver/exceldocs/"

    """Delets all excel files.
       Returns the number of deleted files
    """
    def empty_excel_dir(self):
        filesCount = OperatingSystem.count_files_in_directory(self, self.excel_path)
        OperatingSystem.empty_directory(self, self.excel_path)
        
        return filesCount

    """Saves an excel file with timestmap to '/opt/rfserver/exceldocs/' directory
       Verifies the file was saved
    """
    def save_excel(self):
        date = DateTimeTZ.get_timestamp(self)
        path = self.excel_path+"excel_"+date+".xlsx"
        ExcelLibrary.save_excel_document(self, path)
        OperatingSystem.file_should_exist(self, path)