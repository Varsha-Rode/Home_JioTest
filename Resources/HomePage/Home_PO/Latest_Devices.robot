*** Settings ***
Library                             SeleniumLibrary



*** Keywords ***
Latest and Trending Devices Section Validation
    #Validating user able to see Latest and trending devices Section
    Scroll To                                                   xpath=(//section[contains(@class,'j-container')])[62]
    Text Verification                                           xpath=//div[@class=" l-layout--max-width"]//h2         ${Latestdevices_section[0]}
    CSS Verification                                            xpath=//div[@class=" l-layout--max-width"]//h2        font-weight     900
   
    #sub-text verification
    Text Verification                                           xpath=//div[@class="j-color-primary-grey-80 j-contentBlock__description j-text-body-m" and normalize-space()="${Latestdevices_section[1]}"]    ${Latestdevices_section[1]}      
    Take Page Screenshot                                        LatestDevices
    
       
    #Validating present devices from section
    ${Devices}=  Get WebElements                                xpath=//div[contains(@style,"justify-content")]
    FOR  ${Device}  IN  @{Devices} 
    Wait For And Verify Element     ${Device}             
    END         
   
    #Verifying price of each product
    FOR  ${Device_pi}  IN  @{Latestdevices_price}
    Wait For And Verify Element                                 xpath=//div[normalize-space()='${Device_pi}']            
    END         
   
    #Respective Device Page Redirection  
    FOR  ${Device}  IN  @{Latestdevices_list}
        CSS Verification                                        xpath=//h3[normalize-space()='${Device}']     font-weight     700
        Wait For And Click Element                              xpath=//h3[normalize-space()='${Device}']
        Take Page Screenshot      ${Device}_Page
        Go Back   
        Scroll To                                               xpath=(//section[contains(@class,'j-container')])[62]
    END

    #Start Shopping Button Redirection
    Scroll To                                                   xpath=(//section[contains(@class,'j-container')])[62]
    Redirection On Clicking for Home                            xpath=//button[@aria-label='View all products']   https://www.jio.com/shop/en-in/c/jioaccessories  Shop_Page
                            
                     
