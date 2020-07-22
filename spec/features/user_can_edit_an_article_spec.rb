require 'rails_helper'

RSpec.describe "User can edit an article", type: :feature do
  before(:each) do
    @article_1 = Article.create!(title: "Title 1", body: "Body 1")
    @article_2 = Article.create!(title: "Title 2", body: "Body 2")
  end

  describe "When they link from the show page" do
    it "displays a link to a form where a user can edit an article" do

      visit article_path(@article_1)
      click_link "Edit"

      fill_in "article[title]", with: "Edited Sample Title!"
      fill_in "article[body]",  with: "Edited Sample Body!"
      click_on "Update Article"

      expect(current_path).to eq(article_path(@article_1))
      expect(page).to have_content("Edited Sample Title!")
      expect(page).to have_content("Edited Sample Body!")
      expect(page).to_not have_content("Title 1")
      expect(page).to_not have_content("Body 1")
      expect(page).to_not have_content(@article_2.title)
      expect(page).to_not have_content(@article_2.body)
    end
  end
end
