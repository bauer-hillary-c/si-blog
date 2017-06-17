require 'rails_helper'

describe ArticlesController, type: :controller do
  describe "anonymous user" do
    before :each do
      login_with nil
    end

    it "should be redirected when trying to make a new post" do
      get :new
      expect(response).to redirect_to(new_user_session_path)
    end

    it "should let an anonymous user see the index" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "logged in user" do
    before :each do
      login_with create(:user)
    end

    it "should let a logged in user write a post" do
      get :new
      expect(response).to render_template(:new)
    end
  end
end
