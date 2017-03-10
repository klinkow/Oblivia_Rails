# class Nytimes
#   require 'fuzzystringmatch'
#   fuzzy = FuzzyStringMatch::JaroWinkler.create(:native)
#
#
#
#
#   def get_NYT
#     uri = URI("https://api.nytimes.com/svc/topstories/v2/home.json")
#     http = Net::HTTP.new(uri.host, uri.port)
#     http.use_ssl = true
#     uri.query = URI.encode_www_form({
#       "api-key" => ENV['NYT_TOP_STORIES'],
#       "callback" => "article"
#     })
#     request = Net::HTTP::Get.new(uri.request_uri)
#     @result = JSON.parse(http.request(request).body)
#     @results = @result["results"]
#     return @results
#   end
#
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
# end
