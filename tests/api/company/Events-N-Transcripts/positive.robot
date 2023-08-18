*** Settings ***
Suite Setup    SuiteSetup
Resource    ../../../../resources/common/common_api.robot

*** Test Cases ***
ENABLER
    SuiteSetup

Company Events
    When I send a GET request:  /events?entityId=003KJ3-E
    Then Response status code should be:    200

Download Company Events
    When I send a POST request Download excel:  /eventsDownload?authentication=RSA&companyId=FXH4XG-R&companyName=QUALCOMM%20INCORPORATED&entityId=000V67-E
    Then Response status code should be:    200

Insider Transaction
    When I send a GET request:  /insiderTransaction?currency=USD&securityId=C7R3T7-S
    Then Response status code should be:    200

Download Insider Transaction
    When I send a POST request Download excel:  /insiderTransactionDownload?authentication=RSA&companyName=QUALCOMM%20INCORPORATED&currency=USD&securityId=C7R3T7-S
    Then Response status code should be:    200

Company transcript
    When I send a GET request:  /transcript?reportId=123
    Then Response status code should be:    200

Company Filings
    When I send a GET request:  /companyFilings?companyId=FXH4XG-R&pageNo=5
    Then Response status code should be:    200

