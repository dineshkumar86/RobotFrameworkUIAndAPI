*** Settings ***
Suite Setup    SuiteSetup
Resource    ../../../../resources/common/common_api.robot

*** Test Cases ***
ENABLER
    SuiteSetup

Search_with_empty_search_criteria_all_default_values_check
    When I send a GET request:  /companies?searchCriteria=
    Then Response status code should be:    200

Search_by_attribute_that_does_not_return_company
    When I send a GET request:  /companies?searchCriteria=test123
    Then Response status code should be:    200

Search_by_full_name
    When I send a GET request:  /companies?searchCriteria=apple%20inc
    Then Response status code should be:    200
    And Response body parameter should be:    [0][properName]   Apple Inc.

Search_by_company_exchange_code
    When I send a GET request:  /companies?searchCriteria=500325
    Then Response status code should be:    200
    And Response body parameter should be:    [0][properName]   Reliance Industries Limited
