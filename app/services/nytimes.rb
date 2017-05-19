class Nytimes
  require 'fuzzystringmatch'
  fuzzy = FuzzyStringMatch::JaroWinkler.create(:native)




  def get_NYT
    uri = URI("https://api.nytimes.com/svc/topstories/v2/home.json")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    uri.query = URI.encode_www_form({
      "api-key" => "3ed9debd7fd447c1a4f39fd1fa0a3541",
      "callback" => "article"
    })
    request = Net::HTTP::Get.new(uri.request_uri)
    @result = JSON.parse(http.request(request).body)
    @results = @result["results"]
    return @results
  end


  def sort_us_politics (articles)
    result = []
    # result = ["article found", lastName, headline, blankHeadline, lastNames]
    lastNames = []
    articles.each do |article|
      if article['per_facet'] != [] && article['section'] === "U.S." && article['subsection'] === "Politics"
        headlineWords = article['title'].split(" ")
        lastName = article['per_facet'].first().split(",").first()
        lastNames.push(lastName)
        headline = article['title']
        headlineWords.each do |word|
          # if fuzzy.getDistance(lastName, word) > 0.8
          if lastName === word && result[0] != "article found"
            blankSpaceIndex = headlineWords.index(word)
            headlineWords.slice!(blankSpaceIndex)
            headlineWordsBlanked = headlineWords.insert(blankSpaceIndex, "________")
            blankHeadline = headlineWordsBlanked.join(" ")
            result.push(lastName, headline, blankHeadline)
            result.unshift("article found")
          end
        end
      end
    end
    lastNames.each do |name|
      if name === result[1]
        lastNames.delete_at(lastNames.index(name))
      end
    end
    result.push(lastNames)
    return result
  end
#
#   def sort_us_politics(articles)
#     results = []
#     articles.each do |article|
#       if result['section'] === "U.S." && result['subsection'] === "Politics" && fuzzy.getDistance(result['per_facet'].first(), 'johnson')
#
#
#
#       require 'fuzzystringmatch'
#       fuzzy = FuzzyStringMatch::JaroWinkler.create(:native)
#
#       headline = "Obama retires to Richard Branson's rich guy hideout."
#       name = "Obama, Barack"
#
#
#       headlineWords = headline.split(" ")
#       lastName = name.split(",").first()
#       # firstName = ...
#       allNames = name.split('"')
#
#
#       if headline.include?(lastName)
#
#
#
#       headlineWords.foreach do |headline_word|
#         if headline_word.include?(lastName)
#           if headlineWords[headlineWords.index(headline_word) - 1] =fuzzy= firstName
#             headlineWords.delete(headlineWords[headlineWords.index(headline_word) - 1])
#           end
#           headlineWords.insert(headlineWords.index(headline_word), "BLANK")
#           headlineWords.insert(headlineWords.rindex(headline_word), "BLANK")
#           headlineWords.delete(headline_word)
#         end
#
#
#
#
#       nameArray.foreach do |name|
#         if name.length <= 2
#           nameArray.slice!(nameArray.index(name))
#         end
#       end
#
#       headlineWords.foreach do |headline_word|
#         nameArray.foreach do |name_word|
#           if (fuzzy.getDistance(headline_word, name_word) > .8)
#
#
#
#         results.push(article)
#       end
#     end
#     return results
#   end
#
#
end
