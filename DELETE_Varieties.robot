*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Test Cases ***

# PUT Request Without Data
    # [Tags]  put
    # ${auth}  Create List  punarjitsingh  Monika1472123oye
    # Create Session  cloudant   https://punarjitsingh.cloudant.com  auth=${auth}  verify=True
    # ${resp}=  Put Request  cloudant  /employee_directory2
    # Log To Console  ${resp.text}
    # Should Be Equal As Strings  ${resp.status_code}  201

Delete Request
    [Tags]  delete
    ${auth}  Create List  punarjitsingh  Monika1472123oye
    Create Session  cloudant   https://punarjitsingh.cloudant.com  auth=${auth}  verify=True
    ${resp}=  Delete Request  cloudant  /employee_directory2
    Log To Console  ${resp.text}
    Should Be Equal As Strings  ${resp.status_code}  200
    
