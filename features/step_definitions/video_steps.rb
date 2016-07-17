Given /^I am a new, authenticated user$/ do
  email = 'testing@man.net'
  password = 'secretpass'
  User.new(:email => email, :password => password, :password_confirmation => password).save!
  visit '/users/sign_in'
  fill_in "user_email", with: email
  fill_in "user_password", with: password
  click_button "Log in"
end

When(/^I go to my videos list$/) do
  visit '/videos'
  expect(page).to have_content 'My videos Listing Videos of testing@man.net'
end

Then(/^I create video$/) do
  page.execute_script("$('#video_file').removeClass('hide')");
  attach_file('video[file]', File.absolute_path('./spec/files/bird.avi'))
  sleep 1
  expect(page).to have_content('bird.avi')
end

Then(/^I see video in list$/) do
  visit '/'
  expect(page).to have_content('bird.avi')
end

Then(/^I can change title of video$/) do
  visit '/videos'
  click_link 'Change title'
  fill_in 'video_title', with: 'Best video'
  find_field('video_title').native.send_key(:enter)
  sleep 1
  expect(page).to have_content('Best video')
end

Then(/^I can add tags to video$/) do
  click_link 'Add tag'
  fill_in 'tag_title', with: 'Humor'
  find_field('tag_title').native.send_key(:enter)
  sleep 1
  expect(page).to have_content('Humor')
end

Then(/^I can remove tags from video$/) do
  click_link 'x'
  expect(page).not_to have_content('Humor')
end

Then(/^I can delete video$/) do
  click_link 'Delete'
  expect(page).not_to have_content('Best video')
end

Then(/^i can cancel upload of video$/) do
  page.execute_script("$('#video_file').removeClass('hide')");
  attach_file('video[file]', File.absolute_path('./spec/files/bird.avi'))
  click_button 'Cancel upload'
  page.driver.browser.switch_to.alert.accept
  expect(page).not_to have_content('bird.avi')
end

When(/^I go to root page$/) do
  visit '/videos'
  expect(page).to have_content('User must be logged.')
  visit '/'
  expect(page.status_code).to eq(200)
end

Then(/^I can't see 'My video' link$/) do
  expect(page).not_to have_content('My video')
end

Then(/^I can see Login link$/) do
  expect(page).to have_content('Log in')
  expect(page).to have_content('Sign up')
end

Then(/^I can see uploaded videos$/) do
  video = FactoryGirl.create(:video)
  visit '/'
  expect(page).to have_content(video.title)
end
