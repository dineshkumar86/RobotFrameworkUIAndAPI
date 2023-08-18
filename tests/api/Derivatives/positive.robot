*** Settings ***
Suite Setup    SuiteSetup
Resource    ../../../resources/common/common_api.robot

*** Variables ***
@{categeory}  Futures  Options


*** Test Cases ***
ENABLER
    SuiteSetup


derivative name
    When I send a GET request:  /derivative/derivative-name?searchCriteria=COVESTRO%20AG
    Then Response status code should be:    200
    And Response body parameter should be:    [0][underlyingName]  COVESTRO AG

derivative data
    When I send a GET request:  /derivative/derivativeData
    Then Response status code should be:    200

derivative category
    When I send a GET request:  /derivative/category
    Then Response status code should be:    200
    And Each array element of array in response should contains:   @{categeory}

derivative future Comparable
    When I send a GET request:  /derivative/futureComparable?identifier=16dO%3AQRTEA%5C23A20%5C12.0
    Then Response status code should be:    200


derivative option Comparable
    When I send a GET request:  /derivative/optionComparable?identifier=16dO%3AQRTEA%5C23A20%5C12.0
    Then Response status code should be:    200


