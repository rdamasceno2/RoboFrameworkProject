*** Settings ***
Documentation    This is some basic info about the whole suite
Library          SeleniumLibrary
#Run the script:
#robot -d Results  Tests/crm.robot


*** Variables ***
${LOGIN URL}                https://automationplayground.com/crm
${BROWSER}                  chrome

*** Test Cases ***
Should be able to add a new customer
    [Documentation]    This is some basic info about the test
    [Tags]             1006     Smoke       Contacts
    #Initialize Selenium
    set selenium speed    .2s
    set selenium timeout    10s

    #Open the browser
    log                     Starting the test case!
    Open Browser            ${LOGIN URL}    ${BROWSER}

    #resize the browser
    Maximize Browser Window

    page should contain     Customers Are Priority One!

    click link              id=SignIn
    page should contain     Login

    input text              id=email-id     admin@robot.com
    input text              id=password     123
    click button            id=submit-id
    wait until page contains     Our Happy Customers

    click link    id=new-customer
    page should contain     Add Customer


    input text              id=EmailAddress     Robin_Reed@hotmail.com
    input text              id=FirstName        Robin
    input text              id=LastName         Reed
    input text              id=City             New York City
    select from list by value    id=StateOrRegion     NY
    select radio button     gender       male
    select checkbox         name=promos-name
    click button            Submit
    wait until page contains     Success! New customer added.

    ##resize the browser
    sleep              3s
    close browser




*** Keywords ***
