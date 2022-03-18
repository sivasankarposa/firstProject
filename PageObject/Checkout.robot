*** Settings ***
Documentation       All the page objects and keywords of landing page
Library         SeleniumLibrary


*** Variables ***
${Shop_page_load}       css:.nav-link


*** Keywords ***
verfy items in the checkout page and proceed
    click element       css:.btn-success

