Feature: Templating a string 
  As a person using the templater
  I want to be able to replace my tokens with values
  So that I can reuse my templates across different places

    
  Scenario: Replacing tokens in string
    Given the following tokens
    | name | language |
    | corey | ruby |
    When I template "$name loves $language"
    Then I should get "corey loves ruby"
