*** Settings ***
Resource    ../../resources/common/common_financial.robot
Resource    ../../resources/steps/company_step.robot
Resource    ../../resources/steps/bonds_step.robot
Suite Setup       SuiteSetup
#Suite Teardown    SuiteTeardown
Test Setup        TestSetup
#Test Teardown     TestTeardown


*** Test Cases ***
Company Page TC001: Summary
    Financn on Finanial: logicial Market with provided credentials:
    summary: public company is selected
    summary: search public company in search box:  Apple, Inc.
    summary: company name should be:  APPLE INC. (NAS: AAPL) | TELECOMMUNICATIONS EQUIPMENT | UNITED STATES
    summary: exchange should be:   NASDAQ
    summary: currency should be:  USD
    summary: years should be selected:  1 Yr
    summary: periodicity should be selected:   Daily
    summary: index should be:   NASDAQ-100 Index
    summary: download stock price

company page TC002: Financials
    Financial: login on Financial Market with provided credentials:
    financials: select financials tab on company page
    financials: download financials excel

company page TC003: Segment Information
    Financial: login on Financial Market with provided credentials:
    Segment Information: select Segment Information tab on company page
    Segment Information: download segment excel

company page TC004: debt profile
    Financial: login on Financial Market with provided credentials:
    debt profile: select debt profile on company page
    debt profile: download debt profile excel

company page TC005: management & key employees
    Financial: login on Financial Market with provided credentials:
    management: select management on company page
    management: download management profile excel

company page TC006: ownership
    Financial: login on Financial Market with provided credentials:
    ownership: select ownership on company page
    ownership: download ownership profile excel

company page TC007: analyst coverage
    Financial: login on Financial Market with provided credentials:
    analyst coverage: select analyst coverage on company page
    analyst coverage: download analyst coverage profile excel

company page TC008: Events and filings
    Financial: login on Financial Market with provided credentials:
    Events and filings: select Events and filings on company page
    Events and filings: download Events and filings profile excel
