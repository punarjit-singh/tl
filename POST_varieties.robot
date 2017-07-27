*** Settings ***
Library  Collections
Library  RequestsLibrary

*** Test Cases ***
Post Request With Data
    [Tags]  post
    ${auth}  Create List  punarjitsingh  Monika1472123oye
    Create Session  cloudant   https://punarjitsingh.cloudant.com  auth=${auth}  verify=True
    ${data}  To Json  {"id":"employee789","department": 23,"name":"Lucky Ronney","title":"Salesman","active_employee": true}
    ${headers}=  Create Dictionary  Content-Type=application/json  Accept=application/json
    ${resp}=  Post Request  cloudant  /employee_directory  data=${data}  params=${data}  headers=${headers}
    Log to Console  ${resp}
    Log to Console  ${resp.text}
    Should Be Equal As Strings  ${resp.status_code}  201
    
Post Request With Dict Data
    [Tags]  post
    ${auth}  Create List  punarjitsingh  Monika1472123oye
    Create Session  cloudant   https://punarjitsingh.cloudant.com  auth=${auth}  verify=True
    ${data}  Create Dictionary  name=Punarjit Singh  age=29
    ${headers}=  Create Dictionary  Content-Type=application/json  Accept=application/json
    ${resp}=  Post Request  cloudant  /employee_directory  data=${data}  headers=${headers}
    Log to Console  ${resp}
    Log to Console  ${resp.text}
    Should Be Equal As Strings  ${resp.status_code}  201

Post Request Without Data
    [Tags]  post
    ${auth}  Create List  punarjitsingh  Monika1472123oye
    Create Session  cloudant   https://punarjitsingh.cloudant.com  auth=${auth}  verify=True
    ${data}  To Json  {}
    ${headers}=  Create Dictionary  Content-Type=application/json  Accept=application/json
    ${resp}=  Post Request  cloudant  /employee_directory  data=${data}  headers=${headers}
    Log to Console  ${resp}
    Log to Console  ${resp.text}
    Should Be Equal As Strings  ${resp.status_code}  201