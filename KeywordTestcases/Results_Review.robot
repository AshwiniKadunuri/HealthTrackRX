*** Settings ***
Resource          ../Global/super.robot

*** Test Cases ***
RR_034 Verify the display of Print Labels in new tab for multiple requisitions selected.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    RR_034    Results_Review
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser with Chrome options for Download    ${environment_data}[Url]    ${environment_data}[Browser_name]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Goto Quick Menu. Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on "Result Review" and Click on "Pending Result Tab".
    Navigate To Main Menu    Results Review
    Log    "Results Review" Pending Result data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select Multiple Requisitions and Click on "Print Labels" from tool bar grid.
    Log    Test step 5: .Select Label Template and click on Print button.
    Verify Print Labels with Multiple Requisitions    ${testdata}
    Log    Verified the Print Labels by Selecting "${updated_sample_id}" Requisitions
    [Teardown]    Take Screenshot and Close Browsers

RR_039 Select multiple requisitions in pending results, process the results and verify if raw result value is changed to 25 for all empty results
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    RR_039    Results_Review
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Goto Quick Menu. Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Result Review and Click on Pending Result Tab.
    Navigate To Main Menu    Results Review
    Log    "Results Review" Pending Result data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select Multiple Requisition and Click on "Cross Tab" from tool bar grid.
    Log    Test Step :5 Click on "Raw Result 25" button.
    Log    Test Step :6 Click on "Start Processing" button and Click on "Close Modal and Refresh Grid".
    Verify Raw Result in Cross Tab with Multiple Requisitions    ${testdata}
    Log    Verified Raw Result in Cross Tab by Selecting "${updated_sample_id}" Requisitions
    [Teardown]    Take Screenshot and Close Browsers

RR_041 Select Complete a requisition and verify the requisition under Results completed tab
    Depends On Test    RR_039
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    RR_041    Results_Review
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Goto Quick Menu. Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on "Result Review" and Click on "Pending Result Tab".
    Navigate To Main Menu    Results Review
    Log    "Results Review" Pending Result data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select Multiple Requisition and Click on "Complete Tab" from tool bar grid.
    Log    Test Step 5: Click on "Start Processing" Button and Click on "Close Modal and Refresh Grid".
    Verify Requisition Moved to Results Completed Tab    ${testdata}
    Log    Verified that the Selected "${updated_sample_id}"-Requisition are removed from Requisition Grid and displayed under "Result Completed" Tab.
    [Teardown]    Take Screenshot and Close Browsers

RR_043 Select requisitions, clear results in Sent back to accessioning and verify that \ requisitions are removed from requisition grid and displayed in Accessioning tab
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    RR_043    Results_Review
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Goto Quick Menu. Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Result Review and Click on Pending Result Tab.
    Navigate To Main Menu    Results Review
    Log    "Results Review" Pending Result data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select Multiple Requisitions and Click on "Sent Back to Accessioning" Tab from tool bar grid.
    Log    Test Step 5: Click on "Clear Result and Send Back" button.
    Log    Test Step 6: Click on "Start Processing" button and Click on "Close Modal and Refresh Grid".
    Search for Removed Requisitions from Results Review in Accessioning    ${testdata}
    Log    Verified that the Selected Requisitions of Sample-Id's - "${updated_sample_id}" are Removed from Requisition Grid and displayed in Accessioning tab.
    [Teardown]    Take Screenshot and Close Browsers

RR_044 Select requisitions under pending results, process and verify that \ requisitions are displayed in Preliminary Sent tab
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    RR_043    Results_Review
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Goto Quick Menu. Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on Result Review and Click on Pending Result Tab.
    Navigate To Main Menu    Results Review
    Log    "Results Review" Pending Result data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select Multiple Requisition and Click on "Send Preliminary Report" tab from tool bar grid.
    Log    Test Step 5: Click on "Start Processing" button and Click on "Close Modal and Refresh Grid".
    Select Requisitions and Navigate to Send Preliminary Report Tab    ${testdata}
    Log    Requisitions-"${updated_sample_id}" are Sent to "Send Preliminary Report". "Preliminary Report Sent!" popup message is displayed.
    [Teardown]    Take Screenshot and Close Browsers

RR_049 Verify if user is able to Reject a Requisition
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    RR_049    Results_Review
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 1: Goto Quick Menu. Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 2 : Click on Result Review and Click on Pending Result Tab.
    Navigate To Main Menu    Results Review
    Log    "Results Review" Pending Result data page is displayed.
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 3 & 4: Select any one Requisition ID and Click on Requisition Hamburger Menu. Click on Validity Rejection
    Log    Test Step 5: Select Reject type "YES"<<Enter Reject reason and Click on Save button.
    Log    6.Select Reject type "NO"<<Enter Reject reason and Click on Save button.
    Navigate to Validity Rejection with Selected Requisitions    ${testdata}
    Log    "Success" Pop-up Message is displayed and "Reject Cross" Mark icon is displayed.
