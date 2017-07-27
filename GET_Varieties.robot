*** Settings ***
Library  Collections
Library  RequestsLibrary

*** Test Cases ***
Get Request
    [Tags]  get
    #Keyword         alias     url                                                                Verify Cert.
    Create Session  cloudant   https://punarjitsingh:Monika1472123oye@punarjitsingh.cloudant.com  verify=True
    ${resp}=  Get Request  cloudant  /employee_directory/_all_docs
    Log To Console  ${resp.content}
    ${toJson_content}  To JSon  ${resp.content}
    Log To Console  ${toJson_content}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${dict_keys}=  Get Dictionary Keys  ${resp.json()}
    Log To Console  ${dict_keys}
    ${dict_values}=  Get Dictionary Values  ${resp.json()}
    Log To Console  ${dict_values}
    List Should Contain Value  ${dict_keys}  rows
    #Traversing the following json document
    #[0, [{u'value': {u'rev': u'4-c81016b9b2be91b047fda10d33fd9c0a'}, u'id': u'employee123', u'key': u'employee123'}, {u'value': {u'rev': u'2-3111ba282f918284127c2d23b242c88f'}, u'id': u'employee456', u'key': u'employee456'}], 2]:
    Log To Console  ${dict_values[1][0]['value']['rev']}
    Should Be Equal As Strings  ${dict_values[1][0]['value']['rev']}  4-c81016b9b2be91b047fda10d33fd9c0a
    Dictionary Should Contain Value  ${dict_values[1][0]}  employee123
    Log To Console  ${resp.json()}
    #Traversing the following json document
    # {u'rows': [{u'value': {u'rev': u'4-c81016b9b2be91b047fda10d33fd9c0a'}, u'id': u'employee123', u'key ': u'employee123'}, {u'value': {u'rev': u'2-3111ba282f918284127c2d23b242c88f'}, u'id': u'employee456', u'key': u'employee456'}], u'total_rows': 2, u'offset': 0}
    Log To Console  ${resp.json()['rows'][0]['value']['rev']}
    Log To Console  ${resp.json()['rows'][0]['id']}
    Log To Console  ${resp.json()['rows'][0]['key']}
    
Get Requests with Url Parameters
    [Tags]  get
    Create Session  httpbin     http://httpbin.org
    &{params}=   Create Dictionary   key=value     key2=value2
    ${resp}=     Get Request  httpbin  /get    params=${params}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${jsondata}=  To Json  ${resp.content}
    Should be Equal     ${jsondata['args']}     ${params}
    Log To Console  ${jsondata}

Get Requests with Json Data
    [Tags]  get
    Create Session  httpbin     http://httpbin.org
    &{data}=    Create Dictionary   latitude=30.496346  longitude=-87.640356
    ${resp}=     Get Request  httpbin  /get    json=${data}
    Should Be Equal As Strings  ${resp.status_code}  200
    ${jsondata}=  To Json  ${resp.content}
    Should Be Equal As Strings  ${resp.status_code}  200
    Log To Console  ${jsondata}


Get HTTPS & Verify Cert
    [Tags]  get
    Create Session    httpbin    https://httpbin.org   verify=True
    ${resp}=  Get Request  httpbin  /get
    Should Be Equal As Strings  ${resp.status_code}  200
    
    
Get HTTPS & Verify Cert with a CA bundle
    [Tags]  get
    Create Session    httpbin    https://httpbin.org   verify=${CURDIR}${/}cacert.pem
    ${resp}=  Get Request  httpbin  /get
    Should Be Equal As Strings  ${resp.status_code}  200
    
    
Get With Auth
    [Tags]  get
    ${auth}=  Create List  user   passwd
    Create Session    httpbin    https://httpbin.org     auth=${auth}  verify=true
    ${resp}=  Get Request  httpbin  /basic-auth/user/passwd
    Should Be Equal As Strings  ${resp.status_code}  200
    Should Be Equal As Strings  ${resp.json()['authenticated']}  True
    
    
Get Request With Auth
    [Tags]  get
    ${auth}  Create List  punarjitsingh  Monika1472123oye
    Create Session  cloudant   https://punarjitsingh.cloudant.com  auth=${auth}  verify=True
    ${resp}=  Get Request  cloudant  /employee_directory/_all_docs
    Log To Console  ${resp.content}
    ${toJson_content}  To JSon  ${resp.content}
    Log To Console  ${toJson_content}
    Should Be Equal As Strings  ${resp.status_code}  200


Get With Digest Auth
    [Tags]    get
    ${auth}=    Create List    punarjitsingh  Monika1472123oye
    Create Digest Session  cloudant   https://punarjitsingh.cloudant.com  auth=${auth}  debug=3  verify=true
    ${resp}=  Get Request  cloudant  /employee_directory/_all_docs
    Log To Console  ${resp.content}
    ${toJson_content}  To JSon  ${resp.content}
    Log To Console  ${toJson_content}