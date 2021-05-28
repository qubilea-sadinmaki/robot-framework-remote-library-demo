*** Settings ***
Library    Remote    ${LIBRARY_SERVER}:${LIBRARY_PORT}/       WITH NAME    RemoteLibrary

*** Variables ***
${LIBRARY_SERVER}            http://127.0.0.1
${LIBRARY_PORT}              8270
${DIR_NAME}                  temp
${FILE_NAME}                 temp.txt

*** Keywords ***
Commandline Execution
    [Documentation]    Executes command on system and verifies its success
    [Arguments]    ${commandstring}
    ${out}   RemoteLibrary.Exec   ${commandstring}
    Should Be Equal As Integers    ${out}    0    msg=command '${commandstring}' was failed!

*** Test Cases ***
Verify Create And Remove
    [Template]    Commandline Execution
    echo === Remotely from testcase : ${TEST NAME} ===
    mkdir ${DIR_NAME}
    touch ${DIR_NAME}${FILE_NAME}
    rm ${DIR_NAME}${FILE_NAME}
    rmdir ${DIR_NAME}

Verify Python Virtual Env With Install And Uninstall
    [Template]    Commandline Execution
    echo === Remotely from testcase : ${TEST NAME} ===
    python3 -m venv venv
    venv/bin/pip install robotframework
    venv/bin/pip uninstall --yes robotframework 
    rm -r venv
    dir







