*** Settings ***
Documentation       All the page objects and keywords of landing page
Library     SeleniumLibrary


*** Variables ***
${error_message}        css:div[class='alert alert-danger col-md-12']
${user_name}            rahulshettyacademy
${invalid_password}         sivasankar
${valid_password}           learning
*** Keywords ***

Fill the login Form
    [arguments]         ${user_name}       ${password}
    input text          id:username     ${user_name}
    input password      id:password     ${password}
    click button        signInBtn

wait untill element is visible is located in the page
    wait until element is visible       ${error_message}

verify error message is correct
    element text should be      ${error_message}    Incorrect username/password.

fill the login details and select the user action
    input text      id:username     rahulshettyacademy
    input password      id:password     learning
    click element       css:input[value='user']
    wait until element is visible       css:div[class='modal-content']
    Click Button       id:okayBtn
    Click Button       id:okayBtn
    wait until element is not visible       css:div[class='modal-content']
    select from list by value       css:select[class='form-control']      teach

