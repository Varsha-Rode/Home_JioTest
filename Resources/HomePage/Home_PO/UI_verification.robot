***Settings***
Library                                    SeleniumLibrary
Resource    ../../Common.robot

***Keywords***
Home Page UI Elements Validation
    #TopNav
    Section Verification                   xpath=//div[@class='j-header__grid']     Top_Nav

    #Carousel Banners
    Section Verification                   xpath=//section[@class='j-container max-width-container masthead-slick fullscreen-slick-dots slick-initialized slick-slider slick-dotted']     Carousel_Banner

    #Quick Action Buttons
    Section Verification                   xpath=//section//div[contains(@class,'j-container card-thumbnail-container')]//div[@class='d-flex flex-wrap justify-content-center icon-wrapper']    Quick_Action
    
    #Title Verification
    ${elements}=    Get WebElements        xpath=//h2[@class='j-contentBlock__title j-heading j-text-heading-l']
    FOR  ${element}  IN  @{elements}
        Wait For And Verify Element        ${element}
    END
    
    #Discover New Possibilities
    Section Verification                   xpath=//h2[normalize-space()='Discover new possibilities']  Discover_Section

    #Mobile, JioFiber and Business
    Section Verification                   xpath=//div[@class='l-layout--max-width']//div[@class='j-grid']    Mobile_JioFiber_Business

    #Enrich your digital life
    Section Verification                   xpath=//section[@class='j-grid video__custom_grid ']        Enrich_Your_Digital_Life
    
    #Walking Carousel
    Section Verification                   xpath=//section[@class="j-container max-width-container"]      Walking_Carousel

    #Spotlight Section
    Section Verification                   xpath=//div[@class='j-card size--s j-card__shadow p-0 bg--primary-background']  Spot_Light

    #Three Shopping Sections
    ${elements}=    Get WebElements        xpath=(//section[@class="j-container"]//div[contains(@class,'equal_height_card')])[1]
    ${JH}  Set Variable   0
    FOR  ${element}  IN  @{elements}
        #Wheel Down      1
        Section Verification               ${element}      Shopping_${JH}
        ${JH}=   Evaluate       ${JH} + 1
    END

    #Latest and trending devices 
    Section Verification                   xpath=//h2[normalize-space()='Latest and trending devices']        Latest_And_Trending
    
    #Three product cards
    ${elements}=    Get WebElements        xpath=(//section[@class="j-container"]//div[contains(@class,'equal_height_card')])[2]
    ${PH}  Set Variable   0
    FOR  ${element}  IN  @{elements}
        #Wheel Down      1
        Section Verification               ${element}     Products_${PH}
        ${PH}=   Evaluate       ${PH} + 1
    END

    #Career Banner
    Section Verification                   xpath=//div[@id='promocardNew']       Career_Banner 

    #Making a diiference
    Section Verification                   xpath=//section[@class='j-container bg--primary-grey-20']        Success_Stories
  
    #Business Banner
    Section Verification                   xpath=//div[@class='j-card j-fullwidth-banner p-0']       Jio_Business
    
    #One App For Everything Jio
    Section Verification                   xpath=//section[@class='j-container bg--secondary-20']//div[@class='l-layout--max-width']        QR_Code

    #Need Guidance?
    Section Verification                   xpath=//section[@class='j-container bg--primary-background']        Need_Guidance

#Validating Text and their respective logos from Quick Action Section
Quick Action Section Verification
    ${buttonlist}=    Get WebElements      xpath=//a[@class='txt-align--center icon-circle-transition secondary']
    ${JH}  Set Variable   0
    FOR  ${button}  IN  @{buttonlist}
        Wait For And Verify Element       ${button}
        Text Verification       ${button}      ${Quick_Action}[${JH}]
        ${JH}=   Evaluate       ${JH} + 1
    END




