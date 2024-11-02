*** Settings ***
Library    AppiumLibrary
Suite Setup    Open Application_Demo
Suite Teardown    Close Application_Demo

*** Variables ***
${APPIUM_SERVER_URL}    http://localhost:4723/wd/hub
${PLATFORM_NAME}        Android
${PLATFORM_VERSION}     15.0
${DEVICE_NAME}          emulator-5554
${APP_PACKAGE}          io.appium.android.apis
${APP_ACTIVITY}         io.appium.android.apis.ApiDemos
${AUTOMATION_NAME}      UiAutomator2

*** Test Cases ***
Open Bouncing Ball
    Sleep    2
    Page Should Contain Element    //android.widget.TextView[@content-desc="Animation"]
    Click Element    //android.widget.TextView[@content-desc="Animation"]
    
    Sleep    2
    Page Should Contain Element    //android.widget.TextView[@content-desc="Bouncing Balls"]
    Click Element    //android.widget.TextView[@content-desc="Bouncing Balls"]
    
    Sleep    2
    @{firstFinger}=    Create List    ${100}    ${670}
    @{fingerPositions}=    Create List    ${firstFinger}
    Tap With Positions    ${300}    @{fingerPositions}

    Sleep    2
    @{firstFinger}=    Create List    ${500}    ${900}
    @{fingerPositions}=    Create List    ${firstFinger}
    Tap With Positions    ${300}    @{fingerPositions}

    Sleep    2
    @{firstFinger}=    Create List    ${1000}    ${300}
    @{fingerPositions}=    Create List    ${firstFinger}
    Tap With Positions    ${300}    @{fingerPositions}

    Sleep    2
    Press Keycode    4
    Sleep    2
    Press Keycode    4

Open Hello World
    #App.Activity.Hello World
    Sleep    2
    Page Should Contain Element    //android.widget.TextView[@content-desc="App"]
    Click Element    //android.widget.TextView[@content-desc="App"]
    
    Sleep    2
    Page Should Contain Element    //android.widget.TextView[@content-desc="Activity"]
    Click Element    //android.widget.TextView[@content-desc="Activity"]

    Sleep    2
    Page Should Contain Element    //android.widget.TextView[@content-desc="Hello World"]
    Click Element    //android.widget.TextView[@content-desc="Hello World"]

    Sleep    2
    Page Should Contain Element    //android.widget.TextView[@content-desc="Hello, World!"]
    Sleep    2
    Press Keycode    4
    Sleep    2
    Press Keycode    4
    Sleep    2
    Press Keycode    4
    Sleep    2

Open AudioFX
    Sleep    2
    Page Should Contain Element    //android.widget.TextView[@content-desc="Media"]
    Click Element    //android.widget.TextView[@content-desc="Media"]

    Sleep    2
    Page Should Contain Element    //android.widget.TextView[@content-desc="AudioFx"]
    Click Element    //android.widget.TextView[@content-desc="AudioFx"]

    Sleep    15
    Press Keycode    4
    Sleep    2
    Press Keycode    4
    Sleep    2


*** Keywords ***
Open Application_Demo
    Set Appium Timeout    10
    Open Application       ${APPIUM_SERVER_URL}
    ...                    automationName=${AUTOMATION_NAME}
    ...                    platformName=${PLATFORM_NAME}
    ...                    platformVersion=${PLATFORM_VERSION}
    ...                    deviceName=${DEVICE_NAME}
    ...                    appPackage=${APP_PACKAGE}
    ...                    appActivity=${APP_ACTIVITY}
    ...                    autoGrantPermissions=true
    Sleep    2

Close Application_Demo
    Close Application