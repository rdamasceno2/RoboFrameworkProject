*** Settings ***
Library    SeleniumLibrary



*** Variables ***
${SIGNOUT_HEADER_LABEL}          Signed Out

*** Keywords ***
Verify Page Loaded
    wait until page contains     ${SIGNOUT_HEADER_LABEL}
