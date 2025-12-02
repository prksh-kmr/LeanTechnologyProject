*** Settings ***
Resource    ../../../LeanTechnologyProject/Resources/Similar/WebCommonImports.robot

Suite Teardown    Close All Browsers

*** Test Cases ***

TC-01 Verify Sauce Demo End to End Flow
    [Documentation]    Test cover the customer flow of selecting 3 random items and completing the checkout flow.
    [Tags]             ${sauce_demo}

    Go To Home Page    ${browser_chrome}    ${sauce_url}
    ${user_credentials}    Return Random User Name And Password

    Login To Sauce Demo    ${user_credentials}[0]    ${user_credentials}[1]
    ${product_with_price_dict}    Return Product Name And Their Price
    ${products}                   Return Three Random Products
    Log         ${products}
    Log To Console    Products to add: ${products}
    ${product_count}    Count List Items    ${products}

    &{added_products_dict}    Create Dictionary

    FOR    ${index}    IN RANGE    ${product_count}
    
            ${current_index}    Evaluate    ${index}+1
            Log To Console      \nAdding ${current_index} product to cart
            Log    ${products[${index}]}
            Add Products To Cart    ${products[${index}]}    ${current_index}
            ${price}    Get From Dictionary    ${product_with_price_dict}    ${products[${index}]}
            Set To Dictionary    ${added_products_dict}    ${products}[${index}]=${price}

    END
    Log To Console    Products added to cart are: ${added_products_dict}
    Goto Cart
    Verify Products And Their Price In Cart Or Checkout Overview    &{added_products_dict}
    ${first_name}    ${last_name}    ${postal_code}    Generate Input Data For Checkout
    Proceed To Checkout With Shipping Details    ${first_name}    ${last_name}    ${postal_code}
    Verify Order Placed