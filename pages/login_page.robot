*** Settings ***
Library       RPA.Browser.Selenium

*** Variables ***
${USERNAME_FIELD}             //input[@name='username']
${PASSWORD_FIELD}             //input[@name='password']
${LOGIN_BUTTON}               css:#login > button
${ERROR_MESSAGE_FLASH}        css:#flash
${FLASH_SUCCESS_LABEL}  css:#flash

*** Keywords ***
Login Page Opened
  Wait Until Element Is Visible     ${USERNAME_FIELD}
  Element Should Be Visible         ${USERNAME_FIELD}
  Wait Until Element Is Visible     ${PASSWORD_FIELD}
  Element Should Be Visible         ${PASSWORD_FIELD}

Input Username
  [Arguments]                       ${username}
  Wait Until Element Is Enabled     ${USERNAME_FIELD}
  Input Text                        ${USERNAME_FIELD}       ${username}

Login Button Should Be Enabled
  Wait Until Element Is Enabled     ${LOGIN_BUTTON}
  Element Should Be Enabled         ${LOGIN_BUTTON}

Input Pass
  [Arguments]                       ${password}
  Wait Until Element Is Enabled     ${PASSWORD_FIELD}
  Input Text                        ${PASSWORD_FIELD}       ${password}

Click Login Button
  Wait Until Element Is Enabled     ${LOGIN_BUTTON}
  Click Element                     ${LOGIN_BUTTON}

Error Message Displayed
  [Arguments]   ${message}
  Wait Until Element Is Visible     ${ERROR_MESSAGE_FLASH}
  Element Should Contain            ${ERROR_MESSAGE_FLASH}    ${message}

Login is successful
  Wait Until Element Is Visible    ${FLASH_SUCCESS_LABEL}
  Element Should Be Visible        ${FLASH_SUCCESS_LABEL}
