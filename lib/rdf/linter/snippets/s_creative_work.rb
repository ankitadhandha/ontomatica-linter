# data-vocabulary `Person` snippet:
module RDF::Linter
  LINTER_HAML.merge!({
    RDF::URI("http://schema.org/CreativeWork") => {
      :identifier => "schema:CreativeWork",
      # Properties to be used in snippet title
      :title_props => ["http://schema.org/name"],
      # Properties to be used in snippet photo
      :photo_props => ["http://schema.org/image"],
      # Properties to be used in snippet body
      :body_props => [
        "http://schema.org/aggregateRating",
        "http://schema.org/review",
        "http://schema.org/reviews",
      ],
      :body_fmt => lambda {|list, &block|
        aggregate = block.call("http://schema.org/aggregateRating")
        reviews = block.call("http://schema.org/review") || block.call("http://schema.org/reviews")
        s = ''
        s += "<div>Aggregate Rating : #{aggregate}</div>" if aggregate
        s += "<div>Reviews: #{reviews}</div>" if reviews
        s
      },
      :description_props => ["http://schema.org/description"],
      # Properties to be used when snippet is nested
      :nested_props => [
        "http://schema.org/name",
      ],
      :property_value => %(
        - if predicate == "http://schema.org/aggregateRating"
          != rating_helper(predicate, object)
        - elsif res = yield(object)
          != res
        - elsif ["http://schema.org/image", "http://schema.org/photo"].include?(predicate)
          %img{:property => rel, :src => object.to_s, :alt => ""}
        - elsif object.literal?
          %span{:property => property, :content => get_content(object), :lang => get_lang(object), :datatype => get_dt_curie(object)}= escape_entities(get_value(object))
        - else
          %span{:property => rel, :resource => get_curie(object)}
      ),
      :property_values => %(
        - if predicate == "http://schema.org/aggregateRating"
          != rating_helper(predicate, objects.first)
        - elsif res = objects.map {|object| yield(object)}
          != res.join(", ")
        - elsif ["http://schema.org/image", "http://schema.org/photo"].include?(predicate)
          %img{:property => rel, :src => objects.first.to_s, :alt => ""}
        - elsif object.literal?
          %span{:property => property}
            = objects.map{|object| escape_entities(get_value(object)) }.join(", ")
        - else
          %span{:property => rel}
            = objects.map {|object| escape_entities(object)}
      ),
      # Priority of this snippet when multiple are matched. If it's missing, it's assumed to be 99
      # When multiple snippets are matched by an object, the one with the highest priority wins.
      :priority => 20,
    }
  })
end