*** Settings ***
Test Teardown     Take Screenshot
Resource          ../Global/super.robot

*** Test Cases ***
AC_007 Tracking Number Length Limitation with Invalid Data(Numbers<5).
    [Documentation]    This Test-Case is used for Selecting a Requisition and Performing Complete from Tool-bar-Grid and Tracking Number Length by Passing Invalid Data(<5)
    [Tags]    test_case_id=AC_007
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC_007    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 1: Goto Quick Menu. Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 2 : Move to Accessioning.Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 3: Select the Requisition
    Select Multiple Requisitions Checkbox    2
    Log    Requisition Checkbox is Selected
    Log    Test Step 4 :Click on the COMPLETE Icon (Right Mark)
    Navigate to Tool_Bar Grid Buttons    Complete
    Log    Navigated to ''Complete" Page
    Log    Test Step 5: Enter Invalid Digit Tracking Number
    Log    Test Step 6: Click on Start Processing
    Perform Actions in Complete Page from Tool_bar_Grid_Buttons    ${testdata}    Requisition Complete All
    Log    Entered Invalid Digit Tracking Number - "${testdata}[track-id]"
    Log    Clicked on "Start Processing"
    Verify Text Message    ${testdata}[error_message]    ${MEDIUM_WAIT}
    Log    Alert should be Triggered to Enter Valid 5 Digits Tracking Number. Error_Message - "${testdata}[error_message]" Verification is Completed
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application
    [Teardown]    Take Screenshot And Close Browsers

AC_018 Verify Audit View from Requisition Hamburger Menu
    [Documentation]    This Test-Case is used to Verify Audit View from Requisition Hamburger Menu
    Log    Read test data from excel file
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select one Requisition ID and Click on Requisition Hamburger Menu.
    ${sample_id}    Get First Requisition (Sample-Id,RID)    ${label.accessioning.get_sample-id_first_requisition}
    Log    Requisition is Selected
    Log    Test Step 5: Click on Audit.
    Navigate to Requisition Hamburger Sub-Menu    ${sample_id}    Audit    Audit view
    Log    Options are displayed. & Navigated to Requisition Hamburger ''Audit" Page
    Log    Verified Requisition Data History in Audit Page
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application
    [Teardown]    Take Screenshot And Close Browsers

AC_019 Verify Regenerate Requisition Form from Requisition Hamburger Menu
    [Documentation]    This Test-Case is used to Verify Regenerate Requisition Form from Requisition Hamburger Menu
    Log    Read Test-data from Excel File
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select one Requisition ID and Click on Requisition Hamburger menu.
    ${sample_id}    Get First Requisition (Sample-Id,RID)    ${label.accessioning.get_sample-id_first_requisition}
    Log    Requisition is Selected
    Log    Test Step 5: Click on "Regenerate Requisition Form".
    Navigate to Requisition Hamburger Sub-Menu    ${sample_id}    Regenerate Req Form
    Log    Options are displayed. & Navigated to Requisition Hamburger "Regenerate Requisition Form" Page
    Wait Until Page Contains Element    ${message.successfully}
    Screenshot.Take Screenshot
    Log    Verified the Pop-up Message - "Successfully"
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application
    [Teardown]    Take Screenshot and Close Browsers

AC_021 Verify Print Preview from Requisition Hamburger Menu in "Pending" Tab
    [Documentation]    This Test-Case is used to Verify Print Preview from Requisition Hamburger Menu
    Log    Read test data from excel file
    ${Testdata}    Read TestData From Excel    AC_021    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Click Arrow-Down Button    ${button.accesioning.details.down_arrow}
    Log    Arrow Button is Clicked
    Log    Test Step 4: Select one Requisition ID and Click on Requisition Hamburger menu.
    ${sample_id}    Get First Requisition (Sample-Id,RID)    ${label.accessioning.get_sample-id_first_requisition}
    Log    Requisition is Selected
    Add Comments in Hamburger_Comments Page    ${sample_id}    ${Testdata}
    Log    Added Comments into Requisition through Hamburger_Comments Page
    Log    Test Step 5: Click on "Regenerate Requisition Form".
    Navigate to Requisition Hamburger Sub-Menu    ${sample_id}    Print Preview
    Log    Options are displayed. & Navigated to Requisition Hamburger "Print Preview" Page
    Wait Until Time    2
    ${file_path}    Read File Path    ${EXECDIR}\\Downloads
    ${pdf_data}    Read Coloured PDF    ${file_path}[0]
    Log    "${pdf_data}" is Displayed
    Verify Pdf Data and Remove Pdf File    ${pdf_data}    ${Testdata}[comment]    ${file_path}[0]
    Log    Verified "Print Preview" Data Displayed in New Tab
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application
    [Teardown]    Take Screenshot and Close Browsers

AC_026 Verify Reject from Requisition Hamburger Menu.
    [Documentation]    This Test-Case is used to Verify Reject from Requisition Hamburger Menu
    Log    Read test data from excel file
    ${Testdata}    Read TestData From Excel    AC_026    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select one Requisition ID and Click on Requisition Hamburger menu.
    ${sample_id}    Get First Requisition (Sample-Id,RID)    ${label.accessioning.get_sample-id_first_requisition}
    Log    Requisition is Selected
    Navigate to Requisition Hamburger Sub-Menu    ${sample_id}    Reject
    Log    "Rejection Modal" is Displayed & Navigated to Requisition Hamburger "Reject" Page
    Log    Test step 5: Fill all the Details and Click on Save.
    Select Frame And Input Req Comments    ${frame.accesioning.requisition-hamburger.reject}    ${textbox.results_review.reqcomment}    ${Testdata}
    Perform Actions    ${button.actions}    Save    ${MEDIUM_WAIT}
    Verify Text Message    Requisition Rejected    ${MEDIUM_WAIT}
    Log    "Requisition Rejected" Pop-up Message is Displayed.
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application
    [Teardown]    Take Screenshot and Close Browsers

AC_029 Verify Add Requisition Error from Hamburger Menu
    [Documentation]    This Test-Case is used to Verify Add Requisition Error from Requisition Hamburger Menu
    Log    Read test data from excel file
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select one Requisition ID and Click on Requisition Hamburger menu.
    ${sample_id}    Get First Requisition (Sample-Id,RID)    ${label.accessioning.get_sample-id_first_requisition}
    Log    Requisition is Selected
    Navigate to Requisition Hamburger Sub-Menu    ${sample_id}    Add Requisition Errors
    Log    "Add Requisition Errors" is Displayed & Navigated to Requisition Hamburger "Add Requisition Errors" Page
    Log    Test Step 5: Select one Requisition Error and Click on Save.
    ${requisition_error_name}    Add Requisition Error from Req-Hamburger
    Verify Text Message    Success    ${MEDIUM_WAIT}
    Log    "Success" Pop-up Message is Displayed
    Navigate to Details with Sub-Menu Button Page    ${sample_id}    Errors
    Verify Error Added in Details_Errors Page    ${requisition_error_name}
    Log    Verified the Error Reflected under Errors Tab in Requisition Detail.
    Navigate to Hamburger Options in Details_Errors Page    Delete
    Perform Actions    ${button.actions}    Yes    ${MEDIUM_WAIT}
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application
    [Teardown]    Take Screenshot and Close Browsers

AC_037 Tracking Number Length Limitation with Invalid Data(Alphabets).
    [Documentation]    This Test-Case is used for Selecting a Requisition and Performing Complete from Tool-bar-Grid and Tracking Number Length by Passing Invalid Data(Alphabets & Special-Characters)
    Log    Read test data from excel file
    ${Testdata}    Read TestData From Excel    AC_037    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Goto Quick Menu & Move to Accessioning \
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 3: Select the Requisition Id and Click on the COMPLETE Icon(Right Mark).
    Select Multiple Requisitions Checkbox    2
    Log    Requisition Checkbox is Selected
    Navigate to Tool_Bar Grid Buttons    Complete
    Log    User is Navigated to ''Complete" Page
    Log    Test Step 4: Enter Tracking Number and Click on Start Processing Button.
    Perform Actions in Complete Page from Tool_bar_Grid_Buttons    ${Testdata}    Requisition Complete All    "Close Modal and Refresh Grid"
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application
    [Teardown]    Take Screenshot and Close Browsers

AC_062 Verify Regenerate Requisition Form from Tool Bar Grid.
    [Documentation]    This Test-Case is used to Verify Regenerate Requisition Form from Tool-Bar-Grid by Selecting Requisitions
    Log    Read test data from excel file
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select Multiple Requisitions and Click on Regenerate Requisition Form from Tool Bar Grid.
    Select Multiple Requisitions Checkbox    3
    Log    Requisition Checkbox is Selected
    Navigate to Tool_Bar Grid Buttons    Regenerate Form
    Log    Navigated to ''Regenerate Form"
    Verify Text Message    Successfully    ${MEDIUM_WAIT}
    Log    Verified "Successfully" Pop-up Message.
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application
    [Teardown]    Take Screenshot and Close Browsers

AC_078 Verify Print Requisition Form in Requisition-List (Left Menu)
    [Documentation]    This Test-Case is used to Verify Print Requisition Form in Requisition-List (Left-Menu)
    Log    Read test data from excel file
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Login as an Internal user into LIMSABC.
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3,4: Goto Quick Menu & Click on Accessioning module
    Navigate To Main Menu    Accessioning
    Log    Navigated to "Accessioning" page
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 5: Click on Print Requisition Form icon left to Requisition
    ${sample_id}    Get First Requisition (Sample-Id,RID)    ${label.accessioning.get_sample-id_first_requisition}
    Click on Home-Page Requisitions Button    ${button.accesioning.requisition_list.print_requisition_form.by_replace_sample-id}    ${sample_id}
    ${file_path}    Read Pdf Data
    Log    "${pdf_data}" is Displayed
    Remove File    ${file_path}[0]
    Log    Verified "Print Preview" Data Displayed in New Tab and Requisition Form opened in PDF Format
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application
    [Teardown]    Take Screenshot and Close Browsers

AC_079 Verify Print Labels in Requisition-List (Left Menu)
    [Documentation]    This Test-Case is used to Verify Print Labels in Requisition-List (Left-Menu)
    Log    Read test data from excel file
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Login as an Internal user into LIMSABC.
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3,4: Goto Quick Menu & Click on Accessioning module
    Navigate To Main Menu    Accessioning
    Log    Navigated to "Accessioning" page
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Click Arrow-Down Button    ${button.accesioning.details.down_arrow}
    Log    Arrow Button is Clicked
    Log    Test Step 5: Click on Print Labels icon left to Requisition
    ${sample_id}    Get First Requisition (Sample-Id,RID)    ${label.accessioning.get_sample-id_first_requisition}
    Click on Home-Page Requisitions Button    ${button.accesioning.requisition_list.print_label.by_replace_sample-id}    ${sample_id}
    ${file_path}    Read File Path    ${EXECDIR}\\Downloads
    ${pdf_data}    Read Coloured Pdf    ${file_path}[0]
    Log    "${pdf_data}" is Displayed
    Remove File    ${file_path}[0]
    Log    Verified that Labels opened in PDF Format
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application
    [Teardown]    Take Screenshot and Close Browsers

AC-081 Verify Complete from Requisition-List (Left Menu)
    [Documentation]    This Test-Case is used to Verify Complete from Requisition-List (Left-Menu)
    Log    Read test data from excel file
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Login as an Internal user into LIMSABC.
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    Loggedin to application with ${USERNAME} as username and ${PASSWORD} as password
    Log    Test Step 3,4: Goto Quick Menu & Click on Accessioning module
    Navigate To Main Menu    Accessioning
    Log    Navigated to "Accessioning" page
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Search for Requisition in Accessioned State
    Click Arrow-Down Button    ${button.accesioning.details.down_arrow}
    Log    Arrow Button is Clicked
    Log    Test Step 5: Click on "Complete" icon left to the Requisition(which is not in Complete or Rejected state)
    ${sample_id}    Get First Requisition (Sample-Id,RID)    ${label.accessioning.get_sample-id_first_requisition}
    Click on Home-Page Requisitions Button    ${button.accesioning.requisition_list.complete.by_replace_sample-id}    ${sample_id}
    Log    Test step 6: Verify Labels PDF is Opened and Requisition Completed Message is displayed
    Wait Until Time    2
    ${Windows}    Get Window Handles
    Switch Window    ${Windows}[1]
    Wait Until Time    2
    Screenshot.Take Screenshot
    Switch Window    ${Windows}[0]
    Log    Verified Requisition Form in PDF Format
    Verify Text Message    Requisition Completed    5
    Log    Message -"Requisition Completed" is Displayed
    Perform Actions    ${button.actions}    No    ${MEDIUM_WAIT}
    Log    Clicked on "No"
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application
    [Teardown]    Take Screenshot and Close Browsers

AC_085 Verify Single Requisition Record in Batch Review from Tool-Bar-Grid.
    [Documentation]    This Test-Case is used to Select one Requisition and Verify Requisition Record in Batch-Review from Tool-Bar-Grid
    Log    Read test data from excel file
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select any one Requisition and Click on Review Batch from Tool Bar Grid.
    Select Multiple Requisitions Checkbox    2
    Log    Selected Requisition
    Navigate to Tool_Bar Grid Buttons    Batch Review
    Log    "Batch Review" page is displayed.
    Wait Until Time    2
    ${windows}    Get Window Handles
    Switch Window    ${windows}[1]
    Verify Selected Requisition Details In Batch-Review    ${home_page_requisition_id}    ${req_id_count}
    Log    Verified Selected Requisition Record Details
    Switch Window    ${windows}[0]
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application
    [Teardown]    Take Screenshot and Close Browsers

AC_086 Verify Multiple Requisition Record in Batch Review from Tool-Bar-Grid.
    [Documentation]    This Test-Case is used to Select Multiple Requisitions and Verify Requisitions Record in Batch-Review from Tool-Bar-Grid
    Log    Read test data from excel file
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select Multiple Requisition and Click on Review Batch from Tool Bar Grid.
    Select Multiple Requisitions Checkbox    3
    Log    Selected Requisition
    Navigate to Tool_Bar Grid Buttons    Batch Review
    Log    "Batch Review" page is displayed.
    Wait Until Time    2
    ${windows}    Get Window Handles
    Switch Window    ${windows}[1]
    Verify Selected Requisition Details In Batch-Review    ${home_page_requisition_id}    ${req_id_count}
    Log    Verified Selected Requisition Record Details
    Switch Window    ${windows}[0]
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application
    [Teardown]    Take Screenshot and Close Browsers

AC_087 Verify Single Requisition Records Billing Batch Review from Tool-Bar-Grid.
    [Documentation]    This Test-Case is used to Select one Requisition and Verify Requisition Record in Billing-Batch-Review from Tool-Bar-Grid
    Log    Read test data from excel file
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Click Arrow-Down Button    ${button.accesioning.details.down_arrow}
    Log    Clicked on Arrow Button
    Log    Test Step 4: Select one Requisition and Click on Billing Batch Review from Tool Bar Grid.
    Select Multiple Requisitions Checkbox    2
    Log    Requisition Checkbox is Selected
    Navigate to Tool_Bar Grid Buttons    Billing Batch Review
    Log    "Billing Batch Review" page is displayed.
    Wait Until Time    4
    ${windows}    Get Window Handles
    Switch Window    ${windows}[1]
    Log    Test Step 5: Click on Billing Review right side in the top.
    Verify Selected Requisition Details In Billing-Batch Review    ${home_page_requisition_id}    ${req_id_count}
    Switch Window    ${windows}[0]
    Log    Goto Accessioning Refresh the page and Verified that Selected Requisition Record is in Green Colour Tick Mark.
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application
    [Teardown]    Take Screenshot and Close Browsers

AC_088 Verify Multiple Requisition Records Billing Batch Review from Tool-Bar-Grid.
    [Documentation]    This Test-Case is used to Select Multiple Requisition and Verify Requisition Record in Billing-Batch-Review from Tool-Bar-Grid
    Log    Read test data from excel file
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Click Arrow-Down Button    ${button.accesioning.details.down_arrow}
    Log    Clicked on Arrow Button
    Log    Test Step 4: Select Multiple Requisition and Click on Billing Batch Review from Tool Bar Grid.
    Select Multiple Requisitions Checkbox    3
    Log    Requisition Checkbox is Selected
    Navigate to Tool_Bar Grid Buttons    Billing Batch Review
    Log    "Billing Batch Review" page is displayed.
    Wait Until Time    2
    ${windows}    Get Window Handles
    Switch Window    ${windows}[1]
    Log    Test Step 5: Click on Billing Review right side in the top.
    Verify Selected Requisition Details In Billing-Batch Review    ${home_page_requisition_id}    ${req_id_count}
    Switch Window    ${windows}[0]
    Log    Goto Accessioning Refresh the page and Verified that Selected Requisition Record is in Green Colour Tick Mark.
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application
    [Teardown]    Take Screenshot and Close Browsers

AC_059 Verify Requisitions are Removed from Accessioning after Complete Processing.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC_059    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on Pending.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Click Arrow-Down Button    ${button.accesioning.details.down_arrow}
    Log    Arrow Button is Clicked
    Log    Test Step 4: Select Multiple Requisition and Click on Complete icon from Tool Bar Grid.
    Select Multiple Requisitions Checkbox    3
    Log    Requisition Checkbox is Selected
    Navigate to Tool_Bar Grid Buttons    Complete
    Log    Requisition "Complete all" page is displayed.
    Log    Test Step 5,6 : Enter the Received Date and Tracking Number<<Click on Start Processing Button & \ Click on Close Modal and Refresh Grid.
    Perform Actions in Complete Page from Tool_bar_Grid_Buttons    ${testdata}    Requisition Complete All    "Close Modal and Refresh Grid"
    Log    Requisition Processed Completed Successfully is Displayed.
    Wait Until Time    4
    ${Windows}    Get Window Handles
    Switch Window    ${Windows}[1]
    Screenshot.Take Screenshot
    Log    Verified the Requisition Bar Code Label as New Tab.
    Switch Window    ${Windows}[0]
    Log    Test Step 7: Enter Sample ID and Click on Search Button.
    Search for Multiple Sample-id in Search-Bar & Verify    ${testdata}    ${req_id_count}    ${updated_sample_id}
    Log    No Records found Message is Displayed.
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application
    [Teardown]    Take Screenshot and Close Browsers

AC_098 Verify Rejected Requisition in Requisition_Hamburger -"Back to Pending" from "All" Tab.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC_098    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3: Click on "Accessioning" and click on "All".
    Navigate to Module & Tab    Accessioning    All
    Log    "Accessioning All" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select Rejected Requisition and Click on Back to Pending from Hamburger Menu.
    Select Multiple Requisitions Checkbox    1
    Log    Requisition is Selected
    Verify user is able to Reject Selected Requisition    ${home_page_requisition_id}[0]    ${testdata}
    Log    Rejected the Requisition-"${home_page_req_id}[0]"
    Navigate to Requisition Hamburger Sub-Menu    ${home_page_requisition_id}[0]    Back to Pending    Back to Pending
    Log    "Back to Pending" modal is displayed.
    Log    Test Step 5: Enter the \ Comments and Click on Send Back For Testing Button.
    Enter Comments in Req_Hamburger "Back to Pending"    ${testdata}
    Log    Comments are Entered and Clicked on "Send back for Testing"
    Navigate to Tab    Pending
    Search For Details In Home Page    ${testdata}[pending_searchcategory_checkbox]    ${home_page_requisition_id}[0]
    Wait Until Time    2
    Screenshot.Take Screenshot
    Log    Verified the Selected Requisition - "${home_page_req_id}[0]" in "Pending" Tab.
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application
    [Teardown]    Take Screenshot and Close Browsers

AC_039 Tracking Number Length Limitation with Invalid Data(9100151).
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC_039    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 1: \ Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 2 : Goto Quick Menu.Move to Accessioning.
    Navigate To Main Menu    Accessioning
    Log    "Accessioning Pending" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 3: Select the Requisition
    Select Multiple Requisitions Checkbox    ${testdata}[requisition_checkbox_count]
    Log    Requisition Checkbox is Selected
    Log    Test Step 3 :Click on the COMPLETE Icon (Right Mark)
    Navigate to Tool_Bar Grid Buttons    Complete
    Log    User is Navigated to Requisition "Complete" \ Page.
    Log    Test Step 4: Enter Tracking Number and Click on "Start Processing" button
    Perform Actions in Complete Page from Tool_bar_Grid_Buttons    ${testdata}    Requisition Complete All    "Close Modal and Refresh Grid"
    Log    Entered Invalid Digit Tracking Number - "${testdata}[track-id]" and Clicked on "Start Processing"
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application

AC_195 Verify Print Preview from Requisition Hamburger in "All" Tab
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    AC_195    Accesioning
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Accessioning and Click on All.
    Navigate to Module & Tab    Accessioning    All
    Log    "Accessioning All" data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Click Arrow-Down Button    ${button.accesioning.details.down_arrow}
    Log    Arrow Button is Clicked
    Log    Test Step 4: Select one Requisition ID and Click on Requisition Hamburger menu.
    ${sample_id}    Get First Requisition (Sample-Id,RID)    ${label.accessioning.get_sample-id_first_requisition}
    Log    Requisition is Selected
    Add Comments in Hamburger_Comments Page    ${sample_id}    ${testdata}
    Log    Added Comments into Requisition through Hamburger_Comments Page
    Log    Test Step 5: Click on "Regenerate Requisition Form".
    Navigate to Requisition Hamburger Sub-Menu    ${sample_id}    Print Preview
    Log    Options are displayed. & Navigated to Requisition Hamburger "Print Preview" Page
    Wait Until Time    ${MINI_WAIT}
    ${file_path}    Read File Path    ${EXECDIR}\\Downloads
    ${pdf_data}    Read Coloured Pdf    ${file_path}[0]
    Log    "${pdf_data}" is Displayed
    Verify Pdf Data and Remove Pdf File    ${pdf_data}    ${testdata}[comment]    ${file_path}[0]
    Log    Verified "Print Preview" Data Displayed in New Tab
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application
