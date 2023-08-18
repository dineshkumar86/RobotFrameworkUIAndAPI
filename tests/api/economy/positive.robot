*** Settings ***
Suite Setup    SuiteSetup
Resource      ../../../resources/common/common_api.robot


*** Test Cases ***
ENABLER
    SuiteSetup

economy countries
    When I send a GET request:  /economy/countries
    Then Response status code should be:    200


economy historical data
    When I send a GET request:  /economy/countries/indicators/historical-data?countryIsoCodeList=IND&indicatorNameList=GDP%20Annual%20Growth%20Rate&periodType=Quarterly
    Then Response status code should be:    200

economy historical data with forecast
    When I send a GET request:  /economy/countries/indicators/historical-data-with-forecast?countryIsoCode=IND&indicatorName=GDP%20Annual%20Growth%20Rate&periodType=Quarterly
    Then Response status code should be:    200

economy news
    When I send a GET request:  /economy/news?countryIsoCode=IND
    Then Response status code should be:    200

economy latestfx
    When I send a GET request:  /economy/countries/103/latestfx
    Then Response status code should be:    200

economy credit rating
    When I send a GET request:  /economy/credit-rating?countryIsoCode=IND
    Then Response status code should be:    200

economy latest data
    When I send a GET request:  /economy/countries/IND/latest-data
    Then Response status code should be:    200

economy indicator
    When I send a GET request:  /economy/indicators?countryIsoCodeList=IND
    Then Response status code should be:    200
