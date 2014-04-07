require 'spec_helper'

describe SessionsController do

  describe 'GET #new' do

    before :each do
      get :new
    end

    it "assigns a new session to @session"

    it "renders the :new template" do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do

  end

  describe 'DELETE #destroy' do
    
    it "redirect_to static_pages#index"
  end

end
