Feature: Login

  Background:
    Given I open browser
    And I maximize browser
    And I open "Lolaflora" page

  Scenario: Login with Wrong Email
    And I register with "wrongEmail"
    And I fill:
      | email  | email  |
      | password | password |
    When I click "signIn"
    Then I see "E-mail address or password is incorrect. Please check your information and try again." text in "errorMessage"

  Scenario: Login with Wrong Password
    And I register with "wrongPassword"
    And I fill:
      | email  | email  |
      | password | password |
    When I click "signIn"
    Then I see "E-mail address or password is incorrect. Please check your information and try again." text in "errorMessage"

  Scenario: Login with Empty Email and Password
    When I click "signIn"
    Then I see "Required field." text in "EmailLoginError"
    Then I see "Required field." text in "PasswordError"

  Scenario: Login with Correct User
    And I register with "correctUser"
    And I fill:
      | email  | email  |
      | password | password |
    And I click "signIn"
    When I click "thePage"
    Then I see "My Favorites" text in "userMenu"


  Scenario: Forgot Password
    And I click "forgotPassword"
    And I see "Please enter your e-mail address." text in "forgotPasswordText"
    And I fill:
      | forgotPasswordMail  | slngnn@gmail.com  |
    When I click "sendButton"
    Then I see "You will receive an e-mail from us with instructions for resetting your password." text in "resetPasswordText"

  Scenario: Forgot Password Not Entering An Email
    And I click "forgotPassword"
    When I click "sendButton"
    Then I see "Required field." text in "MailError"

  Scenario: Forgot Password Entering An Email
    And I click "forgotPassword"
    And I fill:
      | forgotPasswordMail  | slngnn  |
    When I click "sendButton"
    Then I see "Please enter a valid e-mail address." text in "MailError"

    


    

