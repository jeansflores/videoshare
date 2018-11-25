require "rails_helper"

RSpec.feature Video, type: :feature do
  before(:each) do
    sign_in
  end

  context "Page Home" do
    context "Without videos" do
      scenario "Display video create message" do
        visit root_path

        expect(page).to have_text("Be the first to share a video ;D")
      end
    end

    context "With videos" do
      scenario "Display video create message" do
        create_video
        visit root_path

        expect(page).to have_text("Public Videos")
      end
    end
  end

  scenario "User create a new video" do
    visit videos_path

    expect(page).to have_text("My Videos")

    page.find('a', text: "New Video").click

    fill_in "Name", with: "My Widget"
    fill_in "Url", with: "http://content.jwplatform.com/manifests/yp34SRmf.m3u8"

    click_button "Create Video"

    expect(page).to have_text("Video was successfully created.")
  end

  scenario "User show a video" do
    create_video(@user)

    visit videos_path

    page.find('h5', text: "Video").click

    expect(page).to have_text("Video")
  end

  scenario "User show 'My Videos" do
    create_video(@user)
    create_video(@user)
    create_video(@user)

    page.find('a', text: "My Video").click

    expect(page).to have_text("Video"), count: 3
  end

  scenario "User edit a video" do
    create_video(@user)

    visit videos_path

    page.find('a', text: "Edit").click

    fill_in "Name", with: "My Widget"

    click_button "Update Video"

    expect(page).to have_text("Video was successfully updated.")
  end

  scenario "User destroy a video" do
    create_video(@user)

    visit videos_path

    page.find('a', text: "Delete").click

    expect(page).to have_text("Video was successfully destroyed.")
  end

  def sign_in
    password = "123456"
    @user = create( :user, password: password)

    visit '/videos'

    within "#new_user" do
      fill_in "user_email", with: @user.email
      fill_in "user_password", with: password
    end

    click_button "Log in"
  end

  def create_video(user = nil)
    if user.present?
      create(:video, name: 'Video', user: user )
    else
      create(:video)
    end
  end
end
