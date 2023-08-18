#Company Elements
*** Variables ***
${check_box_public_company}     xpath://label[contains(text(),'Public Company')]
${public_company_search}    xpath://span[contains(text(),'Search Company')]
#summary
${input_search_box}         xpath://input[@class='select2-search__field']
${select_drop_down}         xpath://li[contains(text(),'*')]
${selected_comany_on_page}  xpath:(//b[contains(text(),"" )])[1]
${exchange_list}            xpath://span[@id='select2-companyStep4-container']
${defult_currency}          xpath://span[@id='select2-companyStep6-container']
${defult_years}             xpath:(//span[starts-with(@id,'select2')])[4]
${tab_company}              xpath://li[contains(text(),'Company')]
${defult_periodicity}       xpath:(//span[starts-with(@id,'select2')])[5]
${defult_index}             xpath:(//span[starts-with(@id,'select2')])[6]
${download_stock_price}     xpath://img[@id='companyStep10']

#financials
${btn_financials}           xpath://button[contains(text(),'Financials')]
${txt_fin}                  xpath://span[contains(text(),'Financials')]
${download_fin}             xpath://img[@id='companyStep14']

#Segment Information
${btn_segment_info}         xpath://button[contains(text(),'Segment Information')]
${txt_segment}              xpath://span[contains(text(),'Segment Information')]
${download_segment}         xpath://div[@id='segment_tab']//div[@class='col-4']/button[1]/img[1]

#Debt Profile
${btn_debt_profile}         xpath://button[contains(text(),'Debt Profile')]
${txt_debt_profile}         xpath://span[contains(text(),'Debt Profile')]
${download_debt_pro}        xpath://div[@id='debt_tab']//div[@class='col-4']/button[1]/img[1]

#management & key employees
${btn_management_key}           xpath://button[contains(text(),'Management')]
${txt_management_key_emp}       xpath://span[contains(text(),'Management & Key Employees')]
${download_management_key_employees}       xpath://div[@id='management_tab']//div[@class='col-4']/button[1]/img[1]

#ownership
${btn_ownership}            xpath://button[contains(text(),'Ownership')]
${txt_ownership}            xpath://span[contains(text(),'Ownership')]
${img_ownership_downlaod}   xpath://div[@id='ownership_tab']//div[@class='col-4']/img[1]

#analyst coverage
${btn_analyst_coverage}     xpath://button[contains(text(),'Analyst Coverage')]
${txt_analyst_coverage}     xpath://span[contains(text(),'Analyst Coverage')]
${img_analyst_coverage}     xpath://div[@id='analyst_tab']//div[@class='col-4']/img[1]

#Events and filings
${btn_events}               xpath://button[contains(text(),'Events')]
${txt_events}               xpath://span[contains(text(),'Events & Transcripts')]
${download_events_transcripts}   //div[@id='event_tab']//div[@class='col-4']//img[1]

