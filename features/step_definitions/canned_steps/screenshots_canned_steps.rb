Entao(/^eu tiro um screenshot$/) do
  step 'I take a screenshot' if ENV['PLATFORM'] == 'android'
end
