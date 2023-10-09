require 'rails_helper'

RSpec.describe "songs/show", type: :view do
  before(:each) do
    assign(:song, Song.create!(
      title: "Title",
      artist: "Artist",
      genre: "Genre",
      lyrics: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Artist/)
    expect(rendered).to match(/Genre/)
    expect(rendered).to match(/MyText/)
  end
end
