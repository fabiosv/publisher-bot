Before do
  @session ||= Capybara.current_session
end

Given(/^I am on Facebook\.com$/) do
  @session.visit('https://www.facebook.com')
end

Then(/^I do Login$/) do
  @session.fill_in('email', with: ENV['FB_USERNAME'])
  @session.fill_in('pass', with: ENV['FB_PASSWORD'])
  @session.find('//input[@value="Log In" or @value="Entrar"]', wait: 1).click
  # @session.click_on('u_0_2', wait:1)
end

Given(/^I access Groups page$/) do
  @session.find('//div[@data-testid="left_nav_section_Explorar"]/descendant::div[text()="Grupos"]', wait:1).click
end

When(/^I pick a group from the group list$/) do
  # @session.all('//span[contains(text(),"Indaiatuba")]', wait:1)
  # @session.click_on('Mercado Livre Indaiatuba oficial.')
  @session.click_on('Publisher test')
end

When(/^I start a new discussion$/) do
  @session.click_on('Iniciar discussão')
end

When(/^I paste text and I upload an image$/) do
  byebug
  xpath = "//div[text()='Escreva algo...']/../following-sibling::div/div[@contenteditable='true']"
  discussion_canvas = @session.find(xpath, wait: 1)
  discussion_canvas.send_keys('test')
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I click to publish discussion$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
