*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Test Cases ***
Patch Requests
    [Tags]    patch
    ${auth}  Create List  punarjitsingh  Monika1472123oye
    Create Session  cloudant   https://punarjitsingh.cloudant.com  auth=${auth}  verify=True
    &{data}=    Create Dictionary    name=bulkan    surname=evcimen
    ${headers}=  Create Dictionary  Content-Type=application/json  Accept=application/json
    ${resp}=  Patch Request  cloudant  /employee_directory/employee456  data=${data}  headers=${headers}
    Log to Console  ${resp}
    Log to Console  ${resp.text}