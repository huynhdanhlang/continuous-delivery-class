*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
Variables   vars.py

*** Variables ***
${SERVER}         localhost:8888
${BROWSER}        Edge
${DELAY}          2
${HOMEPAGE URL}   http://${SERVER}/
${VERSION URL}    http://${SERVER}/version
${API URL}        http://${SERVER}/api

*** Keywords ***
Init App
  Create Webdriver    Edge    options=${signal_electron}    service=${signal_service}
Open Browser To Home Page
    Open Browser    ${HOMEPAGE URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Home Page Should Be Open

Home Page Should Be Open
    Title Should Be    WordCloud

Input Word Cloud Text
    [Arguments]    ${text}
    Input Text    text    ${text}

Submit Word Cloud Text
    Click Button    Submit

Open Browser To Version Endpoint
    Open Browser    ${VERSION URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
