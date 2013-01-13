Given /^there exist notes with the following content:$/ do |table|
  table.raw.flatten.each do |content|
    my_account.notes.create! content: content
  end
  # reload page so that they appear
  visit root_path
end

When /^I want notes only containing "([^"]+)"$/ do |term|
  fill_in 'notes-search', with: term
end

Then /^I should only see the following notes:$/ do |table|
  expected_notes_content = table.raw.flatten
  actual_notes_content = all('#notes_index td').map &:text

  actual_notes_content.should =~ expected_notes_content
end
