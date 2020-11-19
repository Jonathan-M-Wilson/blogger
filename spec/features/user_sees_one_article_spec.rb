require "rails_helper"

RSpec.describe 'As a visitor', type: :feature do
  before(:each) do
    @article_1 = Article.create!(title: "Title 1", body: "Body 1")
    @article_2 = Article.create!(title: "Title 2", body: "Body 2")
  end

  describe "user can see one article" do
    describe "when a user visits /articles/:id" do
      it "displays that article's show page" do

        visit '/articles'

        click_link @article_1.title

        expect(current_path).to eq(article_path(@article_1))

        expect(page).to have_content(@article_1.title)
        expect(page).to have_content(@article_1.body)
      end
    end
  end
end
