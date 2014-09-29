
#Genre seeder
genre_url = 'http://api.trakt.tv/genres/shows.json/b6cb98c70268917b494f3ed68fd73720'
response = HTTParty.get(genre_url)
genres = JSON.parse(response.body)
many_shows = []

i = 0
id = 1
genres.each do |genre|
  genres[i]["id"] = id
  Genre.find_or_create_by(name: genre["name"])
  i += 1
  id += 1
end

genre_and_genre_id = Hash.new

genres.each do |genre|
  genre_and_genre_id[genre["name"]] = genre["id"]
end

show_url = 'http://api.trakt.tv/search/shows.json/b6cb98c70268917b494f3ed68fd73720?query=the'
response = HTTParty.get(show_url)
many_shows << JSON.parse(response.body)

show_url = 'http://api.trakt.tv/search/shows.json/df51bd1d01acd1352732bca955244eda?query=star'
response = HTTParty.get(show_url)
many_shows << JSON.parse(response.body)
many_shows.each do |shows|
  shows.each do |show|
    Show.find_or_create_by(name: show["title"], description: show["overview"], genre_id: genre_and_genre_id[show["genres"].first], year: show["year"])
  end
end

# User.create(username: "hah3", profile_photo: "string_url_of_photo")
# Review.create
