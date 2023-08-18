*** Settings ***
Library     SeleniumLibrary
Resource    ../pages/bonds_pages.robot
Library     String


*** Keywords ***

bonds: select bonds pages
    Wait Until Keyword Succeeds    5x    2s  Click Element    ${tab_bonds}


bonds: select category in dropdown:
    [Arguments]  ${user_category}
    Wait Until Keyword Succeeds    5x    2s  Click Element    ${ddl_category}
    Input Text    ${input_category}    ${user_category}
    ${category}=  Replace String    ${sel_category}    *    ${user_category}
    Wait Until Keyword Succeeds    5x    2s  Click Element    ${category}


bonds: select currency in dropdown:
    [Arguments]    ${user_currency}
    Wait Until Keyword Succeeds    5x    2s  Click Element    ${ddl_currency}
    Input Text    ${input_currency}    ${user_currency}
    ${sel_currency}=  Replace String    ${currency}    *    ${user_currency}
    Wait Until Keyword Succeeds    5x    2s  Click Element    ${sel_currency}


bonds: select bonds in dropdown:
    [Arguments]  ${input_bond_by_user}
    Wait Until Keyword Succeeds    5x    2s  Click Element    ${ddl_bond}
    Input Text    ${input_bond}    ${input_bond_by_user}
    ${bond_name}=  Replace String    ${bond}    *    ${input_bond_by_user}
    Wait Until Keyword Succeeds    5x    2s  Click Element    ${bond_name}

bonds: bonds name should be show on the bond page:
    [Arguments]  ${bonds_name_page}
    ${bonds_name}=  Get Text    ${name_bond}
    Should Be Equal    ${bonds_name}    ${bonds_name_page}

bonds: advance search
    Click Element    ${advanced_search}
    Select From List By Value    locator


bonds:country :     #United States
    [Arguments]     ${country}
    Wait Until Element Is Visible    ${ddl_country}  timeout=20
    Click Element    ${ddl_country}
    Input Text    ${input}    ${country}
    ${sel_country}=  Replace String    ${sel_country}    *    ${country}
    Click Element    ${sel_country}


bonds:currency:  #USD
    [Arguments]    ${user_currency}
    Wait Until Element Is Visible    ${ddl_currency_adv}    timeout=20
    Click Element    ${ddl_currency_adv}
    Input Text    ${input}    ${user_currency}
    ${sel_currency}=  Replace String    ${sel_currency_adv}    *    ${user_currency}
    Click Element    ${sel_currency}
    Sleep    7s

bonds:tenor:  #2 to 3
    [Arguments]    ${user_tenor}
    Wait Until Element Is Visible    ${ddl_tenor}    timeout=20
    Click Element    ${ddl_tenor}
    Input Text    ${input}    ${user_tenor}
    ${sel_tenor}=  Replace String    ${sel_tenor}    *    ${user_tenor}
    Click Element    ${sel_tenor}


bonds:yield to Maturity:   #0.40 to 0.88
    [Arguments]    ${user_yield_to_maturity}
    Wait Until Element Is Visible    ${ddl_yield_to_maturity}    timeout=20
    Click Element    ${ddl_yield_to_maturity}
    Input Text    ${input}    ${user_yield_to_maturity}
    ${sel_yield_to_maturity}=  Replace String    ${sel_yield_to_maturity}    *    ${user_yield_to_maturity}
    Click Element    ${sel_yield_to_maturity}


bonds:modified duration:        #1.67 to 2.35
    [Arguments]    ${user_duration}
    Wait Until Element Is Visible    ${ddl_modified_duration}    timeout=20
    Click Element    ${ddl_modified_duration}
    Input Text    ${input}    ${user_duration}
    ${sel_duration}=  Replace String    ${sel_modified_duration}    *    ${user_duration}
    Click Element    ${sel_duration}



