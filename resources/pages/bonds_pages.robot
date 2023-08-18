*** Variables ***
#bonds page tab
${tab_bonds}    xpath://li[contains(text(),'Bonds')]
#bonds drop down
#--Category drop down
${ddl_category}     xpath:(//span[starts-with(@id, 'select2')])[1]
${input_category}   xpath://body/span[1]/span[1]/span[1]/input[1]
${sel_category}     xpath://li[contains(text(),'*')]
#--currency drop down
${ddl_currency}     xpath:(//span[starts-with(@id, 'select2')])[2]
${input_currency}   xpath://body/span[1]/span[1]/span[1]/input[1]
${currency}         xpath://li[contains(text(),'*')]
#--bond drop down
${ddl_bond}         xpath:(//span[starts-with(@id, 'select2')])[3]
${input_bond}       xpath://body/span[1]/span[1]/span[1]/input[1]
${bond}             xpath://li[contains(text(),'*')]
#---verify bonds name
${name_bond}        xpath://p[@class='mb-2 text-primary fw600 fs17']/span
#bonds advanced search
${advanced_search}  xpath://span[contains(text(),'ADVANCED SEARCH')]
${text_advn_search}     xpath://div[@class='modal-content']/h3[contains(text(),' ADVANCE SEARCH' )]
${input}            xpath://body/span[1]/span[1]/span[1]/input[1]
#-country
${ddl_country}     xpath:(//span[starts-with(@id, 'select2')])[2]
${sel_country}     xpath://li[contains(text(),'*')]
#-currency
${ddl_currency_adv}     xpath:(//span[starts-with(@id, 'select2')])[3]
${sel_currency_adv}     xpath://li[contains(text(),'*')]
#-tenor
${ddl_tenor}    xpath:(//span[starts-with(@id, 'select2')])[4]
${sel_tenor}    xpath://li[contains(text(),'*')]
#-Yield to Maturity
${ddl_yield_to_maturity}    xpath:(//span[starts-with(@id, 'select2')])[5]
${sel_yield_to_maturity}    xpath://li[contains(text(),'*')]
#-modified duration
${ddl_modified_duration}    xpath:(//span[starts-with(@id, 'select2')])[6]
${sel_modified_duration}    xpath://li[contains(text(),'*')]