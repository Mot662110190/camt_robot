*** Settings ***
Library        SeleniumLibrary
Variables      ./data.yaml 
*** Test Cases ***
first Case
  open browser Chrome    ${url}    ${browser}
    Input username        ${username.standard.user}
    Input password        ${username.standard.password}
    Click login
    Verify text products
    Click addcart
    Click cart
    Click checkout
    Verify Checkout: Your Information
    Input Information       ${Information.Firstname}    ${Information.Lastname}    ${Information.Zipcode}
    Click CONTINUE
    Click Finish
    Verify Finish


    
# Second Case
# Third Case
*** Keywords ***
open browser Chrome
    [Arguments]    ${url}    ${browser}
    Open Browser    ${url}    ${browser}
 
Input username
    [Arguments]    ${username}
    Input Text    //*[@id="user-name"]    ${username}
 
Input password
    [Arguments]    ${password}
    Input Text    //*[@id="password"]    ${password}
 
Click login
    Click Button    //*[@id="login-button"]
 
Click addcart
    Click Button    //*[@id="inventory_container"]/div/div[1]/div[3]/button
 
 Verify text products
    Wait Until Element Is Visible    //div[contains(text(),"Products")]    timeout=20s
Click cart
    Click Element    //*[@id="shopping_cart_container"]/a
Click checkout
  Click Element    //*[@id="cart_contents_container"]/div/div[2]/a[2]
Verify Checkout: Your Information
  Wait Until Element Is Visible    //div[contains(text(),"Checkout: Your Information")]    timeout=20s
Input Information
    [Arguments]    ${Frist name}    ${Last name}    ${Zip code} 
    Input Text    //*[@id="first-name"]    ${Frist name}
    Input Text    //*[@id="last-name"]    ${Last name}
    Input Text    //*[@id="postal-code"]    ${Zip code}
 Click CONTINUE
    Click Button    //*[@id="checkout_info_container"]/div/form/div[2]/input
Click Finish
    Click Element     //*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]
Verify Finish
  Wait Until Element Is Visible    //*[@id="checkout_complete_container"]/h2    timeout=20s
Verify logout
    Wait Until Element Is Visible    //*[@id="user-name"]   timeout=10s
    # Should Be Equal    ${current_url}    https://www.saucedemo.com/v1/inventory.html

