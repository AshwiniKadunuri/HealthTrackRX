*** Settings ***
Resource          ../Global/super.robot

*** Keywords ***
Navigate to Details with Sub-Menu Button Page
    [Arguments]    ${Sample_Id}    ${Sub-Menu_name}
    [Documentation]    This Keyword Used to Navigate to Details Sub-Category Page
    ${button.accesioning.req-list_details.by-replace_samp-id.new}    Update Dynamic Value    ${button.accesioning.requisition-list_details.by-replace_sample-id}    ${Sample_Id}
    Wait Until Time    2
    Wait Until Element Is Visible    ${button.accesioning.req-list_details.by-replace_samp-id.new}    ${MEDIUM_WAIT}
    Javascript Click    ${button.accesioning.req-list_details.by-replace_samp-id.new}
    Log    "${button.accesioning.req-list_details.by-replace_samp-id.new}" is Clicked
    ${button.acesioning.details.sub-menu_buttons.new}    Update Dynamic Value    ${button.acesioning.details.sub-menu_buttons}    ${Sub-Menu_name}
    Wait Until Time    2
    Wait Until Element Is Visible    ${button.acesioning.details.sub-menu_buttons.new}
    Javascript Click    ${button.acesioning.details.sub-menu_buttons.new}
    Log    "${button.acesioning.details.sub-menu_buttons.new}" is clicked
    Screenshot.Take Screenshot

Clear Search and Input Text
    [Arguments]    ${Testdata}    ${Search-bar_Locator}    ${Search_Locator}
    [Documentation]    This Keyword is Used to Clear Textdata in Search-bar
    Clear Element Text    ${Search-bar_Locator}
    Input Text    ${Search-bar_Locator}    ${Testdata}[value]
    Javascript Click    ${Search_Locator}

Set Date With Time and Verify
    [Arguments]    ${Calender_Locator}
    [Documentation]    This keyword is Used to Navigate to Calender Page and Select Month,Year,Date and Time
    Wait Until Element Is Visible    ${Calender_Locator}    ${MEDIUM_WAIT}
    Javascript Click    ${Calender_Locator}
    ${dropdown}    Update Dynamic Value    //select[@class="ui-datepicker-month"]//option[text()='replaceText']    Jan
    SeleniumLibrary.Wait Until Element Is Visible    //select[@class="ui-datepicker-month"]    ${MEDIUM_WAIT}
    Click Element    //select[@class="ui-datepicker-month"]
    Screenshot.Take Screenshot
    SeleniumLibrary.Wait Until Element Is Visible    ${dropdown}    ${MEDIUM_WAIT}
    Click Element    ${dropdown}
    Screenshot.Take Screenshot
    Log    Succesfully clicked on the ${dropdown} dropdown value
    ${dropdown}    Update Dynamic Value    //select[@class="ui-datepicker-year"]//option[text()='replaceText']    2000
    SeleniumLibrary.Wait Until Element Is Visible    //select[@class="ui-datepicker-year"]    ${MEDIUM_WAIT}
    Click Element    //select[@class="ui-datepicker-year"]
    Screenshot.Take Screenshot
    SeleniumLibrary.Wait Until Element Is Visible    ${dropdown}    ${MEDIUM_WAIT}
    Click Element    ${dropdown}
    Screenshot.Take Screenshot
    Log    Succesfully clicked on the ${dropdown} dropdown value
    ${Select-day}    Update Dynamic Value    xpath://a[text()[normalize-space()='replaceText']]//parent::td[@data-handler="selectDay"]    6
    Javascript Click    ${Select-day}
    Screenshot.Take Screenshot
    Input Text    //div[@title="Hour"]//preceding-sibling::input    05
    Press Keys    None    RETURN
    Input Text    //div[@title="Minute"]//preceding-sibling::input    50
    Press Keys    None    RETURN
    Click Button    //button[text()[normalize-space()='Done']]

Verify Text Message
    [Arguments]    ${Message}    ${WAIT_TIME}
    [Documentation]    This Keyword is Used to Verify The Text Message by passing the Particular Message-name as Argument.
    Wait Until Page Contains    ${Message}    ${WAIT_TIME}    "${Message}" is not visible until "${WAIT_TIME} seconds"
    Log    "${Message}" is Displayed
    Screenshot.Take Screenshot

Navigate to Module & Tab
    [Arguments]    ${menu}    ${sub-menu}
    ${button.homepage.select_menu.new}    Update Dynamic Value    ${button.homepage.select_menu}    ${menu}
    Comment    Wait Until Element Is Visible    ${button.homepage.select_menu.new}    ${MEDIUM_WAIT}    "${menu}" Locator is not visible until "${MEDIUM_WAIT}" seconds
    Wait Until Time    ${MINI_WAIT}
    Javascript Click    ${button.homepage.select_menu.new}
    Log    "${menu}" is Clicked
    Screenshot.Take Screenshot
    Navigate to Tab    ${sub-menu}

Navigate to Tool_Bar Grid Buttons
    [Arguments]    ${button_name}    ${page_title}=None
    [Documentation]    This Keyword is used to Select any options which is appeared on the Tool-Bar grid, by Passing the Grid Button Name as Arguement
    ${button.select_tool-bar_grid_buttons.new}    Update Dynamic Value    ${button.select_tool-bar_grid_buttons}    ${button_name}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${button.select_tool-bar_grid_buttons.new}    ${MEDIUM_WAIT}    "${button.select_tool-bar_grid_buttons.new}" is not Visible until ${MEDIUM_WAIT} Seconds
    Scroll To Element    ${button.select_tool-bar_grid_buttons.new}
    SeleniumLibrary.Click Element    ${button.select_tool-bar_grid_buttons.new}
    Log    "${button_name}" is Clicked
    Screenshot.Take Screenshot
    Wait Until Time    ${MINI_WAIT}
    Run Keyword If    '${page_title}'!='None'    Page Should Contain    ${page_title}
    Screenshot.Take Screenshot

Navigate to Tab
    [Arguments]    ${sub-menu}
    ${button.homepage.sub_menu.new}    Update Dynamic Value    ${button.homepage.sub_menu}    ${sub-menu}
    Comment    Wait Until Element Is Visible    ${button.homepage.sub_menu.new}    ${MEDIUM_WAIT}    "${sub-menu}" Locator is not visible until "${MEDIUM_WAIT}" seconds
    Wait Until Time    ${MINI_WAIT}
    Javascript Click    ${button.homepage.sub_menu.new}
    Log    "${sub-menu}" is Clicked
    Screenshot.Take Screenshot

Modify Page View
    [Arguments]    ${testdata}
    Select From List By Value    ${button.select-pages_dropdown-value}    ${testdata}[modify_page_view_count]
    Wait Until Time    ${MINI_WAIT}
    Log    Selected "${testdata}[modify_page_view_count]" Requisitions per Page.

Click on Detail Button with Sample-id
    [Documentation]    Opens the Details page of Expected Sample id Requisition
    ${sample_id}    Get Element Attribute    ${label.result_review.sample_id}    title
    Log    ${sample_id}
    ${Details_button}    Update Dynamic Value    ${button.accesioning.details_buttonusing_sampe_id}    ${sample_id}
    Javascript Click    ${Details_button}

Click Element and Verify
    [Arguments]    ${locator}    ${expected_validation}    ${WAIT_TIME}
    Wait Until Element Is Visible    ${locator}    ${WAIT_TIME}    element is not visible after waiting ${SHORT_WAIT} seconds
    Javascript Click    ${locator}
    Wait Until Element Is Visible    ${expected_validation}    ${WAIT_TIME}    ${expected_validation} is not visible after waiting ${SHORT_WAIT} seconds
    Log    ${locator} is clicked succesfully

Click On CheckBox And Verify
    [Arguments]    ${locator}    ${attribute_name}    ${WAIT_TIME}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${WAIT_TIME}    checkbox is not visible after waiting ${SHORT_WAIT} seconds
    Javascript Click    ${locator}
    Log    Succesfully clicked on ${locator}
    ${attribute}    Get Element Attribute    ${locator}    ${attribute_name}
    ${status}    Run Keyword And Return Status    Should Contain    ${attribute}    checked
    Run Keyword If    ${status}==False    Should Contain    ${attribute}    selected
    Log    Succesfully Vaidated that checkbox is clicked

Send Text And Select Dropdown
    [Arguments]    ${locator}    ${input_text}    ${expected_dropdown}    ${WAIT_TIME}
    Wait Until Element Is Visible    ${locator}    ${WAIT_TIME}    ${locator} is not visible after waiting ${SHORT_WAIT} seconds
    Javascript Click    ${locator}
    SeleniumLibrary.Input Text    ${locator}    ${input_text}
    Log    Entered ${input_text} into ${locator} field
    Wait Until Time    3
    Javascript Click    ${expected_dropdown}
    Log    Succesfullly Clicked on ${expected_dropdown}

Perform Actions
    [Arguments]    ${actions_locator}    ${button_name}    ${WAIT_TIME}
    [Documentation]    This Keyword is used to Click on Save,Order,Add,Delete,...etc Buttons \
    ${actions_locator.new}    Update Dynamic Value    ${actions_locator}    ${button_name}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${actions_locator.new}    ${WAIT_TIME}    "${button_name}" is not visible after waiting ${WAIT_TIME}seconds
    Wait Until Time    ${MINI_WAIT}
    Javascript Click    ${actions_locator.new}
    Screenshot.Take Screenshot
    Log    "${button_name}" button is Clicked

Get Element Text And Verify
    [Arguments]    ${locator}    ${expected_text}    ${attribute_name}
    [Documentation]    This keyword is used to get element text and verify
    [Timeout]
    ${actual_text}    Get Element Attribute    ${locator}    ${attribute_name}
    Should Contain    ${actual_text}    ${expected_text}
    Log    Succesfully Compared ${actual_text} with ${expected_text}

Export Data And Verify
    [Arguments]    ${export_locator}    ${file_type}
    Javascript Click    ${export_locator}
    Wait Until Time    5
    ${actual_data}    read data
    should contain    ${expected_data}    ${actual_data}

Click And Select Dropdown
    [Arguments]    ${locator}    ${expected_dropdown}    ${WAIT_TIME}
    [Documentation]    This keyword is used to click on textbox and select dropdown
    Javascript Click    ${textbox.new_requisition.ics_codes}
    Wait Until Time    3
    Wait Until Element Is Visible    ${expected_dropdown}    ${WAIT_TIME}    ${testdata}[icd_code] \ is not visible after waiting ${SHORT_WAIT} seconds
    Javascript Click    ${expected_dropdown}
    Log    Succesfully Clicked on the ${expected_dropdown}

Select Dropdown Value
    [Arguments]    ${locator}    ${dropdown_locator}    ${dropdown_value}    ${WAIT_TIME}
    ${dropdown}    Update Dynamic Value    ${dropdown_locator}    ${dropdown_value}
    SeleniumLibrary.Wait Until Element Is Visible    ${locator}    ${WAIT_TIME}    ${locator} is not visible after waiting ${WAIT_TIME} seconds
    Javascript Click    ${locator}
    SeleniumLibrary.Wait Until Element Is Visible    ${dropdown}    ${WAIT_TIME}    ${locator} is not visible after waiting ${WAIT_TIME} seconds
    Javascript Click    ${dropdown}
    Log    Succesfully clicked on the ${dropdown} dropdown value

Click on Quick Menu Hamburger Menu and Navigate to Specific Menu Page
    [Arguments]    ${menu_page_name}    ${WAIT_TIME}
    SeleniumLibrary.Wait Until Element Is Visible    ${button.homepage.quick_menu_hamburger}    ${WAIT_TIME}    Quick Menu Hamburger button is not displayed after waiting seconds
    Javascript Click    ${button.homepage.quick_menu_hamburger}
    SeleniumLibrary.Wait Until Element Is Visible    ${textbox.homepage.quick_menu_search}    ${WAIT_TIME}    Qucik Menu Search Box is not displayed after waiting seconds
    SeleniumLibrary.Input Text    ${textbox.homepage.quick_menu_search}    ${menu_page_name}
    Javascript Click    ${button.homepage.quick_menu_search}
    ${splited_data}    Split String    ${menu_page_name}
    ${count}    get length    ${splited_data}
    ${updated_xpath}    Run Keyword If    ${count}==2    Update Dynamic Values    ${splited_data}[0]    ${splited_data}[1]
    ...    ELSE    Update Dynamic Value    ${splited_data}

Update Dynamic Values
    [Arguments]    ${locator}    ${value1}    ${value2}
    ${xpath}    Replace String    ${locator}    replaceText1    ${value1}
    ${updated_xpath}    Replace String    ${xpath}    replaceText2    ${value2}
    [Return]    ${updated_xpath}

Navigate to Requisition Hamburger Sub-Menu
    [Arguments]    ${sample_id_value}    ${Hamburger_Menu}    ${input_data}==None    ${page_title}=None
    [Documentation]    This Keyword is used to Navigate to Hamburger Sub-menu by Passing the Selected Requisition Sample-Id \ and Menu Option Name
    ${button.req-hamburger.new}    Run Keyword If    '${input_data}'=='rid'    Update Dynamic Value    ${button.client_portal.hamburger_menu_using_rid}    ${sample_id_value}
    ...    ELSE    Update Dynamic Value    ${button.requisition_hamburger}    ${sample_id_value}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${button.req-hamburger.new}    ${MEDIUM_WAIT}    "${sample_id_value} - Requisition Hamburger" is not visible until "${MEDIUM_WAIT}" seconds
    Scroll To Element    ${button.req-hamburger.new}
    Click Element    ${button.req-hamburger.new}
    Log    Requisition Hamburger of Sample Id-"${sample_id_value}" is Clicked
    Screenshot.Take Screenshot
    ${button.req-hamburger-options.new}    Update Dynamic Values    ${button.requisition_hamburger_options}    ${sample_id_value}    ${Hamburger_Menu}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${button.req-hamburger-options.new}    ${MEDIUM_WAIT}    "${Hamburger_Menu}" is not displayed until ${MEDIUM_WAIT} seconds
    Wait Until Time    ${MINI_WAIT}
    Javascript Click    ${button.req-hamburger-options.new}
    Log    "${Hamburger_Menu}" is clicked.
    Screenshot.Take Screenshot
    Wait Until Time    ${MINI_WAIT}
    Run Keyword If    '${page_title}'!='None'    Page Should Contain    ${page_title}
    Screenshot.Take Screenshot

Read Pdf Data
    [Timeout]
    ${file_path}    Read File Path    ${EXECDIR}\\Downloads
    ${pdf_data}    Read Pdf    ${file_path}[0]
    Set Test Variable    ${pdf_data}    ${pdf_data}
    [Return]    ${file_path}

Verify Pdf Data and Remove Pdf File
    [Arguments]    ${pdf_data}    ${application_data_to_verify}    ${file_path}
    Should Contain    ${pdf_data}    ${application_data_to_verify}
    Remove File    ${file_path}
    Wait Until Time    ${MINI_WAIT}
    Log    "${pdf_data}" contains value - "${application_data_to_verify}"

Read Data from Coloured PDF
    [Arguments]    ${pdf_name}=Coloured_Pdf
    sleep    3
    ${file_path}    Read File Path    ${EXECDIR}\\Downloads
    ${pdf_data}    Run Keyword If    '${pdf_name}'=='Coloured_Pdf'    Read Coloured PDF    ${file_path}[0]
    ...    ELSE    Read Pdf    ${file_path}[0]
    Set Test Variable    ${file_path}    ${file_path}
    Set Test Variable    ${pdf_data}    ${pdf_data}

Verify Message
    [Arguments]    ${Message_Locator}    ${WAIT_TIME}
    Wait Until Element Is Visible    ${Message_Locator}    ${WAIT_TIME}    "${Message_Locator}" is not visible until "${WAIT_TIME} seconds"
    Log    "${Message_Locator}" is Displayed
    Screenshot.Take Screenshot
