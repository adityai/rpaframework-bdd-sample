
*** Settings ***
Library           ../utils/database_utils.py
Library    RPA.Tables
Resource          ../resources.robot
Resource          ../pages/login_page.robot
Resource          ../steps/login_steps.robot
Test Setup        Open Login Page Using Chrome Browser
Test Teardown     Close Browser

*** Variables ***
${valid_username}       tomsmith
${valid_password}       SuperSecretPassword!
${invalid_data}         qwerty
${expected_username_incorrect}
${expected_password_incorrect}

*** Test Cases ***
Valid Login
  GIVEN Login Page Opened
  WHEN Input Username And Password    ${valid_username}    ${valid_password}
  THEN Login is successful

Try data driven
  ${test_data}=    Get Test Data From Database    Try data driven
  ${test_data}=    Export Table    ${test_data}
  Log    ${test_data}[0][username]    
  Log    ${test_data}[0][password]    
  Log    ${test_data}[0][expected_message]
  GIVEN Login Page Opened
  WHEN Input Username And Password    ${test_data}[0][username]    ${test_data}[0][password]
  THEN Error Message Displayed      ${test_data}[0][expected_message]

Invalid Login
  [Template]    Login with Invalid Credentials
  ${valid_username}   ${invalid_data}   ${expected_password_incorrect}
  ${invalid_data}   ${valid_password}   ${expected_username_incorrect}
  ${invalid_data}   ${invalid_data}     ${expected_username_incorrect}

*** Keywords ***
Login with Invalid Credentials
  [Arguments]   ${username}   ${password}   ${message}
  GIVEN Login Page Opened
  WHEN Input Username And Password    ${username}    ${password}
  THEN Error Message Displayed      ${message}
