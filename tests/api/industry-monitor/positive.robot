*** Settings ***

Suite Setup    SuiteSetup
Resource      ../../../resources/common/common_api.robot


*** Test Cases ***
ENABLER
    SuiteSetup

industry monitor setorList
    When I send a GET request:  /industry/sectorList
    Then Response status code should be:    200

industry monitor industry list
    When I send a GET request:  /industry/ticsIndustryList
    Then Response status code should be:    200

industy monitor countries
    When I send a GET request:  /industry/countries?ticsIndustryCode=
    Then Response status code should be:    200

industry monitor industry period
    When I send a GET request:  /industry/period?countryId=&ticsIndustryCode=
    Then Response status code should be:    200

industy monitor currency
    When I send a GET request:  /economy/currency/
    Then Response status code should be:    200
