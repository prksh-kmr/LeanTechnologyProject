*** Settings ***
Resource    ../../LeanTechnologyProject/Resources/Similar/WebCommonImports.robot

*** Variables ***

${headless_flag}    ${True}

*** Keywords ***
Chrome Driver Initialization
    [Documentation]    This keyword initialize chrome driver

    Close All Browsers
    ${chrome_driver_path}    Get Chromedriver Path
    ${options}               Get Chrome Options    ${headless_flag}
    # Create Webdriver         Chrome                executable_path=${chromedriver_path}   options=${options}
    Create Webdriver         Chrome                options=${options}

Firefox Driver Initialization
    [Documentation]    This keyword initialize firefox driver

    Close All Browsers
    ${firefox_path}        Get Firefox Driver Path
    ${options}             Get Firefox Options    ${headless_flag}
    Create Webdriver       Firefox                options=${options}

Edge Driver Initialization
    [Documentation]    This keyword initialize ms edge driver

    Close All Browsers
    ${ms_edge_path}        Get Edge Driver Path
    ${options}             Get Edge Options    ${headless_flag}
    Create Webdriver       Edge                options=${options}

Safari Driver Initialization
    [Documentation]    This keyword initialize safari driver

    Close All Browsers
    ${safari_path}         Get Safari Driver Path
    ${options}             Get Safari Options    ${headless_flag}
    Create Webdriver       Safari                options=${options}
