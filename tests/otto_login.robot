*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}            https://admin-dev.ottopoint.id/ottopointweb/#/login
${USERNAME}       admin
${PASSWORD}       open123

*** Test Cases ***
Valid Login To OttoPoint
    [Tags]    login
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Wait Until Page Contains Element    xpath=//input[@type='userID']    timeout=10s
    Input Text    xpath=//input[@type='userID']    ${USERNAME}
    Click Button    xpath=//button[contains(text(),'Submit')]
    Wait Until Page Contains Element    id=password    timeout=10s
    Input Text    id=password    ${PASSWORD}
    Click Button    xpath=//button[contains(text(),'Login')]
    # Tambahkan assertion jika perlu, contoh:
    # Wait Until Page Contains    Welcome, admin

    [Teardown]    Close Browser
