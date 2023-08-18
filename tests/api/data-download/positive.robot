*** Settings ***

Suite Setup    SuiteSetup
Resource      ../../../resources/common/common_api.robot


*** Test Cases ***
ENABLER
    SuiteSetup

economy countries
    When I send a GET request:  /economy/countries
    Then Response status code should be:    200
