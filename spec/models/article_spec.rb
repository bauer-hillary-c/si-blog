require 'rails_helper'

describe Article, type: :model do
  describe "Article validation" do
    before :each do 
      @user = create(:user)
    end

    it "should save if it has a title and content" do
      article = Article.new(title: "Article Title", text: "Article body", user: @user)
      expect(article.save!).to eq true
    end

    it "should not save without a title" do
      article = Article.new(text: "Article body", user: @user)
      expect{article.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
