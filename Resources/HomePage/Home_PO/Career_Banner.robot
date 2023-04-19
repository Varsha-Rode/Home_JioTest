*** Settings ***
Library        SeleniumLibrary

*** Keywords ***
Career Banner Validation                         
    #Banner Content
    Scroll To                                          xpath=//button[contains(text(),'View job openings')] 
    
    #Banner content (Title, Background Image, Button )
    Banner Content Verification                        xpath=//h2[@class='j-heading j-promo-card__content-title j-text-heading-l']    ${Createopportunity_title}      xpath=//div[@class='j-promo-card bg--primary size--l img--filled orientation--horizontal j-promo-card__has-CTA']//img[@alt='JioCareers']    xpath=//button[contains(text(),'View job openings')]      JobCareers
    CSS Verification                                   xpath=//h2[@class='j-heading j-promo-card__content-title j-text-heading-l']    font-weight    900 
   
    #Title Subtext Verification
    Wait For And Verify Element                        xpath=//div[@class="j-promo-card__children pd--top sp--m"]//div[@class="j-color-primary-grey-80 j-text-body-m"]    
    Text Verification                                  xpath=//div[@class="j-promo-card__children pd--top sp--m"]//div[@class="j-color-primary-grey-80 j-text-body-m"]    ${Createopportunity_subtitle}
   
    #'View Job Opening' Button Redirection
    Redirection On Clicking for Home                   xpath=//button[contains(text(),'View job openings')]   https://careers.jio.com/   JobCareers_Page