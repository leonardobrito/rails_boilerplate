require 'rails_helper'

RSpec.describe "songs/edit", type: :view do
  let(:song) {
    Song.create!(
      title: "MyString",
      artist: "MyString",
      genre: "MyString",
      lyrics: "MyText"
    )
  }

  before(:each) do
    assign(:song, song)
  end

  it "renders the edit song form" do
    render

    assert_select "form[action=?][method=?]", song_path(song), "post" do

      assert_select "input[name=?]", "song[title]"

      assert_select "input[name=?]", "song[artist]"

      assert_select "input[name=?]", "song[genre]"

      assert_select "textarea[name=?]", "song[lyrics]"
    end
  end
end
