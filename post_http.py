import requests
import json

class MyLibrary:
    
    def do_requests_post( url=None, data=None, headers={"Content-Type":"application/json"}):
      return requests.post( url, data=data, headers=json.loads(headers) )