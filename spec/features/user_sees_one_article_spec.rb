# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  before(:each) do
    @article_1 = Article.create!(title: 'Title 1', body: 'Body 1')
    @article_2 = Article.create!(title: 'Title 2', body: 'Body 2')
    @comment_1 = article.comments.create(author_name: "John Wayne", body: "Courage is being scared to death but saddling up anyway.")
    @comment_2 = article.comments.create(author_name: "Kathy", body: "Wow! I love this so much!")
  end

  describe 'user can see one article' do
    describe 'when a user visits /articles/:id' do
      it "displays that article's show page" do
        visit '/articles'

        click_link @article_1.title

        expect(current_path).to eq(article_path(@article_1))

        expect(page).to have_content(@article_1.title)
        expect(page).to have_content(@article_1.body)
        expect(page).to have_content(@comment_1.author_name)
        expect(page).to have_content(@comment_1.body)
        expect(page).to have_content(@comment_2.author_name)
        expect(page).to have_content(@comment_2.body)
      end
    end
  end
end
