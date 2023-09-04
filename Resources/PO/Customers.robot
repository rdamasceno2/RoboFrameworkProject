*** Settings ***
Library    SeleniumLibrary



*** Variables ***
${CUSTOMERS_HEADER_LABEL}     Our Happy Customers
${CUSTOMERS_ADD_CUSTOMER_LINK}    id=new-customer
${CUSTOMERS_CUSTOMER_SUCESS_LABEL}    Success! New customer added.

*** Keywords ***
Verify Page Loaded
    wait until page contains       ${CUSTOMERS_HEADER_LABEL}

Click Add Customer Link
    click link     ${CUSTOMERS_ADD_CUSTOMER_LINK}

Verify Customer Added Succeesfuly
    wait until page contains     ${CUSTOMERS_CUSTOMER_SUCESS_LABEL}    timeout=15

