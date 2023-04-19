***Settings*** 
Library                                 SeleniumLibrary

Resource    ../../Common.robot

***Keywords***
Business Banner Validation
    #Scroll to Make your business grow faster than ever section
    Scroll To   //body/div[@role='toolbar']/div[27]/span[1]
    
    #Heading Content Verification
    Text Verification                 xpath=//h3[@class="j-contentBlock__title j-heading j-text-heading-l"]      ${BusinessGrowFaster_Heading}
    CSS Verification                             xpath=//h3[@class="j-contentBlock__title j-heading j-text-heading-l"]        font-weight    900

    #Sub-Heading Content Verification
    Text Verification                 xpath=//div[@class="j-color-primary-grey-80 j-contentBlock__description j-text-body-l"]    ${BusinessGrowFaster_Subtext}
    
    #Background Image Verification
    Image Verification                           xpath=//div[@class='j-card j-fullwidth-banner p-0']//div[@class="l-breakpoint--desktop"]//img   
    
    #Button Verification
    Wait For And Verify Element                  xpath=//button[normalize-space()='Learn more about JioBusiness']
    Text Verification                            xpath=//button[normalize-space()='Learn more about JioBusiness']    ${BusinessGrowFaster_Button}
    Log To Console                               JioBusiness_Section Verified
         
    #Button Redirection
    Redirection On Clicking for Home             xpath=//button[normalize-space()='Learn more about JioBusiness']      https://www.jio.com/business/   JioBusiness_Page
