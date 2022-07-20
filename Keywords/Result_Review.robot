*** Settings ***

*** Keywords ***
Navigate to Cross Tab Result Review Page
    Javascript Click    ${checkbox.result_review.select_first_requisition}
    Javascript Click    ${checkbox.result_review.select_second_requisition}
    Javascript Click    ${button.result_review.tool_bar.cross_tab}
    sleep    3
    Javascript Click    ${button.result_review.tool_bar.cross_tab.raw_result}

Navigate to Cross Tab Start Processing Page
    Wait Until Element Is Visible    ${button.result_review.tool_bar.cross_tab.raw_result}    ${LONG_WAIT}    ${button.result_review.tool_bar.cross_tab.raw_result} in requisition complete all page is displayed after waiting ${LONG_WAIT} seconds
    Javascript Click    ${button.result_review.tool_bar.cross_tab.raw_result}
    Wait Until Element Is Visible    ${textbox.accesioning.requisition_completeall.start_processing}    ${LONG_WAIT}    Start processing in requisition complete all page is displayed after waiting ${LONG_WAIT} seconds
    Javascript Click    ${textbox.accesioning.requisition_completeall.start_processing}
    Wait Until Element Is Visible    ${label.accesioning.requisition_completeall.complete_100%_process}    ${LONG_WAIT}    Process complete label in requisition complete all page is displayed after waiting ${LONG_WAIT} seconds
    Screenshot.Take Screenshot
    Log    Requisition completed success message is displayed***
    Javascript Click    ${textbox.accesioning.requisition_completeall.closemodal}

Verify if "Changed the raw result value to 25 for all empty result"
    Wait Until Element Is Visible    ${message.result_review.raw_result_value}    ${LONG_WAIT}    Changed the raw result value to 25 for all empty result" popup message is displayed after waiting ${LONG_WAIT} seconds
