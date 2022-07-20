*** Settings ***
Resource          ../Global/super.robot

*** Keywords ***
Navigate to Batch Review Page with Selected Sample-id
    Comment    select sample id check-box
    sleep    3
    Javascript Click    xpath:${Checkbox.Results.Sample id-grid}
    Comment    Click on batch review from grid-tool bar
    Wait Until Element Is Visible    ${button.Results.batch_review grid}    ${MEDIUM_WAIT}
    sleep    3
    Javascript Click    xpath:${button.Results.batch_review grid}

Search Id in Results review searchbar
    Comment    Verify user is able to search using sample id
    Wait Until Page Contains Element    ${textbox.Results.searchbar}    ${MEDIUM_WAIT}    searchbox in pending menu is not displayed after waiting ${MEDIUM_WAIT} seconds
    Input Text    ${textbox.Results.searchbar}    ${sample_id}
    Wait Until Page Contains Element    ${Checkbox.Results.Sample#}    ${MEDIUM_WAIT}    checkbox for selecting sample# \ is not displayed after waiting ${MEDIUM_WAIT} seconds
    Javascript Click    xpath:${Checkbox.Results.Sample#}
    Comment    Verify user is able to click on search button
    Wait Until Element Is Visible    ${button.Results.Search}    ${MEDIUM_WAIT}    search button is not displayed after waiting ${MEDIUM_WAIT} seconds
    Javascript Click    xpath:${button.Results.Search}
    Log    ${sample_id} id details is displayed

Create Attachment in Batch Reviews
    [Arguments]    ${test_data}
    Comment    Click on Attachments
    Click on Attachments in Batch Review
    Comment    Click on upload button
    Upload Attachment
    Comment    Verify user is able to complete upload form
    Verify User is Able to Complete Upload Form    ${test_data}
    Log    ${choose file.jpg} and ${Attachments file-type.batch_Review} is displayed
    Screenshot.Take Screenshot

Create Medication in Batch Review
    Comment    Click on Medication button in Batch Review
    sleep    3
    Javascript Click    xpath:${button.Results.Medication}
    Comment    Click on Add_Medication button in Batch Review
    Wait Until Element Is Visible    ${button.Results.Add_med}    ${MEDIUM_WAIT}
    Javascript Click    xpath:${button.Results.Add_med}
    Comment    Click on Add prescribed
    Go to Add prescribed Medication Page in Batch Review and Verify
    Screenshot.Take Screenshot

Create POCT in Batch Review
    [Arguments]    ${test_data}
    comment    Click on POCT button
    Click on POCT button in Batch Review
    comment    Click on Add-poct
    Click on Add POCT button in Batch Review
    comment    Poct form is displayed
    Select POCT type in Batch Review    ${test_data}
    Screenshot.Take Screenshot

Create Comments in Batch review
    [Arguments]    ${test_data}
    comment    click on comments menu button
    Wait Until Element Is Visible    ${button.Results.comment}    ${MEDIUM_WAIT}
    Javascript Click    ${button.Results.comment}
    sleep    3
    Javascript Click    ${button.Results.comment_menu.sample_comment}
    sleep    3
    Input Text    ${textbox.accesioning.sample_commentpredefinedcomment}    ${test_data}[Predefined_comment]
    Press Keys    ${textbox.accesioning.sample_commentpredefinedcomment}    RETURN
    Enter Requirement Comments    ${test_data}
    comment    Save sample comments
    sleep    3
    Javascript Click    ${button.results.save_sample_comment}

Send Preliminary reports in Result Reviews
    comment    Click on send preliminary reports
    sleep    3
    Wait Until Element Is Visible    ${button.Results.send-peliminary}    ${MEDIUM_WAIT}
    Javascript Click    xpath:${button.Results.send-peliminary}
    comment    click on Alertstab
    Wait Until Element Is Visible    ${button.Results.Alerts-preliminary}    ${LONG_WAIT}
    Click Element    ${button.Results.Alerts-preliminary}

Click on Attachments in Batch Review
    Wait Until Element Is Visible    ${button.Results.Attachments}    ${MEDIUM_WAIT}    Attachments is not visible after ${MEDIUM_WAIT}
    sleep    3
    Javascript Click    xpath:${button.Results.Attachments}

Upload Attachment
    Wait Until Element Is Visible    ${button.Results.upload}    ${MEDIUM_WAIT}    upload is not visible after ${MEDIUM_WAIT}
    sleep    3
    Javascript Click    xpath:${button.Results.upload}

Verify User is Able to Complete Upload Form
    [Arguments]    ${test_data}
    Wait Until Element Is Visible    ${button.Results.Choose_file}    ${MEDIUM_WAIT}    choose file \ is not visible after ${MEDIUM_WAIT}
    sleep    3
    Choose File    ${button.Results.Choose_file}    ${choose file.jpg}
    Comment    Click on Filetype
    Wait Until Element Is Visible    ${button.Results.Filetype}    ${MEDIUM_WAIT}    Filetype is not visible after ${MEDIUM_WAIT}
    comment    3
    Input Text    ${button.Results.Filetype}    ${test_data}[Attachment_File_Type]
    Press Keys    None    RETURN
    Save Attachment in Batch Review

Save Attachment in Batch Review
    Comment    Click on save button
    sleep    3
    Javascript Click    ${button.batchreview_attachment.Save}

Display Reports in New Window
    comment    click on display reports
    Javascript Click    xpath:${button.Results.display-reports}
    comment    click on quick summarized reports
    sleep    3
    Javascript Click    xpath:${button.Results.infectious-disease}
    comment    click on covid only option
    Javascript Click    ${checkbox.Results.view_report_in_another_window}
    sleep    5
    Javascript Click    ${checkbox.Results.covid-only_report}
    Javascript Click    ${checkbox.Results.view_report_in_another_window}
    Javascript Click    ${checkbox.Results.view_report_in_another_window}

Click on Add_Medication button in Batch Review

Go to Add prescribed Medication Page in Batch Review and Verify
    Wait Until Element Is Visible    //select[@data-shortname='medication_id']//parent::div//input[@type='text']    ${MEDIUM_WAIT}
    Javascript Click    xpath://select[@data-shortname='medication_id']//parent::div//input[@type='text']
    sleep    3
    Input Text    //select[@data-shortname='medication_id']//parent::div//input[@type='text']    Clorazepate
    Wait Until Element Is Visible    ${text.Results.dropdown}    ${MEDIUM_WAIT}
    sleep    3
    Javascript Click    xpath:${text.Results.dropdown}
    Comment    Click on save button
    Javascript Click    xpath:${button.Results.Save}

Click on POCT button in Batch Review
    Wait Until Element Is Visible    ${button.Results.POCT}    ${MEDIUM_WAIT}
    sleep    3
    Javascript Click    xpath:${button.Results.POCT}

Click on Add POCT button in Batch Review
    Wait Until Element Is Visible    ${button.Results.Add}    ${MEDIUM_WAIT}
    sleep    3
    Click Element    ${button.Results.Add}

Select POCT type in Batch Review
    [Arguments]    ${test_data}
    comment    Click on Select poct
    Wait Until Element Is Visible    ${Select.Results.POCT-result}    ${MEDIUM_WAIT}
    Input Text    ${Select.results.POCT}    ${test_data}[POCT]
    Press Keys    None    RETURN
    comment    Click on select poct-results
    Wait Until Element Is Visible    ${Select.Results.POCT-result}    ${MEDIUM_WAIT}
    Input Text    ${Select.Results.POCT-result}    ${test_data}[POCT_type]
    Press Keys    None    RETURN
    comment    Click on save button
    Wait Until Element Is Visible    ${button.Results.savepoct}    ${MEDIUM_WAIT}
    Javascript Click    xpath:${button.Results.savepoct}
    Wait Until Element Is Visible    ${button.Results.cross}    ${MEDIUM_WAIT}
    Javascript Click    xpath:${button.Results.cross}

Enter Requirement Comments
    [Arguments]    ${test_data}
    comment    Select frame and pass the comment
    Wait Until Element Is Visible    ${frame.results_review.create_sample_comment.}    ${LONG_WAIT}    frame is not visible after waiting ${LONG_WAIT} seconds
    Select Frame And Input Req Comments    ${test_data}

Verify Reports in Result Review
    [Arguments]    ${testdata}
    sleep    5
    ${file_path}    Read File Path    ${EXECDIR}\\Downloads
    ${quick_summary_report_data}    read_coloured_pdf    ${file_path}[0]
    sleep    3
    ${covid_report_data}    Read Pdf    ${file_path}[1]
    Should Contain    ${quick_summary_report_data}    ${testdata}[Comment]
    Should Contain    ${covid_report_data}    ${testdata}[POCT]
    Should Contain    ${covid_report_data}    ${testdata}[POCT_type]
    FOR    ${file}    IN    @{file_path}
        Remove File    ${file}
        sleep    5
    END

Add Data in Batch Review Page
    [Arguments]    ${test_data}
    Comment    Navigates to batch review page
    sleep    3
    ${windows}    Get Window Handles
    Switch Window    ${windows}[1]
    Comment    Verify whether user is able to create Attachments in batch_review
    Create Attachment in Batch Reviews    ${test_data}
    Log    Test Step 7: Clicked on Attachments and upload${choose file.jpg} and file type${Attachments file-type.batch_Review} and save it
    Screenshot.Take Screenshot
    Comment    Verify whether user is able to create Medications in batch_review
    Create Medication in Batch Review
    Log    Test Step 8: Clicked on Medications and created medication
    Screenshot.Take Screenshot
    Comment    Verify whether user is able to create Medications in batch_review
    Create POCT in Batch Review    ${test_data}
    Log    Test Step 9: Clicked on POCT and created POCT
    Screenshot.Take Screenshot
    Comment    Verify whether user is able to create Comments in batch_review
    Create Comments in Batch review    ${test_data}
    Log    Test Step 10: Clicked on Comments and created a comment
    Screenshot.Take Screenshot

Verify User Able to View Reports
    [Arguments]    ${testdata}
    Comment    Verify whether user is able to generate preliminary reports in batch_review
    Send Preliminary reports in Result Reviews
    Log    Test Step 11: Click on Send preliminary reports
    Screenshot.Take Screenshot
    Comment    Verify whether user is able to click on display reports and check the reports
    Display Reports in New Window
    Log    Test Step 12: Click on Display report and click on Quick Summarized report and click on Covid rapid test
    Screenshot.Take Screenshot
    Verify Reports in Result Review    ${testdata}

Select Frame And Input Req Comments
    [Arguments]    ${frame_locator}    ${textbox_locator}    ${testdata}
    [Documentation]    This Keyword is used to Select Frame and Text Data into Frame, by Passing the Frame Locator,Textfield Locator with Text Value.
    SeleniumLibrary.Wait Until Element Is Visible    ${frame_locator}    ${MEDIUM_WAIT}
    SeleniumLibrary.Select Frame    ${frame_locator}
    Log    "${frame_locator}" is Selected
    Screenshot.Take Screenshot
    SeleniumLibrary.Input Text    ${textbox_locator}    ${testdata}[comment]
    Log    "${testdata}[comment]" is Entered into "${textbox_locator}" TextField
    Screenshot.Take Screenshot
    SeleniumLibrary.Unselect Frame
    Log    "${frame_locator}" \ is Deselected

Actions done in Sent Back to Accessioning
    [Arguments]    ${testdata}
    Wait Until Element Is Visible    ${title.result_review.sent_back_to_accessioning}    ${MEDIUM_WAIT}    "Sent back to accessioning" page title is not displayed until ${MEDIUM_WAIT}
    Javascript Click    ${button.result_review.sent_back_to_accesioning.clear_results_and_send_back}
    Log    "Clear Results and Send Back" button is Clicked
    Wait Until Page Contains    Please click on the button "START PROCESSING" to start the Requisitions Back to Accessioning process!    ${LONG_WAIT}    "Start Processing" message is not displayed until ${MEDIUM_WAIT}
    Screenshot.Take Screenshot
    Navigate to Start Process and Close Modal Grid
    Log    Navigated to "Strt Process nd Close Modal Grid" page
    Wait Until Page Contains    Results Review    ${MEDIUM_WAIT}    "Results Review" page is not displayed until ${MEDIUM_WAIT} seconds
    Screenshot.Take Screenshot

Verify Selected Requisitions are Removed from Requistion List
    [Arguments]    ${req_id_count}    ${sample-id}    ${testdata}    ${message}=None
    FOR    ${key}    IN RANGE    ${req_id_count}
        ${update_key}    evaluate    ${key}+1
        Wait Until Element Is Visible    ${textbox.results_review.searchbar}    ${MEDIUM_WAIT}
        Input Text    ${textbox.results_review.searchbar}    ${sample-id}[${key}]
        Log    "${sample-id}[${key}]" is entered into Search-bar
        ${checkbox.accesioning.home_page.search_category.new}    Update Dynamic Value    ${checkbox.accesioning.home_page.search_category}    ${testdata}[result_review_searchcategory_checkbox]
        ${class}    Get Element Attribute    ${checkbox.accesioning.home_page.search_category.new}    class
        Run Keyword If    '$(class)'=='radio'    Javascript Click    ${checkbox.accesioning.home_page.search_category.new}
        Log    "${testdata}[result_review_searchcategory_checkbox]" Checkbox is Clicked
        Javascript Click    ${button.homepage.common_search}
        Wait Until Time    ${SHORT_WAIT}
        Run Keyword If    ${message}!=None    Wait Until Element Is Visible    ${message.result_review.no_record_found}    ${MEDIUM_WAIT}
        Screenshot.Take Screenshot
    END

Select Label Template
    [Arguments]    ${testdata}
    Wait Until Element Is Visible    ${button.maximize_window}    ${MEDIUM_WAIT}    "Maximize" button is not visible until "${MEDIUM_WAIT}" seconds
    Javascript Click    ${button.maximize_window}
    Wait Until Element Is Visible    ${textbox.results_review.print_labels.label_template}    ${MEDIUM_WAIT}    "Label_Template" textbox is not visible until "${MEDIUM_WAIT}" seconds
    Javascript Click    ${textbox.results_review.print_labels.label_template}
    ${select_template_option}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${testdata}[label_template_name]
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${select_template_option}    ${MEDIUM_WAIT}
    Run Keyword If    ${status}==True    Click Element    ${select_template_option}
    Run Keyword If    ${status}==False    Click Element    ${textbox.results_review.print_labels.label_template}
    Run Keyword If    ${status}==False    Click Element    ${select_template_option}
    Perform Actions    ${button.actions}    Print    ${MEDIUM_WAIT}
    Wait Until Time    ${MINI_WAIT}

Select Requisitions and Click on Print Labels
    [Arguments]    ${testdata}
    Select Multiple Requisition Checkboxes in Result Review    ${testdata}[requisition_checkbox_count]
    Log    Requisition Checkboxes of "${updated_sample_id}" Sample Id's' is Selected
    Navigate to Tool_Bar Grid Buttons    Print Labels    Print Labels
    Select Label Template    ${testdata}
    Log    "${testdata}[label_template_name]" is Selected
    Wait Until Time    ${MINI_WAIT}
    ${file_path}    Read Pdf Data
    Remove File    ${file_path}[0]

Select Multiple Requisition Checkboxes in Result Review
    [Arguments]    ${Count_Value}
    @{home_page_requisition_id}    Create List
    @{updated_sample_id}    Create List
    FOR    ${key}    IN RANGE    0    ${Count_Value}
        ${key}    Evaluate    ${key}+1
        ${updated_key}    Convert To String    ${key}
        ${label.result_review.sample_id.new}    Update Dynamic Value    ${label.result_review.sample_id}    ${updated_key}
        ${sample_id_attribute}    Get Element Attribute    ${label.result_review.sample_id.new}    title
        Log    Sample_Id-"${Sample_id_attribute}" is Received
        @{Sample_Id}    Split String    ${sample_id_attribute}    ,
        ${checkbox.accesioning.requisition_checkboxes(details).new}    Update Dynamic Value    ${checkbox.accesioning.requisition_checkboxes(details)}    ${Sample_Id}[0]
        Click Element    ${checkbox.accesioning.requisition_checkboxes(details).new}
        Log    Requisition Checkbox of sample-id -"${Sample_Id}[0]" is Clicked
        Append To List    ${updated_sample_id}    ${Sample_Id}[0]
        Log    ${updated_sample_id}
        Screenshot.Take Screenshot
    END
    ${req_id_count}    Get Length    ${updated_sample_id}
    Set Test Variable    ${req_id_count}    ${req_id_count}
    Set Global Variable    ${updated_sample_id}

Navigate to Raw Result 25 Page
    Wait Until Time    ${MINI_WAIT}
    Comment    Wait Until Element Is Visible    ${button.result_review.tool_bar.cross_tab.raw_result}    ${MEDIUM_WAIT}    "Raw result 25" in requisition complete all page is displayed after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.result_review.tool_bar.cross_tab.raw_result}
    Log    "Raw Result 25" is Clicked
    Navigate to Start Process and Close Modal Grid

Navigate to Cross Tab with Selected Requisitions
    [Arguments]    ${testdata}
    Select Multiple Requisition Checkboxes in Result Review    ${testdata}[requisition_checkbox_count]
    Navigate to Tool_Bar Grid Buttons    Cross Tab    Cross Tab Results Review
    Log    Verified that the Cross Tab Result Review Modal is displayed.
    Navigate to Raw Result 25 Page
    Log    Navigated to "Raw Result 25 page"
    Log    Start Processing page is displayed.
    Verify Text Message    ${testdata}[message]    ${MEDIUM_WAIT}
    Log    Verified with the"${testdata}[message]" popup message.

Navigate to Start Process and Close Modal Grid
    Wait Until Element Is Visible    ${textbox.accesioning.requisition_completeall.start_processing}    ${LONG_WAIT}    "Start processing" in requisition complete all page is displayed after waiting ${MEDIUM_WAIT} seconds
    Javascript Click    ${textbox.accesioning.requisition_completeall.start_processing}
    Log    "Start Processing" button is Clicked
    Wait Until Element Is Visible    ${label.accesioning.requisition_completeall.complete_100%_process}    ${LONG_WAIT}    "Process complete label" in requisition complete all page is displayed after waiting ${LONG_WAIT} seconds
    Screenshot.Take Screenshot
    Log    "Process Completed Succesfully 100%" is displayed
    Wait Until Element Is Visible    ${textbox.accesioning.requisition_completeall.closemodal}    ${MEDIUM_WAIT}    "Close Modal and Refresh Grid" in requisition complete all page is displayed after waiting ${MEDIUM_WAIT} seconds
    Javascript Click    ${textbox.accesioning.requisition_completeall.closemodal}
    Log    "Close Modal and Refresh Grid" button is Clicked
    Wait Until Time    ${MINI_WAIT}

Verify Print Labels with Multiple Requisitions
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    Pending results    Preliminary Sent    Results Completed    All
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to "${Page_Name}[${key}]" page
        Select Requisitions and Click on Print Labels    ${testdata}
        Log    Verified the Print Labels displayed in New Tab in "${Page_Name}[${key}]".
    END

Verify Raw Result in Cross Tab with Multiple Requisitions
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    Pending results    Preliminary Sent
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to "${Page_Name}[${key}]" page
        Navigate to Cross Tab with Selected Requisitions    ${testdata}
        Log    Navigated to "Cross Tab" page with Selecting "${updated_sample_id}" Requisitions Checkbox.
    END

Verify Requisition Moved to Results Completed Tab
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    Pending results    Preliminary Sent
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to "${Page_Name}[${key}]" Page
        Navigate to Complete Tab with Multiple Requisitions    ${testdata}
        Log    Selected Requisitions and Navigated to "Complete" page
        Verify Selected Requisitions are Removed from Requistion List    ${req_id_count}    ${updated_sample_id}    ${testdata}
        Log    Searched for Sample-Id : "${updated_sample_id}" in "${Page_Name}[${key}]" Page.
        Navigate to Tab    Results Completed
        Log    Navigated to "Results Completed" Page
        Verify Selected Requisitions are Removed from Requistion List    ${req_id_count}    ${updated_sample_id}    ${testdata}    None
        Log    Searched for Sample-Id : "${updated_sample_id}" in "Results Completed" Page.
    END

Navigate to Complete Tab with Multiple Requisitions
    [Arguments]    ${testdata}
    Select Multiple Requisition Checkboxes in Result Review    ${testdata}[requisition_checkbox_count]
    Log    Selected "${testdata}[requisition_checkbox_count]" Requisitions
    Navigate to Tool_Bar Grid Buttons    Complete    Result Samples Complete All
    Log    Verified that the Result samples complete all Modal is displayed.
    Navigate to Start Process and Close Modal Grid
    Log    Navigated to "Start Processing and Close Modal Grid" page in Complete Tab

Search for Removed Requisitions from Results Review in Accessioning
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    Pending results    Preliminary Sent    Results Completed    All
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate To Main Menu    Results Review
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to "${Page_Name}[${key}]" Page
        Select Multiple Requisition Checkboxes in Result Review    ${testdata}[requisition_checkbox_count]
        Log    Selected "${testdata}[requisition_checkbox_count]" Requisitions
        Navigate to Tool_Bar Grid Buttons    Sent back to Accessioning    Sent back to Accessioning
        Log    Navigated to "Sent Back to Accessioning", "Sent Back to Accessioning" Modal is displayed.
        Actions done in Sent Back to Accessioning    ${testdata}
        Log    "Sent Back to Accessioning" module is displayed. Navigated to "Clear Results and Send Back" Page
        Verify Selected Requisitions are Removed from Requistion List    ${req_id_count}    ${updated_sample_id}    ${testdata}
        Log    "${updated_sample_id}" - Requisitions are Removed from Results Review "${Page_Name}[${key}]" Page
        Navigate to Module & Tab    Accessioning    Pending
        Log    Navigated to "Accessioning Pending" Page
        Search for Multiple Sample-id in Search-Bar & Verify    ${testdata}    ${req_id_count}    ${updated_sample_id}    None
        Log    Searched for "${updated_sample_id}"- Requisitions in "Accessioning Pending" Page. "${updated_sample_id}" is Displayed
    END

Select Requisitions and Navigate to Send Preliminary Report Tab
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    Pending results    Preliminary Sent    Results Completed    All
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Navigated to "${Page_Name}[${key}]" Page
        Select Multiple Requisition Checkboxes in Result Review    ${testdata}[requisition_checkbox_count]
        Log    Selected "${testdata}[requisition_checkbox_count]" Requisitions
        Navigate to Tool_Bar Grid Buttons    Send Preliminary Report    Send Preliminary Report
        Log    Navigated to "Send Preliminary Reports", "Send Preliminary Reports" Modal is displayed.
        Navigate to Start Process and Close Modal Grid
        Log    "Preliminary Report Sent!" popup message is displayed.
    END

Reject Requisition in Validity Rejection from Hamburger Menu
    [Arguments]    ${validity_yes_or_no}    ${testdata}
    Javascript Click    ${button.result_review.pending_results.requisition_hamburger.validity_rejection.reject_dropdown_arrow}
    Wait Until Time    ${SHORT_WAIT}
    ${dropdown_locator}    Update Dynamic Value    ${option.result_review.pending_results.requisition_hamburger.validity_rejection.reject_dropdown_value}    ${validity_yes_or_no}
    Javascript Click    ${dropdown_locator}
    Select Frame    ${frame.result_review.pending_results.requisition_hamburger.validity_rejection.reason}
    Input Text    ${textbox.results_review.reqcomment}    ${testdata}[Comment]
    Log    "${testdata}[Comment]" is entered into textbox
    Unselect Frame
    Perform Actions    ${button.actions}    Save    ${MEDIUM_WAIT}
    Log    "Save" is Clicked
    [Teardown]

Search for Validity Rejected Icon on Requisition
    [Arguments]    ${Key}
    Wait Until Time    ${MEDIUM_WAIT}
    Run Keyword If    ${Key}==0    SeleniumLibrary.Wait Until Element Is Visible    ${icon.result_review.pending_results.requisition.validity_rejected_icon}    ${MEDIUM_WAIT}    Validity icon is not visible after waiting ${LONG_WAIT} seconds
    Screenshot.Take Screenshot
    Wait Until Time    ${MEDIUM_WAIT}
    Run Keyword If    ${Key}==1    Page Should Not Contain Element    ${icon.result_review.pending_results.requisition.validity_rejected_icon}    ${MEDIUM_WAIT}    Validity icon is not visible after waiting ${LONG_WAIT} seconds
    Screenshot.Take Screenshot
    Wait Until Time    ${MEDIUM_WAIT}

Validity Reject the Selected Requisition
    [Arguments]    ${testdata}
    FOR    ${Key}    IN RANGE    2
        ${Key}    Convert To String    ${Key}
        ${result_review_sample-id}    Get Element Attribute    ${get-id.result_review.pending_results.first_requisition_sample-id}    title
        Log    "${result_review_sample-id}" is Received. "${result_review_sample-id}" is Selected
        Navigate to Requisition Hamburger Sub-Menu    ${result_review_sample-id}    Validity Rejection    Validity Rejection
        Log    Options are displayed. "Validity Rejection Modal" is displayed.
        ${validity_yes_or_no}    Run Keyword If    '${Key}'=='0'    Set Variable    Yes
        ...    ELSE    Set Variable    No
        Log    Value - "${validity_yes_or_no}"
        Reject Requisition in Validity Rejection from Hamburger Menu    ${validity_yes_or_no}    ${testdata}
        Log    "${validity_yes_or_no}" is selected. and "Save" is Clicked
        Verify Message    //div[text()="Success!"]    ${MEDIUM_WAIT}
        Log    "Success!" Pop-up Message is displayed
        Search for Validity Rejected Icon on Requisition    ${Key}
    END

Navigate to Validity Rejection with Selected Requisitions
    [Arguments]    ${testdata}
    @{Page_Name}    Create List    Pending results    Preliminary Sent    Results Completed    All
    FOR    ${key}    IN RANGE    0    ${testdata}[loop_count_value]
        Navigate to Tab    ${Page_Name}[${key}]
        Log    Result Review "${Page_Name}[${key}]" is displayed.Navigated to "${Page_Name}[${key}]" Page
        Validity Reject the Selected Requisition    ${testdata}
        Log    Verified "Success" Pop-up Message and "Reject Cross" mark icon is visible under "${Page_Name}[${key}]" tab.
    END
