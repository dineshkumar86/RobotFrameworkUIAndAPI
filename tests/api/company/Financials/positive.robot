*** Settings ***
Suite Setup    SuiteSetup
Resource    ../../../../resources/common/common_api.robot

*** Test Cases ***
ENABLER
    SuiteSetup


Financials Income Statement Yearly
     When I send a GET request:  /companies/V08R67-R/financial/IS?periodType=Yearly
     Then Response status code should be:    200

Financials Income Statement Quarterly
     When I send a GET request:  /companies/V08R67-R/financial/IS?periodType=quarterly
     Then Response status code should be:    200

Financials Balance Sheet Yearly
     When I send a GET request:  /companies/V08R67-R/financial/BS?periodType=Yearly
     Then Response status code should be:    200

Financials Balance Sheet Quarterly
     When I send a GET request:  /companies/V08R67-R/financial/BS?periodType=Quarterly
     Then Response status code should be:    200

Financials Cash Flow Yearly
     When I send a GET request:  /companies/V08R67-R/financial/CF?periodType=Yearly
     Then Response status code should be:    200

Financials Cash Flow Quarterly
     When I send a GET request:  /companies/V08R67-R/financial/CF?periodType=Quarterly
     Then Response status code should be:    200

Financials Financial Ratios Yearly
     When I send a GET request:  /companies/V08R67-R/financial/FR?periodType=Yearly
     Then Response status code should be:    200

Financials Financial Ratios Quarterly
     When I send a GET request:  /companies/V08R67-R/financial/FR?periodType=Quarterly
     Then Response status code should be:    200
