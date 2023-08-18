*** Settings ***
Suite Setup    SuiteSetup
Resource    ../../../../resources/common/common_api.robot

*** Test Cases ***
ENABLER
    SuiteSetup

Search_without_query_parameter
    When I send a GET request:    /companies?
    Then Response status code should be:    400
    And Response reason should be:    Bad Request

