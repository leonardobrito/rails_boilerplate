# frozen_string_literal: true

class SongsIndex < Chewy::Index
  index_scope Song

  settings analysis: {
    analyzer: {
      email: {
        tokenizer: "keyword",
        filter: ["lowercase"]
      }
    }
  }

  field :title, type: :text
  field :artist, type: :text
  field :genre, type: :keyword
  field :lyrics, type: :text
end
