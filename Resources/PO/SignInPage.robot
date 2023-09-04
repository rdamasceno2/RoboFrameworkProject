*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SIGNIN_HEADER_LABEL}          Login
${SIGN_EMAIL_TEXTBOX} =         id=email-id
${SIGN_PASSWORD_TEXTBOX} =      id=password
${SIGN_SUBMIT_BUTTON} =         id=submit-id
*** Keywords ***

Verify Page Loaded
    wait until page contains    ${SIGNIN_HEADER_LABEL}

Sign in with valid credentials
    [Arguments]    ${email}      ${password}
    Verify Page Loaded
    Fill "Email" Field           ${email}
    Fill "Password" Field        ${password}
    Click "Submit" Button

Login with Invalid Credentials
    [Arguments]    ${email}      ${password}
    Verify Page Loaded
    Fill "Email" Field          ${email}
    Fill "Password" Field       ${password}
    Click "Submit" Button

Fill "Email" Field
    [Arguments]    ${email}
    input text              ${SIGN_EMAIL_TEXTBOX}    ${email}

Fill "Password" Field
    [Arguments]    ${password}
    input text              ${SIGN_PASSWORD_TEXTBOX}     ${password}

Click "Submit" Button
    click button            ${SIGN_SUBMIT_BUTTON}