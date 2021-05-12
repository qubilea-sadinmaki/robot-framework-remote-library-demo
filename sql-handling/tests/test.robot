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
    ${output} =    Execute SQL String    CREATE TABLE person (id integer unique,first_name varchar(20),last_name varchar(20))
    Log    ${output}
    Should Be Equal As Strings    ${output}    ${EMPTY}

Table Must Exist - person
    [Tags]    db    smoke
    Table Must Exist    person

Insert Data Into Table person
    [Tags]    db    smoke
    ${output} =    Execute SQL String    INSERT INTO person VALUES(1,'Joe','Doe');
    Log    ${output}
    Should Be Equal As Strings    ${output}    ${EMPTY}

Verify Query - Row Count person table
    [Tags]    db    smoke
    ${output} =    Query    SELECT COUNT(*) FROM person;
    Log    ${output}
    Should Be Equal As Strings    ${output}    [[1]]

Verify Replace Data From person table
    [Tags]    db    smoke
    ${output} =    Execute SQL String    REPLACE INTO person VALUES(1,'John','Doe');
    Log    ${output}
    Should Be Equal As Strings    ${output}    ${EMPTY}
    Check If Exists In Database    SELECT first_name, last_name FROM person WHERE last_name = 'Doe' AND first_name = 'John'; 

Verify Delete All Rows From Table - person
    [Tags]    db    smoke
    Delete All Rows From Table    person
    Sleep    2    reason=None
    ${output} =    Query    SELECT COUNT(*) FROM person;
    Log    ${output}
    Should Be Equal As Strings    ${output}    [[0]]

Drop person table
    [Tags]    db    smoke
    ${output} =    Execute SQL String    DROP TABLE person
    Log    ${output}
    Should Be Equal As Strings    ${output}    ${EMPTY}

