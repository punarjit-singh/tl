*** Settings ***
Library  Collections
Library  RequestsLibrary

*** Test Cases ***
Get Request
    [Tags]  get
    Create Session  cloudant   https://api.flickr.com
    ${resp}=  Get Request  cloudant  /services/feeds/photos_public.gne
    Log To Console  ${resp}
    Log To Console  ${resp.text}
    Should Be Equal As Strings  ${resp.status_code}  200