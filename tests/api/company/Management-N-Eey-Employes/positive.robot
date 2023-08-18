*** Settings ***
Suite Setup    SuiteSetup
Resource    ../../../../resources/common/common_api.robot

*** Test Cases ***
ENABLER
    SuiteSetup


Ownership Structure management info
    When I send a GET request:  /ownershipstructure/managementinfo?companyName=RELIANCE%20INDUSTRIES%20LTD.&entityId=05HRR3-E
    Then Response status code should be:    200

Ownership Structure people profile
    When I send a GET request:  /ownershipstructure/peopleprofile?personId=06F4NQ-E
    Then Response status code should be:    200


Ownership Structure holdings
    When I send a GET request:  /ownershipstructure/holdings?personId=06F4NQ-E
    Then Response status code should be:    200

Ownership Structure employee history
    When I send a GET request:  /ownershipstructure/holdings?personId=06F4NQ-E
    Then Response status code should be:    200

Ownership Structure directorship
    When I send a GET request:  /ownershipstructure/directorship?personId=06F4NQ-E
    Then Response status code should be:    200

Download Ownership Structure
    When I send a POST request:  /downloadOwnershipStructure?authentication=RSA&companyName=RELIANCE%2520INDUSTRIES%2520LTD.&entityId=05HRR3-E
    Then Response status code should be:    200


