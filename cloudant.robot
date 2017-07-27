*** Settings ***
Library  Collections
Library  RequestsLibrary

*** Test Cases ***
Get Request
    [Tags]  get
    Create Session  cloudant   https://punarjitsingh:Monika1472123oye@punarjitsingh.cloudant.com
    ${resp}=  Get Request  cloudant  /employee_directory/employee123
    Log To Console  ${resp}
    Log To Console  ${resp.json()}
    Should Be Equal As Strings  ${resp.status_code}  200
    Dictionary Should Contain Value	${resp.json()}	employee123
    ${dict_keys}=  Get Dictionary Keys  ${resp.json()}
    Log To Console  ${dict_keys}