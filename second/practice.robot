*** Settings ***
Library     SeleniumLibrary
Documentation       filling up the login page
Resource        resource.robot
Library         Collections
*** Variables ***
${errorMessage}     css:div[class='alert alert-danger col-md-12']

*** Test Cases ***
Login Test
    opening the browser with required url
    filling up the login form       ${user_name}    ${valid_password}
    displaying error message
    checking the error message
    verify card title in the login page

*** Keywords ***

filling up the login form
    [arguments]     ${userName}     ${password}
    input text      id:username       ${userName}
    input password      id:password     ${password}
    click button    id:signInBtn

displaying error message
    wait until element is visible       ${errorMessage}

checking the error message
    element text should be      ${errorMessage}     Incorrect username/password.

verify card title in the login page

    @{l1}=  Create List     iphone X    Samsung Note 8      Nokia Edge      Blackberry
    ${elements}=    get webelements     css:h4[class='card-title']
    @{l3}=  Create List
    FOR    ${element}    IN     @{elements}

        Log     ${element.text}
        append to list      ${l3}       ${element.text}

    END
    lists should be equal      ${l3}    ${l1}



