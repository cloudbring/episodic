FactoryGirl.define do
  sequence :trakt_id do |n|
    1426 + n
  end

  sequence :title do |n|
    "TV Show ##{n}"
  end

  factory :tvshow do
    title
    trakt_id
    poster_image "https://walter.trakt.us/images/shows/000/001/426/posters/medium/749eeff986.jpg"
  end

  factory :the_good_wife, class: Tvshow do
    title "The Good Wife"
    trakt_id 1426
    poster_image "https://walter.trakt.us/images/shows/000/001/426/posters/medium/749eeff986.jpg"
  end

end
