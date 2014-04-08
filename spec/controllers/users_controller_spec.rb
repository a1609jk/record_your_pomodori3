require 'spec_helper'

describe UsersController do

  let(:user) { create(:user) }

  describe 'GET #show' do

    before :each do
      controller.stub!(:signed_in?).and_return(true)
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

    before :each do
      get :new
    end

    it "assigns a new user to @user" do
      expect(assigns(:user)).to be_a_new(User)
    end

    it "renders the :new template" do
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #edit' do

    it "assigns the requested user to @user"

    it "renders the :edit template"
  end

  describe 'POST #create' do

    context 'with valid information' do

      it "saves the new user in the database" do
        expect{
          post :create, user: attributes_for(:user)
        }.to change(User, :count).by(1)
      end

      it "redirects to #show" do
        post :create, user: attributes_for(:user)
        expect(response).to redirect_to user_path(assigns(:user))
      end
    end

    context 'with invalid information' do

      it "does not save the user in the database" do
        expect{
          post :create,
            user: attributes_for(:user, email: nil)
        }.to_not change(User, :count)
      end

      it "re-renders the :new template" do
        post :create, user: attributes_for(:user, email: nil)
        expect(response).to render_template(:new)
      end
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
