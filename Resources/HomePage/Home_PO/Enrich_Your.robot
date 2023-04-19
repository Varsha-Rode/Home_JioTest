***Settings***
Library                             SeleniumLibrary
***Keywords***
Enrich Your Section Validation
    Scroll To                                               xpath=//section[@class='j-grid video__custom_grid ']
    Enrich Your Section Content Validation
    Sleep   200ms
    Walking Carousel Validation 

Enrich Your Section Content Validation  
    Take Page Screenshot                                    DigitalLife_Section
    #Title Verification
    Text Verification                                       xpath=//div[@class='j-contentBlock__content']//h2[contains(text(),'Enrich')]      ${Enrich_text[0]}
    CSS Verification                                        xpath=//div[@class='j-contentBlock__content']//h2[contains(text(),'Enrich')]      font-weight	 900

    #Subtitle Verification
    Text Verification                                       xpath=//div[@class='j-contentBlock__content']//div[contains(text(),'Stream')]     ${Enrich_text[1]}
    
    #Checking Video playing or not
    Element Attribute Value Should Be                       xpath=//div[@class="video__custom embed-responsive embed-responsive-16by9"]//video   autoplay    true
   
    #Animation
    Wait For And Verify Element                             xpath=//div[@class="content__wrap_custom"]  
    
    #Jiocinema
    Wait For And Verify Element                             xpath=//div[@class='j-badge j-badge-kind__service img-fluid']
    Text Verification                                       xpath=//div[@class='j-contentBlock__content ']//h3[@class='j-contentBlock__title j-heading j-text-heading-m']      ${Enrich_banner_text} 
    CSS Verification 	                                    xpath=//div[@class='j-contentBlock__content ']//h3[@class='j-contentBlock__title j-heading j-text-heading-m']    font-weight	 900
   
    #Start Watching Button
    Wait For And Verify Element                             xpath=//button[normalize-space()='Watch Now'] 
   
    #Click watch Now button and Redirection to Jiocinema Page
    Wait For And Click Element                              xpath=//button[normalize-space()='Watch Now']
  
    
Walking Carousel Validation    
    #Walking Carousel
    Wait For And Verify Element                             xpath=//section[@class='j-container max-width-container']
    Scroll To                                               xpath=//section[@class='j-container max-width-container'] 
    ${elements}=    Get WebElements                         xpath=//section[@class='j-container max-width-container'] 
    ${len}=     Get Length  ${elements}
    FOR  ${element}  IN  @{elements}
        Wait For And Verify Element  ${element}
    END
   
    #Walking Carousel Redirection
    Mouse Over                                              xpath=//button[normalize-space()='Find out more']  
    ${VB}  Set Variable   1
    WHILE  ${VB} != ${len}
        Wait For and Click Element                          xpath=//button//div[contains(text(),'${Enrich_Walkingcarousel_button}[${VB}]')] 
        Sleep   2s     
        Change Tab                                          ${Enrich_Walkingcarousel_title}[${VB}]
        URL Validation                                      ${Enrich_Walkingcarousel_urls}[${VB}]
        Take Page Screenshot                                ${Enrich_Walkingcarousel_button}[${VB}]
        Change Tab                                          Jio - Best Prepaid, Postpaid Plans, WiFi Connection & Mobile Apps          
        ${VB}=   Evaluate    ${VB} + 1
    END
   
    #Clicking JioSaavn Card
    Wait For And Click Element                              xpath=//section[@class='j-container max-width-container']    
    Take Page Screenshot                                    WC_App
    Go Back
    
    #Hovering on Walking Carousel
    Mouse Over                                              xpath=//section[@class='j-container max-width-container'] 
    # Sleep   3s
   
    #Clicking View all button
    Redirection On Clicking for Home                        xpath=//button[@aria-label="Shop all products"]     https://www.jio.com/jcms/apps/      WCApps_page
