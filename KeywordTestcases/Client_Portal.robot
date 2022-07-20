*** Settings ***
Resource          ../Global/super.robot

*** Test Cases ***
LP_054 User to Login to HealthTrack Rx
    Log    Read test data from excel file
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 1: Enter Valid UserName & Password Click on Sign-in.
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    [Teardown]

LP_055 User to Login to HealthTrack Rx with Invalid Username and Invalid Password
    Log    Read test data from excel file
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Validating Login Functionality    ${environment_data}
    [Teardown]    Take Screenshot and Close Browsers

LP_056 Forgot Password Functionality in Login Page
    Log    Read test data from excel file
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Click on Forgot your Password link.
    Click Element    ${button.login.forgot_password_link}
    Log    User is Navigated to a New Tab with Enter Email Field
    Log    Test Step 3: Enter Invalid Email id and Click on Send.
    Perform Actions in Forgot Password Page    ${environment_data}[InvalidPassword]
    Wait Until Page Contains Element    ${message.login.forgot_password_link.email_textbox}
    Screenshot.Take Screenshot
    Log    Error Text "This email is not registered in our database" is displayed.
    Log    Test Step 4: Enter Registered Email and Click on Send
    Perform Actions in Forgot Password Page    prakash.kamma@qualizeal.com
    Comment    Wait Until Element Is Visible    //input[@name="limsabc_qa_securityQuestions_form_answer_622"]    ${MEDIUM_WAIT}
    Comment    Input Text    //input[@name="limsabc_qa_securityQuestions_form_answer_622"]    kamma
    Comment    Wait Until Element Is Visible    //input[@name="limsabc_qa_securityQuestions_form_answer_623"]    ${MEDIUM_WAIT}
    Comment    Input Text    //input[@name="limsabc_qa_securityQuestions_form_answer_623"]    sweety
    Comment    Wait Until Element Is Visible    //input[@name="limsabc_qa_securityQuestions_form_answer_624"]    ${MEDIUM_WAIT}
    Comment    Input Text    //input[@name="limsabc_qa_securityQuestions_form_answer_624"]    kurnool
    Comment    Perform Actions    ${button.actions}    Send    ${MEDIUM_WAIT}
    Comment    Log    User Received an Email \ with Reset Password Link.
    [Teardown]    Take Screenshot and Close Browsers

CP_072 Verify whether Newly Added Comments are displayed in Comments Page.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP_072    Client_Portal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on "Client Portal" New Report button.
    Navigate to Module & Tab    Client Portal    New Report
    Log    Navigated to "Client Portal" and New Report data page is displayed
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select any one requisition ID click on requisition hamburger menu.
    Log    Test Step 5&6 :Click on Comments. Enter comments and click on Add button.
    Navigate to First Requisition Comments Page    ${testdata}
    Log    Options are displayed
    Log    Comments page is displayed and Comments Added in the "${sample_id}" Comments page.
    Log    Test Step 7: Refresh the New Report Page
    Search For Details In Home Page    ${testdata}[pending_searchcategory_checkbox]    ${sample_id}
    Log    Searched for the sample-id - ${sample_id}. ${sample_id} is displayed successfuly.
    Validate comments icon
    Log    "Comments" Message Box icon is displayed.
    Logout From Healthtrack Application
    Log    LoggedOut from HealthTrackRX Application
    [Teardown]    Take Screenshot and Close Browsers

CP_087 Verify User is able to Upload Documents with out Selecting File type.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP_087    Client_Portal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on "Client Portal" New Report button.
    Navigate to Module & Tab    Client Portal    New Report
    Log    Navigated to "Client Portal" and New Report data page is displayed
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select any one requisition ID click on requisition hamburger menu.
    ${RID}    Navigate to First Requisition View Documents
    Log    Navigated to Requisition -"${RID}" "View Documents" Page
    Log    Test Step 6: Click on Upload icon.
    Log    Test Step 7: Click on choose file and click on save.
    Upload File in View Documents and Save    ${testdata}    ${upload_file.clientportal.view_document}
    Log    Upload Modal is Displayed and Verified the error Message after Clicking Save without Selecting File Type.
    [Teardown]    Take Screenshot and Close Browsers

CP_088 Verify User is able to Upload Documents by Selecting File type.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP_088    Client_Portal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on "Client Portal" New Report button.
    Navigate to Module & Tab    Client Portal    New Report
    Log    Navigated to "Client Portal" and New Report data page is displayed
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select any one requisition ID click on requisition hamburger menu.
    Log    Test Step 5: Click on View Documents.
    ${RID}    Navigate to First Requisition View Documents
    Log    Options are displayed and Requisition-id -"${RID}" View Documents page is displayed
    Log    Test Step 6: Click on Upload icon.
    Log    Test Step 7: Click on Choose File and Select File with File type and Save.
    Upload File with File Type in View Documents and Save    ${testdata}    ${upload_file.clientportal.view_document}
    Log    Upload Modal is Displayed and Verified with Uploaded File in View Documents Page
    [Teardown]    Take Screenshot and Close Browsers

CP-094 Verify that the Selected Record is Removed from the Requisition List.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP_094    Client_Portal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on "Client Portal" Pending Lab Work Button..
    Navigate to Module & Tab    Client Portal    Pending Lab Work
    Log    Navigated to "Client Portal" and Pending Lab Work page is displayed
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select any one requisition ID click on requisition hamburger menu.
    Log    Test Step 5: Click on Cancel then click on yes.
    ${RID}    Click on Cancel Button in Hamburger
    Log    Navigated to Requisition-id -"${RID}" "Cancel" Page
    Search ID Value and Verify    ${testdata}    ${RID}
    Log    Searched for "${RID}" - Value
    [Teardown]    Take Screenshot and Close Browsers

CP_092 Verifying for requisition final reports.
    Log    Read test data from excel file
    ${testdata}    Read TestData From Excel    CP_092    Client_Portal
    ${environment_data}=    Read TestData From Excel    Chrome    QA_environment
    Log    Test Step 1: Launch HealthTrack Rx URL.
    Launch Browser    ${environment_data}[Browser_name]    ${environment_data}[Url]
    Log    User is Navigated to HealthTrack Rx Application with ${environment_data}[Url]-URL in ${environment_data}[Browser_name]
    Log    Test Step 2: Enter Credentials and Sign-In. ${USERNAME} as Username and ${PASSWORD} as Password
    Login To Application    ${USERNAME}    ${PASSWORD}
    Log    User is Navigated to Home Page
    Log    Test Step 3 : Click on "Client Portal" New Report button.
    Navigate to Module & Tab    Client Portal    New Report
    Log    Navigated to "Client Portal" and New Report data page is displayed
    Log    Handle Alert - "We'd like to show you notifications for the latest news and updates."
    Refuse Alert for Notifications of News
    Log    Refused Alert for Notifications of News
    Log    Test Step 4: Select any one Requisition ID and Click on Preview Report.
    Send Requisitions with Finalized Status to Preview Report    ${testdata}
    Log    Final Reports for Requisition Modal is displayed.
    [Teardown]    Take Screenshot and Close Browsers
