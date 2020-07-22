require 'rails_helper'

RSpec.describe "User can delete an article", type: :feature do
  before(:each) do
    @article_1 = Article.create!(title: "Title 1", body: "Body 1")
    @article_2 = Article.create!(title: "Title 2", body: "Body 2")
  end

  describe "When they link from the show page" do
    it "displays all articles without the deleted entry" do

      visit article_path(@article_1)
      click_link "Delete"

      expect(current_path).to eq(articles_path)
      expect(page).to have_content(@article_2.title)
      expect(page).to_not have_link(@article_1.title)
    end
  end

  describe "When a user deletes an article" do
    it "can display a flash message after deleting an article" do
      visit article_path(@article_1)
      click_link "Delete"

      expect(current_path).to eq(articles_path)
      expect(page).to have_content("Article '#{@article_1.title}' has been deleted!")
    end
  end
end
