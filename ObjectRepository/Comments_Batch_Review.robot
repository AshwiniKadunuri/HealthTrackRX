*** Variables ***
${button.Results.comment}    xpath://li[@data-tabid="view_htmlelement_5"]//a
${button.Results.comment_menu.sample_comment}    xpath://div[text()='Sample Comment']//parent::div//div[@class='toolbar-icon-circle']
${frame.results_review.create_sample_comment.}    //iframe[contains(@id,"extended_comment_ifr")]
${textbox.results_review.reqcomment}    //body[@id="tinymce"]
${button.Results.save-reqcomment}    css:div#limsabc_qa_addExtendedComment_form_form_submit
${button.Results.req_comments.close}    xpath://span[@class='icon-squarex']
${button.result_review.create_req_comments.maximize}    xpath://div[@class='lims-modal-caption-maximize-button']
${textbox.batchreview.addreqcomment}    //textarea[contains(@id,'extended_comment')]
${messages.accesioning.batch_review.create_comment.save}    //div[text()='Saved']
${button.results.save_sample_comment}    xpath://div[text()='Save']
${textbox.accesioning.sample_commentpredefinedcomment}    //div[text()='Predefined Comment']//parent::div//input[@type='text']
