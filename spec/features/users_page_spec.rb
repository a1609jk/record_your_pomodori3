require "spec_helper"

describe "users page" do

  describe "profile page" do
    let(:user) { create(:user) }

    before :each do 
      visit signin_path
      fill_in 'メールアドレス', with: user.email
      fill_in 'パスワード', with: user.password
      click_button 'サインイン'
    end

    it "has the title user name" do
      expect(page).to have_title(user.name)
    end

    it "has the content user name" do
      expect(page).to have_content(user.name)
    end

  end

  describe "signup page" do

    before :each do
      visit signup_path
    end

    it "has the title 'ユーザー登録'" do
      expect(page).to have_title('ユーザー登録')
    end

    it "has the content 'ユーザー登録'" do
      expect(page).to have_content('ユーザー登録')
    end

    context "with invalid information" do

      it "doesn't create a user" do
        expect{click_button '更新する'}.to_not change(User, :count)
      end

    end

    context "with valid information" do

      before :each do
        fill_in "名前", with: "Exmaple User"
        fill_in "メールアドレス", with: "user@example.com"
        fill_in "パスワード", with: "foobar"
        fill_in "パスワード確認", with: "foobar"
      end

      it "create a user" do
        expect{ click_button '更新する' }.to change(User, :count).by(1)
      end

      describe "after saving the user" do

        it "has link 'sign out'"

        it "has the user name in title"

        it "has flash message 'Welcome'"
      end

    end
  end
end
