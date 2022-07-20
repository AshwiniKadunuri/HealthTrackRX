*** Variables ***
${textbox.create_new_patient.address}    xpath://input[@id='address_obj.components.delivery_line_1.value']
${textbox.create_new_patient.mobile_number}    xpath://div[@id='phone']//following-sibling::div//input[@type='text']
${textbox.create_new_patient.guarantor_relationship}    xpath://div[@id='guarantor_relationship_id']//following-sibling::div//input[@type='text']
${dropdown.create_new_patient.father}    xpath://span[text()='Father']
${textbox.create_new_patient.guarantor_firstname}    //div[@id='guarantor_first_name']//following-sibling::div//input[@type='text']
${textbox.create_new_patient.guarantor_lastname}    //div[@id='guarantor_last_name']//following-sibling::div//input[@type='text']
${textbox.create_new_patient.guarantor_dob}    //div[@id='guarantor_dob']//following-sibling::div//input[@type='text']
${button.create_new_patient.guarantor_gender_id}    xpath://div[@id='guarantor_gender_id']//following-sibling::div//input[@type='text']
${textbox.create_new_patient.guarontor_address}    guarantor_address_obj.components.delivery_line_1.value
