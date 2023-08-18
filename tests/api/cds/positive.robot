*** Settings ***
Suite Setup    SuiteSetup
Resource    ../../../resources/common/common_api.robot

*** Test Cases ***
ENABLER
    SuiteSetup


CDS Name List
    When I send a GET request:  /cds/cdsNameList?currency=USD&searchCriteria=Alberto-Culver%20Company&sector=Consumer%20Staples
    Then Response status code should be:    200

Currency List
    When I send a GET request:  /cds/currencyList
    Then Response status code should be:    200

CDS Metric List
    When I send a GET request:  /cds/metricList
    Then Response status code should be:    200

CDS comparable
    When I send a GET request:  /cds/comparable?identifier=04297120EURSeniorCR
    Then Response status code should be:    200

CDS data
    When I send a GET request:  /cds/cdsData
    Then Response status code should be:    200

