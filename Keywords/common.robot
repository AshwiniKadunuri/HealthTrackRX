*** Settings ***
Resource          ../Global/super.robot

*** Keywords ***
Launch Browser
    [Arguments]    ${browser_name}    ${url}
    Run Keyword If    '${browser_name}'=='Chrome' or '${browser_name}'=='chrome' or '${browser_name}'=='gc'    Open Browser    ${url}    gc
    Run Keyword If    '${browser_name}'=='Firefox' or '${browser_name}'=='firefox' or '${browser_name}'=='ff'    Open Browser    ${url}    Firefox
    Maximize Browser Window

Launch Browser And Navigate to URL
    [Arguments]    ${url}    ${browser_name}
    Launch Browser    ${browser_name}    ${url}
    Maximize Browser Window
    Wait Until Time    2

Read TestData From Excel
    [Arguments]    ${testcaseid}    ${sheet_name}
    [Documentation]    Read TestData from excel file for required data.
    ...
    ...    Example:
    ...    Read TestData From Excel TC_01 SheetName
    ${test_data}    CustomLibrary.Get Ms Excel Row Values Into Dictionary Based On Key    ${TESTDATA_FOLDER}/TestData.xls    ${testcaseid}    ${sheet_name}
    [Return]    ${test_data}

Take Screenshot
    Capture Page Screenshot

Set Browser Position
    [Arguments]    ${browser_name}
    Run Keyword If    '${browser_name}'=='Chrome' or '${browser_name}'=='chrome' or '${browser_name}'=='gc'    Set Window Position    0    5
    Run Keyword If    '${browser_name}'=='Firefox' or '${browser_name}'=='firefox' or '${browser_name}'=='ff'    Set Window Position    1005    6
    Set Window Size    959    1047

Create Screenshot Directory
    Run Keyword And Ignore Error    Create Directory    ${EXECDIR}/Screenshots
    SeleniumLibrary.Set Screenshot Directory    ${EXECDIR}/Screenshots

Login To Application
    [Arguments]    ${user_name}    ${password}
    Log    Login page is displayed
    Input Text    ${login.textbox.username}    ${user_name}
    Log    ${user_name} is entered in ${login.textbox.username} textbox
    Input Text    ${login.textbox.password}    ${password}
    Log    ${password} is entered in ${login.textbox.password} textbox
    Wait Until Element Is Visible    ${login.button.signin}    ${LONG_WAIT}    Sign in button is not displayed
    sleep    2s
    Click Element    ${login.button.signin}
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${homescreen.label.homepage.client_portal_menu}    ${LONG_WAIT}    Login failed. Home page is not displayed
    Run Keyword If    ${status}==False    Fail
    Wait Until Page Contains Element    ${pagetitle.homepage}
    Screenshot.Take Screenshot

Wait Until Element Clickable And Click
    [Arguments]    ${locator}    ${time_interval}=2s
    Wait Until Keyword Succeeds    14s    ${time_interval}    Click Element    ${locator}

Fail And Take Screenshot
    [Arguments]    ${error_message}
    Run Keyword And Continue On Failure    Fail    ${error_message}
    Take Screenshot

Create Directories
    Create Screenshot Directory

Take Screenshot And Close Browsers
    common.Take Screenshot
    Close All Browsers

Scroll And Click
    [Arguments]    ${locator}
    Scroll To Element    ${locator}
    Click Element    ${locator}

Navigate To Main Menu
    [Arguments]    ${menu}
    Comment    Navigate to ${menu} page
    ${button.homepage.select_menu.new}    Update Dynamic Value    ${button.homepage.select_menu}    ${menu}
    Comment    Wait Until Element Is Visible    ${button.homepage.select_menu.new}    ${MEDIUM_WAIT}
    Wait Until Time    4
    Javascript Click    ${button.homepage.select_menu.new}
    Screenshot.Take Screenshot

Search For Details In Home Page
    [Arguments]    ${pending_searchcategory_checkbox}    ${sample_id}
    [Timeout]
    Reload Page
    Comment    Wait Until Element Is Visible    ${textbox.homepage.common_search}    ${LONG_WAIT}    Search box is not displayed after waiting ${LONG_WAIT} seconds
    Wait Until Time    ${MINI_WAIT}
    Input Text    ${textbox.homepage.common_search}    ${sample_id}
    Comment    Click on sample id checkbox
    ${pending_searchcategory_checkbox_option}    Update Dynamic Value    ${checkbox.accesioning.home_page.search_category}    ${pending_searchcategory_checkbox}
    ${class}    Get Element Attribute    ${pending_searchcategory_checkbox_option}    class
    Run Keyword If    '$(class)'=='radio'    Javascript Click    ${pending_searchcategory_checkbox_option}
    Comment    Click on Search button
    Javascript Click    ${button.homepage.common_search}
    Screenshot.Take Screenshot
    Wait Until Time    ${MINI_WAIT}

Get 2 Days Previous Date
    ${date}    Get Current Date
    ${date}    Subtract Time From Date    ${date}    2days    result_format=%m/%d/%Y
    [Return]    ${date}

Update Dynamic Value
    [Arguments]    ${locator}    ${value}
    ${xpath}    Replace String    ${locator}    replaceText    ${value}
    [Return]    ${xpath}

Logout From Healthtrack Application
    Wait Until Element Is Visible    ${button.homepage.log_out}    ${LONG_WAIT}    Log out button is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.homepage.log_out}
    Wait Until Element Is Not Visible    ${button.homepage.log_out}    ${LONG_WAIT}    Log out button is not visible after waiting ${LONG_WAIT} seconds

Refuse Alert for Notifications of News
    Comment    Refuse Alert Popup of Notifications of News and Updates
    SeleniumLibrary.Wait Until Element Is Visible    ${button.homepage.refusealert}    ${LONG_WAIT}    refuse_alert is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.homepage.refusealert}
    Log    "${button.homepage.refusealert}" is Clicked
    Screenshot.Take Screenshot

Navigate To Pending Search Page
    Wait Until Element Is Visible    ${button.accesioning.pending}    ${LONG_WAIT}    Pending label is not displayed after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.accesioning.pending}

Verify User is Navigated to Menu Page
    [Arguments]    ${menu}
    ${menu_title}    Update Dynamic Value    //div[@class='title-top' and normalize-space(text())='replaceText']    ${menu}
    SeleniumLibrary.Wait Until Element Is Visible    ${menu_title}    ${LONG_WAIT}    ${menu_title} is not visible after waiting ${LONG_WAIT} seconds

Launch Browser with Chrome Options and Navigate to URL
    [Arguments]    ${url}    ${browser_name}
    ${session}    Run Keyword And Return Status    Get Session Id
    Run Keyword If    ${session}==True    Go To    ${url}
    ...    ELSE    Launch Browser with Chrome options for Download    ${browser_name}    ${url}
    Maximize Browser Window
    Wait Until Time    2

Launch Browser with Chrome options for Download
    [Arguments]    ${URL}    ${BROWSER_NAME}
    ${chromeOptions}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${prefs} =    Create Dictionary    download.default_directory=${PDF_DOWNLOAD_FOLDER}    enabled=False    name=Chrome PDF Viewer    download.extensions_to_open=applications/pdf    plugins.always_open_pdf_externally=${TRUE}
    Call Method    ${chromeOptions}    add_experimental_option    prefs    ${prefs}
    Create Webdriver    ${BROWSER_NAME}    chrome_options=${chromeOptions}
    Go To    ${URL}
    Maximize Browser Window

Read Data From Pdf
    ${file_path}    Read File Path    ${EXECDIR}\\Downloads
    ${pdf_data}    Read Pdf    ${file_path}[0]
    Log    ${pdf_data}
    ${get_data}    FilterNumber status    ${pdf_data}
    Log    ${get_data}[0]
    ${sample_id}    Set Variable    ${get_data}[0]
    Set Global Variable    ${sample_id}
    [Return]    ${file_path}

Verify User is able to Search and View Sample id in Result Review Page
    Log    Test Step 4: Clicked on pending results button
    Screenshot.Take Screenshot
    Comment    Verify user is able to search sample id using search text bar
    Search Id in Results review searchbar
    Log    Test Step 5: Enter Valid ${sample_id} Sample ID and click on search button.
    Screenshot.Take Screenshot
    Comment    Verify user is able to click on check box{Sample-id} and click on Batch Review from Tool bar grid.
    Navigate to Batch Review Page with Selected Sample-id
    Log    Test Step 6: Clicked on ${sample_id} check box and click on Batch Review from Tool bar grid.

Login to Application with Invalid and Valid data for Verification
    [Arguments]    ${user_name}    ${password}    ${message_locator}
    Log    Login page is displayed
    Input Text    ${login.textbox.username}    ${user_name}
    Log    ${user_name} is entered in ${login.textbox.username} textbox
    Input Text    ${login.textbox.password}    ${password}
    Log    ${password} is entered in ${login.textbox.password} textbox
    Wait Until Element Is Visible    ${login.button.signin}    ${LONG_WAIT}    Sign in button is not displayed
    sleep    2s
    Click Element    ${login.button.signin}
    Wait Until Page Contains Element    ${message_locator}
    Screenshot.Take Screenshot

Perform Actions in Forgot Password Page
    [Arguments]    ${Data}
    Input Text    ${textbox.login.forgot_password_link.email_textbox}    ${Data}
    Perform Actions    ${button.actions}    Send    ${MEDIUM_WAIT}
    Screenshot.Take Screenshot

Validating Login Functionality
    [Arguments]    ${environment_data}
    Log    Test Step 2: Enter Valid UserName & Invalid Password and Click on sign in.
    Login to Application with Invalid and Valid data for Verification    ${USERNAME}    ${environment_data}[InvalidPassword]    ${message.login.invalid_password}
    Reload Page
    Log    Error Text 'Password is not correct' is displayed.
    Log    Test Step 3: Enter Valid User Name & Invalid Password and Click on Sign-in.
    Login to Application with Invalid and Valid data for Verification    ${environment_data}[InvalidUsername]    ${PASSWORD}    ${message.login.invalid_mail}
    Reload Page
    Log    Error Text 'Username/Email address has not been found' is displayed.
    Log    Test Step 4: Enter Valid User Name & Invalid Password and Click on Sign-in.
    Login to Application with Invalid and Valid data for Verification    ${environment_data}[InvalidUsername]    ${environment_data}[InvalidPassword]    ${message.login.invalid_mail}
    Log    Error Text 'Username/Email address has not been found' is displayed.

Switch to New Window and Verify
    ${windowslist}    Get Window Handles
    ${defaultwindow}    get_current_window
    Should Be Equal    ${defaultwindow}    ${windows_list}[0]
    Switch Window    ${windows_list}[1]
    ${newwindow}    get_current_window
    Should Be Equal    ${newwindow}    ${windows_list}[1]

Switch to Default Window and Verify
    ${windows_list}    Get Window Handles
    ${new_window}    get_current_window
    Should Be Equal    ${new_window}    ${windows_list}[1]
    Switch Window    ${windows_list}[0]
    ${default_window}    get_current_window
    Should Be Equal    ${default_window}    ${windows_list}[0]
