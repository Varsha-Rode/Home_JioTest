***Settings***
Library                                   SeleniumLibrary

***Keywords***
Discover New Section Validation
    Scroll To                                       xpath=//button[contains(@onclick,"JioFiber") and normalize-space()='Know more']
    #Title Verification
    Text Verification                               xpath=//h2[@class="j-contentBlock__title j-heading j-text-heading-l" and contains(text(),'Discover')]        ${Discovernew_section[0]}
    CSS Verification                                xpath=//h2[@class="j-contentBlock__title j-heading j-text-heading-l" and contains(text(),'Discover')]       font-weight     900
   
    #Subtitle Verification
    Text Verification                               xpath=//div[@class="j-contentBlock__description j-text-body-m j-color-primary-grey-80" and contains(text(),'Planning')]    ${Discovernew_section[1]}
    
    #Icons Verifications
    ${elements}=    Get WebElements                 xpath=//div[@class='custom_icon_size size_icon_home m-auto flex-shrink-0']
    FOR  ${element}    IN  @{elements}
        Wait For And Verify Element                 ${element}
    END
    
    #Icon names verification
    ${Inc}  Set Variable   0
    ${elements}=    Get WebElements                 xpath=//div[@class='j-grid']//h3
    
    FOR  ${element}    IN  @{elements}
        Text Verification   ${element}              ${Discovernew_iconname}[${Inc}]
        CSS Verification    ${element}              font-weight     900
        ${inc}=   Evaluate     ${inc} + 1  
    END

    #Icon text verification
    ${i}  Set Variable   0
    ${text}=    Get WebElements                     xpath=//div[@class="j-color-primary-grey-80 j-contentBlock__description j-text-body-s"]
    FOR  ${t}    IN  @{text}
        Text Verification                           ${t}    ${Discovernew_subtext}[${i}]
        ${i}=   Evaluate     ${i} + 1  
    END

    #Icon button redirection
    ${VB}  Set Variable   0
    WHILE  ${VB} < 3
        Redirection On Clicking for Home            xpath=//button[@aria-label="Explore Mobile" and normalize-space()="${Discovernew_buttons}[${VB}]"]    ${Discovernew_urls}[${VB}]      DNP_${Discovernew_iconname}[${VB}]
        CSS Verification                            xpath=//button[@aria-label="Explore Mobile" and normalize-space()="${Discovernew_buttons}[${VB}]"]    font-weight     700
        ${VB}=   Evaluate     ${VB} + 1
    END
