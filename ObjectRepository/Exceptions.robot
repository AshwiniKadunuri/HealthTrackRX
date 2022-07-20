*** Variables ***
${page_view.panels}    //div[contains(text(),"Panels for Requsition")]//parent::div
${button.panels.select_panel}    xpath://div[text()="Select Panels"]
${textbox.panels.select_panel.panels_dropdown}    xpath://div[text()="Panels"]//preceding-sibling::input
