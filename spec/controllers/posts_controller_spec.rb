require 'spec_helper'

RSpec.describe PostsController do
  subject(:post) { create :post }

  describe 'GET #index' do
    before { get :index }

    it 'renders the :index view' do
      expect(response).to be_success
      expect(response).to render_template :index
    end

    it 'populates an array of posts' do
      expect(assigns(:posts)).to match_array([post])
      expect(assigns(:title)).to eq 'Our Blog'
    end
  end

  describe 'GET #show' do
    before { get :show, id: post }

    it 'renders the #show view' do
      expect(response).to be_success
      expect(response).to render_template :show
    end

    it 'assigns the requested post to @post' do
      expect(assigns(:post)).to eq post
      expect(assigns(:title)).to eq post.title
    end
  end
end
