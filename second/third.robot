*** Settings ***
Documentation       To validate the login form
Library     SeleniumLibrary
Test Setup  open the browser with the Mortgage payment url
Resource        resource.robot
Library     String # mandatory for using the split string
Library     Collections #mandatory for get from list

*** Variables ***

*** Test Cases ***
validate child window functionality
    select the link of the child window
    verify the user is switched to child window
    grab the email id on the child window
    switch to parent window and verify the email Id

*** Keywords ***

select the link of the child window
    click element       css:a[class='blinkingText']
    sleep       7

verify the user is switched to child window
    switch window       NEW
    element text should be      css:h1      DOCUMENTS REQUEST

grab the email id on the child window
    ${text}=    get text    css:.red
    @{words}=   Split String    ${text}     at
    ${text_split}=      get from list       ${words}        1
    log     ${text_split}
    @{words_2}=     split string        ${text_split}
    ${email}=       get from list       ${words_2}      0
    Set Global Variable     ${email}

switch to parent window and verify the email Id
    switch window       MAIN
    title should be     LoginPage Practise | Rahul Shetty Academy
    input text      id:username     ${email}
