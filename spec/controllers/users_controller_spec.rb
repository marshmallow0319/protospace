require 'rails_helper'

describe UsersController, type: :controller do

  let(:user) { build(:user) }

  describe 'GET #edit' do
    it "assigns the requested contact to @user" do
      get :edit, id: user
      expect(assigns(:user)).to eq user
    end

    it "renders the :edit template" do
      get :edit, id: user
      expect(response).to render_template :edit
    end
  end

  describe 'GET #show' do
    it "assigns the requested contact to @user" do
      get :show, id: user
      expect(assigns(:user)).to eq user
    end

    it "renders the :show template" do
      get :show, id: user
      expect(response).to render_template :show
    end
  end

  describe 'PATCH #update' do
    it "set valiable :user" do
      patch :update, id: user, user: attributes_for(:user)
      expect(assigns(:user)).to eq(user)
    end

    it "change user" do
      patch :update, id: user, user: attributes_for(:user, username: "テスト")
      user.reload
      expect(user.username).to eq("テスト")
    end

    it "dose not change user" do
      patch :update, id: user, user: attributes_for(:user, username: "テスト", email: nil)
      user.reload
      expect(user.username).to eq("テスト")
    end

    it "redirect to index" do
      patch :update, id: user, user: attributes_for(:user)
      expect(response).to redirect_to root_path
    end

    it "render to edit" do
      patch :update, id: user, user: attributes_for(:user, username: nil)
      expect(response).to render_template :edit
    end
  end

end
