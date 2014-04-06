require 'spec_helper'

describe UsersController do

  let(:user) { create(:user) }

  describe 'GET #show' do

    before :each do
      get :show, id: user
    end

    it "assigns the requested user to @user" do
      expect(assigns(:user)).to eq user
    end

    it "renders the :show template" do
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do

    it "assigns a new user to @user"

    it "renders the :new template"
  end

  describe 'GET #edit' do

    it "assigns the requested user to @user"

    it "renders the :edit template"
  end

  describe 'POST #create' do

    context 'with valid information' do

      it "saves the new user in the database"

      it "redirects to #show"
    end

    context 'with invalid information' do

      it "does not save the user in the database"

      it "re-renders the :new template"
    end
  end

  describe 'PATCH #update' do

    it "assigns the requested user to @user"

    context "with valid information" do

      it "changes @user's attributes"

      it "redirects to #show"
    end

    context "with invalid information" do

      it "does not change @user's attributes"

      it "re-renders the edit template"
    end
  end

  describe 'DELETE #destroy' do

    it "deletes the user"

    it "redirects to static_pages#index"
  end

end
