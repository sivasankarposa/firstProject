*** Settings ***
Documentation       All the page objects and keywords of landing page
Library     SeleniumLibrary

*** Variables ***
${shop_page_load}       css:.nav-link

*** Keywords ***
open the browser with the Mortgage payment url
    create webdriver    Chrome  executable_path=C:\\Users\\siva sankar\\Downloads\\chromedriver_win32\\chromedriver.exe
    go to       https://rahulshettyacademy.com/loginpagePractise

wait untill element is visible is located in the page
    wait until element is visible       ${shop_page_load}

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
    ${index}=   Set Variable    0

    FOR     ${element}   IN     @{elements}
        Exit For Loop If      '${cardName}' == '${element.text}'
        ${index}=  Evaluate   ${index} + 1

    END
    click button    xpath:(//div[@class='card-footer'])[${index}]/button
