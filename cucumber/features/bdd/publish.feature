Feature: Publicar no Facebook

   Feature Description

  @login
  Scenario: Login
   Given I am on Facebook.com
   And I do Login
   And I access Groups page
   When I pick a group from the group list
   And I start a new discussion
   And I paste text and I upload an image
   Then I click to publish discussion
