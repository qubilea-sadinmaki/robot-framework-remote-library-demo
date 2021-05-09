*** Settings ***
Library    Remote    http://127.0.0.1:8270/       WITH NAME    RemoteDatabaseLibrary
Suite Setup       Connect To Database    pymysql    ${DBName}    ${DBUser}    ${DBPass}    ${DBHost}    ${DBPort}
Suite Teardown    Disconnect From Database

*** Variables ***
${DBName}    myDB
${DBUser}    user
${DBPass}    passw
${DBHost}    db
${DBPort}    3306

*** Test Cases ***
Create person table
    [Tags]    db    smoke
    ${output} =    Execute SQL String    CREATE TABLE person (id integer unique,first_name varchar2(20),last_name varchar2(20))
    Log    ${output}
    Should Be Equal As Strings    ${output}    ${EMPTY}

Drop person and foobar tables
    [Tags]    db    smoke
    ${output} =    Execute SQL String    DROP TABLE person
    Log    ${output}
    Should Be Equal As Strings    ${output}    ${EMPTY}

