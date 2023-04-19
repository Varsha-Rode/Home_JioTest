*** Settings ***
Library        SeleniumLibrary

*** Keywords ***
Three Promo Cards Verification
    #Three banners section
    Scroll To                                         xpath=//div[@class="overflow-scroll-max-width j-content-layout l-layout--max-width j-content-layout__layout-3-col-even carousel-card-wrap common_card_row_carousel_function equal_height_card grid-j-card"]//section[@class="j-container "]
    ${elements}=    Get WebElements                   xpath=//div[@class="overflow-scroll-max-width j-content-layout l-layout--max-width j-content-layout__layout-3-col-even carousel-card-wrap common_card_row_carousel_function equal_height_card grid-j-card"]//section[@class="j-container "]
    ${len}=     Get Length  ${elements}
    FOR  ${element}  IN  @{elements}
        Wait For And Verify Element                   ${element}
    END
    
    #Three Banner Buttons Redirection
    ${VB}  Set Variable   0
    WHILE  ${VB} != ${len}
        Wait For And Click Element                    xpath=//button//div[contains(text(),'${ThreeAppsBanner_button}[${VB}]')]
        Sleep   2s     
        Change Tab                                    ${ThreeAppsBanner_title}[${VB}]
        URL Validation                                ${ThreeAppsBanner_URL}[${VB}]
        Take Page Screenshot                          ${ThreeAppsBanner_button}[${VB}]
        Change Tab                                    Jio - Best Prepaid, Postpaid Plans, WiFi Connection & Mobile Apps          
        ${VB}=   Evaluate    ${VB} + 1
    END
