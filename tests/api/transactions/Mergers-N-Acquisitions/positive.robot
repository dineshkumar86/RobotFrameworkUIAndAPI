*** Settings ***
Suite Setup    SuiteSetup
Resource    ../../../../resources/common/common_api.robot

*** Variables ***



*** Test Cases ***
ENABLER
    SuiteSetup

mna countries
    When I send a GET request:  /mna/countries
    Then Response status code should be:    200

mna tics industry
    When I send a GET request:  /mna/ticsindustry?countryCode=IND
    Then Response status code should be:    200

mna Companies
    When I send a GET request:  /mna/companies
    Then Response status code should be:    200

mna company search by name
    When I send a GET request:  /mna/companies?searchCriteria=Tech%20Mahindra%20Ltd
    Then Response status code should be:    200

mna companies all deal
    When I send a GET request:  /mna/Companies/06JLTG-E/allDeal
    Then Response status code should be:    200
    And Response body parameter should be:    [0][acquirer]  Tech Mahindra Ltd.

mna all deal currency
    When I send a GET request:  /mna/Companies/05HRR3-E/allDeal?currency=USD
    Then Response status code should be:    200

mna top deal maker
    When I send a GET request:  /mna/topDealMaker?country=IND&currency=INR&industry=All&periodEnd=2022-07-27&periodStart=2021-07-26&rowCount=10&rowOffset=0&sortingColumn=total_deals&sortingType=desc
    Then Response status code should be:    200

mna companies eps
    When I send a GET request:  /mna/Companies/eps?companyId=V08R67-R&periodicity=yearly
    Then Response status code should be:    200
    And Response body parameter should be:    [0][companyId]  V08R67-R
    And Response body parameter should be:    [0][currency]  INR

mna deal history download
    When I send a POST request:  /mna/dealHistroyDownload?entityId=06JLTG-E
    Then Response status code should be:    200

mna deal Term Synopsis Download
    When I send a POST request Download excel:   /mna/dealTermSynopsisDownload?dealId=4085553&entityId=05HRR3-E
    Then Response status code should be:    200

mna price Eps Performance
    When I send a POST request with data:  /mna/priceEpsPerformance  {"companyId": "B5SB09-R", "currency": "USD", "endDate": "2022-05-05", "entityId": "05HRR3-E", "epsPeriodicity":"daily","startDate":"2022-04-05"}
    Then Response status code should be:    200

mna price Eps Performance download
    When I send a POST request with data:  /mna/priceEpsPerformanceDownload  {"companyId": "B5SB09-R", "currency": "USD", "endDate": "2022-05-05", "entityId": "05HRR3-E", "epsPeriodicity":"daily","startDate":"2022-04-05"}
    Then Response status code should be:    200

mna top deal maker download
    When I send a POST request Download excel:  /mna/topDealMakerDownload?authentication=RSA&country=IND&currency=INR&industry=All&periodEnd=2022-07-27&periodStart=2021-07-2&rowCount=10&sortingColumn=0&sortingType=desc
    Then Response status code should be:    200
