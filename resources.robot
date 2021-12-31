*** Settings ***
Library       SeleniumLibrary   plugins=SauceLabs

*** Variables ***
${MAIN_PAGE}      https://the-internet.herokuapp.com/login
${LOGIN_PAGE}     ${MAIN_PAGE}
${CHROMEDRIVER_PATH}        /usr/local/bin/chromedriver

*** Keywords ***
Open Login Page Using Chrome Browser
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    # Open Browser   ${LOGIN_PAGE}    Chrome    options=${chrome_options}      executable_path=${CHROMEDRIVER_PATH}
    Start Latest Chrome On Sauce  ${LOGIN_PAGE}
