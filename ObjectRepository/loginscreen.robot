*** Variables ***
${login.textbox.username}    //input[contains(@name,'username')]
${login.textbox.password}    //input[contains(@name,'password')]
${login.button.signin}    //div[@class='button-text']
${message.login.invalid_password}    //span[text()="Password is not correct"]
${message.login.invalid_mail}    //span[text()="Username/Email address has not been found"]
${button.login.forgot_password_link}    //div//a[text()="Forgot your password?"]
${textbox.login.forgot_password_link.email_textbox}    //input[@name="limsabc_qa_password_form_email"]
${message.login.forgot_password_link.email_textbox}    //span[text()="This email is not registered in our database."]
