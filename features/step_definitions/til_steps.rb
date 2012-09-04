Given /^I am signed in$/ do
  visit twitter_auth_path
end

When /^I view my notes/ do
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

Given /^I have a note with content "(.*?)"$/ do |content|
  Til.create! content: content
end

Given /^the oldest one has been updated most recently$/ do
  t = Til.first
  t.content = 'it is time to sleep'
  Delorean.jump 10 # so that updated time differ from others
  t.save
end

Given /^I've just googled something useful$/ do
  @something_useful = 'WAT'
end

When /^I choose to see one$/ do
  @chosen_til = Til.first # relies on the fact that by default last is shown

  visit root_path
  find("##{@chosen_til.id}_index_item").click
end

When /^I save it in new note$/ do
  click_link "New"
  fill_in "wmd-input", with: @something_useful
  click_button "Save"
end

When /^I change its content to "(.*?)"$/ do |content|
  visit root_path
  click_button 'Edit'
  fill_in 'wmd-input', with: content
  click_button 'Save'
end

Then /^I should see a list of notes with their content$/ do
  Til.all do |note|
    within '#tils' do
      page.should have_content note.content
    end
  end
end

Then /^it should appear in the list of my notes$/ do
  within '#tils_index' do
    page.should have_content @something_useful
  end
end

Then /^I should see the content of the oldest note$/ do
  within "#note_details" do
    page.should have_content last_modified_til.content
  end
end

Then /^I should see its content$/ do
  within '#note_details' do
    page.should have_content @chosen_til.content
  end
end

Then /^its content should be "(.*?)"$/ do |text|
  %w[#wmd-preview #tils].each do |selector|
    within selector do
      page.should have_content text
    end
  end
end
