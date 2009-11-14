Given /^I am a guest$/ do
  #nothing to see here
end

Given /^I am a registered user$/ do
  current_user = User.create()
end

