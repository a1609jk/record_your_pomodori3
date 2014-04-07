require 'spec_helper'

describe SessionsController do

  describe 'GET #new' do

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do

    let(:user) { create(:user) }

    context "with invlaid attributes" do

      it "renders the :new template" do
        session_attributes = { email: "", password: ""}
        post :create, session: session_attributes
        expect(response).to render_template(:new)
      end
    end

    context "with valid attributes" do

      before :each do
        session_attributes = { email: user.email, password: user.password }
        post :create, session: session_attributes
      end
      
      it "sets remember_token to cookie" do
        expect(cookies.permanent[:remember_token]).to_not eq nil
      end

      it "redirects to users#show" do
        expect(response).to redirect_to user_path(user)
      end

    end
  end

  describe 'DELETE #destroy' do

    before :each do
      delete :destroy
    end

    it "deletes remember_token from cookie" do
      expect(cookies.permanent[:remember_token]).to eq nil
    end

    it "redirects to static_pages#index" do
      expect(response).to redirect_to root_path
    end
  end

end
