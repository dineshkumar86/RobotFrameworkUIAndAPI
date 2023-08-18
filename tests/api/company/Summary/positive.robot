*** Settings ***
Suite Setup    SuiteSetup
Resource    ../../../../resources/common/common_api.robot

*** Test Cases ***
ENABLER
    SuiteSetup


Get summary details of company
    When I send a GET request:  /companies/WFKG8H-R/metadata/info?currency=INR
    Then Response status code should be:    200
    And Response body parameter should be:    [companyName]    Indian Oil Corp. Ltd.
    And Response body parameter should be:    [exchangeName]   BSE Ltd.
    And Response body parameter should not be EMPTY:  [sharePrice]
    And Response body parameter should not be EMPTY:  [highStockPrice]
    And Response body parameter should not be EMPTY:  [lowStockPrice]
    And Response body parameter should not be EMPTY:  [dailyVolume]
    And Response body parameter should not be EMPTY:  [priceEarnings]
    And Response body parameter should not be EMPTY:  [priceBookValue]
    And Response body parameter should not be EMPTY:  [marketCap]
    And Response body parameter should not be EMPTY:  [evEbitda]
    And Response body parameter should not be EMPTY:  [finViability]
    And Response body parameter should be:    [cashMcapUnit]   %
    And Response body parameter should be:    [dividendYieldUnit]   %
    And Response body parameter should be:    [finViabilityUnit]   Years
    And Response body parameter should be:    [bookValueUnit]     x
    And Response body parameter should be:    [evEbitdaUnit]     x

download company profile
    When I send a POST request Download excel:  /downloadCompanyProfile?authentication=RSA&companyId=V08R67-R
    Then Response status code should be:    200


Benchmark-Interactive Analysis Yearly
     When I send a GET request:  /companies/V08R67-R/editbenchmarkcompanies?periodType=yearly&resultLimit=7
     Then Response status code should be:    200
     And Response body parameter should be:    [0][periodType]   YEARLY
     And Response body parameter should be:    [0][companyId]   V08R67-R
     And Response body parameter should be:    [0][companyName]   Indian Oil Corp. Ltd.
     And Response body parameter should be:    [0][currency]   INR
     And Response body parameter should be:    [0][fieldName]   t_net_sales_growth
     And Response body parameter should not be EMPTY:  [0][data]
     And Response body parameter should be:    [0][shortName]   Revenue Growth
     And Response body parameter should be:    [0][itemName]   Net Sales Growth
     And Response body parameter should be:    [0][unit]   %

Benchmark-Interactive Analysis Quarterly
     When I send a GET request:  /companies/V08R67-R/editbenchmarkcompanies?periodType=quarterly&resultLimit=7
     Then Response status code should be:    200
     And Response body parameter should be:    [0][periodType]   QUARTERLY
     And Response body parameter should be:    [0][companyId]   V08R67-R
     And Response body parameter should be:    [0][companyName]   Indian Oil Corp. Ltd.
     And Response body parameter should be:    [0][currency]   INR
     And Response body parameter should be:    [0][fieldName]   t_net_sales_growth
     And Response body parameter should not be EMPTY:  [0][data]
     And Response body parameter should be:    [0][shortName]   Revenue Growth
     And Response body parameter should be:    [0][itemName]   Net Sales Growth
     And Response body parameter should be:    [0][unit]   %


Relative Price Performance
     When I send a GET request:  /companies/relativeperformance?companyId=V08R67-R
     Then Response status code should be:    200
     And Response body parameter should not be EMPTY:  [duration]
     And Response body parameter should not be EMPTY:  [comPerChange]
     And Response body parameter should not be EMPTY:  [indexPerChange]
