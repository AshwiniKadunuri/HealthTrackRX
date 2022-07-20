*** Variables ***
${textbox.new_requisition.clientsite}    xpath://div[@id='clientSite']//following-sibling::div//input[@type='text']
${textbox.new_requisition.orderingphysician}    xpath://div[@id='siteDoctor']//following-sibling::div//input[@type='text']
${textbox.new_requisition.sitecontact}    xpath://div[@id='siteContact']//following-sibling::div//input[@type='text']
${textbox.new_requisition.patientname}    //div//span[@id='patient']//following-sibling::div//input[@type='text']
${textbox.new_requisition.patientbill}    //div[@id='patient.bill_id']//following-sibling::div//input[@type='text']
${textbox.new_requisition.ics_codes}    xpath://span[@id='icd_codes']//parent::div//following-sibling::div//input[@class='el-select__input is-small']
${textbox.new_requisition.medication}    xpath://span[@id='medication']//parent::div//following-sibling::div//input[@class='el-select__input is-small']
${button.new_requisition.save}    xpath://span[text()='SAVE']
${button.new_requisition.syndromic_menu_filter}    xpath://div[normalize-space(text())='Syndromic Menu Filter']//parent::div//i
${button.select_present_time}    xpath://input[@value='Now']
${button.new_requisition.syndromic_menu_filter.sample_collection.swab_site}    xpath://small[normalize-space(text())='Swab Site:']//ancestor::div//div[@class='el-select el-select--mini']
${checkbox.new_requisition.syndromic_menu_filter.respiratory_pathogens.category.Adenovirus}    xpath://div[normalize-space(text())='Adenovirus Respiratory HAdV-B']//label[@class='el-checkbox']
${checkbox.provide_acknowledgement}    xpath://span[@class='el-radio__input']//span
${button.new_requisition.confirm}    xpath://button//span[text()='Confirm']
${button.new_requisition.create_new_patient}    xpath://span[@id='patient']//following-sibling::div//button[@class='el-button el-button--default el-button--small is-circle']
${textbox.new_requisition.create_new_patient.patient_bill_category}    xpath://div[@id='bill_id']//following-sibling::div//input[@type='text']
${textbox.new_requisition.create_new_patient.first_name}    //div[@id='first_name']//parent::div//div[@class='el-input el-input--small el-input--suffix']//input
${textbox.new_requisition.create_new_patient.DOB}    //input[@placeholder='mm/dd/yyyy']
${textbox.new_requisition.create_new_patient.select_gender}    xpath://div[@id='gender_id']//following-sibling::div//input[@placeholder='Select']
${button.new_requisition.create_new_patient.save}    xpath://span[text()='Save']
${textbox.new_requisition.create_new_patient.last_name}    //div[@id='last_name']//parent::div//div[@class='el-input el-input--small el-input--suffix']//input
${dropdown_for_suggestion.new_requisition}    xpath://li//span[text()='replaceText']
${dropdown_for_suggestion.new_requisition.create_patient.patient_bill}    xpath:(//li//span[text()='replaceText'])[2]
