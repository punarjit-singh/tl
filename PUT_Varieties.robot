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
    
# Put Request With No Data
    # [Tags]  put
    # Create Session  httpbin  http://httpbin.org
    # ${resp}=  Put Request  httpbin  /put
    # Log To Console  ${resp.text}
    # Should Be Equal As Strings  ${resp.status_code}  200
    
# Put Request With URL Params
    # [Tags]  put
    # Create Session  httpbin  http://httpbin.org
    # &{params}=   Create Dictionary   key=value     key2=value2
    # ${resp}=  Put Request  httpbin  /put  params=${params}
    # Log To Console  ${resp.text}
    # Should Be Equal As Strings  ${resp.status_code}  200
    
# Put Request With No Dictionary
    # [Tags]  put
    # Create Session  httpbin  http://httpbin.org
    # Set Test Variable  ${data}  some content
    # ${resp}=  Put Request  httpbin  /put  data=${data}
    # Log To Console  ${resp.text}
    # Should Be Equal As Strings  ${resp.status_code}  200
    # Should Contain  ${resp.text}  ${data}
    
# Put Requests
    # [Tags]  put
    # Create Session  httpbin  http://httpbin.org
    # &{data}=  Create Dictionary  name=bulkan  surname=evcimen
    # &{headers}=  Create Dictionary  Content-Type=application/x-www-form-urlencoded
    # ${resp}=  Put Request  httpbin  /put  data=${data}  headers=${headers}
    # Log To Console  ${resp.text}
    # Dictionary Should Contain Value  ${resp.json()['form']}  bulkan
    # Dictionary Should Contain Value  ${resp.json()['form']}  evcimen
    
Put Request With Redirection
    [Tags]  put
    Create Session  jigsaw  http://jigsaw.w3.org    debug=3
    ${resp}=  Put Request  jigsaw  /HTTP/300/302.html
    Log To Console  ${resp.text}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${resp}=  Put Request  jigsaw  /HTTP/300/302.html  allow_redirects=true
    Log To Console  ${resp.text}
    Should Be Equal As Strings  ${resp.status_code}  200
    
