*** Settings ***
Library    SeleniumLibrary      timeout=60s
Library    OperatingSystem
Library    DateTime


*** Variables ***
${email}   xpath://input[@type='email']
${password}  xpath://input[@type='password']
${login}    xpath://button[contains(text(),'Login')]

# *** SUITE VARIABLES ***
${headless}            false
${browser}             Chrome
${browser_timeout}     13 seconds
${SiteUrl}   https://xyz.com/login



*** Keywords ***
Financial: login on Financial Market with provided credentials:
    Input Text  ${email}  test3@gmail.com
    Input Text    ${password}    test123
    Click Element    ${login}
    Sleep    10s

SuiteSetup
    [documentation]  Basic steps before each suite
    Remove Files    C:/Users/Dinesh Kumar/PycharmProjects/FinancialMarkets/selenium-screenshot-*.png
    Remove Files    resources/libraries/__pycache__/*
    Open Browser    ${SiteUrl}   ${browser}
    maximize browser window
    Set Browser Implicit Wait    ${browser_timeout}
    ${today}=    Get Current Date    result_format=%Y-%m-%d
    Set Global Variable    ${today}
    [Teardown]

SuiteTeardown
    Close All Browsers

TestSetup
    Go To    ${SiteUrl}

TestTeardown
    Delete All Cookies
