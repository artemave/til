Given /^I am signed in$/ do
  visit twitter_auth_path
end

When /^I view my notes/ do
  visit root_path
end

Given /^I have some notes$/ do
  5.times do |n|
    Note.create! content: n
  end
end

Given /^I have a note$/ do
  Note.create! content: 'NaN'
end

Given /^I have a note with content "(.*?)"$/ do |content|
  Note.create! content: content
end

Given /^the oldest one has been updated most recently$/ do
  t = Note.first
  t.content = 'it is time to sleep'
  Delorean.jump 10 # so that updated time differ from others
  t.save
end

Given /^I've just googled something useful$/ do
  @something_useful = 'WAT'
end

When /^I choose to see one$/ do
  @chosen_note = Note.first # relies on the fact that by default last is shown

  visit root_path
  find("##{@chosen_note.id}_index_item").click
end

When /^I save it in new note$/ do
  click_link "New"
  fill_in "wmd-input", with: @something_useful
  click_button "Create"
end

When /^I change its content to "(.*?)"$/ do |content|
  visit root_path
  click_button 'Edit'
  fill_in 'wmd-input', with: content
  click_button 'Save'
end

When /^I delete it/ do
  visit root_path
  click_button 'Delete'
  page.driver.wait_until(page.driver.browser.switch_to.alert.accept)
end

Then /^I should see a list of notes with their content$/ do
  Note.all do |note|
    within '#notes' do
      page.should have_content note.content
    end
  end
end

Then /^it should appear in the list of my notes$/ do
  within '#notes_index' do
    page.should have_content @something_useful
  end
end

Then /^I should see the content of the oldest note$/ do
  within "#note_details" do
    page.should have_content last_modified_note.content
  end
end

Then /^I should see its content$/ do
  within '#note_details' do
    page.should have_content @chosen_note.content
  end
end

Then /^its content should be "(.*?)"$/ do |text|
  %w[#wmd-preview #notes].each do |selector|
    within selector do
      page.should have_content text
    end
  end
end

Then /^it should no longer exist$/ do
  Note.count.should == 0
end

Then /^it should not be displayed$/ do
  find('#wmd-input').text.should == ''
end
