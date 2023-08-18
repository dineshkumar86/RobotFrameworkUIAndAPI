*** Settings ***
Suite Setup    SuiteSetup
Resource      ../../../resources/common/common_api.robot

*** Test Cases ***

Industry country
    When I send a GET request:  /industry/countries
    Then Response status code should be:    200

Industry currency
    When I send a GET request:  /economy/currency
    Then Response status code should be:    200

Industry period
    When I send a GET request:  /industry/period
    Then Response status code should be:    200

Industry sectorList
    When I send a GET request:  /industry/sectorList?periodType=YEARLY&startDate=2022-03-31&endDate=2022-03-31&countryId=&currency=USD
    Then Response status code should be:    200

Industry setor
    When I send a GET request:  /industry/sectors?periodType=YEARLY&startDate=2022-03-31&endDate=2022-03-31&countryId=&currency=USD
    Then Response status code should be:    200
