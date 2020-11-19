require 'rails_helper'

RSpec.describe "User can create a new article", type: :feature do
  describe "When they link from the articles index" do
    describe "And they fill in a title and body" do
      it "allows a user to click on a link to create a new article" do

        visit articles_path
        click_link "Create a New Article"

        expect(current_path).to eq(new_article_path)

        fill_in "article[title]", with: "New Sample Title!"
        fill_in "article[body]",  with: "New Sample Body!"
        click_on "Create Article"

        expect(page).to have_content("New Sample Title!")
        expect(page).to have_content("New Sample Body!")
      end
    end
  end

  describe "When a user creates an article" do
    it "can display a flash message after creating an article" do

      visit articles_path
      click_link "Create a New Article"

      expect(current_path).to eq(new_article_path)

      fill_in "article[title]", with: "New Sample Title!"
      fill_in "article[body]",  with: "New Sample Body!"
      click_on "Create Article"

      expect(page).to have_content("Article 'New Sample Title!' has been created!")
    end
  end
end
