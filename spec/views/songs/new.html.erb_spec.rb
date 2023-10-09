require 'rails_helper'

RSpec.describe "songs/new", type: :view do
  before(:each) do
    assign(:song, Song.new(
      title: "MyString",
      artist: "MyString",
      genre: "MyString",
      lyrics: "MyText"
    ))
  end

  it "renders new song form" do
    render

    assert_select "form[action=?][method=?]", songs_path, "post" do

      assert_select "input[name=?]", "song[title]"

      assert_select "input[name=?]", "song[artist]"

      assert_select "input[name=?]", "song[genre]"

      assert_select "textarea[name=?]", "song[lyrics]"
    end
  end
end
