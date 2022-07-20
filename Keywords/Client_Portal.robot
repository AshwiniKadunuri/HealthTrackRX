*** Settings ***
Resource          ../Global/super.robot

*** Keywords ***
Click on Cancel Button in Hamburger
    ${RID}    Get Element Attribute    ${label.client_portal.get_attribute_for_first_requisition_rid}    rel
    Log    Selected Requisition
    Navigate to Requisition Hamburger Sub-Menu    ${RID}    Cancel    rid    Confirmation required
    Log    Options are displayed and Cancel page is displayed
    Perform Actions    ${button.actions}    Yes    ${MEDIUM_WAIT}
    Log    "Yes" button is Clicked
    [Return]    ${RID}

Search ID Value and Verify
    [Arguments]    ${testdata}    ${id_value}
    Search For Details In Home Page    ${testdata}[pending_searchcategory_checkbox]    ${id_value}
    Verify Text Message    ${testdata}[error_message]    ${MEDIUM_WAIT}
    Log    Verified that the Selected Record is Removed from the Requisition List.

Choose File in View Documents
    [Arguments]    ${testdata}    ${file_to_upload}
    Wait Until Time    ${MINI_WAIT}
    ${upload_button}    Update Dynamic Value    ${label.accesioning.details.submenu}    ${testdata}[button_name]
    Javascript Click    ${upload_button}
    Wait Until Time    ${MINI_WAIT}
    Choose File    ${button.accesioning.attachments.choose_file}    ${file_to_upload}

Verify Uploaded File
    ${splitted_data}    Split String    ${upload_file.clientportal.view_document}    \\
    Page Should Contain    ${splitted_data}[4]
    Screenshot.Take Screenshot

Navigate to First Requisition View Documents
    ${RID}    Get Element Attribute    ${label.client_portal.get_attribute_for_first_requisition_rid}    rel
    Navigate to Requisition Hamburger Sub-Menu    ${RID}    View Documents    rid    View Documents
    Log    Options are displayed and View Documents page is displayed
    [Return]    ${RID}

Validate comments icon
    Wait Until Page Contains Element    ${icon.client_portal.new_report.requisition_list.comments}    ${MEDIUM_WAIT}    "Comments icon" is not visible until "${MEDIUM_WAIT}" Seconds
    Screenshot.Take Screenshot

Upload File in View Documents and Save
    [Arguments]    ${testdata}    ${upload_file}
    Choose File in View Documents    ${testdata}    ${upload_file}
    Log    File is Uploaded
    Perform Actions    ${button.actions}    Save    ${MEDIUM_WAIT}
    Log    "Save" button is Clicked
    Verify Text Message    ${testdata}[error_message]    ${MEDIUM_WAIT}
    Log    Verified that the Error Message "${testdata}[error_message]" is displayed.

Upload File with File Type in View Documents and Save
    [Arguments]    ${testdata}    ${upload_file}
    Choose File in View Documents    ${testdata}    ${upload_file}
    Log    "${upload_file.clientportal.view_document}" is uploaded into View Documents
    Select File type    ${testdata}
    Log    "${testdata}[file_type]" is Selected
    Perform Actions    ${button.actions}    Save    ${MEDIUM_WAIT}
    Log    "Save" button is Clicked
    Verify Uploaded File
    Log    Uploaded File is displayed in View Documents page.

Navigate to First Requisition Comments Page
    [Arguments]    ${testdata}
    ${sample_id}    Get First Requisition (Sample-Id,RID)    ${get_title.client_portal.new_report.requisition_list}
    Log    Selected ${sample_id} - Requisition
    Add Comments in Hamburger_Comments Page    ${sample_id}    ${testdata}
    Set Test Variable    ${sample_id}    ${sample_id}

Change Requisition Portal Status
    [Arguments]    ${testdata}
    Scroll Element Into View    ${button.client_portal.new_report.requisition_list.portal_status}
    Wait Until Time    ${MINI_WAIT}
    Javascript Click    ${button.client_portal.new_report.requisition_list.portal_status}
    Log    "Portal Status" Searchicon is Clicked
    Javascript Click    ${textbox.client_portal.new_report.requisition_list.portal_status.select_filter_dropdown_arrow}
    Log    "Select Filter" textbox is Clicked
    ${select_filter.new}    Update Dynamic Value    ${textbox.client_portal.new_report.requisition_list.portal_status.select_filter.replace_value}    ${testdata}[portalstatus_selectfiltername]
    Javascript Click    ${select_filter.new}
    Log    "${testdata}[portalstatus_selectfiltername]" is Selected from "Select Filter" textbox
    Wait Until Time    ${MINI_WAIT}
    Click Element    ${textbox.client_portal.new_report.requisition_list.portal_status.portal_status_textfield}
    Log    "Portal Status" textbox is Clicked
    Input Text    ${textbox.client_portal.new_report.requisition_list.portal_status.portal_status_textfield}    ${testdata}[portalstatus_portalstatusname]
    Log    "${testdata}[portalstatus_portalstatusname]" is entered into textbox
    Wait Until Time    ${MINI_WAIT}
    Press Keys    None    RETURN
    Javascript Click    ${button.client_portal.new_report.requisition_list.portal_status.filter}
    Wait Until Time    ${MINI_WAIT}
    Log    "Filter" button is Clicked

Send Requisitions with Finalized Status to Preview Report
    [Arguments]    ${testdata}
    Modify Page View    ${testdata}
    Log    Selected Requisitions per Page.
    Javascript Click    ${arrowbutton.client_portal.new_reports.requisition_list.right_arrow}
    Log    "Requisition Right Arrow" is Clicked
    Change Requisition Portal Status    ${testdata}
    Log    Requisition of "Portal Status" - "${testdata}[portalstatus_portalstatusname]" is Selected
    ${RID}    Get Element Attribute    ${label.client_portal.get_attribute_for_first_requisition_rid}    rel
    Log    "${RID}" is Received
    Click on Home-Page Requisitions Button    ${button.client_portal.new_report.requisition_form.preview_report}    ${RID}
    Log    Requisition "Preview Report" button is Clicked
    Wait Until Page Contains Element    ${page_title.client_portal.new_report.requisition_form.preview_report}    ${MEDIUM_WAIT}
    Screenshot.Take Screenshot
