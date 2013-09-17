require 'spec_helper'

describe PostsController do
  describe "GET #index" do
    it "populates an array of posts" do
      post = create :post
      get :index
      assigns(:posts).should eq([post])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    subject(:post) { create :post }

    it "assigns the requested post to @post" do
      get :show, id: post
      assigns(:post).should eq(post)
    end

    it "renders the #show view" do
      get :show, id: post
      response.should render_template :show
    end
  end
end
