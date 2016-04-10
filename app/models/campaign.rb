class Campaign < Registry

  def tweet_link
    URI::HTTPS.build(host: "twitter.com", path: "/intent/tweet", query: {text: tweet, via: "Heartful_ly"}.to_query)
  end

end
