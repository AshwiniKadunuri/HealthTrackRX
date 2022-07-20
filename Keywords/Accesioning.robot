*** Settings ***
Resource          ../Global/super.robot

*** Keywords ***
Add New Panel
    Wait Until Element Is Visible    ${button.accesioning.pending.add_panel}    ${LONG_WAIT}    Add panel button is not displayed after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.accesioning.pending.add_panel}
    Wait Until Element Is Visible    ${button.accesioning.pending.add_new_panel.select_first_panel}    ${LONG_WAIT}    Required Panel checkbox is not displayed after waiting ${LONG_WAIT} seconds
    ${panel_name}    Get Element Attribute    ${label.accesioning.pending.add_new_panel.first_panel}    title
    ${splitted_panel_name}    Split String    ${panel_name}    \ (***
    ${updated_panel_name}    Set Variable    ${splitted_panel_name}[0]
    Javascript Click    ${button.accesioning.pending.add_new_panel.select_first_panel}
    Screenshot.Take Screenshot
    Wait Until Element Is Visible    ${button.accesioning.pending.add_new_panel.select_panel.order}    ${MEDIUM_WAIT}    Order button is not displayed after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.accesioning.pending.add_new_panel.select_panel.order}
    sleep    4
    Comment    Scroll To Element    //th[text()='Panel']
    [Return]    ${updated_panel_name}

Remove Created Panel
    [Arguments]    ${updated_panel_name}
    Javascript Click    ${button.accesioning.pending.panels.select_panel}
    sleep    2
    ${panel_close_button}    Update Dynamic Value    ${button.acessioning.remove_panel.close}    ${updated_panel_name}
    Javascript Click    ${panel_close_button}
    Screenshot.Take Screenshot
    Wait Until Element Is Visible    ${button.accesioning.pending.add_new_panel.select_panel.order}    ${MEDIUM_WAIT}    Order button is not displayed after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.accesioning.pending.add_new_panel.select_panel.order}
    sleep    5
    ${panel_name}    Update Dynamic Value    ${button.acessioning.remove_panel.close}    ${updated_panel_name}[0]
    Wait Until Element Is Not Visible    ${panel_name}    ${LONG_WAIT}    Added ${updated_panel_name} Panel name is not displayed after waiting ${LONG_WAIT} seconds

Navigate To Panels Page
    sleep    2
    Wait Until Element Is Visible    ${button.accesioning.panels}    ${LONG_WAIT}    Panels menu button is not displayed after waiting ${LONG_WAIT} seconds
    sleep    2
    Javascript Click    ${button.accesioning.panels}

Verify User Able To Move Sample Id To On Hold
    [Arguments]    ${testdata}
    Click Element    ${button.accesioning.pending.search_result_details.hamburger_menu}
    Wait Until Element Is Visible    ${button.accesioning.pending_search_result.hamburger_menu.on_hold}    ${LONG_WAIT}    On hold button is not displayed after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.accesioning.pending_search_result.hamburger_menu.on_hold}
    Wait Until Element Is Visible    ${button.homepage.accesioning.on_hold_menu}    ${LONG_WAIT}    On hold menu Panel name is not displayed after waiting ${LONG_WAIT} seconds
    Screenshot.Take Screenshot
    Javascript Click    ${button.homepage.accesioning.on_hold_menu}

Verify User is Able to Create and Remove Panel with Pending Search
    [Arguments]    ${testdata}
    Log    Test Step 4: Navigate to Pending Tab in Accesioning module..
    Comment    Search for details Using Created Sample id
    Search For Created Sample Details In Accesioning Module    ${testdata}
    Log    Test Step 5: Searched For Requisition with Sample ID.
    Comment    Verify user is able to navigate to Panels page
    Navigate To Panels Page
    Log    Test Step 6: Navigated to Panels Tab***
    Screenshot.Take Screenshot
    Comment    Validate user able to Add New Panel
    ${updated_panel_name}=    Add New Panel
    Screenshot.Take Screenshot
    Log    Test Step 7 : Succesfully Attached New Panel***
    Comment    Verify Admin able to Remove Created Panels
    Remove Created Panel    ${updated_panel_name}
    Log    Test Step 8 : Verified Created New Panel in Requisitions Page
    Log    Test Step 9 : Removed Newly Created Panel in Requisitions Page
    Log    Test Step 10 : Verified Newly Created Panel in Requisitions Page is Removed Succesfully***
    Screenshot.Take Screenshot
    Log    Succesfully Removed Created Panels

Verify User is Able to Create and Remove Panel with On Hold Search
    [Arguments]    ${testdata}
    Comment    Search for details Using Created Sample id
    Search For Created Sample Details In Accesioning Module    ${testdata}
    Log    Test Step 12: Searched For Requisition with Sample ID.
    Comment    Verify user is able to navigate to Panels page
    Navigate To Panels Page
    Log    Test Step 13: Navigated to Panels Tab***
    Screenshot.Take Screenshot
    Comment    Validate user able to Add New Panel
    ${updated_panel_name}=    Add New Panel
    Screenshot.Take Screenshot
    Log    Test Step 14 : Attached New Panel***
    Comment    Verify Admin able to Remove Created Panels
    Remove Created Panel    ${updated_panel_name}
    Log    Test Step 15 : Verified Created New Panel in Requisitions Page
    Log    Test Step 16 : Removed Newly Created Panel in Requisitions Page
    Log    Test Step 17 : Verified Newly Created Panel in Requisitions Page is Removed***
    Screenshot.Take Screenshot
    Log    Succesfully Removed Created Panels

Remove Sample Id from on Hold
    Click Element    ${button.accesioning.pending.search_result_details.hamburger_menu}
    Wait Until Element Is Visible    ${button.accesioning.pending_search_result.hamburger_menu.remove_hold}    ${LONG_WAIT}
    Javascript Click    ${button.accesioning.pending_search_result.hamburger_menu.remove_hold}
    sleep    3

Click on Details and Go to Add Sample Page
    Comment    Navigate To Details of First Displayed Element
    Click on First Element Details Button
    sleep    3
    Javascript Click    ${button.accesioning.details.samples}
    sleep    3
    SeleniumLibrary.Wait Until Element Is Visible    ${button.accesioning.details.samples.add_sample}    ${LONG_WAIT}    Add samples button is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.accesioning.details.samples.add_sample}
    SeleniumLibrary.Wait Until Element Is Visible    ${textbox.accesioning.details.samples.add_sample.sample_name}    ${LONG_WAIT}    Sample name textbox is not visible after waiting ${LONG_WAIT} seconds

Create New Sample and Verify Added in Samples Page
    [Arguments]    ${testdata}
    Input Text    ${textbox.accesioning.details.samples.add_sample.sample_name}    ${testdata}[sample_name]
    ${sample_name}    Set Variable    ${testdata}[sample_name]
    SeleniumLibrary.Wait Until Element Is Visible    ${dropdown.accesioning.details.samples.add_sample.sample_type}    ${LONG_WAIT}    Sample type dropdown is not visible after waiting ${LONG_WAIT} seconds
    Input Text    ${dropdown.accesioning.details.samples.add_sample.sample_type}    ${testdata}[sample_type]
    sleep    2
    Press Keys    ${dropdown.accesioning.details.samples.add_sample.sample_type}    RETURN
    sleep    5
    Javascript Click    ${button.accesioning.details.samples.add_sample.save_sample}
    Log    Test Step 5 : Created New Sample in Accessioning page***
    SeleniumLibrary.Wait Until Element Is Visible    //td[@title='${sample_name}']    ${LONG_WAIT}    Hamburger is not visible after waiting ${LONG_WAIT} seconds
    [Return]    ${sample_name}

Verify Delete Button by Clicking No in Delete Samples Page
    [Arguments]    ${poct_category}
    sleep    5
    Log    ${poct_category}
    ${menu_hamburger_button}    Update Dynamic Value    ${button.accesioning.details.menu_hamburger}    ${poct_category}
    Click Element    ${menu_hamburger_button}
    ${delete_button}    Update Dynamic Value    ${button.accesioning.details.hamburger_menu.delete}    ${poct_category}
    SeleniumLibrary.Wait Until Element Is Visible    ${delete_button}    ${LONG_WAIT}    Delete button is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${delete_button}
    SeleniumLibrary.Wait Until Element Is Visible    ${button.accesioning.details.samples.add_sample.delete.no}    ${LONG_WAIT}    Do not delete pop up button is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.accesioning.details.samples.add_sample.delete.no}
    ${disease_name}    Update Dynamic Value    ${label.accesioning.disease_name}    ${poct_category}
    SeleniumLibrary.Wait Until Element Is Visible    ${disease_name}    ${LONG_WAIT}    Disease name is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${menu_hamburger_button}
    sleep    2
    Log    Test Step 7 : Verified POCT is not deleted by Clicking on"No" button on confirmation page***
    Screenshot.Take Screenshot
    [Return]    ${delete_button}

Verify Delete Button by Clicking Yes in Delete Samples Page
    [Arguments]    ${poct_category}    ${delete_button}
    Javascript Click    ${delete_button}
    SeleniumLibrary.Wait Until Element Is Visible    ${button.accesioning.details.samples.add_sample.delete.yes}    ${LONG_WAIT}    Do not delete pop up button is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.accesioning.details.samples.add_sample.delete.yes}
    SeleniumLibrary.Wait Until Element Is Not Visible    //td[@title='${poct_category}']    ${LONG_WAIT}    Disease name is still visible after waiting ${LONG_WAIT} seconds
    Log    Test Step 8 : Verified POCT got deleted by Clicking on"Yes" button on confirmation page.
    Screenshot.Take Screenshot

Navigate to On-Hold Menu
    SeleniumLibrary.Wait Until Element Is Visible    ${button.homepage.accesioning.on_hold_menu}    ${LONG_WAIT}    On-hold menu is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.homepage.accesioning.on_hold_menu}

Navigate to Missing_Data Menu
    SeleniumLibrary.Wait Until Element Is Visible    ${button.accesioning.pending_search_result.hamburger_menu.missing_data}    ${LONG_WAIT}    On-hold menu is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.accesioning.pending_search_result.hamburger_menu.missing_data}

Navigate to Add POCT Page
    sleep    3
    Javascript Click    ${button.accesioning.details.poct}
    sleep    3
    Javascript Click    ${button.accesioning.details.poct.add_poct}
    sleep    3

Select Positive as POCT Type And Verify is Updated
    ${disease}    Get Element Attribute    ${button.accesioning.details.poct.add_poct.select_infectious_disease_type}    title
    ${positive_checkbox_to_get_attribute}    Update Dynamic Value    ${checkbox.accesioning.poct.add_poct.select_positive_for_attribute}    ${disease}
    ${status}    Get Element Attribute    ${positive_checkbox_to_get_attribute}    class
    ${positive_checkbox_to_select}    Update Dynamic Value    ${checkboxbox.accesioning.details.poct.add_poct.positive_checkbox}    ${disease}
    Run Keyword If    '${status}'=='checkbox'    Javascript Click    ${positive_checkbox_to_select}
    sleep    2
    Javascript Click    ${button.accesioning.details.poct.add_poct.save}
    SeleniumLibrary.Wait Until Element Is Visible    ${label.accesioning.details.poct.add_poct.positive_result}    ${LONG_WAIT}    Positive label is not visible after waiting ${LONG_WAIT} seconds
    Log    Test Step 5 : Selected Positive for COVID Rapid Antigen Test and clicked on Save***
    Javascript Click    ${label.accesioning.details.poct.add_poct.positive_result}
    Screenshot.Take Screenshot
    [Return]    ${disease}

Select Negative as POCT Type And Verify is Updated
    [Arguments]    ${test_data}
    SeleniumLibrary.Wait Until Element Is Visible    ${button.accesioning.details.poct.add_poct.edit}    ${LONG_WAIT}    Edit button is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.accesioning.details.poct.add_poct.edit}
    sleep    3
    Javascript Click    ${button.accesioning.details.poct.edit_poct.clear_poct_type_textbox}
    sleep    2
    Input Text    ${textbox.accesioning.details.poct.edit_poct.type_poct_type}    ${test_data}[poct_negative_type]
    sleep    3
    Press Keys    ${textbox.accesioning.details.poct.edit_poct.type_poct_type_dropdown_opened}    RETURN
    SeleniumLibrary.Wait Until Element Is Visible    ${button.accesioning.details.poct.edit_poct.save}    ${LONG_WAIT}    Save button is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.accesioning.details.poct.edit_poct.save}
    SeleniumLibrary.Wait Until Element Is Visible    ${label.accesioning.details.poct.add_poct.negative_result}    ${LONG_WAIT}    Negative label is not visible after waiting ${LONG_WAIT} seconds
    Log    Test Step 7 : Selected Negative for COVID Rapid Antigen Test and clicked on save***
    Screenshot.Take Screenshot

Verify Add and Delete POCT in Accesioning Module
    [Arguments]    ${test_data}
    Comment    Navigate To Details of First Displayed Element
    Click on First Element Details Button
    Comment    Navigate To Add POCT page
    Navigate to Add POCT Page
    Log    Test Step 4 : Navigated to Details tab and clicked on Add POCT Tab***
    Screenshot.Take Screenshot
    Comment    Select positive as POCT Status and Verify
    ${disease}=    Select Positive as POCT Type And Verify is Updated
    Log    Test Step 6 : Verified COVID Rapid Antigen POCT is added and POCT result is "Positive"
    Comment    Select Negative as POCT Status and Verify
    Select Negative as POCT Type And Verify is Updated    ${test_data}
    Log    Test Step 8 : Verified COVID Rapid Antigen POCT is added and POCT result is "Negative"
    Comment    Select Not Performed as POCT Status and Verify
    Select Not Performed as POCT Type And Verify is Updated    ${test_data}
    Comment    Verify POCT is not deleted when not deleted using no option
    ${delete_button}=    Verify Delete Button by Clicking No in Delete Samples Page    ${disease}
    Comment    Verify POCT is not deleted when deleted using yes option
    Verify Delete Button by Clicking Yes in Delete Samples Page    ${disease}    ${delete_button}

Verify Add and Delete POCT in On-Hold Menu
    [Arguments]    ${testdata}
    Comment    Navigate to ON-Hold Menu
    Navigate to On-Hold Menu
    Comment    Navigate To Details of First Displayed Element
    Click on First Element Details Button
    Comment    Navigate To Add POCT page
    Navigate to Add POCT Page
    Comment    Select positive as POCT Status and Verify
    ${disease1}=    Select Positive as POCT Type And Verify is Updated
    Comment    Verify POCT is not deleted when not deleted using no option
    Select Negative as POCT Type And Verify is Updated    ${testdata}
    Comment    Select Not Performed as POCT Status and Verify
    Select Not Performed as POCT Type And Verify is Updated    ${testdata}
    Comment    Verify POCT is not deleted when not deleted using no option
    Verify Delete Button by Clicking No in Delete Samples Page    ${disease1}
    Comment    Verify POCT is deleted when deleted using yes option
    Verify Delete Button by Clicking Yes in Delete Samples Page    ${disease1}

Verify Add and Delete POCT in Missing Data Menu
    [Arguments]    ${testdata}
    Comment    Navigate to Missing Data Menu
    Navigate to Missing_Data Menu
    Comment    Navigate To Details of First Displayed Element
    Click on First Element Details Button
    Comment    Navigate To Add POCT page
    Navigate to Add POCT Page
    Comment    Select positive as POCT Status and Verify
    ${disease2}=    Select Positive as POCT Type And Verify is Updated
    Comment    Verify POCT is not deleted when not deleted using no option
    Select Negative as POCT Type And Verify is Updated    ${testdata}
    Comment    Select Not Performed as POCT Status and Verify
    Select Not Performed as POCT Type And Verify is Updated    ${testdata}
    Comment    Verify POCT is not deleted when not deleted using no option
    Verify Delete Button by Clicking No in Delete Samples Page    ${disease2}
    Comment    Verify POCT is deleted when deleted using yes option
    Verify Delete Button by Clicking Yes in Delete Samples Page    ${disease2}

Select Not Performed as POCT Type And Verify is Updated
    [Arguments]    ${test_data}
    SeleniumLibrary.Wait Until Element Is Visible    ${button.accesioning.details.poct.add_poct.edit}    ${LONG_WAIT}    Edit button is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.accesioning.details.poct.add_poct.edit}
    sleep    3
    Javascript Click    ${button.accesioning.details.poct.edit_poct.clear_poct_type_textbox}
    sleep    2
    Input Text    ${textbox.accesioning.details.poct.edit_poct.type_poct_type}    ${test_data}[poct_not_performed_type]
    sleep    3
    Press Keys    ${textbox.accesioning.details.poct.edit_poct.type_poct_type_dropdown_opened}    RETURN
    Javascript Click    ${button.accesioning.details.poct.edit_poct.save}
    Wait Until Element Is Visible    ${messages.accesioning.details.poct.add_poct.select_not_performed_result}    ${LONG_WAIT}    Error message is not visible after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.accesioning.details.poct.add_poct.select_infectious_disease_type.close}
    Log    Test Step 9 : Selected Not Performed for COVID Rapid Antigen Test and clicked on save

Verify Add and Delete Sample in Accesioning Module
    [Arguments]    ${testdata}
    Comment    Navigate to Add Samples Page
    Click on Details and Go to Add Sample Page
    Log    Test Step 4 : Clicked on Details Tab and Navigated to Add Sample page***
    Screenshot.Take Screenshot
    Comment    Create New Sample and Verify is Added in Samples Page
    ${sample_name}=    Create New Sample and Verify Added in Samples Page    ${testdata}
    Log    Test Step 6 : Verified Newly Added Samples in Accessioning page***
    Screenshot.Take Screenshot
    Comment    Verify delete functionality by clicking no in Delete Options
    ${delete_button}    Verify Delete Button by Clicking No in Delete Samples Page    ${sample_name}
    Comment    Verify delete functionality by clicking yes in Delete Options
    Verify Delete Button by Clicking Yes in Delete Samples Page    ${sample_name}    ${delete_button}

Verify Add and Delete Sample in On Hold Menu

Verify Add and Delete POCT in Missing Tab Menu

Verify Selected Requisition Details In Billing-Batch Review
    [Arguments]    ${home.page_req-id}    ${req_id_count}
    Comment    Verifies whether the selected requisition details are displaying
    FOR    ${key}    IN RANGE    ${req_id_count}
        sleep    3
        ${updated_key}    evaluate    ${key}+1
        ${class_value}    Get Element Attribute    ${button.accessioning.billing-batch-review.billing-review}    class
        ${disable_status}    Run Keyword And Return Status    Should Contain    ${class_value}    disable
        Run Keyword If    '${disable_status}'=='False'    Click on Billing Review For Selected Requisition    ${home.page_req-id}    ${key}
        Run Keyword If    '${disable_status}'=='False'    Wait Until Element Is Visible    ${messages.accesioning.billing_batch_review_page.billing_reviewed_message}
        sleep    3
        ${windows}    Get Window Handles
        Switch Window    ${windows}[0]
        Run Keyword If    ${key}==0    Verify Sample Id details in Required Arrow    ${button.accesioning.details.up_arrow}
        Reload Page
        sleep    3
        ${element}    Update Dynamic Value    ${button.accessioning.billing-batch-review.green_tick_dyna,mic_QA-complete-form}    ${home_page_req_id}[${key}]
        Wait Until Element Is Visible    ${element}    ${MEDIUM_WAIT}    Billing_QA_Complete is not displayed after ${MEDIUM_WAIT} seconds
        Screenshot.Take Screenshot
        ${windows}    Get Window Handles
        Switch Window    ${windows}[1]
        sleep    3
        Screenshot.Take Screenshot
        Log    ${home.page_req-id}
        ${billing_page_req-id}    Get text    ${button.accessioning.billing-review.requistion#-id}
        Log    ${billing_page_req-id}
        ${equality_status}    BuiltIn.Run Keyword And Return Status    Should Contain    ${billing_page_req-id}    ${home_page_req_id}[${key}]
        BuiltIn.Run Keyword If    '${equality_status}'=='True'    Wait Until Element Is Visible    ${button.accessioning.billing-batch-review.reviewed-forward}    ${MEDIUM_WAIT}    Reviewed Forward button is not displayed after ${MEDIUM_WAIT} seconds
        Javascript Click    ${button.accessioning.billing-batch-review.reviewed-forward}
        Screenshot.Take Screenshot
    END
    Log    Test Step 5:-Goto Accessinoing refresh the page and Verify that selected requisition record is in Green color tick mark.

Verify Selected Requisition Details In Batch-Review
    [Arguments]    ${home.page_req-id}    ${req_id_count}
    FOR    ${key}    IN RANGE    ${req_id_count}
        ${updated_key}    Evaluate    ${key}+1
        sleep    2
        Log    ${home.page_req-id}
        ${batch_review_page_req-id}    Get text    ${button.accessioning.batch-review.Req#-id}
        Log    ${batch_review_page_req-id}
        Log    "${batch_review_page_req-id}" is Received from "${button.accessioning.batch-review.Req#-id}"
        ${equality_status}    Run Keyword And Return Status    Should Contain    ${home.page_req-id}[${key}]    ${batch_review_page_req-id}
        Log    Value - "${home.page_req-id}[${key}]"
        Run Keyword If    ${equality_status}==True    Javascript Click    ${button.accessioning.batch-review.reviewed-forward}
        Log    "${button.accessioning.batch-review.reviewed-forward}" is Clicked
        Screenshot.Take Screenshot
    END

Verify Sample Id details in Required Arrow
    [Arguments]    ${arrow_locator}
    Click Arrow-Down Button    ${arrow_locator}
    Log    Arrow Button is Clicked
    ${arrow_attribute1}    Get Element Attribute    ${button.accesioning.sample_details_arrow}    class
    ${down_arrow_status1}    Run Keyword And Return Status    Should Be Equal    ${arrow_attribute1}    ${arrow_locator}
    Run Keyword If    ${down_arrow_status1}==False    Javascript Click    ${button.accesioning.sample_details_arrow}
    sleep    5

Click on Billing Review For Selected Requisition
    [Arguments]    ${home.page_req-id}    ${key}
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    xpath://p[contains(text(),'${home.page_req-id}[${key}]')]//ancestor::div[@class='atk-row']//div[text()='Billing Review']    ${MEDIUM_WAIT}    Billing review button is not visible after waiting ${MEDIUM_WAIT} seconds
    Run Keyword If    ${status}==True    Javascript Click    xpath://p[contains(text(),'${home.page_req-id}[${key}]')]//ancestor::div[@class='atk-row']//div[text()='Billing Review']
    Run Keyword If    ${status}==False    Javascript Click    ${button.accessioning.billing-batch-review.reviewed-forward}
    Wait Until Element Is Visible    xpath://p[contains(text(),'${home.page_req-id}[${key}]')]//ancestor::div[@class='atk-row']//div[text()='Billing Review']    ${MEDIUM_WAIT}    Billing review button is not visible after waiting ${MEDIUM_WAIT}seconds
    Run Keyword If    ${status}==False    Javascript Click    xpath://p[contains(text(),'${home.page_req-id}[${key}]')]//ancestor::div[@class='atk-row']//div[text()='Billing Review']

Verify New Panel is Added
    Comment    Validate user able to Add New Panel
    ${updated_panel_name}=    Add New Panel
    Screenshot.Take Screenshot
    Log    Test Step 8 & 9 : Succesfully Attached New Panel***
    Wait Until Page Contains Element    ${page_view.panels}
    Screenshot.Take Screenshot
    Comment    Verify panel is Added
    ${status}    Run Keyword And Return Status    Page Should Contain    ${updated_panel_name}
    Run Keyword If    ${status}==False    Fail

Navigate to Select_Panels in Panels Page
    Wait Until Element Is Visible    ${button.panels.select_panel}    ${MEDIUM_WAIT}    Select_Panel page is not visible until ${MEDIUM_WAIT}
    Javascript Click    ${button.panels.select_panel}
    Screenshot.Take Screenshot

Select New Panel in Req_List
    [Arguments]    ${testdata}
    comment    Select panel from list by passing Text
    Wait Until Element Is Visible    ${textbox.panels.select_panel.panels_dropdown}    ${MEDIUM_WAIT}
    sleep    2
    Input Text    ${textbox.panels.select_panel.panels_dropdown}    ${testdata}[Panel_dropdown_type]
    sleep    2
    Press Keys    None    RETURN
    Screenshot.Take Screenshot
    ${selected_panel}    Update Dynamic Value    ${dropdown.accessioning.req_list.panels.select_panels.panels}    ${testdata}[Panel_dropdown_type]
    ${updated_panel_name}    Get Text    ${selected_panel}
    Log    ${updated_panel_name}
    Log    Test Step :Selects the Panel name from list appeared
    comment    click on order
    Javascript Click    ${button.accesioning.pending.add_new_panel.select_panel.order}
    Screenshot.Take Screenshot
    [Return]    ${updated_panel_name}

Verify Selected Panel is Added to Panels Tab
    [Arguments]    ${test-data}
    ${updated_panel_name}    Select New Panel in Req_List    ${test-data}
    Log    Test Step 9:Navigated to Select Panels page to Add panels
    comment    Verify Selected Panel is Added
    sleep    2
    Comment    Wait Until Page Contains Element    ${page_view.panels}    ${LONG_WAIT}
    Page Should Contain    ${updated_panel_name}
    Screenshot.Take Screenshot
    [Teardown]
    [Return]    ${updated_panel_name}

Perform Actions in Complete Page from Tool_bar_Grid_Buttons
    [Arguments]    ${testdata}    ${page_title}    ${Button}=None
    Wait Until Time    ${MINI_WAIT}
    Page Should Contain    ${page_title}
    SeleniumLibrary.Wait Until Element Is Visible    ${button.select_present_time}    ${MEDIUM_WAIT}
    Javascript Click    ${button.select_present_time}
    Input Text    ${textbox.accesioning.requisition_completeall.tracking_number}    ${testdata}[track-id]
    Log    Data - "${testdata}[track-id]" is texted into "${textbox.accesioning.requisition_completeall.tracking_number}" TextField
    Click Element    ${textbox.accesioning.requisition_completeall.start_processing}
    Wait Until Time    ${MINI_WAIT}
    Screenshot.Take Screenshot
    Run Keyword If    ${Button}=="Close Modal and Refresh Grid"    Javascript Click    ${textbox.accesioning.requisition_completeall.closemodal}

Navigate to Hamburger Options in Details_Errors Page
    [Arguments]    ${Sub_Menu-Name}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${button.accesioning.req-details.errors.hamburger}    ${MEDIUM_WAIT}
    Wait Until Time    3
    Scroll And Click    ${button.accesioning.requisition-details.errors.hamburger}
    Log    "${button.accesioning.req-details.errors.hamburger}" is Clicked
    Screenshot.Take Screenshot
    ${button.accesioning.req-details.errors.hamburger.sub-menu.new}    Update Dynamic Value    ${button.accesioning.requisition-details.errors.hamburger.sub-menu}    ${Sub_Menu-Name}
    Log    "${button.accesioning.req-details.errors.hamburger.sub-menu.new}" is Received by replacing Value-"${Sub_Menu-Name}" into Locator-"${button.accesioning.req-details.errors.hamburger.sub-menu}"
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${button.accesioning.req-details.errors.hamburger.sub-menu.new}    ${MEDIUM_WAIT}
    Wait Until Time    4
    Javascript Click    ${button.accesioning.req-details.errors.hamburger.sub-menu.new}
    Log    "${button.accesioning.req-details.errors.hamburger.sub-menu.new}" is Clicked
    Screenshot.Take Screenshot

Add Requisition Error from Req-Hamburger
    [Documentation]    This keyword is used to Add Requisition Error by Getting Attribute from the First Error Name and by Replacing that Attribute Value into Locator ,Particular Error Checkbox is Selected
    Wait Until Time    3
    ${requisition_error_name}    Get Element Attribute    ${get-attribute.accesioning.requisition-hamburger.add-requisition-error.first-error-name}    title
    Log    "${req_error_name}" is Received
    ${checkbox.accesioning.requisition_checkboxes(hamburger_add-req-error).new}    Update Dynamic Value    ${checkbox.accesioning.requisition_checkboxes(hamburger_add-requisition-error)}    ${requisition_error_name}
    ${class-attribute}    Get Element Attribute    ${checkbox.accesioning.requisition_checkboxes(hamburger_add-req-error).new}    class
    Log    "${class-attribute}" is Received
    Run Keyword If    "${class-attribute}"=="checkbox"    Click Element    ${checkbox.accesioning.requisition_checkboxes(hamburger_add-req-error).new}
    Screenshot.Take Screenshot
    Perform Actions    ${button.actions}    Save    ${MEDIUM_WAIT}
    [Return]    ${requisition_error_name}

Verify Error Added in Details_Errors Page
    [Arguments]    ${req_error_name}
    ${verify.accesioning.req-details.errors.added-error.new}    Update Dynamic Value    ${verify.accesioning.requisition-details.errors.added-error}    ${req_error_name}
    Wait Until Page Contains Element    ${verify.accesioning.req-details.errors.added-error.new}
    Log    "${req_error_name}" is Displayed
    Screenshot.Take Screenshot

Add Comments in Hamburger_Comments Page
    [Arguments]    ${sample_Id}    ${Testdata}
    Navigate to Requisition Hamburger Sub-Menu    ${sample_Id}    Comments    Comments
    Log    Navigated to "Hamburger_Comments" Page
    Select Frame And Input Req Comments    ${frame.results_review.create_sample_comment.}    ${textbox.results_review.reqcomment}    ${Testdata}
    Log    Comments from "${Testdata}" is Entered into Selected Frame
    Perform Actions    ${button.actions}    Add    ${MEDIUM_WAIT}
    Log    "Add" is Clicked
    Javascript Click    ${button.accesioning.requisition_list_hamburger_menu.comments.pageclose(x)}

Click Arrow-Down Button
    [Arguments]    ${arrow_locator}
    ${arrow_attributeo}    Get Element Attribute    ${button.accesioning.sample_details_arrow}    class
    Log    "${arrow_attributeo}" is Received
    ${down_arrow_status0}    Run Keyword And Return Status    Should Be Equal    ${arrow_attributeo}    ${arrow_locator}
    Log    "${down_arrow_status0}" is Received
    Run Keyword If    ${down_arrow_status0}==False    Javascript Click    ${button.accesioning.sample_details_arrow}
    Log    "${button.accesioning.sample_details_arrow}" is Clicked
    Screenshot.Take Screenshot

Click on Home-Page Requisitions Button
    [Arguments]    ${Locator}    ${sample_id}
    [Timeout]
    Wait Until Time    ${MINI_WAIT}
    ${Locator.new}    Update Dynamic Value    ${Locator}    ${sample_id}
    Javascript Click    ${Locator.new}
    Wait Until Time    ${MINI_WAIT}

Get First Requisition (Sample-Id,RID)
    [Arguments]    ${get_id-value_locator}
    Wait Until Time    ${MINI_WAIT}
    Wait Until Element Is Visible    ${get_id-value_locator}    ${MEDIUM_WAIT}    Locator is not visible until "${MEDIUM_WAIT}" seconds
    ${sample_id}    Get Element Attribute    ${get_id-value_locator}    title
    Log    "${sample_id}" is Received
    [Return]    ${sample_id}

Search for Multiple Sample-id in Search-Bar & Verify
    [Arguments]    ${testdata}    ${count_value}    ${sample_id}    ${message}=None
    FOR    ${key}    IN RANGE    ${count_value}
        Search For Details In Home Page    ${testdata}[pending_searchcategory_checkbox]    ${sample_id}[${key}]
        Run Keyword If    ${message}!=None    Wait Until Element Is Visible    ${label.homepage.no_records_found}
        Run Keyword If    ${message}!=None    Page Should Contain Element    ${label.homepage.no_records_found}
        Screenshot.Take Screenshot
    END

Verify user is able to Reject Selected Requisition
    [Arguments]    ${ID_Value}    ${Testdata}
    Navigate to Requisition Hamburger Sub-Menu    ${ID_Value}    Reject    Reject Requisition
    Select Frame And Input Req Comments    ${frame.accesioning.requisition-hamburger.reject}    ${textbox.Results.reqcomment}    ${Testdata}
    Perform Actions    ${button.actions}    Save    ${MEDIUM_WAIT}
    Verify Text Message    Requisition Rejected    ${MEDIUM_WAIT}

Enter Comments in Req_Hamburger "Back to Pending"
    [Arguments]    ${testdata}
    Wait Until Element Is Visible    ${textfield.accesioning.requisition_hamburger.back_to_pending.comments_field}    ${MEDIUM_WAIT}
    Input Text    ${textfield.accesioning.requisition_hamburger.back_to_pending.comments_field}    ${testdata}[comment]
    Perform Actions    ${button.actions}    Send back for Testing    ${MEDIUM_WAIT}
    Log    "${testdata}[comment]" is Entered and Clicked on "Send back for Testing"

Select File type
    [Arguments]    ${testdata}
    Wait Until Element Is Visible    ${textbox.accesioning.attachments.filetype}    ${MEDIUM_WAIT}    "File type" textbox is not Visible until ${MEDIUM_WAIT} seconds
    Javascript Click    ${textbox.accesioning.attachments.filetype}
    Screenshot.Take Screenshot
    Input Text    ${textbox.accesioning.attachments.filetype}    ${testdata}[file_type]
    Press Keys    None    RETURN
