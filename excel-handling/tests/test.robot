*** Settings ***
Library    Remote    http://127.0.0.1:8270/       WITH NAME    RemoteExcelLibrary
# Library    DateTime
# Library	   OperatingSystem
# Suite Setup       Connect To Database    pymysql    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
Suite Teardown    Close All Excel Documents

*** Variables ***
${ExcelName}    SampleData.xlsx
${ExcelID}      excel_on_server
${NewExcelID}   new-excel

*** Test Cases ***
Open Excel On Server
    [Tags]    db    smoke
    ${output} =    Open Excel Document    ${ExcelName}    ${ExcelID}
    Log To Console    \nlocal:${output}
    Should Be Equal As Strings    ${output}    ${ExcelID}

Verify Excel Sheetnames
    [Tags]    db    smoke
    ${output} =    Get List Sheet Names
    Log To Console    \nsheetnames:${output}
    Should Be Equal As Strings    ${output}    ['Instructions', 'FoodSales', 'MyLinks']

Create New Excel
    [Tags]    db    smoke
    ${output} =    Create Excel Document    ${NewExcelID}
    Log To Console    \ncreated:${output}
    Should Be Equal As Strings    ${output}    ${NewExcelID}

Verify Save New Excel
    [Tags]    db    smoke
    Empty Excel Dir
    Save Excel

