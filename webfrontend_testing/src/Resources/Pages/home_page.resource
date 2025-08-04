*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Check Loging Successful
    Wait For Condition	return document.readyState == "complete"
    ${subHeader}    Get WebElement    class:subheader
    ${title}    Get WebElement    tag:h2
    
    # Assertions

    Element Text Should Be    ${subHeader}    Welcome to the Secure Area. When you are done click logout below.
    Element Text Should Be    ${title}     Secure Area


    
    