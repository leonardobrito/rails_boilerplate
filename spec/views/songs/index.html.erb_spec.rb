require 'rails_helper'

RSpec.describe "songs/index", type: :view do
  before(:each) do
    assign(:songs, [
      Song.create!(
        title: "Title",
        artist: "Artist",
        genre: "Genre",
        lyrics: "MyText"
      ),
      Song.create!(
        title: "Title",
        artist: "Artist",
        genre: "Genre",
        lyrics: "MyText"
      )
    ])
  end

  it "renders a list of songs" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Artist".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Genre".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
