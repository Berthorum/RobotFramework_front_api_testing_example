*** Settings ***
Resource    ../Resources/Core/open_browser.resource
Resource    ../Resources/Pages/login_page.resource
Resource    ../Resources/Pages/home_page.resource

Test Setup    Open Browser  url=${url}/login    browser=${browser}
Test Teardown    Log To Console    Finish Test


*** Test Cases ***
Login com Sucesso
    User Login
    Check Loging Successful
