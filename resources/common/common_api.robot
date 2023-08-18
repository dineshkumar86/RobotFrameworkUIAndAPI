*** Settings ***
Library     RequestsLibrary
Library     String
Library     Dialogs
Library     OperatingSystem
Library     Collections
Library     BuiltIn
Library     DateTime
Library     JSONLibrary
Library     DatabaseLibrary
*** Variables ***
#${current_url}      https://financialmarketapi.televisory.com/CapitalMarket
${current_url}       https://financialmarketapi.televisory.com/CapitalMarket

# *** SUITE VARIABLES ***
${api_timeout}                 90
${default_password}            test123
${default_allow_redirects}     true
${default_auth}                ${NONE}
# *** DB VARIABLES ***
${email}    test6@gloify.com

*** Keywords ***

I set Headers:
    [Documentation]    Keyword sets any number of headers for the further endpoint calls.
    ...    Headers can have any name and any value, they are set as test variable - which means they can be used throughtout one test if set once.
    ...    This keyword can be used to add access token to the next endpoint calls or to set header for the guest customer, etc.
    ...
    ...    It accepts a list of pairs haader-name=header-value as an argument. The list items should be separated by 4 spaces.
    ...
    ...    *Example:*
    ...
    ...    ``I set Headers:    Content-Type=${default_header_content_type}    Authorization=${token}``

    [Arguments]    &{headers}
    Set Suite Variable    &{headers}
    [Return]    &{headers}

I get access token for the customer:
    [Documentation]    This is a helper keyword which helps get access token for future use in the headers of the following requests.
    ...
    ...    It gets the token for the specified customer ``${email}`` and saves it into the test variable ``${token}``, which can then be used within the scope of the test where this keyword was called.
    ...    After the test ends the ``${token}`` variable is cleared. This keyword needs to be called separately for each test where you expect to need a customer token.
    ...
    ...    The password in this case is not passed to the keyword and the default password stored in ``${default_password}`` will be used when getting token.
    ...
    ...    *Example:*
    ...
    ...    ``I get access token for the customer:    ${yves_user.email}``
    [Arguments]   ${path}  ${email}    ${password}=${default_password}
#    ${hasValue}    Run Keyword and return status     Should not be empty    ${headers}
    ${data}=    Evaluate    {"email":"${email}","password":"${password}"}
    ${headers}=  Create Dictionary  Content-Type=application/json
    ${response}=    POST    ${current_url}${path}    json=${data}  headers=${headers}
    ${token}=    Set Variable    Bearer ${response.json()['token']}
    ${response_body}=    Set Variable    ${response.json()}
    ${response_headers}=    Set Variable    ${response.headers}
    Set Suite Variable    ${token}    ${token}
    Set Suite Variable    ${response}    ${response}
    Set Suite Variable    ${response_headers}    ${response_headers}
    Set Suite Variable    ${response_body}    ${response_body}
    Set Suite Variable    ${expected_self_link}    ${current_url}${path}
    Log    ${token}
    [Return]    ${token}


SuiteSetup
     [Documentation]         Basic steps before each suite. Should be sed with the ``Suite Setup`` tag.
      Run Keyword  I get access token for the customer:    /auth/login  test6@gloify.com  test123
          AND I set Headers:    Authorization=${token}


I send a POST request without header:
     [Documentation]    This keyword is used to make POST requests. It accepts the endpoint *without the domain* and the body in JOSN.
    ...    Variables can and should be used in the endpoint url and in the body JSON.
    ...
    ...    If the endpoint needs to have any headers (e.g. token for authorisation), ``I set Headers`` keyword should be called before this keyword to set the headers beforehand.
    ...
    ...    After this keyword is called, response body, selflink, response status and headers are recorded into the test variables which have the scope of the current test and can then be used by other keywords to get and compare data.
    ...
    ...    *Example:*
    ...
    ...    ``I send a POST request:    /agent-access-tokens    {"data": {"type": "agent-access-tokens","attributes": {"username": "${agent.email}","password": "${agent.password}"}}}``
    [Arguments]   ${path}    ${timeout}=${api_timeout}    ${allow_redirects}=${default_allow_redirects}    ${auth}=${default_auth}    ${expected_status}=ANY
    ${response}=    POST    ${current_url}${path}   timeout=${timeout}    allow_redirects=${allow_redirects}    auth=${auth}    expected_status=${expected_status}
#    ${response_body}=    Set Variable If    ${response.status_code} != 204     ${response.json()}
    ${response_body}=       Set Variable    ${response.json()}
    ${response_headers}=    Set Variable    ${response.headers}
    Set Test Variable    ${response_headers}    ${response_headers}
    Set Test Variable    ${response}    ${response}
    Set Test Variable    ${expected_self_link}    ${current_url}${path}
#    Log To Console    ${response_body}
    [Return]    ${response_body}

I send a POST request Download excel:
     [Documentation]    This keyword is used to make POST requests. It accepts the endpoint *without the domain* and the body in JOSN.
    ...    Variables can and should be used in the endpoint url and in the body JSON.
    ...
    ...    If the endpoint needs to have any headers (e.g. token for authorisation), ``I set Headers`` keyword should be called before this keyword to set the headers beforehand.
    ...
    ...    After this keyword is called, response body, selflink, response status and headers are recorded into the test variables which have the scope of the current test and can then be used by other keywords to get and compare data.
    ...
    ...    *Example:*
    ...
    ...    ``I send a POST request:    /agent-access-tokens    {"data": {"type": "agent-access-tokens","attributes": {"username": "${agent.email}","password": "${agent.password}"}}}``
    [Arguments]   ${path}    ${timeout}=${api_timeout}    ${allow_redirects}=${default_allow_redirects}    ${auth}=${default_auth}    ${expected_status}=ANY
    ${response}=    POST    ${current_url}${path}  headers=${headers}  timeout=${timeout}    allow_redirects=${allow_redirects}    auth=${auth}    expected_status=${expected_status}
#    ${response_body}=    Set Variable If    ${response.status_code} != 204     ${response.json()}
#    ${response_body}=       Set Variable    ${response.json()}
    ${response_headers}=    Set Variable    ${response.headers}
    Set Test Variable    ${response_headers}    ${response_headers}
    Set Test Variable    ${response}    ${response}
    Set Test Variable    ${expected_self_link}    ${current_url}${path}
#    Log To Console    ${response_body}
    [Return]    ${response.headers}


 I send a POST request:
     [Documentation]    This keyword is used to make POST requests. It accepts the endpoint *without the domain* and the body in JOSN.
    ...    Variables can and should be used in the endpoint url and in the body JSON.
    ...
    ...    If the endpoint needs to have any headers (e.g. token for authorisation), ``I set Headers`` keyword should be called before this keyword to set the headers beforehand.
    ...
    ...    After this keyword is called, response body, selflink, response status and headers are recorded into the test variables which have the scope of the current test and can then be used by other keywords to get and compare data.
    ...
    ...    *Example:*
    ...
    ...    ``I send a POST request:    /agent-access-tokens    {"data": {"type": "agent-access-tokens","attributes": {"username": "${agent.email}","password": "${agent.password}"}}}``
    [Arguments]   ${path}    ${timeout}=${api_timeout}    ${allow_redirects}=${default_allow_redirects}    ${auth}=${default_auth}    ${expected_status}=ANY
    ${response}=    POST    ${current_url}${path}  headers=${headers}  timeout=${timeout}    allow_redirects=${allow_redirects}    auth=${auth}    expected_status=${expected_status}
#    ${response_body}=    Set Variable If    ${response.status_code} != 204     ${response.json()}
    ${response_body}=       Set Variable    ${response.json()}
    ${response_headers}=    Set Variable    ${response.headers}
    Set Test Variable    ${response_headers}    ${response_headers}
    Set Test Variable    ${response}    ${response}
    Set Test Variable    ${expected_self_link}    ${current_url}${path}
#    Log To Console    ${response_body}
    [Return]    ${response_body}


I send a POST request with data:
    [Documentation]    This keyword is used to make POST requests. It accepts the endpoint *without the domain* and the body in plain text.
    ...    Variables can and should be used in the endpoint url and in the body.
    ...
    ...    If the endpoint needs to have any headers (e.g. token for authorisation), ``I set Headers`` keyword should be called before this keyword to set the headers beforehand.
    ...
    ...    After this keyword is called, response body, selflink, response status and headers are recorded into the test variables which have the scope of the current test and can then be used by other keywords to get and compare data.
    ...
    ...    *Example:*
    ...
    ...    ``I send a POST request:    /agent-access-tokens    {"data": {"type": "agent-access-tokens","attributes": {"username": "${agent.email}","password": "${agent.password}"}}}``
    [Arguments]   ${path}    ${data}    ${timeout}=${api_timeout}    ${allow_redirects}=${default_allow_redirects}    ${auth}=${default_auth}    ${expected_status}=ANY
    ${data}=    Evaluate    ${data}
    ${response}=    POST    ${current_url}${path}   json=${data}  headers=${headers}  timeout=${timeout}    allow_redirects=${allow_redirects}    auth=${auth}    expected_status=${expected_status}
    ${response_body}=       Set Variable    ${response.json()}
    ${response_headers}=    Set Variable    ${response.headers}
    Set Test Variable    ${response_headers}    ${response_headers}
    Set Test Variable    ${response_body}    ${response_body}
    Set Test Variable    ${response}    ${response}
    Set Test Variable    ${expected_self_link}    ${current_url}${path}
#    Log To Console    ${response_body}
    [Return]    ${response_body}

I send a POST request with data for user:
    [Documentation]    This keyword is used to make POST requests. It accepts the endpoint *without the domain* and the body in plain text.
    ...    Variables can and should be used in the endpoint url and in the body.
    ...
    ...    If the endpoint needs to have any headers (e.g. token for authorisation), ``I set Headers`` keyword should be called before this keyword to set the headers beforehand.
    ...
    ...    After this keyword is called, response body, selflink, response status and headers are recorded into the test variables which have the scope of the current test and can then be used by other keywords to get and compare data.
    ...
    ...    *Example:*
    ...
    ...    ``I send a POST request:    /agent-access-tokens    {"data": {"type": "agent-access-tokens","attributes": {"username": "${agent.email}","password": "${agent.password}"}}}``
    [Arguments]   ${path}    ${data}    ${timeout}=${api_timeout}    ${allow_redirects}=${default_allow_redirects}    ${auth}=${default_auth}    ${expected_status}=ANY
    ${data}=    Evaluate    ${data}
    ${response}=    POST    ${current_url}${path}   json=${data}    timeout=${timeout}    allow_redirects=${allow_redirects}    auth=${auth}    expected_status=${expected_status}
    ${response_body}=       Set Variable    ${response.json()}
    ${response_headers}=    Set Variable    ${response.headers}
    Set Test Variable    ${response_headers}    ${response_headers}
    Set Test Variable    ${response_body}    ${response_body}
    Set Test Variable    ${response}    ${response}
    Set Test Variable    ${expected_self_link}    ${current_url}${path}
    Log To Console    ${response_body}
    [Return]    ${response_body}



I send a GET request:
    [Documentation]    This keyword is used to make GET requests. It accepts the endpoint *without the domain*.
    ...    Variables can and should be used in the endpoint url.
    ...
    ...    If the endpoint needs to have any headers (e.g. token for authorisation), ``I set Headers`` keyword should be called before this keyword to set the headers beforehand.
    ...    If this keyword was already called within this test case (e.g. before POST request), there is no need to call it again.
    ...
    ...    Sometimes for GET requests you need to know and use the ID (UID) if the resource you need to view.
    ...    To  get the ID you need forst to make a POST or GET request to get the data and then call ``Save value to a variable:`` endpoint to save the ID to a test variable to be able to use it in the GET request.
    ...
    ...    After this keyword is called, response body, selflink, response status and headers are recorded into the test variables which have the scope of the current test and can then be used by other keywords to get and compare data.
    ...
    ...    *Example:*
    ...
    ...    ``I send a GET request:    /companies/${company_id}/metadata/info``
    [Arguments]   ${path}    ${timeout}=${api_timeout}    ${allow_redirects}=${default_allow_redirects}    ${auth}=${default_auth}    ${expected_status}=ANY
    ${response}=    run keyword    GET    ${current_url}${path}  headers=${headers}  timeout=${timeout}    allow_redirects=${allow_redirects}    auth=${auth}    expected_status=${expected_status}
    ${response_body}=     Set Variable If   ${response.status_code} != 204   ${response.json()}
    ${response_headers}=    Set Variable    ${response.headers}
    Set Test Variable    ${response_headers}    ${response_headers}
    Set Test Variable    ${response_body}    ${response_body}
    Set Test Variable    ${response}    ${response}
    Set Test Variable    ${expected_self_link}    ${current_url}${path}
    Log To Console    ${response_body}
    [Return]    ${response_body}

Response reason should be abc:
    [Documentation]    This keyword checks that response reason saved  in ``${response}`` test variable matches the reason passed as an argument.
    ...
    ...    *Example:*
    ...
    ...    ``Response reason should be:    Created``
    [Arguments]    ${reason}
    Should Be Equal As Strings    ${reason}    ${response.reason}


Response status code should be:
    [Documentation]    This keyword checks that response status code saved  in ``${response}`` test variable matches the status code passed as an argument.
    ...
    ...    *Example:*
    ...
    ...    ``Response status code should be:    200``
    [Arguments]    ${status_code}
    Should Be Equal As Strings    ${response.status_code}    ${status_code}

Response body should contain:
    [Documentation]    This keyword checks that the response saved  in ``${response_body}`` test variable contsains the string passed as an argument.
    ...
    ...    *Example:*
    ...
    ...    ``Response body should contain:    "CompanyName": "Apple Inc."``
    [Arguments]    ${value}
    ${response_body}=    Convert To String    ${response_body}
    ${response_body}=    Replace String    ${response_body}    '    "
    Should Contain    ${response_body}    ${value}

Response should return error message:
    [Documentation]    This keyword checks if the ``${response_body}`` test variable that contains the response of the previous request contains the specific  ``${error_message}``.
    ...
    ...    Call only for negative tests where you expect an error. NOTE: it checks only the first error, if there are more than one, better use this keyword: ``Array in response should contain property with value``.
    ...
    ...    *Example:*
    ...
    ...    ``Response should return error message:    Can`t find abstract product image sets.``
    [Arguments]    ${json_path}  ${error_message}
    ${data}=    Get Value From Json    ${response_body}    ${json_path}
    ${data}=    Convert To String    ${data}
    ${data}=    Replace String    ${data}    '   ${EMPTY}
    ${data}=    Replace String    ${data}    [   ${EMPTY}
    ${data}=    Replace String    ${data}    ]   ${EMPTY}
    Log    ${data}
    Should Be Equal    ${data}   ${error_message}    Actual ${data} doens't equal expected ${error_message}


Response body parameter should be:
    [Documentation]    This keyword checks that the response saved  in ``${response_body}`` test variable contsains the speficied parameter ``${json_path}`` with he specified value ``${expected_value}``.
    ...
    ...    *Example:*
    ...
    ...    ``Response body parameter should be:    [companyName]    Indian Oil Corp. Ltd.
    [Arguments]    ${json_path}    ${expected_value}
    ${data}=    Get Value From Json    ${response_body}    ${json_path}
    ${data}=    Convert To String    ${data}
    ${data}=    Replace String    ${data}    '   ${EMPTY}
    ${data}=    Replace String    ${data}    [   ${EMPTY}
    ${data}=    Replace String    ${data}    ]   ${EMPTY}
    Log    ${data}
    Should Be Equal    ${data}    ${expected_value}

Evaluate datatype of a variable:
    [Documentation]    This is a technical keyword that is used in ``Response body parameter should have datatype:`` and is used to evaluate the actual data type of a variable.
    ...
    ...        Example of assertions:
    ...
    ...    ``${is int}=      Evaluate     isinstance($variable, int) ``    will be True
    ...
    ...    ``${is string}=   Evaluate     isinstance($variable, str) ``    will be False
    [Arguments]    ${variable}
    ${data_type}=    Evaluate     type($variable).__name__
    [Return]    ${data_type}

Response reason should be:
    [Documentation]    This keyword checks that response reason saved  in ``${response}`` test variable matches the reason passed as an argument.
    ...
    ...    *Example:*
    ...
    ...    ``Response reason should be:    Created``
    [Arguments]    ${reason}
    Should Be Equal As Strings    ${reason}    ${response.text}



Response body parameter should have datatype:
    [Documentation]    This keyword checks that the response saved  in ``${response_body}`` test variable contsains the speficied parameter ``${parameter}`` and that parameter has the specified data type ``${expected_data_type}``.
    ...
    ...    Some types that can be used are: ``int``, ``str``, ``list``. It uses a custom keyword ``Evaluate datatype of a variable:`` to evaluate the datatype.
    ...
    ...    *Example:*
    ...
    ...    ``Response body parameter should have datatype:    [data][0][attributes][name]    str``
    ...    ``Response body parameter should have datatype:    [data][0][attributes][sort][sortParamNames]    list``
    [Arguments]    ${parameter}    ${expected_data_type}
    @{parameter}=    Get Value From Json    ${response_body}    ${parameter}
    ${actual_data_type}=    Evaluate datatype of a variable:    @{parameter}
    Should Be Equal    ${actual_data_type}    ${expected_data_type}

Response header parameter should be:
    [Documentation]    This keyword checks that the response header saved previiously in ``${response_headers}`` test variable has the expected header with name ``${header_parameter}`` and this header has value ``${header_value}``
    ...
    ...    *Example:*
    ...
    ...    ``Response header parameter should be:    Content-Type    ${default_header_content_type}``
    [Arguments]    ${header_parameter}    ${header_value}
    ${actual_header_value}=    Get From Dictionary    ${response_headers}    ${header_parameter}
    Should Be Equal    ${actual_header_value}    ${header_value}

Response header parameter should contain:
    [Documentation]    This keyword checks that the response header saved previiously in ``${response_headers}`` test variable has the expected header with name ``${header_parameter}`` and this header contains substring ``${header_value}``
    ...
    ...    *Example:*
    ...
    ...    ``Response header parameter should be:    Content-Type    ${default_header_content_type}``
    [Arguments]    ${header_parameter}    ${header_value}
    ${actual_header_value}=    Get From Dictionary    ${response_headers}    ${header_parameter}
    Should Contain    ${actual_header_value}    ${header_value}

Response body parameter should not be EMPTY:
    [Documentation]    This keyword checks that the body parameter sent in ``${json_path}`` argument is not empty. If the parameter value is other that ``null`` the keyword will fail.
    ...
    ...    This keyword checks both that the parameter does not have null value or that it does not have an empty string value and makes sure that the pagameter actually exists.
    ...
    ...    *Example:*
    ...
    ...    ``Response body parameter should not be EMPTY:    [data][attributes][description]``
    [Arguments]    ${json_path}
    ${data}=    Get Value From Json    ${response_body}    ${json_path}
    ${data}=    Convert To String    ${data}
    ${data}=    Replace String    ${data}    '   ${EMPTY}
    ${data}=    Replace String    ${data}    [   ${EMPTY}
    ${data}=    Replace String    ${data}    ]   ${EMPTY}
#    Log To Console    ${data}
    Should Not Be Empty    ${data}    ${data} is empty but shoud not be
    Should Not Be Equal    ${data}    None    Propewrty value is ${data} which is null, but it shoud be a non-null value

Response body parameter should be greater than:
    [Documentation]    This keyword checks that the body parameter sent in ``${json_path}`` argument is greater than a specific integer value ``${expected_value}``.
    ...    It can be used to check that the number of items in stock is more than the minimum, that the number of returned products or cms pages in search is more than the minimum.
    ...
    ...    *Example:*
    ...
    ...    ``Response body parameter should be greater than:    [data][0][attributes][price]   100``
    ...
    ...    ``Response body parameter should be greater than:    data[0].attributes.dateSchedule[0].date    ${today}``
    [Arguments]    ${json_path}    ${expected_value}
    ${data}=    Get Value From Json    ${response_body}    ${json_path}
    ${data}=    Convert To String    ${data}
    ${data}=    Replace String    ${data}    '   ${EMPTY}
    ${data}=    Replace String    ${data}    [   ${EMPTY}
    ${data}=    Replace String    ${data}    ]   ${EMPTY}
    ${result}=    Evaluate    '${data}' > '${expected_value}'
    ${result}=    Convert To String    ${result}
    Should Be Equal    ${result}    True    Actual ${data} is not greater than expected ${expected_value}

Response body parameter should be less than:
    [Documentation]    This keyword checks that the body parameter sent in ``${json_path}`` argument is less than a specific integer value ``${expected_value}``.
    ...    It can be used to check that the default price of the product is less than the original price, that the date of the order is before the certain date.
    ...
    ...    *Example:*
    ...
    ...    ``Response body parameter should be less than:    [data][0][attributes][price]   100``
    ...
    ...    ``Response body parameter should be less than:    data[0].attributes.dateSchedule[0].date    2019-01-01``
    [Arguments]    ${json_path}    ${expected_value}
    ${data}=    Get Value From Json    ${response_body}    ${json_path}
    ${data}=    Convert To String    ${data}
    ${data}=    Replace String    ${data}    '   ${EMPTY}
    ${data}=    Replace String    ${data}    [   ${EMPTY}
    ${data}=    Replace String    ${data}    ]   ${EMPTY}
    ${result}=    Evaluate    '${data}' < '${expected_value}'
    ${result}=    Convert To String    ${result}
    Should Be Equal    ${result}    True    Actual ${data} is not less than expected ${expected_value}

Each array element of array in response should contain value:
        [Documentation]    This keyword checks whether the array ``${json_path}`` that is present in the ``${response_body}`` test variable contsains a value ``${expected_value}`` in every of it's array elements.
    ...
    ...    It does not take into account the property name, just checks if the value is there for every element. If some of the array elements have this value and others do not, the keyword will fail.
    ...
    ...    *Example:*
    ...
    ...   ``Each array element of array in response should contain value:    [data][0][attributes][prices]    ${currency.eur.code}``
    ...
    ...    The example above checks if ALL prices returened in volumePrices array have currency code, regardless of which property has this value.
    [Arguments]    ${json_path}    ${expected_value}
    @{data}=    Get Value From Json    ${response_body}    ${json_path}
    ${list_length}=    Get Length    @{data}
    ${log_list}=    Log List    @{data}
    FOR    ${index}    IN RANGE    0    ${list_length}
        ${list_element}=    Get From List    @{data}    ${index}
        ${sub_list_element}=    Create List    ${list_element}
        ${sub_list_element}=    Convert To String    ${sub_list_element}
        Should Contain    : ${sub_list_element}    ${expected_value}
    END

Each array element of array in response should contains:
    [Arguments]   @{expected_list}
    @{data}=  Create List    ${response_body}
#    Log To Console    @{data}
    ${list_length}=    Get Length    @{data}
    ${log_list}=    Log List    @{data}
    FOR    ${item}   IN     @{expected_list}
        Should Contain    : @{data}    ${item}
    END
