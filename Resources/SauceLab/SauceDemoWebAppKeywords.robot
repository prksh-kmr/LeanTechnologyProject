*** Settings ***
Resource    ../../../LeanTechnologyProject/Resources/Similar/WebCommonImports.robot

*** Keywords ***

Return Random User Name And Password
    [Documentation]    Keyword Return Random User Name And Password

    SeleniumLibrary.Wait Until Element Is Visible      ${sauce_user_name_container}   ${short_wait_duration}
    ${raw_users}    SeleniumLibrary.Get Text   ${sauce_user_name_container}
    Log    ${raw_users}
    ${user_names}    Process Text    ${raw_users}    'Accepted usernames are:'
    
    ${raw_password}      SeleniumLibrary.Get Text   ${sauce_user_pwd_container}
    Log    ${raw_password}
    ${passwords}        Process Text    ${raw_password}    'Password for all users:'

    ${user_name}     Extract Random Item From List    ${user_names}
    ${password}      Get From List    ${passwords}    ${1}
    @{user_cred}     Create List    ${user_name}    ${password}
    Log To Console   \nSelected user name and password are: ${user_cred}

    RETURN    @{user_cred}

Login To Sauce Demo
    [Documentation]    Keyword Login To Sauce Demo
    [Arguments]        ${username}    ${password}

    SeleniumLibrary.Wait Until Element Is Visible    ${sauce_input_username}    ${short_wait_duration}
    SeleniumLibrary.Input Text      ${sauce_input_username}    ${sauce_username}
    SeleniumLibrary.Input Text      ${sauce_input_password}    ${sauce_password}
    SeleniumLibrary.Click Button    ${sauce_login_button}
    SeleniumLibrary.Wait Until Element Is Visible    ${sauce_items}    ${short_wait_duration}

Return All The Product Name
    [Documentation]    Keyword Return All The Product Name

    SeleniumLibrary.Wait Until Element Is Visible      ${sauce_items}    ${short_wait_duration}
    ${raw_items}    SeleniumLibrary.Get WebElements    ${sauce_items}
    @{product_list}    Convert Web Elements Into String List    ${raw_items}

    RETURN    ${product_list}

Return Three Random Products
    [Documentation]    Keyword Return Three Random Products

    ${product_list}    Return All The Product Name
    Log    ${product_list}

    ${product1}    Extract Random Item From List    ${product_list}
    Remove Values From List    ${product_list}    ${product1}

    ${product2}    Extract Random Item From List    ${product_list}
    Remove Values From List    ${product_list}    ${product2}

    ${product3}    Extract Random Item From List    ${product_list}
    Remove Values From List    ${product_list}    ${product3}

    @{item_list}    Create List    ${product1}    ${product2}    ${product3}

    RETURN    ${item_list}


Return Product Name And Their Price
    [Documentation]    Keyword Return Product Name And Their Price

    &{product_with_price_dict}    Create Dictionary

    SeleniumLibrary.Wait Until Element Is Visible    ${sauce_product_container}    ${short_wait_duration}
    ${product_count}    SeleniumLibrary.Get Element Count    ${sauce_items}

    FOR    ${index}    IN RANGE    ${product_count}
    
            ${product_name}      SeleniumLibrary.Get Text    (${sauce_items})[${index}+1]
            ${price_locator}     Set Variable    //div[text()='${product_name}']/ancestor::div[@data-test="inventory-item-description"]//div[@class="inventory_item_price"]
            ${product_price}     SeleniumLibrary.Get Text    ${price_locator}
            Set To Dictionary    ${product_with_price_dict}    ${product_name}=${product_price}
    END
    
    Log Dictionary    ${product_with_price_dict}

    RETURN    ${product_with_price_dict}

Add Products To Cart
    [Documentation]    Keyword Add Products To Cart
    [Arguments]        ${product_name}    ${cart_item_count}

    ${add_to_cart_button}    Set Variable    //div[text()='${product_name}']/ancestor::div[@data-test="inventory-item-description"]//button[contains(@data-test,'add-to-cart')]

    SeleniumLibrary.Wait Until Element Is Visible    ${add_to_cart_button}    ${short_wait_duration}
    SeleniumLibrary.Click Button    ${add_to_cart_button}

    SeleniumLibrary.Wait Until Element Is Visible    //div[text()='${product_name}']/ancestor::div[@data-test="inventory-item-description"]//button[contains(@data-test,"remove")]    ${short_wait_duration}
    SeleniumLibrary.Wait Until Element Is Visible    //span[@class="shopping_cart_badge" and text()="${cart_item_count}"]    ${short_wait_duration}

Goto Cart
    [Documentation]    Keyword Goto Cart

    SeleniumLibrary.Wait Until Element Is Visible    ${sauce_cart_icon}    ${short_wait_duration}
    SeleniumLibrary.Click Element                    ${sauce_cart_icon}
    SeleniumLibrary.Wait Until Element Is Visible    ${sauce_cart_list}    ${short_wait_duration}

Verify Products In Cart
    [Documentation]    Keyword Verify Products In Cart
    [Arguments]        @{item_list}

    FOR    ${product_name}    IN    @{item_list}
    
        ${product_in_cart}    Set Variable    //div[@class="cart_item"]//div[text()='${product_name}']
        SeleniumLibrary.Wait Until Element Is Visible    ${product_in_cart}    ${short_wait_duration}
    
    END

Verify Products And Their Price In Cart Or Checkout Overview
    [Documentation]    Keyword Verify Products Or Their Price In Cart And Checkout Overview
    [Arguments]        &{product_with_price_dict}

    FOR    ${product_name}    ${product_price}    IN    &{product_with_price_dict}
    
        ${product_in_cart}          Set Variable    //div[@class="cart_item"]//div[text()='${product_name}']
        ${price_in_cart_locator}    Set Variable    //div[text()='${product_name}']/ancestor::div[@class="cart_item_label"]//div[@class="inventory_item_price"]
        
        SeleniumLibrary.Wait Until Element Is Visible    ${product_in_cart}    ${short_wait_duration}
        ${price_in_cart}    SeleniumLibrary.Get Text    ${price_in_cart_locator}
        Should Be Equal     ${price_in_cart}    ${product_price}
    
    END

Generate Input Data For Checkout
    [Documentation]    Keyword Generate Input Data For Checkout

    ${first_name}    Generate Random Text/Number    text
    ${last_name}     Generate Random Text/Number    text
    ${postal_code}     Generate Random Text/Number    number    6

    RETURN    ${first_name}    ${last_name}    ${postal_code}

Proceed To Checkout With Shipping Details
    [Documentation]    Keyword Proceed To Checkout With Shipping Details
    [Arguments]        ${first_name}    ${last_name}    ${postal_code}

    SeleniumLibrary.Wait Until Element Is Visible    ${sauce_checkout_button}    ${short_wait_duration}
    SeleniumLibrary.Click Button                     ${sauce_checkout_button}

    SeleniumLibrary.Wait Until Element Is Visible    ${sauce_first_name_input}    ${short_wait_duration}
    SeleniumLibrary.Input Text                       ${sauce_first_name_input}    ${first_name}
    SeleniumLibrary.Input Text                       ${sauce_last_name_input}     ${last_name}
    SeleniumLibrary.Input Text                       ${sauce_postal_code_input}   ${postal_code}
    SeleniumLibrary.Click Button                     ${sauce_continue_button}

    SeleniumLibrary.Wait Until Element Is Visible    ${sauce_finish_button}    ${short_wait_duration}
    SeleniumLibrary.Click Button                     ${sauce_finish_button}

Verify Order Placed
    [Documentation]    Keyword Verify Order Placed

    SeleniumLibrary.Wait Until Element Is Visible    ${sauce_thanks_order_text}   ${short_wait_duration}
    SeleniumLibrary.Wait Until Element Is Visible    ${sauce_order_complete_text}    ${short_wait_duration}
    SeleniumLibrary.Page Should Contain              ${sauce_thank_text}
    SeleniumLibrary.Page Should Contain              ${sauce_dispatch_text}
    SeleniumLibrary.Capture Page Screenshot