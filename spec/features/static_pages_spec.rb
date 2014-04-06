require 'spec_helper'

feature 'navbar' do

  before :each do
    visit root_path
  end

  scenario "has the brand name 'Record Your Pomodori'" do
    within 'div.navbar-header' do
      expect(page).to have_content('Record Your Pomodori')
    end
  end
end

feature 'footer' do
  before :each do
    visit root_path
  end

  scenario "has copyright" do
    within 'footer.site-footer' do
      expect(page).to have_content('Copyright')
    end
  end
end


feature 'index page' do

  before :each do
    visit root_path
  end

  scenario "has the title 'Record Your Pomodori'" do
    expect(page).to have_title('Record Your Pomodori')
  end

  scenario "has the content 'Record Your Pomodori'" do
    expect(page).to have_content('Record Your Pomodori')
  end

  scenario "has the content 'ユーザー登録'" do
    expect(page).to have_content('ユーザー登録')
  end

end

feature 'about page' do

  before :each do
    visit about_path
  end

  scenario "has the title 'Record Your Pomodori | About'" do
    expect(page).to have_title('Record Your Pomodori | About')
  end

  scenario "has the content 'このサイトについて'" do
    expect(page).to have_content('このサイトについて')
  end

end

feature 'contact page' do

  before :each do
    visit contact_path
  end

  scenario "has the title 'Record Your Pomodori | Contact'" do
    expect(page).to have_title('Record Your Pomodori | Contact')
  end

  scenario "has the content 'お問い合わせ'" do
    expect(page).to have_content('お問い合わせ')
  end

end
