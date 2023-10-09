module Songs
  class Search
    def initialize(filters:, scope: SongsIndex.all, page: 1, per_page: 5)
      @scope = scope
      @keywords = filters.fetch(:keywords, "")
      @genre = filters.fetch(:genre)
      @page = page
      @per_page = per_page
    end

    def search
      apply_filters.objects
    end

    private

    attr_reader :keywords, :genre, :scope, :page, :per_page

    def apply_filters
      [
        genre_filter,
        query_multi_match
      ].compact.reduce(:merge)
    end

    def query_multi_match
      scope.query(multi_match: {
        query: keywords,
        fields: [ :title, :artist, :lyrics ],
        operator: :and,
        type: :cross_fields
      }) if keywords.present?
    end

    def genre_filter
      scope.query(term: { genre: genre }) if genre.present?
    end
  end
end
