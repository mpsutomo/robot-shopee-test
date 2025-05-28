*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Shopee Website
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}       chrome
${URL}           https://shopee.co.id
${SEARCH_TERM}   sepatu sneakers

*** Keywords ***
Open Shopee Website
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    xpath=//input[@placeholder="Cari di Shopee"]
    Run Keyword And Ignore Error    Close Login Popup If Exists

Close Login Popup If Exists
    Wait Until Element Is Visible    xpath=//div[@class="shopee-popup__close-btn"]    timeout=5s
    Click Element    xpath=//div[@class="shopee-popup__close-btn"]

*** Test Cases ***

Search And Verify Product
    Title Should Contain    Shopee
    Input Text    xpath=//input[@placeholder="Cari di Shopee"]    ${SEARCH_TERM}
    Press Keys    xpath=//input[@placeholder="Cari di Shopee"]    RETURN
    Wait Until Page Contains Element    xpath=//div[contains(@class, "shopee-search-item-result__item")]
    Page Should Contain    ${SEARCH_TERM}

Click On First Product And Log Title
    Click Element    xpath=(//div[contains(@class, "shopee-search-item-result__item")])[1]
    Wait Until Page Contains Element    xpath=//div[contains(@class, "qaNIZv")]
    ${title}=    Get Text    xpath=//div[contains(@class, "qaNIZv")]
    Log    Nama Produk Diuji: ${title}
