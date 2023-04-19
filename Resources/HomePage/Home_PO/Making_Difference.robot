***Settings***
Library                                SeleniumLibrary

***Keywords***
Making a Difference Validation
    Scroll To                                                  xpath=//section[@class='j-container bg--primary-grey-20']
    
    #Heading Text and CSS Verification
    Text Verification                                          xpath=//section[@class="j-container bg--primary-grey-20"]//h2[@class="j-contentBlock__title j-heading j-text-heading-l"]    ${Makingdiff_section[0]}
    CSS Verification                                           xpath=//section[@class="j-container bg--primary-grey-20"]//h2[@class="j-contentBlock__title j-heading j-text-heading-l"]    font-weight    900 
    
    #Subtext Text and 
    Text Verification                                          xpath=//div[@class="j-color-primary-grey-80 j-contentBlock__description j-text-body-m"][text()="Here is a handful of the many success stories."]    ${Makingdiff_section[1]}
    
    #Content Verification for Three Tiles
    ${i}    Set Variable   0
    ${inc}  Set Variable   1
    WHILE  ${inc} !=4 
        Wait For And Verify Element                             xpath=//div[contains(@class,'shadow-vertical-mg ')][${inc}]
        Banner Content Verification                             xpath=//div[contains(@class,'shadow-vertical-mg ')][${inc}]//div[@class="j-contentBlock__description j-text-body-m-bold"]   ${Makingdiff_storytext}[${i}]   xpath=//div[contains(@class,'shadow-vertical-mg ')][${inc}]//img    xpath=//div[contains(@class,'shadow-vertical-mg ')][${inc}]//button   Making difference 
        Wait For And Verify Element                             xpath=//div[contains(@class,'shadow-vertical-mg ')][${inc}]//div[@class="j-contentBlock__description j-text-body-s j-color-primary-grey-80"]        
        ${i}=       Evaluate     ${i} + 1
        ${inc}=     Evaluate     ${inc} + 1
    END 
    
    #Three Tiles Redirection
    ${inc}      Set Variable   1        
    ${i}        Set Variable   0
    ${j}        Set Variable   0
    WHILE  ${inc} !=4
        Redirection On Clicking for Home                        xpath=//div[contains(@class,'shadow-vertical-mg ')][${inc}]//button  https://www.jio.com/en-in/jiostory/${Makingdiff_storyurl}[${i}]  ${Makingdiff_storyurl}[${i}]_Page       
        #Success Stories page Content Verifcation
        Wait For And Click Element                              xpath=//div[contains(@class,'shadow-vertical-mg ')][${inc}]
        #Buttons CSS Verification
        Sleep   50ms
        #JioGraphy Tag
        Wait For And Verify Element                             xpath=//span[@class='j-text j-text-body-xxs-bold']   
        #Heading
        Wait For And Verify Element                             xpath=//h2[@class="j-heading j-text-heading-l"]
        #Date
        Wait For And Verify Element                             xpath=//section[@data-testid="story-details"]//div[@class="j-text j-text-body-m"]
        #Share Icons Redirection
        WHILE   ${j}!=4
            Wait For And Verify Element                         xpath=//button[@aria-label='${Makingdiff_shareicons}[${j}]']
            Wait For And Click Element                          xpath=//button[@aria-label='${Makingdiff_shareicons}[${j}]']
            Sleep   300ms
            Log To Console                                      ${Makingdiff_storyurl}[${i}] stories for ${Makingdiff_shareicons}[${j}] Redirection Successful
            ${j}=       Evaluate     ${j} + 1
        END
        ${j}    Set Variable   0
        #Images on Success Stories Page
        ${images}=      Get WebElements                        xpath=//div[@class='video-btn-custom ']//img
        FOR  ${image}  IN  @{images}
            Image Verification    ${image}
        END
        #Text Content on Success Stories Page
        ${elements}=      Get WebElements                      xpath=//div[@class='j-color-primary-grey-80']
        FOR  ${element}  IN  @{elements}
            Wait For And Verify Element                        ${element}
        END
        #Related Stories
        Scroll To                                              xpath=//body/div[@id='__next']/div/main/section[@class='j-container l-layout--full-width']/section[@class='j-container l-layout--full']/section[2]
        #Related Stories Section Verification and Redirection
        Wait For And Verify Element                            xpath=//h3[normalize-space()='Related Stories']
        Wait For And Verify Element                            xpath=//body/div[@id='__next']/div/main/section[@class='j-container l-layout--full-width']/section[@class='j-container l-layout--full']/section[2]
        ${cnt}  Set Variable   1
        WHILE  ${cnt} !=4  
            Image Verification                                 xpath=//div[@class="j-card h-100 css-1tpuwfs size--xs card-vertical j-card__has-fullCardCTA no-top-padding j-card__shadow"][${cnt}]//img
            ${temp}=    Get Text                               xpath=(//section[@class="j-container l-layout--max-width"]//div[@class="j-contentBlock__title"])[${cnt}]
            List Should Contain Value                          ${Makingdiff_relatedstorytext}     ${temp} 
            Wait For And Verify Element                        xpath=(//section[@class="j-container l-layout--max-width"]//div[@class="j-contentBlock__description"])[${cnt}]
            
            Wait For And Verify Element                        xpath=(//section[@class="j-container l-layout--max-width"]//button[@class="j-button j-button-size__medium tertiary"])[${cnt}]
            Wait For And Click Element                         xpath=(//section[@class="j-container l-layout--max-width"]//button[@class="j-button j-button-size__medium tertiary"])[${cnt}]
            Sleep   3s
            Take Page Screenshot                               ${Makingdiff_storyurl}[${i}] Success Page_${cnt}                    
            Go Back
            ${cnt}=     Evaluate     ${cnt} + 1
        END  
        Log To Console      Success Stories Page of            ${Makingdiff_storyurl}[${i}]     Content Verified
        Go Back
        #${cnt}    Set Variable   1         
        ${inc}=     Evaluate     ${inc} + 1
        ${i}=       Evaluate     ${i} + 1
    END 
