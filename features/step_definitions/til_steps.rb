Given /^I am signed in$/ do
  visit twitter_auth_path
end

Given /^today I learned that "([^"]*)"$/ do |piece_of_knowledge|
  @piece_of_knowledge = piece_of_knowledge
end

When /^I save this fact in a TIL$/ do
  visit root_path
  fill_in "Today I learned that", with: @piece_of_knowledge
  click_button "Save"
end
