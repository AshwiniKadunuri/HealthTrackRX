*** Settings ***
Resource          ../Global/super.robot

*** Keywords ***
Create New Requisition
    [Arguments]    ${test_data}
    Comment    Select ${test_data}[clientsitetotype] as client
    Select Client Site    ${testdata}
    Log    Selected ${test_data}[clientsitetotype] as client site
    Comment    Verify user is able to select order physician
    Select Order Physician    ${testdata}
    Log    Test Step 7 : Selected ${test_data}[orderphysician_name] as order physician
    Comment    Select ${test_data}[site_contact_name] as sitecontact and ${testdata}[patient_first_name] as patient name
    Select Site Contact    ${testdata}
    Log    Selected ${test_data}[site_contact_name]
    Comment    Verify user is able to create New Patient
    Create New Patient    ${testdata}
    Log    Created New Patient
    Comment    Select syndromic menu filter categories
    Select Syndromic Menu Filter Categories    ${testdata}
    Log    Selected ${testdata}[syndromic_filter_category] as Syndromic FIlter Category
    Comment    Select ICS code for new requisition
    Select ICS code    ${testdata}
    Log    Selected ${testdata}[icd_code]
    Comment    Select Medication code for new requisition
    Select Medication Code    ${testdata}
    Log    Selected ${testdata}[medication_code]
    Save Requisition
    Log    Test Step 9 : Saved the requisition
    Wait Until Element Is Visible    ${checkbox.provide_acknowledgement}    ${LONG_WAIT}    Provide acknowledgement checkbox is not visible after waiting ${LONG_WAIT} seconds
    Log    Test Step 10 : Completed requisition form to the stage where the acknowledgement checkbox must be selected
    Provide Acknowledgement
    Log    Test Step 11 : Provided Acknowledgement for confirming the requisition***
    Screenshot.Take Screenshot
    Confirm Requisition
    Log    Test Step 12 : Confirmed the requisition***
    sleep    10

Create New Order physician
    Javascript Click    xpath://div[@id='siteDoctor']//following-sibling::button[@type='button']
    Input Text    //div[@id='first_name']//following-sibling::div//input[@class='el-input__inner']    qa
    Input Text    //div[@id='last_name']//following-sibling::div//input[@class='el-input__inner']    qa_lastname
    Input Text    //div[@id='suffix']//following-sibling::div//input[@class='el-input__inner']    qa_suffix
    Input Text    //div[@id='npi']//following-sibling::div//input[@class='el-input__inner']    qa_npi
    Javascript Click    xpath://button[@type='button']//span[.='Save']

Select Client Site
    [Arguments]    ${testdata}
    Wait Until Element Is Visible    ${textbox.new_requisition.clientsite}    ${LONG_WAIT}    Client site textbox is not visible after waiting ${LONG_WAIT} seconds
    Click Element    ${textbox.new_requisition.clientsite}
    Input Text    ${textbox.new_requisition.clientsite}    ${test_data}[clientsite]
    sleep    3
    ${clientsite_dropdown}    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition}    ${test_data}[clientsitetotypeforlocating]
    Set Global Variable    ${clientsite_dropdown}
    sleep    3
    ${status}    Run Keyword And Return Status    Javascript Click    ${clientsite_dropdown}
    Run Keyword If    ${status}==False    Select Client Site With Update Name    ${testdata}

Select Syndromic Menu Filter Categories
    [Arguments]    ${testdata}
    Wait Until Element Is Visible    ${button.new_requisition.syndromic_menu_filter}    ${LONG_WAIT}    Syndromic menu filter button is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.new_requisition.syndromic_menu_filter}
    ${syndromic_filter_category}    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition}    ${testdata}[syndromic_filter_category]
    Wait Until Element Is Visible    ${syndromic_filter_category}    ${LONG_WAIT}    Syndromic menu filter option '${testdata}[syndromic_filter_category] is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${syndromic_filter_category}
    Wait Until Element Is Visible    ${checkbox.new_requisition.syndromic_menu_filter.respiratory_pathogens.category.Adenovirus}    ${LONG_WAIT}    Syndromic menu filter subcategory is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${checkbox.new_requisition.syndromic_menu_filter.respiratory_pathogens.category.Adenovirus}
    Wait Until Element Is Visible    ${button.select_present_time}    ${LONG_WAIT}    Current time button is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.select_present_time}
    Wait Until Element Is Visible    ${button.new_requisition.syndromic_menu_filter.sample_collection.swab_site}    ${LONG_WAIT}    Swab site dropdown is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.new_requisition.syndromic_menu_filter.sample_collection.swab_site}
    ${swap_site_category}    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition}    ${testdata}[swap_site_category]
    Wait Until Element Is Visible    ${swap_site_category}    ${LONG_WAIT}    Syndromic menu filter button is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${swap_site_category}
    Screenshot.Take Screenshot

Select Site Contact
    [Arguments]    ${testdata}
    Click Element    ${textbox.new_requisition.sitecontact}
    ${site_contact_name}    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition}    ${test_data}[site_contact_name]
    sleep    3
    Wait Until Element Is Visible    ${site_contact_name}    ${LONG_WAIT}    Site contact name dropdown is not visible after waiting ${LONG_WAIT} seconds
    Click Element    ${site_contact_name}
    Screenshot.Take Screenshot

Create New Patient
    [Arguments]    ${testdata}
    Click Element    ${button.new_requisition.create_new_patient}
    Wait Until Element Is Visible    ${textbox.new_requisition.create_new_patient.patient_bill_category}    ${LONG_WAIT}    Bill category button is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${textbox.new_requisition.create_new_patient.patient_bill_category}
    ${patient_bill_dropdown}    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition.create_patient.patient_bill}    ${testdata}[patient_bill]
    Wait Until Element Is Visible    ${patient_bill_dropdown}    ${LONG_WAIT}    Patient bill options is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${patient_bill_dropdown}
    Wait Until Element Is Visible    ${textbox.new_requisition.create_new_patient.first_name}    ${LONG_WAIT}    Patient first name textbox is not visible after waiting ${LONG_WAIT} seconds
    Input Text    ${textbox.new_requisition.create_new_patient.first_name}    ${testdata}[patient_first_name]
    Input Text    ${textbox.new_requisition.create_new_patient.last_name}    ${testdata}[patient_last_name]
    ${date}    Get 2 Days Previous Date
    Input Text    ${textbox.new_requisition.create_new_patient.DOB}    ${date}
    Press Keys    ${textbox.new_requisition.create_new_patient.DOB}    RETURN
    Javascript Click    ${textbox.new_requisition.create_new_patient.select_gender}
    ${select_gender_option}    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition}    ${testdata}[gender]
    Set Global Variable    ${select_gender_option}
    Comment    Run Keyword If    '${testdata}[patient_bill]'=='Other Insurance'    Edit New Patient With Other Insurance option Bill Type
    Comment    Run Keyword If    '${testdata}[patient_bill]'!=='Other Insurance'    Wait Until Element Is Visible    ${select_gender_option}    ${LONG_WAIT}    Gender options are not visible after waiting ${LONG_WAIT} seconds
    Comment    Run Keyword If    '${testdata}[patient_bill]'!=='Other Insurance'    Click Element    ${select_gender_option}
    Wait Until Element Is Visible    ${select_gender_option}    ${LONG_WAIT}    Gender options are not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${select_gender_option}
    Wait Until Element Is Visible    ${button.new_requisition.create_new_patient.save}    ${LONG_WAIT}    Save button is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.new_requisition.create_new_patient.save}
    Screenshot.Take Screenshot

Search For Created Sample Details In Accesioning Module
    [Arguments]    ${testdata}
    Search For Details In Home Page    ${sample_id}    ${testdata}[pending_searchcategory_checkbox]
    ${details_button}    Update Dynamic Value    ${button.accesioning.details_buttonusing_sampe_id}    ${sample_id}
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${details_button}    ${LONG_WAIT}    Search sample id details are not displayed after waiting ${LONG_WAIT} seconds
    Run Keyword If    ${status}==False    Fail
    Javascript Click    ${details_button}
    Screenshot.Take Screenshot

Verify The Errors In Created Sample Id
    [Arguments]    ${details_button}
    Javascript Click    ${details_button}
    Wait Until Element Is Visible    ${button.accesioning.searchdetails.errors}    ${LONG_WAIT}    Errors button is not displayed in tool bar after waiting ${LONG_WAIT} seconds
    Execute Javascript    window.scrollTo(0,200)
    Javascript Click    ${button.accesioning.searchdetails.errors}
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    //div[.='Errors']//parent::div//div[text()='No Records Found']
    Run Keyword If    ${status}==False    Log    Errors are displayed
    Run Keyword If    ${status}==True    Log    "No records found" message is displayed

Verify User Is able To Complete Processing
    [Arguments]    ${element}    ${testdata}    ${count}
    Javascript Click    ${button.select_present_time}
    Input Text    ${textbox.accesioning.requisition_completeall.tracking_number}    ${sample_data}
    Click Element    ${textbox.accesioning.requisition_completeall.start_processing}
    Wait Until Element Is Visible    ${label.accesioning.requisition_completeall.complete_100%_process}    ${LONG_WAIT}    Process complete label in requisition complete all page is displayed after waiting ${LONG_WAIT} seconds
    Screenshot.Take Screenshot
    Log    Requisition completed success message is displayed
    Javascript Click    ${textbox.accesioning.requisition_completeall.closemodal}
    Comment    Search for Created Sample id details
    FOR    ${key}    IN RANGE    ${count}
        Search For Details In Home Page    ${element}[${key}]    ${testdata}[pending_searchcategory_checkbox]
        Screenshot.Take Screenshot
    END

Select ICS code
    [Arguments]    ${testdata}
    Scroll Element Into View    ${textbox.new_requisition.ics_codes}
    Javascript Click    ${textbox.new_requisition.ics_codes}
    ${icd_code}    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition}    ${testdata}[icd_code]
    Wait Until Element Is Visible    ${icd_code}    ${LONG_WAIT}    ${testdata}[icd_code] \ is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${icd_code}

Select Client Site With Update Name
    [Arguments]    ${testdata}
    Input Text    ${textbox.new_requisition.clientsite}    ${test_data}[clientsitetotype]
    sleep    3
    Javascript Click    ${clientsite_dropdown}

Select Order Physician
    [Arguments]    ${testdata}
    Javascript Click    ${textbox.new_requisition.orderingphysician}
    Input Text    ${textbox.new_requisition.orderingphysician}    ${test_data}[orderphysician_name]
    ${order_physician_dropdown}    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition}    ${test_data}[orderphysician_name]
    Wait Until Element Is Visible    ${order_physician_dropdown}    ${LONG_WAIT}    Ordering physician name dropdown is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${order_physician_dropdown}
    Screenshot.Take Screenshot

Confirm Requisition
    Wait Until Element Is Visible    ${button.new_requisition.confirm}    ${LONG_WAIT}    Confirm button is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.new_requisition.confirm}
    ${status}    Run Keyword And Return Status    Wait Until Element Is Not Visible    ${button.new_requisition.confirm}    ${SHORT_WAIT}    Confirm button is not visible after waiting ${LONG_WAIT} seconds
    Run Keyword If    ${status}==False    Javascript Click    ${button.new_requisition.confirm}

Edit New Patient With Other Insurance option Bill Type
    Wait Until Element Is Visible    (${select_gender_option})[4]    ${LONG_WAIT}    Gender options are not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    xpath:(${select_gender_option})[4]
    Input Text    ${textbox.create_new_patient.address}    ${test_data}[patient_adress]
    Input Text    ${textbox.create_new_patient.mobile_number}    9440118967
    Javascript Click    ${textbox.create_new_patient.guarantor_relationship}
    Wait Until Element Is Visible    ${dropdown.create_new_patient.father}    ${LONG_WAIT}    Father option is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${dropdown.create_new_patient.father}
    Input Text    ${textbox.create_new_patient.guarantor_firstname}    qa_gurantor_first_name
    Input Text    ${textbox.create_new_patient.guarantor_lastname}    qa_gurantor_last_name
    Input Text    ${textbox.create_new_patient.guarantor_dob}    02252022
    Press Keys    ${textbox.create_new_patient.guarantor_dob}    RETURN
    Javascript Click    ${button.create_new_patient.guarantor_gender_id}
    Wait Until Element Is Visible    xpath:(${select_gender_option})[4]    ${LONG_WAIT}    Female option is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    xpath:(${select_gender_option})[4]
    Wait Until Element Is Visible    ${textbox.create_new_patient.guarontor_address}    ${LONG_WAIT}    guarantor address textbox is not visible after waiting ${LONG_WAIT} seconds
    Input Text    ${textbox.create_new_patient.guarontor_address}    qa_address

Select Medication Code
    [Arguments]    ${testdata}
    Scroll Element Into View    ${textbox.new_requisition.medication}
    Javascript Click    ${textbox.new_requisition.medication}
    ${medication_code}    Update Dynamic Value    ${dropdown_for_suggestion.new_requisition}    ${testdata}[medication_code]
    Wait Until Element Is Visible    ${medication_code}    ${LONG_WAIT}    ${testdata}[medication_code] is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${medication_code}

Navigate To New Order Menu
    Log    Succesfully Refused the alert page
    sleep    3
    Javascript Click    ${button.clientportal.newordermenu}

Navigate To Infectious Disease Menu
    [Arguments]    ${inner_sub_menu_text}
    sleep    3
    Javascript Click    ${button.clientportal.neworder.infectious_disease}
    Wait Until Element Is Visible    ${textbox.new_requisition.clientsite}    ${LONG_WAIT}    Client site textbox is not visible after waiting ${LONG_WAIT} seconds

Verify User is able to Navigate to Requisition Complete All Page with Multiple Requisitions
    @{element}    Create List
    sleep    2
    ${arrow_attributeo}    Get Element Attribute    ${button.accesioning.sample_details_arrow}    class
    ${down_arrow_status0}    Run Keyword And Return Status    Should Be Equal    ${arrow_attributeo}    new-grid-column sort-arrow-down
    Run Keyword If    ${down_arrow_status0}==False    Javascript Click    ${button.accesioning.sample_details_arrow}
    ${arrow_attribute1}    Get Element Attribute    ${button.accesioning.sample_details_arrow}    class
    ${down_arrow_status1}    Run Keyword And Return Status    Should Be Equal    ${arrow_attribute1}    new-grid-column sort-arrow-down
    Run Keyword If    ${down_arrow_status1}==False    Javascript Click    ${button.accesioning.sample_details_arrow}
    sleep    5
    FOR    ${key}    IN RANGE    3
        ${updated_key}    evaluate    ${key}+1
        ${updated_key}    Convert To String    ${updated_key}
        ${sample_id_attribute}    Update Dynamic Value    ${label.accesioning.details.sample_id}    ${updated_key}
        ${attribute}    Get Element Attribute    ${sample_id_attribute}    title
        ${count}    Get Length    ${attribute}
        Run Keyword If    ${count}==6    Append To List    ${element}    ${attribute}
        Log    ${element}
    END
    ${element_1}    Update Dynamic Value    ${checkbox.accesioning.details.dynamic_sampleid}    ${element}[0]
    ${element_2}    Update Dynamic Value    ${checkbox.accesioning.details.dynamic_sampleid}    ${element}[1]
    Click Element    ${element_1}
    Click Element    ${element_2}
    Javascript Click    ${button.accesioning.complete}
    Wait Until Element Is Visible    ${textbox.accesioning.requisition_completeall.tracking_number}    ${LONG_WAIT}    Tracking number textbox in requisition complete all page is not displayed after waiting ${LONG_WAIT} seconds
    Log    Test Step 4.Selected multiple requisitions and Navigated to Complete icon from tool bar grid.
    Screenshot.Take Screenshot
    ${count}    Get Length    ${element}
    [Return]    ${element}    ${count}

Select Multiple Requisitions Checkbox
    [Arguments]    ${Count_Value}
    [Documentation]    This Keyword is used to Select Requisition Checkboxes by taking Sample-id Value into the Checkbox Locator. It also provides the RID_Value from Requisition for Verification purpose.
    ...
    ...    Arguements need to pass is:${count_Value}. ex- 1 or \ 2 or 3.... depends on how many Requisition user wants to select.
    @{home_page_requisition_id}    Create List
    @{updated_sample_id}    Create List
    FOR    ${key}    IN RANGE    0    ${Count_Value}
        ${key}    Evaluate    ${key}+1
        ${updated_key}    Convert To String    ${key}
        ${label.accesioning.details.sample_id.new}    Update Dynamic Value    ${label.accesioning.details.sample_id}    ${updated_key}
        ${sample_id_attribute}    Get Element Attribute    ${label.accesioning.details.sample_id.new}    title
        Log    Sample_Id-"${Sample_id_attribute}" is Received
        @{Sample_Id}    Split String    ${sample_id_attribute}    ,
        ${label.accesioning.details.req_id_for_attribute.new}    Update Dynamic Value    ${label.accesioning.details.req_id_for_attribute}    ${updated_key}
        ${RID_attribute}    Get Element Attribute    ${label.accesioning.details.req_id_for_attribute.new}    title
        Log    "${RID_attribute}" is Received
        ${RID_count}    Get length    ${RID_attribute}
        Run Keyword If    ${RID_count}==6    Append To List    ${home_page_requisition_id}    ${RID_attribute}
        Log    ${home_page_requisition_id}
        @{Requisition_Id}    Split String    ${RID_attribute}    ,
        ${checkbox.accesioning.requisition_checkboxes(details).new}    Update Dynamic Value    ${checkbox.accesioning.requisition_checkboxes(details)}    ${Requisition_Id}[0]
        Log    "${checkbox.accesioning.requisition_checkboxes(details).new}" is Received by Replacing Value-"${Requisition_Id}[0]" into Locator-"${checkbox.accesioning.requisition_checkboxes(details)}"
        Click Element    ${checkbox.accesioning.requisition_checkboxes(details).new}
        Log    "${checkbox.accesioning.requisition_checkboxes(details).new}" is Clicked
        Append To List    ${updated_sample_id}    ${Sample_Id}[0]
        Log    ${updated_sample_id}
        Screenshot.Take Screenshot
    END
    ${req_id_count}    Get Length    ${home_page_requisition_id}
    Set Test Variable    ${home_page_requisition_id}    ${home_page_requisition_id}
    Set Test Variable    ${req_id_count}    ${req_id_count}
    Set Test Variable    ${updated_sample_id}    ${updated_sample_id}
    [Teardown]
