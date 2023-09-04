*** Settings ***
Documentation    This is some basic info about the whole suite
Resource          ../Resources/Common.robot
Resource          ../Resources/crmApp.robot


#Run the script:
#robot -d Results -N "Full Regresion" -i 1004 --screenshots Results/Screenshots -v Browser:headlesschrome   Tests/crm.robot
# Suite Setup
# Suite Teardown
Test Setup  Begin Web Test
Test Teardown     End Web Test

*** Variables ***


*** Test Cases ***

Home page should load
    [Documentation]    Test the home page
    [Tags]             1000     Smoke       Home
    crmApp.Go to "Home" Page

Should be able to Login with valid Credentials
    [Documentation]    Test the Login
    [Tags]             1001     Smoke       Login
    crmApp.Go to "Home" Page
    crmApp.Login with valid Credentials    ${VALID_LOGIN_EMAIL}    ${VALID_LOGIN_PASSWORD}
    crmApp.Sign Out

Should be able to Log Out
    [Documentation]    Test the Log out
    [Tags]             1002     Smoke       Login
    crmApp.Go to "Home" Page
    crmApp.Login with valid Credentials    ${VALID_LOGIN_EMAIL}    ${VALID_LOGIN_PASSWORD}
    crmApp.Sign Out

Should be able to add a new customer
    [Documentation]    Test adding a new customer
    [Tags]             1003     Smoke       Contacts
    crmApp.Go to "Home" Page
    crmApp.Login with valid Credentials    ${VALID_LOGIN_EMAIL}    ${VALID_LOGIN_PASSWORD}
    crmApp.Add New Customer
    crmApp.Sign Out

Should be able to add a new customer again
    [Documentation]    Test adding a new customer
    [Tags]             1004    Smoke       Contacts
    crmApp.Go to "Home" Page
    crmApp.Login with valid Credentials    ${VALID_LOGIN_EMAIL}    ${VALID_LOGIN_PASSWORD}
    crmApp.Add New Customer python
    crmApp.Sign Out




