*** Settings ***
Library           RequestsLibrary
Library           Collections
Library           String
Library           OperatingSystem

*** Variables ***



*** Test Cases ***

Merk moet uitkomen op PEUGEOT
    ${params}=    Create Dictionary    kenteken=P300BB
    ${response}=    Get     https://opendata.rdw.nl/resource/m9d7-ebf2.json     params=${params}
    ${json_response}=    Evaluate    json.loads($response.content.decode('utf-8'))
    Should Be Equal As Strings    ${json_response[0]["kenteken"]}    P300BB
    Should Be Equal As Strings    ${json_response[0]["merk"]}    PEUGEOT



Merk moet uitkomen op BMW met 6 Cilinder
    ${params}=    Create Dictionary    kenteken=02LJNX
    ${response}=    Get     https://opendata.rdw.nl/resource/m9d7-ebf2.json     params=${params}
    ${json_response}=    Evaluate    json.loads($response.content.decode('utf-8'))
    Should Be Equal As Strings    ${json_response[0]["kenteken"]}    02LJNX
    Should Be Equal As Strings    ${json_response[0]["merk"]}    BMW
    Should Be Equal As Strings    ${json_response[0]["aantal_cilinders"]}    6


Merk moet uitkomen op Audi met 6 Cilinder (Hier moet FAIL uitkomen)
    ${params}=    Create Dictionary    kenteken=00GBD9
    ${response}=    Get     https://opendata.rdw.nl/resource/m9d7-ebf2.json     params=${params}
    ${json_response}=    Evaluate    json.loads($response.content.decode('utf-8'))
    Should Not Be Equal As Strings        ${json_response[0]["kenteken"]}    00GBD7
    Should Be Equal As Strings    ${json_response[0]["merk"]}    AUDI
    Should Be Equal As Strings    ${json_response[0]["aantal_cilinders"]}    6




