*** Settings ***
Suite Setup    SuiteSetup
Resource    ../../../resources/common/common_api.robot

*** Variables ***
@{categeory}  Quasi & Foreign Government  Corporate  Sovereign  Securitized/Collateralized  CASH
@{currency}   CNH  USD  EUR  INR  GBP  SGD  HKD


*** Test Cases ***
ENABLER
    SuiteSetup

Fi categeory list
    When I send a GET request:  /fi/categeory
    Then Response status code should be:    200
    And Each array element of array in response should contains:   @{categeory}
    And I send a GET request:  /fi/currencyList?categeory=Corporate
    And Response status code should be:    200
    And Each array element of array in response should contains:   @{currency}

Fi name list
    When I send a GET request:  /fi/fiNameList?categeory=Corporate&currency=INR
    Then Response status code should be:    200
    And Response body parameter should be:    [0][categeory]   Corporate

Fi Data
    When I send a GET request:  /fi/fiData?fieldName=yield_to_maturit&identifier=US912810FM54
    Then Response status code should be:    200
    And Response body parameter should be:    [bondLatestData][isin_number]   US912810FM54

Fi AdvanceSearch
    When I send a POST request with data:  /getAdvanceSearch  {"additionalProp1": "Corporate", "additionalProp2": "INR", "additionalProp3": "ABB Ltd"}
    Then Response status code should be:    200





