*** Settings ***
Documentation   To validate the login form
Library     SeleniumLibrary
Test Teardown   Close Browser
Test Template       LoginTest #for parameterization puropose


*** Variables ***
${error_message}   css:div[class='alert alert-danger col-md-12']

*** Test Cases ***      uername     password
invalid username        siavsankar      12345678
invalid password        rahulshetty     sivasankar
speacial cvahracters        @#@#        learning

*** Keywords ***

LoginTest
    [Arguments]     ${username}     ${password}

    open the browser with the Mortgage payment url
    Fill the login Form     ${username}     ${password}
    wait untill it checks and display error message
    verify error message is correct


open the browser with the Mortgage payment url
    create webdriver    Chrome  executable_path=C:\\Users\\siva sankar\\Downloads\\chromedriver_win32\\chromedriver.exe
    go to   https://rahulshettyacademy.com/loginpagePractise

Fill the login Form
    [arguments]     ${userName}     ${password}
    input text      id:username       ${userName}
    input password      id:password     ${password}
    click button    id:signInBtn

wait untill it checks and display error message
    wait until element is visible        ${error_message}

verify error message is correct
    element text should be     ${error_message}    Incorrect username/password.
