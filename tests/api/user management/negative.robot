*** Settings ***
#Suite Setup    SuiteSetup
Resource      ../../../resources/common/common_api.robot


*** Test Cases ***
#ENABLER
#    SuiteSetup

Create_a_customer_with_already_existing_email
    When I send a POST request with data for user:   /auth/subscribe  {"email":"test100@gloify.com","password":"test12","requestType":"capitalmarket","firstName":"dinesh","lastName":"kumar","userType":"prime","contact":900000000,"serviceType":"All","services":[],"countryType":"All","countries":[],"amount":"5000","regionType":"All","regions":[]}
    Then Response status code should be:    302
    And Response reason should be:  Account already in use

Create_a_customer_with_too_short_password
    When I send a POST request with data for user:   /auth/subscribe  {"email":"test110@gloify.com","password":"test1","requestType":"capitalmarket","firstName":"dinesh","lastName":"kumar","userType":"prime","contact":900000000,"serviceType":"All","services":[],"countryType":"All","countries":[],"amount":"5000","regionType":"All","regions":[]}
    Then Response status code should be:    302

Create_a_customer_with_too_long_password
    When I send a POST request with data for user:   /auth/subscribe  {"email":"test110@gloify.com","password":"test1111112345678945698745678912354635940235456987526","requestType":"capitalmarket","firstName":"dinesh","lastName":"kumar","userType":"prime","contact":900000000,"serviceType":"All","services":[],"countryType":"All","countries":[],"amount":"5000","regionType":"All","regions":[]}
    Then Response status code should be:    302

Create_a_customer_with_wrong_email_format
    When I send a POST request with data for user:   /auth/subscribe  {"email":"test100.gloify.com","password":"test12","requestType":"capitalmarket","firstName":"dinesh","lastName":"kumar","userType":"prime","contact":900000000,"serviceType":"All","services":[],"countryType":"All","countries":[],"amount":"5000","regionType":"All","regions":[]}
    Then Response status code should be:    400
    And Response should return error message:  [error]   Bad Request

Create_a_customer_with_empty_type
    When I send a POST request with data for user:   /auth/subscribe  {"email":"test110@gloify.com","password":"test12","requestType":"capitalmarket","firstName":"dinesh","lastName":"kumar","userType": ,"contact":900000000,"serviceType":"All","services":[],"countryType":"All","countries":[],"amount":"5000","regionType":"All","regions":[]}
    Then Response status code should be:    302

Create_a_customer_with_empty_values_for_required_fields


Get_a_cusomer_without_access_token


Get_a_customer_with_access_token_from_another_user
