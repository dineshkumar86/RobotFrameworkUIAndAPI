*** Settings ***
Suite Setup    SuiteSetup
Resource    ../../../../resources/common/common_api.robot

*** Variables ***



*** Test Cases ***
ENABLER
    SuiteSetup

Upcoming ipo list
    When I send a GET request:   /ipo/upcoming-ipo-list/1/10
    Then Response status code should be:    200
