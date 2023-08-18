*** Settings ***
Suite Setup    SuiteSetup
Resource    ../../../../resources/common/common_api.robot

*** Test Cases ***
ENABLER
    SuiteSetup

Segment Structure busniness
    When I send a GET request:  /segmentstructure/business?fsimId=WFKG8H-R
    Then Response status code should be:    200
    And Response body parameter should be:    [0][fsymId]    WFKG8H-R

Segment Structure operational
    When I send a GET request:  /segmentstructure/operational?fsimId=WFKG8H-R
    Then Response status code should be:    200
    And Response body parameter should be:    [0][fsymId]    WFKG8H-R

Segment Structure operational quarter
    When I send a GET request:  /segmentstructure/operationalQuarter?fsimId=WFKG8H-R
    Then Response status code should be:    200
    And Response body parameter should be:    [0][fsymId]    WFKG8H-R

Segment Structure region
    When I send a GET request:  /segmentstructure/region?fsimId=WFKG8H-R
    Then Response status code should be:    200
    And Response body parameter should be:    [0][fsymId]    WFKG8H-R

Download Segment Operational Data
    When I send a POST request Download excel:  /downloadSegmentOperationalData?authentication=RSA&companyName=Reliance%2520Industries%2520Ltd.&fsimId=WFKG8H-R
    Then Response status code should be:    200
