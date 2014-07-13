This a simple Sinatra-based web application which can produce anagrams of words.
======================================

* It is provided with a list of words to use.
* Non-alphanumeric characters should be considered as part of the anagram (e.g. "he's" is not an anagram of "she")
* This application is able to respond to a request made every second.
* It is also hosted on heroku: http://eganagramsfinder.herokuapp.com/

Details:
--------

The application is able to receive an HTTP GET request with the requested word as the path and is returning the results as JSON. 

Such as:

* GET /crepitus
{"crepitus":["cuprites","pictures","piecrust"]}


* GET /crepitus,paste
{"crepitus":["cuprites","pictures","piecrust"],"paste":["pates","peats","septa","spate","tapes","tepas"]}


* GET /sdfwehrtgegfg
{"sdfwehrtgegfg":[]}