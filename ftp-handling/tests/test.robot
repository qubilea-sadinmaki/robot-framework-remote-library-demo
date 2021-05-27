*** Settings ***
Library    Remote    ${LIBRARY_SERVER}:${LIBRARY_PORT}/       WITH NAME    RemoteLibrary
# Library    Remote    ${LIBRARY_SERVER}:${FTP_PORT}/       WITH NAME    FTPServerLibrary
Library    DateTime
Suite Teardown    Ftp Close

*** Variables ***
${LIBRARY_SERVER}            http://127.0.0.1
${LIBRARY_PORT}              8270
${FTP_SERVER}                ftp-server
${FTP_PORT}                  21
${FTP_USER}                  robot
${FTP_PASS}                  robot
${upload_path}               files/
${downloads_path}            downloads/
${imagefile_to_send}         qubilea-logo-50.png
${filename_on_server}        ""
${textfile_to_send}          send.txt

*** Test Cases ***
Verify Textfile Transfer To Server
    [Documentation]    Uploads text file into FTP server and verifies the file has correct size
    [Tags]    upload    transfer
    ${output}    RemoteLibrary.Ftp Connect    ${FTP_SERVER}    user=${FTP_USER}    password=${FTP_PASS}     port=${FTP_PORT}    timeout=20
    ${original_filesize}    RemoteLibrary.Get Filesize    ${upload_path}${textfile_to_send}
    ${timestamp}    DateTime.Get Current Date
    Set Suite Variable    ${filename_on_server}    text_${timestamp}.txt
    RemoteLibrary.Upload File	${upload_path}${textfile_to_send}    ${filename_on_server}
    ${filesize_on_server}   RemoteLibrary.size    ${filename_on_server}	
    Should Be Equal As Numbers    ${original_filesize}    ${filesize_on_server}

Verify Textfile Transfer From Server
    [Documentation]    Downloads text file from FTP server and verifies the file contais right text
    [Tags]    download    transfer
    # ${filename_on_server} was saved on testcase: Verify File Transfer To Server
    RemoteLibrary.Download File    ${filename_on_server}    ${downloads_path}
    ${downloaded_text}    RemoteLibrary.Read File    ${downloads_path}${filename_on_server}
    ${original_text}    RemoteLibrary.Read File    ${upload_path}${textfile_to_send}
    Should Be Equal As Strings    ${downloaded_text}    ${original_text}

Verify Imagefile Transfer To Server
    [Documentation]    Uploads imagefile into FTP server and verifies the file has correct size
    [Tags]    upload    transfer
    # ${output}    RemoteLibrary.Ftp Connect    ${FTP_SERVER}    user=${FTP_USER}    password=${FTP_PASS}     port=${FTP_PORT}    timeout=20
    ${original_filesize}    RemoteLibrary.Get Filesize    ${upload_path}${imagefile_to_send}
    ${timestamp}    DateTime.Get Current Date
    Set Suite Variable    ${filename_on_server}    img_${timestamp}.png
    RemoteLibrary.Upload File	${upload_path}${imagefile_to_send}    ${filename_on_server}
    ${filesize_on_server}   RemoteLibrary.size    ${filename_on_server}	
    Should Be Equal As Numbers    ${original_filesize}    ${filesize_on_server}




