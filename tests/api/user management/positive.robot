*** Settings ***
Suite Setup    SuiteSetup
Resource      ../../../resources/common/common_api.robot


*** Test Cases ***
user login
    When I get access token for the customer:    /auth/login  test6@gloify.com  test123
    Then Response status code should be:    200
    And Response body parameter should be:    [data][email]  test6@gloify.com

user logout
    When I send a POST request:  /user/logout?email=test6@gloify.com
    Then Response status code should be:    200

