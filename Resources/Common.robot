*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/PO/Customers.robot
Resource    ../Resources/PO/SignInPage.robot
Resource    ../Resources/PO/AddCustomer.robot
Resource    ../Resources/PO/LoggedOut.robot
Resource    ../Resources/PO/Home.robot
Resource    ../Resources/PO/TopNav.robot


*** Variables ***
${BROWSER}                  chrome

*** Keywords ***
Begin Web Test
    Set selenium speed        .2s
    set selenium timeout         10s
    open browser    about:blank     ${BROWSER}
    maximize browser window

End Web Test
    close browser