*** Settings ***
Documentation       All the page objects and keywords of landing page
Library                 SeleniumLibrary

*** Variables ***
${Shop_page_load}       css:.nav-link
${country_location}     //a[text()='India']

*** Keywords ***
Enter your country

    [arguments]         ${country_name}
    input text         id:country      ${country_name}
    wait until element is visible       //a[text()='${country_name}']
    click element           //a[text()='${country_name}']
    sleep                7
    click element           css:label[for='checkbox2']

purchasing the item
    click button         .checkbox label
    page should contain         Success!

