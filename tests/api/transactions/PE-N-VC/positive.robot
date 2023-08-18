*** Settings ***
Suite Setup    SuiteSetup
Resource    ../../../../resources/common/common_api.robot

*** Variables ***

*** Test Cases ***
ENABLER
    SuiteSetup


pevc countries
    When I send a GET request:  /pevc/countries
    Then Response status code should be:    200

pevc company
    When I send a GET request:  /pevc/company
    Then Response status code should be:    200

pevc financial type
    When I send a GET request:  /pevc/financialtype
    Then Response status code should be:    200

Top funding compaines
    When I send a GET request:  /pevc/topFundedCompanies?countryIsoCode=IND&currency=INR&endDate=2022-07-27&limit=100&startDate=2021-07-27
    Then Response status code should be:    200

pevc summary sector chart
    When I send a GET request:  /pevc/summary/sectorCharts?countryIsoCode=IND&currency=USD
    Then Response status code should be:    200

pevc summary industry chart
    When I send a GET request:  /pevc/summary/industryChart?countryIsoCode=IND&currency=USD&sectorCode=3300
    Then Response status code should be:    200

pevc summary country chart
    When I send a GET request:  /pevc/summary/countryChart?countryIsoCode=IND&currency=USD
    Then Response status code should be:    200

pevc advance search countries
    When I send a GET request:  /pevc/advancesearchcountries
    Then Response status code should be:    200

pevc advance search financial type
    When I send a GET request:  /pevc/advancesearchfinancialtype
    Then Response status code should be:    200

pevc advance search industry
    When I send a GET request:  /pevc/advancesearchindustry
    Then Response status code should be:    200

pevc all funding detail
    When I send a GET request:  /pevc/allFundingDetail?country=IND&currency=INR&financingType=All&industry=All&periodEnd=2022-07-27&periodStart=2021-07-27&rowCount=10&rowOffset=0&sortingColumn=inception_date&sortingType=desc
    Then Response status code should be:    200

pevc all funding download
    When I send a POST request:  /pevc/allFundingDetailDownload?country=IND&currency=INR&financingType=All&industry=All&periodEnd=2022-07-27&periodStart=2021-07-27&rowCount=10&rowOffset=0&sortingColumn=inception_date&sortingType=desc
    Then Response status code should be:    200

pevc all funding detail advanceed search
    When I send a GET request:  /pevc/allFundingDetailAdvancedSearch?country=IND&currency=INR&financingType=All&industry=All&issueType=PQ&periodEnd=2022-07-27&periodStart=2021-07-27&rowCount=10&rowOffset=0&sortingColumn=inception_date&sortingType=desc
    Then Response status code should be:    200

pevc all funding details advance search download
    When I send a POST request:  /pevc/allFundingDetailAdvancedSearchDownload?country=IND&currency=INR&financingType=All&industry=All&issueType=PQ&periodEnd=2022-07-27&periodStart=2021-07-27&rowCount=10&rowOffset=0&sortingColumn=inception_date&sortingType=desc
    Then Response status code should be:    200

pevc company
    When I send a GET request:  /pevc/company
    Then Response status code should be:    200

pevc issue type
    When I send a GET request:  /pevc/issueType
    Then Response status code should be:    200

pevc minmax Funding Amount
    When I send a GET request:  /pevc/minmaxFundingAmount
    Then Response status code should be:    200

pevc summary download
    When I send a GET request:  /pevc/summary/download?countryIsoCode=IND&currency=INR
    Then Response status code should be:    200







