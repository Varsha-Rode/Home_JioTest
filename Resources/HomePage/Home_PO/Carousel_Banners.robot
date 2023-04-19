***Settings***
Library                                      SeleniumLibrary

***Keywords***
#Validating working of videos from Carousel banners
Home Carousel Banners Verification
    # ${elements}=    Get WebElements          xpath=//button[@class='j-button j-button-size__medium secondary icon-primary icon-primary-inline w-auto video-btn-custom mt-3']
    # ${VB}  Set Variable   0
    # FOR  ${element}  IN  @{elements}
    #     Sleep  2s
    #     Wait For And Click Element           xpath=//li[@id='slick-slide0${VB}'] 
    #     Wait For And Click Element           ${element}
    #     Sleep   1s
    #     Take Page Screenshot                 BannerVideo_${VB}
    #     Wait For And Click Element           xpath=//div[@class='model-fullscreen-btn']
    #     ${VB}=   Evaluate     ${VB} + 1
    #     Log To Console                       BannerVideo_${VB} is playable
    # END

#Validating Carousel Banner Redirection
    Banner Redirection with content verification    slick-slide0       HomePage

