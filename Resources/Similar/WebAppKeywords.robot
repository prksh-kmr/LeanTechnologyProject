*** Settings ***
# Resource    ${CURDIR}/WebCommonImports.robot
Resource    WebCommonImports.robot


*** Keywords ***

Open Chrome Browser
    [Documentation]    Keyword open the chrome browser

    Chrome Driver Initialization
    Maximize Browser Window

Open Firefox Browser
    [Documentation]    Keyword open the firefox browser

    Firefox Driver Initialization
    Maximize Browser Window

Open Edge Browser
    [Documentation]    Keyword open the edge browser

    Edge Driver Initialization
    Maximize Browser Window

Open Safari Browser
    [Documentation]    Keyword open the safari browser

    Safari Driver Initialization
    Maximize Browser Window

Go To Home Page
    [Documentation]    This keyword used to navigate to endpoint/server
    ...                browser argument either be chrome or firefox or edge
    [Arguments]        ${browser}    ${url}

    IF         '${browser}' == 'chrome'
                Open Chrome Browser

    ELSE IF    '${browser}' == 'firefox'
                Open Firefox Browser

    ELSE IF    '${browser}' == 'edge'
                Open Edge Browser

    ELSE IF    '${browser}' == 'safari'
                Open Safari Browser

    ELSE
                Fail    "Invalid browser name. Please input valid browser name"
        
    END
    
    SeleniumLibrary.Go To     ${url}

Generate Random Text/Number
    [Documentation]    Keyword return random text/number
    [Arguments]        ${type}    ${lenght}=${false}

    IF          '${type}' == 'text'
                ${value}    Generate Random String       7    [LOWER]

    ELSE IF    '${type}' == 'number' and '${lenght}' != '${false}'
                ${value}    Generate Random String       ${lenght}    [NUMBERS]
                
    ELSE IF    '${type}' == 'number'
                ${value}    Generate Random String       10    [NUMBERS]
    
    ELSE
                Fail    "Input valid type, with text or number"
    END
    
    RETURN    ${value}

Click Using JavaScript
    [Documentation]    Keyword click th element using javascript
    [Arguments]    ${ele}

    ${webelement}    Wait Until Keyword Succeeds    30s    3s    SeleniumLibrary.Get WebElement    ${ele}
    Wait Until Keyword Succeeds    15s    3s    Execute Javascript     arguments[0].click()    ARGUMENTS    ${webelement}


