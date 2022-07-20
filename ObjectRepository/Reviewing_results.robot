*** Variables ***
${button.Results.pending-results}    //button[@id="limsabc_qa_tabmenu_i0"]//div[@class="tabmenu-text"]
${Checkbox.Results.Sample#}    //label[text()="Sample#"]//parent::div//input[@data-shortname="radio"]
${button.Results.Search}    //div[@class=" \ small-submit-blue-buttons \ submit-blue-buttons" and text()='Search']
${Checkbox.Results.Sample id-grid}    //td[@data-init="limsabc_qa_lifecycle_results_review_pending_crud_grid"]//child::span//input
${button.Results.batch_review grid}    //div[@class="toolbar-icon-circle"]//parent::div[@title="Batch Review"]
