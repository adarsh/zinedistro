require 'spec_helper'

feature 'When Browsing Zines' do
  describe 'On the index page' do

    let!(:first_zine) do create(:zine_with_authors,
                                title: 'Zine 1',
                                subtitle: 'Subtitle 1')
    end
    let!(:second_zine) { create :zine, title: 'Zine 2' }
    let!(:unpublished_zine) do
      create(:zine,
             :unpublished,
             title: 'Super Secret')
    end

    before do
      visit '/zines'
    end

    scenario 'I can see zine images on the index page' do
      page.should have_css "img[src$=\'/zines/covers/#{first_zine.id}.png\']"
    end

    scenario 'I can see zine alt tag on the index page' do
      page.should have_css "img[alt$=\'#{first_zine.title}\']"
    end

    scenario 'I can see zines titles on the index page' do
      page.should have_content first_zine.title
    end

    scenario 'I can see zines subtitles on the index page' do
      page.should have_content first_zine.subtitle
    end

    scenario 'I can see zines sorted by date in descending order' do
      page.body.should =~ /Zine 2.*Zine 1/m
    end

    scenario "I can see the authors' names" do
      page.should have_content "by #{first_zine.authors.map(&:name)
        .to_sentence}"
    end

    scenario 'I can see a summary' do
      page.should have_content first_zine.excerpt
    end

    scenario 'I do not see unpublished zines' do
      page.should have_no_content unpublished_zine.title
    end

    scenario 'I can click on the zine cover to get to the zine details' do
      find('#zines .zine:first-of-type a.cover').click
      page.should have_selector 'article.zine'
      current_url.should eq zine_url(second_zine)
    end

    describe 'On the zine details page' do

      before do
        within "#zine_#{first_zine.id} .entry-title h3" do
          click_link first_zine.title
        end
      end

      scenario 'I can see the cover image' do
        page.should have_selector "img[src^='http://assets.zinedistro.org/" +
        "zines/covers/#{first_zine.id}']"
      end

      scenario 'I can see the full text' do
        page.should have_content first_zine.full_text
      end

      scenario 'I can download a PDF of the zine' do
        page.should have_css "a[href='http://assets.zinedistro.org/" +
        "zines/pdfs/#{first_zine.id}.pdf']"
      end

      describe 'Going back to the index page' do
        scenario 'I can go back to the index page' do
          click_link 'Back to zines'
          current_path.should eq '/zines'
        end
      end

    end
  end
end
