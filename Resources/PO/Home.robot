*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${HOME_HEADER_LABEL}       Customers Are Priority One!
${URL}                https://automationplayground.com/crm
*** Keywords ***
Nagivate to
    go to     ${URL}

Verify Page Loaded
   page should contain       ${HOME_HEADER_LABEL}