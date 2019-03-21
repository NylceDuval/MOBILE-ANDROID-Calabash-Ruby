Entao(/^eu entro o texto "([^\"]*)" no campo com id "([^\"]*)"$/) do |text, id|
  step "I enter text \"#{text}\" into field with id \"#{id}\""
end
