*** Settings ***
Suite Setup    SuiteSetup
Resource      ../../../resources/common/common_api.robot


*** Test Cases ***
ENABLER
    SuiteSetup

commodity historical data
    When I send a GET request:  /commodity/historical-data?symbolList=CL1:COM&startDate=2021-07-26&endDate=2022-07-27
    Then Response status code should be:    200

commodity news
    When I send a GET request:  /commodity/news?
    Then Response status code should be:    200

commodity latest data
    When I send a GET request:  /commodity/latest-data?
    Then Response status code should be:    200
