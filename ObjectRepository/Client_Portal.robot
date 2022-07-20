*** Variables ***
${arrowbutton.client_portal.new_reports.requisition_list.right_arrow}    xpath://div[@class="new-lims-grid-swipe-arrow new-lims-grid-swipe-arrow-right visible"]
${button.client_portal.new_report.requisition_list.portal_status}    xpath://th[text()="Portal Status"]//span[@class="icon-search"]
${textbox.client_portal.new_report.requisition_list.portal_status.select_filter_dropdown_arrow}    xpath://th[text()="Portal Status"]//div[@title='Select Filter']//ancestor::div[@class='lims-dropdown-header']//div[@class='arrow']
${textbox.client_portal.new_report.requisition_list.portal_status.portal_status_textfield}    //div[text()="Portal Status"]//preceding-sibling::input
${button.client_portal.new_report.requisition_list.portal_status.filter}    xpath://div[@id="64918cdc__rdetails_8_form_submit"]//div
${button.client_portal.new_report.requisition_form.preview_report}    xpath://tbody[@class="grid_body"]//child::tr[@data-id="replaceText"]//child::div[@title="Preview Report"]
${page_title.client_portal.new_report.requisition_form.preview_report}    //div[contains(text(),'Final Reports')]
${textbox.client_portal.new_report.requisition_list.portal_status.select_filter.replace_value}    xpath://th[text()="Portal Status"]//div[@title='Select Filter']//ancestor::div[@class='lims-dropdown-header']//following-sibling::div[@class="dropdown-list-wrapper"]//div[text()="replaceText"]
