def new_article
  visit new_article_path

  fill_in :article_title, with: 'Any title'
  fill_in :article_text, with: 'Any text'
    
  click_button 'Send article'
end