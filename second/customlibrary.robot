*** Settings ***
Documentation    To validate the login form
Library          SeleniumLibrary
Test Setup       open the browser with the Mortgage payment url
#Test Teardown       Closing Browser Session
#Suite Setup     Excute first before all  test cases only once
#Suite Teardown     excute at the end of entire excution
Library         ../CustomeLibrary/Shop.py
#Collections is used to used to like append list
Library         Collections
#Library        String  for using split string method
Resource        ../PageObject/LandingPage.robot
Resource        ../PageObject/ShopPage.robot
Resource        ../PageObject/Checkout.robot
Resource        ../PageObject/ConfirmationPage.robot

*** Variables ***
${error_message}    css:div[class='alert alert-danger col-md-12']

@{listofproducts}           Blackberry          Nokia Edge
${country_name}             India

*** Test Cases ***
#LoginTest

 #   LandingPage.Fill the login Form     ${user_name}    ${invalid_password}
  #  LandingPage.wait untill element is visible is located in the page
   # LandingPage.verify error message is correct

validate card display in the shopping page
    LandingPage.Fill the login Form     ${user_name}    ${valid_password}
    Shoppage.wait untill element is visible is located in the page
    Shoppage.verify card title in the shop page
    helloworld
    add items to cart and checkout           ${listofproducts}
    #select the card     BlackBerry
    Checkout.verfy items in the checkout page and proceed
    ConfirmationPage.Enter your country                ${country_name}
    ConfirmationPage.purchasing the item


#select the form and navigate to childwindow
    #LandingPage.fill the login details and select the user action

*** Keywords ***
verify error message is correct
    element text should be       ${error_message}      Incorrect username/password.

