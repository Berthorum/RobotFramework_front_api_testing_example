*** Settings ***
Library    SeleniumLibrary
Resource    ../Core/user_credentials.resource

*** Keywords ***
User Login
    Wait For Condition	return document.readyState == "complete"
    Input Text    id:username    ${username}
    Input Password    id:password    ${password}

    Click Button    class:radius



    

