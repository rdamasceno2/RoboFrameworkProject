*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    ../../Library/add_customer.py

*** Variables ***
${ADDCUSTOMER_HEADER_LABEL} =          Add Customer
${ADDCUSTOMER_EMAIL_TEXTBOX} =         id=EmailAddress
${ADDCUSTOMER_FIRST_NAME_TEXTBOX} =    id=FirstName
${ADDCUSTOMER_LAST_NAME_TEXTBOX} =     id=LastName
${ADDCUSTOMER_CITY_TEXTBOX} =          id=City
${ADDCUSTOMER_STATE_DROPDOWN} =        id=StateOrRegion
${ADDCUSTOMER_GENDER_RADIO} =          gender
${ADDCUSTOMER_PROMO_CHECKBOX} =        name=promos-name
${ADDCUSTOMER_SUBMIT_BUTTON} =         Submit

*** Keywords ***
Verify Page Loaded
     wait until page contains     ${ADDCUSTOMER_HEADER_LABEL}

Add New Customer
    Fill Customer Fields
    Click Submit Button

Fill Customer Fields
    input text                    ${ADDCUSTOMER_EMAIL_TEXTBOX}            Robin_Reed@hotmail.com
    input text                    ${ADDCUSTOMER_FIRST_NAME_TEXTBOX}       Robin
    input text                    ${ADDCUSTOMER_LAST_NAME_TEXTBOX}        Reed
    input text                    ${ADDCUSTOMER_CITY_TEXTBOX}             New York City
    select from list by value     ${ADDCUSTOMER_STATE_DROPDOWN}           NY
    select radio button           ${ADDCUSTOMER_GENDER_RADIO}             male
    select checkbox               ${ADDCUSTOMER_PROMO_CHECKBOX}

Add New Customer using Python
    [Arguments]    ${email}    ${first_name}    ${last_name}    ${city}    ${state}    ${gender}
    add_customer.add_new_customer_via_python   ${email}    ${first_name}    ${last_name}    ${city}    ${state}    ${gender}

Create new user
    ${user}                     add_customer.generate new customer
    ${gender}                   Get From Dictionary    ${user['results'][0]}                gender
    ${first_name}               Get From Dictionary    ${user['results'][0]['name']}        first
    ${last_name}                Get From Dictionary    ${user['results'][0]['name']}        last
    ${email}                    Get From Dictionary    ${user['results'][0]}                email
    ${city}                     Get From Dictionary    ${user['results'][0]['location']}    city
    ${state_value}              Get From Dictionary    ${user['results'][0]['location']}    state
    ${state}                    add_customer.get_state_key     ${state_value}

    [return]        ${email}    ${first_name}    ${last_name}    ${city}    ${state}    ${gender}


Click Submit Button
    click button                  ${ADDCUSTOMER_SUBMIT_BUTTON}
