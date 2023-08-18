*** Settings ***
Suite Setup    SuiteSetup
Resource    ../../../../resources/common/common_api.robot

*** Test Cases ***
ENABLER
    SuiteSetup


Debt Structure Borrowing Limit
    When I send a GET request:  /debtstructure/borrowinglimit?entityId=05HRR3-E
    Then Response status code should be:    200

Debt structure capital charges
    When I send a GET request:  /debtstructure/capitalcharges?entityId=05HRR3-E
    Then Response status code should be:    200

Debt structure debt
    When I send a GET request:  /debtstructure/debt?entityId=05HRR3-E
    Then Response status code should be:    200

Debt structure maturity
    When I send a GET request:  /debtstructure/maturity?entityId=05HRR3-E
    Then Response status code should be:    200

Download debt structure
    When I send a POST request Download excel:  /downloadDebtStructure?authentication=RSA&companyName=Reliance%252520Industries%252520Ltd.&entityId=05HRR3-E
    Then Response status code should be:    200

