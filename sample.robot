*** Settings ***				
Library  Collections			
Library  RequestsLibrary

*** Test Cases ***				
Get Requests
	Create Session	github	http://punarjit-singh:lucky4bins@api.github.com	
	${resp}=	Get Request	github	users/punarjit-singh
	Log To Console  ${resp}
	Dictionary Should Contain Value	${resp.json()}	punarjit-singh