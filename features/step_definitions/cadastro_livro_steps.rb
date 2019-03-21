Entao(/^eu entro o numero "([^\"]*)" no campo com id "([^\"]*)"$/) do |text, id|
  hide_soft_keyboard
  step "I enter text \"#{text}\" into field with id \"#{id}\""
  hide_soft_keyboard
end
