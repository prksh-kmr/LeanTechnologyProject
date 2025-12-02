*** Settings ***

*** Variables ***

#url
${sauce_url}                  https://www.saucedemo.com/

#login
${sauce_user_name_container}           //div[@data-test='login-credentials']
${sauce_user_pwd_container}            //div[@data-test="login-password"]
${sauce_input_username}                //input[@data-test="username"]
${sauce_input_password}                //input[@data-test="password"]
${sauce_login_button}                  //input[@data-test="login-button"]

#value
${sauce_username}             standard_user
${sauce_password}             secret_sauce

#items locator
${sauce_items}                 //div[@data-test="inventory-item-name"]
${sauce_cart_icon}             //a[@class="shopping_cart_link"]    
${sauce_product_container}     //div[@data-test="inventory-item-description"]
${sauce_cart_list}             //div[@class="cart_list"]   

#checkout locators
${sauce_checkout_button}        //button[@data-test="checkout"]
${sauce_first_name_input}       //input[@data-test="firstName"]
${sauce_last_name_input}        //input[@data-test="lastName"]
${sauce_postal_code_input}      //input[@data-test="postalCode"]
${sauce_continue_button}        //input[@data-test="continue"]
${sauce_finish_button}          //button[@data-test="finish"]
${sauce_thanks_order_text}     //h2[text()="Thank you for your order!"]
${sauce_order_complete_text}   //div[@data-test='complete-text']

#text
${sauce_thank_text}           Thank you for your order!
${sauce_dispatch_text}        Your order has been dispatched, and will arrive just as fast as the pony can get there!
