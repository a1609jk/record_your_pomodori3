require 'spec_helper'

describe "sessions" do

  describe "signin page" do

    before :each do
      visit signin_path
    end

    it "has the title 'サインイン'" do
      expect(page).to have_title('サインイン')
    end

    it "has the content 'サインイン'" do
      expect(page).to have_content('サインイン')
    end

    it "has the link to new_user_path" do
      expect(page).to have_link('こちら', new_user_path)
    end

    context "with invalid information" do

      before :each do
        click_button "サインイン"
      end

      it "has the title 'サインイン'" do
        expect(page).to have_title('サインイン')
      end

      it "has the alert message" do
        expect(page).to have_content('メールアドレスとパスワードの組み合わせが正しくありません')
      end

    end

    context "with valid information" do
      let(:user) { create(:user) }

      before :each do
        fill_in 'メールアドレス', with: user.email.downcase
        fill_in 'パスワード', with: user.password
        click_button 'サインイン'
      end

      it "has user name in title" do
        expect(page).to have_title(user.name)
      end

      it "has the link 'Profile'" do
        expect(page).to have_link('Profile', href: user_path(user))
      end

      it "has the link 'Sign out'" do
        expect(page).to have_link('Sign out', href: signout_path)
      end

      it "doesn't have link 'Sign in'" do
        expect(page).to_not have_link('Sign in', href: signin_path)
      end

    end

  end
end
