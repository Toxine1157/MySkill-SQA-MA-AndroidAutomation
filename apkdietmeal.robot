*** Settings ***
Library    AppiumLibrary
Suite Setup    Open Application_DietMeal
Suite Teardown    Close Application_DietMeal

*** Variables ***
${APPIUM_SERVER_URL}    http://localhost:4723/wd/hub
${PLATFORM_NAME}        Android
${PLATFORM_VERSION}     15.0
${DEVICE_NAME}          emulator-5554
${APP_PACKAGE}          com.fghilmany.dietmealapp
${APP_ACTIVITY}         com.fghilmany.dietmealapp.ui.main.MainActivity
${AUTOMATION_NAME}      UiAutomator2

*** Test Cases ***
User Login
    Sleep    4
    Page Should Contain Element    //android.widget.EditText[@resource-id="com.fghilmany.dietmealapp:id/et_name"]
    Input Text    //android.widget.EditText[@resource-id="com.fghilmany.dietmealapp:id/et_name"]    Soni

    Sleep    2
    Input Text    //android.widget.EditText[@resource-id="com.fghilmany.dietmealapp:id/et_weight"]    65

    Sleep    2
    Input Text    //android.widget.EditText[@resource-id="com.fghilmany.dietmealapp:id/et_height"]    165

    Sleep    2
    Click Element    //android.widget.RadioButton[@resource-id="com.fghilmany.dietmealapp:id/rb_male"]

    Sleep    2
    Click Element    //android.widget.Button[@resource-id="com.fghilmany.dietmealapp:id/bt_next"]

Fill A Form
    Sleep    3
    Page Should Contain Element    //android.widget.RadioButton[@resource-id="com.fghilmany.dietmealapp:id/rb_rest"]
    Click Element    //android.widget.RadioButton[@resource-id="com.fghilmany.dietmealapp:id/rb_rest"]

    Sleep    2
    Click Element    //android.widget.Button[@resource-id="com.fghilmany.dietmealapp:id/bt_finish"]

Open Pop Ice Meal
    Sleep    2
    Page Should Contain Element    //android.widget.FrameLayout[@content-desc="Meals"]
    Click Element    //android.widget.FrameLayout[@content-desc="Meals"]

    Sleep    2
    Click Element    //androidx.recyclerview.widget.RecyclerView[@resource-id="com.fghilmany.dietmealapp:id/rv_meal"]/android.view.ViewGroup[5]

    Sleep    5


*** Keywords ***
Open Application_DietMeal
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

Close Application_DietMeal
    Close Application