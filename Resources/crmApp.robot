*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/PO/Customers.robot
Resource    ../Resources/PO/SignInPage.robot
Resource    ../Resources/PO/AddCustomer.robot
Resource    ../Resources/PO/LoggedOut.robot
Resource    ../Resources/PO/Home.robot
Resource    ../Resources/PO/TopNav.robot


*** Variables ***
${VALID_LOGIN_EMAIL}                admin@robot.com
${VALID_LOGIN_PASSWORD}             GoodPassword
${INVALID_LOGIN_EMAIL}              admin@robotcom
${INVALID_LOGIN_PASSWORD}           BadPassword

*** Keywords ***
Go to "Home" Page
        home.Nagivate to
        home.verify page loaded

Login with valid Credentials
    [Arguments]    ${email}   ${password}
    TopNav.Click "Sign In" Link
    SignInPage.Sign in with valid credentials      ${email}   ${password}
    Customers.Verify Page Loaded

Login with Invalid Credentials
    [Arguments]    ${email}   ${password}
    TopNav.Click "Sign In" Link
    SignInPage.Sign in with valid credentials      ${email}   ${password}
    SignInPage.Verify Page Loaded

Add New Customer
    Customers.Click Add Customer Link
    AddCustomer.Verify Page Loaded
    AddCustomer.Add New Customer
    Customers.Verify Customer Added Succeesfuly

Add New Customer python
    Customers.Click Add Customer Link
    AddCustomer.Verify Page Loaded
    ${email}    ${first_name}    ${last_name}    ${city}    ${state}    ${gender}     AddCustomer.Create new user
    AddCustomer.Add New Customer using Python      ${email}    ${first_name}    ${last_name}    ${city}    ${state}    ${gender}


Sign Out
    TopNav.Click "Sign out" Link
    LoggedOut.Verify Page Loaded

