*** Settings ***
Library     SeleniumLibrary     timeout=25
Resource    ../pages/company_pages.robot
Library     String
Library     DateTime



*** Keywords ***

summary: public company is selected
    Wait Until Keyword Succeeds    5x    2s  Wait Until Element Is Visible    ${check_box_public_company}
    ${Is_Checkbox_Selected}=    Run Keyword And Return Status    Radio Button Should Not Be Selected    id:entitySelect2
    ${Actual_Chkbx_Value}=  Run Keyword If   '${Is_Checkbox_Selected}'== 'True'    Set Variable    Yes
    ...    ELSE IF    '${Is_Checkbox_Selected}'== 'False'    Set Variable    No
    Log To Console    ${Actual_Chkbx_Value}
    [Return]    ${Actual_Chkbx_Value}

summary: search public company in search box:
    [Arguments]    ${public_company}
    Wait Until Keyword Succeeds    5x    2s  Click Element    ${public_company_search}
    Input Text    ${input_search_box}    ${public_company}
    ${company_name}=  Replace String    ${select_drop_down}    *    ${public_company}
    Wait Until Keyword Succeeds    5x    2s  Click Element    ${company_name}


summary: company name should be:
    [Arguments]     ${company_name_ticker}
    Wait Until Keyword Succeeds    5x    2s   Wait Until Element Is Visible    ${selected_comany_on_page}
    ${company_name}=    Get Text    ${selected_comany_on_page}
    Wait Until Keyword Succeeds    5x    2s   Should Be Equal    ${company_name}    ${company_name_ticker}

summary: exchange should be:
    [Arguments]     ${exchange_name}
    Wait Until Element Is Visible    ${exchange_list}
    ${exchange}=    Get Text    ${exchange_list}
    Should Be Equal    ${exchange}    ${exchange_name}

summary: currency should be:
    [Arguments]     ${currency}
    Wait Until Element Is Visible    ${defult_currency}
    ${get_currency}=    Get Text    ${defult_currency}
    Should Be Equal    ${get_currency}    ${currency}

summary: years should be selected:
    [Arguments]     ${years}
    Wait Until Element Is Visible    ${defult_years}
    ${get_years}=    Get Text    ${defult_years}
    Should Be Equal    ${get_years}    ${years}

summary: periodicity should be selected:
    [Arguments]     ${periodicity}
    Element Should Be Visible    ${defult_periodicity}
    ${get_periodicity}=    Get Text    ${defult_periodicity}
    Should Be Equal    ${get_periodicity}    ${periodicity}

summary: index should be:
    [Arguments]     ${index}
    Element Should Be Visible    ${defult_index}
    ${get_index}=    Get Text    ${defult_index}
    Should Be Equal    ${get_index}    ${index}

summary: download stock price
    Element Should Be Visible    ${download_stock_price}
    Wait Until Keyword Succeeds    5x    .5s  Click Element    ${download_stock_price}

financials: select financials tab on company page
    Wait Until Keyword Succeeds    5x    .5s      Click Element    ${btn_financials}
    Sleep    1s
    Wait Until Element Is Visible    ${txt_fin}

financials: download financials excel
    Wait Until Element Is Visible    ${download_fin}
    Click Element    ${download_fin}

Segment Information: select Segment Information tab on company page
     Wait Until Keyword Succeeds    5x    .5s  Click Element    ${btn_segment_info}
     Sleep    1s
     Element Should Be Visible    ${txt_segment}

Segment Information: download segment excel
    Element Should Be Visible    ${download_segment}
    Click Element    ${download_segment}

debt profile: select debt profile on company page
    Wait Until Keyword Succeeds    5x    .5s  Click Element    ${btn_debt_profile}
    Sleep    1s
    Element Should Be Visible    ${txt_debt_profile}

debt profile: download debt profile excel
    Wait Until Keyword Succeeds    5x    .5s  Click Element    ${download_debt_pro}

management: select management on company page
    Wait Until Keyword Succeeds    5x    .5s  Click Element    ${btn_management_key}
    Sleep    1s
    Element Should Be Visible    ${txt_management_key_emp}

management: download management profile excel
    Element Should Be Visible    ${download_management_key_employees}
    Click Element    ${download_management_key_employees}

ownership: select ownership on company page
    Wait Until Keyword Succeeds    5x    .5s  Click Element    ${btn_ownership}
    Sleep    1s
    Element Should Be Visible    ${txt_ownership}

ownership: download ownership profile excel
    Wait Until Keyword Succeeds    5x    .5s  Click Element    ${img_ownership_downlaod}

analyst coverage: select analyst coverage on company page
    Wait Until Keyword Succeeds    5x    .5s  Click Element    ${btn_analyst_coverage}
    Sleep    1s
    Element Should Be Visible    ${txt_analyst_coverage}

analyst coverage: download analyst coverage profile excel
    Wait Until Keyword Succeeds    5x    .5s  Click Element    ${img_analyst_coverage}

Events and filings: select Events and filings on company page
    Wait Until Element Is Visible    ${btn_events}
    Wait Until Keyword Succeeds    5x    .5s  Click Element    ${btn_events}
    Sleep    1s
    Element Should Be Visible    ${txt_events}

Events and filings: download Events and filings profile excel
    Wait Until Keyword Succeeds    5x    .5s  Click Element    ${download_events_transcripts}







