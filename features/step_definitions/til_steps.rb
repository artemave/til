Given /^I am signed in$/ do
  visit twitter_auth_path
end

When /^I view my tils$/ do
  visit root_path
end

Given /^I have learned the following things in the past:$/ do |table|
  table.hashes.each do |row|
    Til.create(content: row['til'])
  end
end

Given /^today I learned that "([^"]*)"$/ do |piece_of_knowledge|
  @piece_of_knowledge = piece_of_knowledge
end

When /^I add new TIL$/ do
  click_button "New"
  fill_in "wmd-input", with: @piece_of_knowledge
  click_button "Save"
end

Then /^my list of tils should include the following:$/ do |table|
  table.hashes.each do |row|
    within '#tils' do
      page.should have_content(row['content'])
    end
  end
end

Then /^list of my TILs should include "([^"]*)"$/ do |content|
  Til.exists?(conditions: { content: content }).should be(true), "Expected til with content #{content} to have been saved in db"
  within '#tils_index' do
    page.should have_content content
  end
end
