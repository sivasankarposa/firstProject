*** Settings ***
Documentation    To validate the login form
Library          SeleniumLibrary
Test Setup       open the browser with the Mortgage payment url
#Test Teardown       Closing Browser Session
Library         Collections
Resource          Generic.robot

*** Variables ***
${error_message}        css:div[class='alert alert-danger col-md-12']
${shop_page_load}           css:.nav-link

*** Test Cases ***
#LoginTest

    #Fill the login Form     ${user_name}    ${invalid_password}
    #wait untill element is visible is located in the page       ${error_message}
    #verify error message is correct

validate card display in the shopping page
    Fill the login Form       ${user_name}      ${valid_password}
    wait untill element is visible is located in the page      ${shop_page_load}
    verify card title in the shop page
    select the card     Blackberry


select the form and navigate to childwindow
    fill the login details and select the user action

*** Keywords ***
Fill the login Form
    [arguments]         ${username}       ${password}
    input text          id:username     ${user_name}
    input password      id:password     ${password}
    click button        signInBtn

wait untill element is visible is located in the page
    #[Tags]          SMOKE          REGRESSION
    [arguments]     ${element}
    wait until element is visible   ${element}

verify error message is correct
    #[Tags]         REGRESSION
    element text should be      ${error_message}    Incorrect username/password.

verify card title in the shop page

        @{l1} =    Create List     iphone X    Samsung Note 8      Nokia Edge      Blackberry
        ${elements} =  Get Webelements      css:.card-title
        @{l3} =    Create List

        FOR    ${element}   IN    @{elements}
            Log     ${element.text}
            Append To List      ${l3}       ${element.text}
        END
        Lists Should Be Equal    ${l1}   ${l3}

select the card
    [arguments]     ${cardName}
    ${elements}=    get webelements     css:.card-title
    ${index}=     Set Variable       0

    FOR     ${element}   IN     @{elements}
        Exit For Loop If      '${cardName}' == '${element.text}'
        ${index}=  Evaluate   ${index} + 1

    END
    click button    xpath:(//div[@class='card-footer'])[${index}]/button

fill the login details and select the user action
    input text      id:username     rahulshettyacademy
    input password      id:password     learning
    click element       css:input[value='user']
    wait until element is visible       css:div[class='modal-content']
    Click Button       id:okayBtn
    Click Button       id:okayBtn
    wait until element is not visible       css:div[class='modal-content']
    select from list by value       css:select[class='form-control']       teach

    #NOTES

    #1) To run all test Cases in terminal "robot ." press enter it will run all test cases one by one

    #2)HOW TO RUN ALL TEST CASES   IN PARALLEL :
        #we have to install in terminal "pip install -U robotframework-pabot"
        #in terminal "pabot ." enter in terminal it will all test cases in parallel

     #3) HOW TO RUN TEST CASES PARALLE IN ONE FILE
      #in terminal enter "pabot --testlevelsplit filename(Checkout).robot"

     #4) HOW TO RUN SINGLE TEST CASE IN SPECIFIC FILE
       #in terminal "robot -t "Test Case Name"  ."
                        #or
       #in terminal "robot -t "Test case Name"  filename.robot"

     #5) HOW TO RUN TEST CASE BY TAG NAME (IN LINE NO 39 MARKED AS TAG)
          # in terminal "robot --include "tag name" ." press enter

      #6) HOW TO RUN TESTS WITH MULTIPLE TAGS (IN LINE 39 AND LINE NO 44)
      # in terminal "robot --include tagname1ORtagname2 ." press enter

      #7) HOW TO RUN TEST MARKED WITH TWO TAGS IN (LINE NO 39)
       # in terminal "robot --include tagename1ANDtagname2  ." press enter

       #8) HOW TO DO NOT RUN SPEECIFIED TEST WITH SPECIFIED TAG NAME
        # in terminal "robot --include TAGNAME  ." press enter

       #9)   HOW TO RUN ALL TEST IN ONE SINGLE FOLDER (EX : firstcopy.robot)
         #in terminal "robot --suite foldername ."  press enter

       #10) HOW TO RUN ALL  FAILED TEST CASES
          # in terminal "robot --rerunfailed output.xml  ." press enter
