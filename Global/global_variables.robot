*** Variables ***
${URL}            https://qa.healthtrackrx.com/qa/
${BROWSER_NAME}    Chrome
${USERNAME}       prakash.kamma
${PASSWORD}       QZhtrx@123
${TESTDATA_FOLDER}    ${EXECDIR}/Testdata
${LONG_WAIT}      60
${MEDIUM_WAIT}    20
${SHORT_WAIT}     5
${TIME_INTERVAL}    4s
${download}       document.querySelector("#viewer").shadowRoot.querySelector("#toolbar").shadowRoot.querySelector("#downloads").shadowRoot.querySelector("#download").shadowRoot.querySelector("#icon > iron-icon")
${sample_data}    123455
${PDF_DOWNLOAD_FOLDER}    ${EXECDIR}\\Downloads
${sample_id}      271346
${choose file.jpg}    C:\\Users\\Ashwini Kadunuri\\OneDrive - QualiZeal\\Pictures\\python logo.png
${upload_file.clientportal.view_document}    C:\\Users\\Ashwini Kadunuri\\Downloads\\Critical_Older_HTRXTEST.pdf
${MINI_WAIT}      2
