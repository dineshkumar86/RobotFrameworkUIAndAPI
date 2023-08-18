*** Settings ***
Suite Setup    SuiteSetup
Resource    ../../../../resources/common/common_api.robot

*** Test Cases ***
ENABLER
    SuiteSetup

Get summary details of company
    When I send a GET request:  /companies/WFKG8H-R/metadata/info?currency=INR
    Then Response status code should be:    200
