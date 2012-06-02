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

Given /^I have some notes$/ do
  5.times do |n|
    Til.create! content: n
  end
end

Given /^the first one has been updated last$/ do
  t = Til.first
  t.content = 'it is time to sleep'
  Delorean.jump 10 # so that updated time differ from others
  t.save
end

Given /^today I learned that "([^"]*)"$/ do |piece_of_knowledge|
  @piece_of_knowledge = piece_of_knowledge
end

When /^I choose to see one$/ do
  @chosen_til = Til.first # relies on the fact that by default last is shown

  visit root_path
  find("##{@chosen_til.id}_index_item").click
end

When /^I add new TIL$/ do
  click_link "New"
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
  within '#tils_index' do
    page.should have_content content
  end
end

Then /^I should see the content of the first one$/ do
  last_modified_til = Til.last_modified
  within "#note_details" do
    page.should have_content last_modified_til.content
  end
end

Then /^I should see its content$/ do
  within '#note_details' do
    page.should have_content @chosen_til.content
  end
end
