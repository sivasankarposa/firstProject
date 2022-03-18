*** Settings ***
Documentation       A demo on resource file
Library             SeleniumLibrary

*** Variables ***
${user_name}             rahulshettyacademy
${invalid_password}      1234567789
${valid_password}        learning
${url}      https://rahulshettyacademy.com/loginpagePractise

*** Keywords ***

open the browser with the Mortgage payment url
    create webdriver     Chrome    executable_path=C:\\Users\\siva sankar\\Downloads\\chromedriver_win32\\chromedriver.exe
    go to       ${url}

#Closing Browser Session
    #Close Browser
