*** Settings ***
Suite Setup    SuiteSetup
Resource    ../../../../resources/common/common_api.robot

*** Test Cases ***
ENABLER
    SuiteSetup


Analyst recommendation
    When I send a GET request:  /analyst/WFKG8H-R/recommendation?recType=REC
    Then Response status code should be:    200

Analyst Total Recommendation
    When I send a GET request:  /analyst/WFKG8H-R/totalrecommendation?recType=REC
    Then Response status code should be:    200

Download Analyst recommendation
    When I send a POST request Download excel:  /downloadAnalystRecommendation?authentication=RSA&companyId=WFKG8H-R&companyName=RELIANCE%2520INDUSTRIES%2520LIMITED&recType=REC
    Then Response status code should be:    200

Analyst Estimates Consensus yeary
    When I send a GET request:  /analyst/WFKG8H-R/consensus/financial?periodicity=YEARLY
    Then Response status code should be:    200

Analyst Estimates basic Consensus quarterly
    When I send a GET request:  /analyst/WFKG8H-R/basic/consensus?isDownload=true&periodicity=quarterly
    Then Response status code should be:    200

Analyst Estimates basic Consensus yeary
    When I send a GET request:  /analyst/WFKG8H-R/basic/consensus?isDownload=true&periodicity=yeary
    Then Response status code should be:    200

Download Estimates Consensus
    When I send a POST request Download excel:  /downloadAnalystConsensus?authentication=RSA&companyId=WFKG8H-R&companyName=RELIANCE%20INDUSTRIES%20LIMITED
    Then Response status code should be:    200

Management Guidance Performance yearly
    When I send a GET request:  /analyst/FXH4XG-R/advanced/manageguide?periodicity=yearly
    Then Response status code should be:    200

Management Guidance Performance quarterly
    When I send a GET request:  /analyst/FXH4XG-R/advanced/manageguide?periodicity=quarterly
    Then Response status code should be:    200

