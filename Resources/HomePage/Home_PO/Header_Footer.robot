*** Settings ***
Library                                      SeleniumLibrary



*** Keywords ***
Header Content Validation   
    ${i}    Set Variable   0
    #Jio Logo
    Wait For And Verify Element                       xpath=//div[@class="header_logo-group override_logo"]
    WHILE  ${i} != 8
        IF  ${i} < 7
            Wait For And Verify Element               xpath=//a[@aria-label='${Header_Options}[${i}]']
            Text Verification                         xpath=//a[@aria-label='${Header_Options}[${i}]']    ${Header_Options}[${i}]
            CSS Verification                          xpath=//a[@aria-label='${Header_Options}[${i}]']      font-weight	 700
        END
        ${i}=       Evaluate     ${i} + 1
    END
    Wait For And Verify Element                       xpath=//section[@class='header_search-box j-container override_search hide-in--xmobile']
    Wait For And Verify Element                       xpath=//a[@id='Sign-In']
    Log To Console                                    Header UI and Content Verified 

    #Header Content Redirection
    ${i}    Set Variable   0
    WHILE  ${i} != 8
        IF  ${i} < 7
            Wait For And Verify Element               xpath=//a[@aria-label='${Header_Options}[${i}]'] 
            Redirection On Clicking for Home          xpath=//a[@aria-label='${Header_Options}[${i}]']    ${Header_URLs}[${i}]    ${Header_Options}[${i}]_Page
        END
        ${i}=       Evaluate     ${i} + 1
    END
    Wait For And Click Element                        xpath=//section[@class='header_search-box j-container override_search hide-in--xmobile']    
    Wait For And Click Element                        xpath=//span[@class='input-icon clickable input-icon-prefix j-icon']
    Redirection On Clicking for Home                  xpath=//a[@id='Sign-In']    ${Header_URLs}[7]    Login_page
    Log To Console                                    Header UI and Content Verified 



Footer Content Validation
    Scroll To                                         xpath=//div[@class="j-footer j-accordion-wrapper j-accordion-plus-minus-icon"]
    #Footer Title Verification
    ${elements}=    Get WebElements                   xpath=//div[@class="group__heading j-listBlock align-middle"]
    FOR  ${element}  IN  @{elements}
        Wait For And Verify Element  ${element}
        CSS Verification             ${element}    font-weight    500   
    END

    #Footer Sub Section Verification
    ${elements}=    Get WebElements                   xpath=//div[@class='group']//div[@class='group__links j-grid']//a
    FOR  ${element}  IN  @{elements}
        Wait For And Verify Element  ${element}
    END

    #Connect with us & Download MyJio Title Verification
    ${elements}=    Get WebElements                   xpath=//h3[@class='j-heading j-text-heading-xs']
    FOR  ${element}  IN  @{elements}
        Wait For And Verify Element  ${element}
        CSS Verification    ${element}    font-weight    900                
    END

    #Connect with us Section Verification
    ${elements}=    Get WebElements                   xpath=//div[@class='items']//a
    FOR  ${element}  IN  @{elements}
        Wait For And Verify Element  ${element}
    END

    #Download MyJio Section Verification
    ${elements}=    Get WebElements                   xpath=//div[@class='stores']//a
    FOR  ${element}  IN  @{elements}
        Wait For And Verify Element  ${element}
    END

    #Jio Logo and Copyright Content  
    Wait For And Verify Element                       xpath=//div[@class='j-footer-legals__content__logo']
    Text Verification                                 xpath=//div[@class='j-footer-legals__content__copyright']    Copyright © 2023 Reliance Jio Infocomm Ltd. All rights reserved.

    #Footer Legals Title Verification
    ${elements}=    Get WebElements                   xpath=//div[@class='j-text j-text-body-xxs']
    FOR  ${element}  IN  @{elements}
        Wait For And Verify Element  ${element}
    END    

#Footer Content Redirection

    #Our_offerings Redirection
    Text Verification                                 xpath=//div[@class='group__heading j-listBlock align-middle']//div[@class='j-text j-text-body-m'][normalize-space()='Our offerings']    Our offerings
    CSS Verification	                              xpath=//div[@class='group__heading j-listBlock align-middle']//div[@class='j-text j-text-body-m'][normalize-space()='Our offerings']    font-weight	 900
    ${j}  Set Variable   1
    FOR  ${inc}  IN RANGE  0  5
        Text Verification                             xpath=//div[@class='group'][1]//div[@class='group__links j-grid']//a[${j}]  ${Ourofferings_text}[${inc}]
        Redirection On Clicking for Home              xpath=//div[@class='group'][1]//div[@class='group__links j-grid']//a[${j}]  ${Our_offerings}[${inc}]      Our_Offerings_Sub_${j}
        ${j}=   Evaluate     ${j} + 1
    END

    #Support Redirection
    Text Verification                                 xpath=//div[@class='group__heading j-listBlock align-middle']//div[@class='j-text j-text-body-m'][normalize-space()='Support']    Support
    CSS Verification                                  xpath=//div[@class='group__heading j-listBlock align-middle']//div[@class='j-text j-text-body-m'][normalize-space()='Support']    font-weight	 900
    ${j}  Set Variable   1
    FOR  ${inc}  IN RANGE  0  5
        Text Verification                             xpath=//div[@class='group'][2]//div[@class='group__links j-grid']//a[${j}]  ${Footer_Support_text}[${inc}]
        Redirection On Clicking for Home              xpath=//div[@class='group'][2]//div[@class='group__links j-grid']//a[${j}]  ${Footer_Support}[${inc}]  Support_Sub_${j}
        ${j}=   Evaluate     ${j} + 1
    END

    #Our_company Redirection       
    Text Verification                                 xpath=//div[@class='group__heading j-listBlock align-middle']//div[@class='j-text j-text-body-m'][normalize-space()='Our company']    Our company
    CSS Verification                                  xpath=//div[@class='group__heading j-listBlock align-middle']//div[@class='j-text j-text-body-m'][normalize-space()='Our company']    font-weight	 900
    ${j}  Set Variable   1
    FOR  ${inc}  IN RANGE  0  5
        Text Verification                             xpath=//div[@class='group'][3]//div[@class='group__links j-grid']//a[${j}]  ${Ourcompany_text}[${inc}]
        IF  ${inc} == 0 or ${inc} == 1
            Wait For And Click Element                xpath=//div[@class='group'][3]//div[@class='group__links j-grid']//a[${j}]
            Change Tab                                ${Footer_Titles}[${inc}]
            Sleep  1s
            Take Page Screenshot                      Our_company_Sub_${j}
            Change Tab                                Jio - Best Prepaid, Postpaid Plans, WiFi Connection & Mobile Apps
        ELSE IF  ${inc} == 3
            Wait For And Click Element                xpath=//div[@class='group'][3]//div[@class='group__links j-grid']//a[${j}]
            Take Page Screenshot                      Our_company_Sub_${j}
            Go Back
        ELSE
            Redirection On Clicking for Home          xpath=//div[@class='group'][3]//div[@class='group__links j-grid']//a[${j}]  ${Our_company}[${inc}]  Our_company_Sub_${j}
        END
        ${j}=   Evaluate     ${j} + 1
    END

    #Useful_links Redirection 
    Text Verification                                 xpath=//div[@class='group__heading j-listBlock align-middle']//div[@class='j-text j-text-body-m'][normalize-space()='Useful links']    Useful links
    CSS Verification                                  xpath=//div[@class='group__heading j-listBlock align-middle']//div[@class='j-text j-text-body-m'][normalize-space()='Useful links']    font-weight	 900
    ${j}  Set Variable   1
    FOR  ${inc}  IN RANGE  0  5
        Text Verification                             xpath=//div[@class='group'][4]//div[@class='group__links j-grid']//a[${j}]  ${Usefulinks_text}[${inc}]
        Redirection On Clicking for Home              xpath=//div[@class='group'][4]//div[@class='group__links j-grid']//a[${j}]  ${Useful_links}[${inc}]  Useful_links_Sub_${j}
        ${j}=   Evaluate     ${j} + 1
    END

    #Connect_with_us Redirection
    Text Verification                                 xpath=//h3[normalize-space()='Connect with us']    Connect with us
    CSS Verification                                  xpath=//h3[normalize-space()='Connect with us']    font-weight	 900
    ${j}  Set Variable   1
    FOR  ${inc}  IN RANGE  0  5
        Redirection On Clicking for Home              xpath=//div[@class='items']//a[${j}]  ${Connect_with_us}[${inc}]  Connect_with_us_Sub_${j}
        ${j}=   Evaluate     ${j} + 1
    END

    #Download_MyJio Redirection
    Text Verification                                 xpath=//h3[normalize-space()='Download MyJio']    Download MyJio
    CSS Verification 	                              xpath=//h3[normalize-space()='Download MyJio']        font-weight	 900
    ${j}  Set Variable   1
    FOR  ${inc}  IN RANGE  0  2
        Redirection On Clicking for Home              xpath=//div[@class='stores']//a[${j}]  ${Download_MyJio}[${inc}]  Download_MyJio_Sub_${j}
        ${j}=   Evaluate     ${j} + 1
    END

    #Footer Legals Redirection
    ${j}  Set Variable   1
    FOR  ${inc}  IN RANGE  0  4
        Redirection On Clicking for Home              xpath=//div[@class='j-text j-text-body-xxs'][${j}]//a  ${Copyright_Section}[${inc}]  Copyright_Section_${j}
        ${j}=   Evaluate     ${j} + 1
    END
