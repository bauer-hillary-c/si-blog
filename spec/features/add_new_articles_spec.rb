require 'rails_helper'

RSpec.feature "AddNewArticles", type: :feature do
  it "should require the user to log in before adding an article" do
    password = "123456789"
    user = create(:user, password: password, password_confirmation: password)

    visit new_article_path

    within "#new_user" do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: password
    end

    click_button "Log in"

    within "#new_article" do
      fill_in 'article_title', with: "Article Title"
      fill_in 'article_text', with: "Article body"
    end

    click_button "Save Article"

    expect(Article.count).to eq(1)
    expect(Article.first.title).to eq("Article Title")
  end
end
