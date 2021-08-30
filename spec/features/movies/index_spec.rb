require 'rails_helper'
RSpec.describe "Movie index page" do
  before(:each)do
  user = User.create(email: 'hello@example.com', password: '1234')

  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  visit movies_path

  response_body = File.read('spec/fixtures/top_rated_1.json')
  stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1&region=US").
       with(
         headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Authorization'=>'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0Y2VmYTg1MDQxZjYwNjJjODkzZGNhZmNmYzFjOWU0OSIsInN1YiI6IjYxMmQ0MjViZDA0ZDFhMDA2NWU5NmJkYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.iptPkyYT4S15vd2ZZq4SUMXjFL0qo5umJHH_3mbr4J4',
        'User-Agent'=>'Faraday v1.7.0'
         }).
       to_return(status: 200, body: response_body, headers: {})

    response_body_2 = File.read('spec/fixtures/top_rated_2.json')
    stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1&region=US").
       with(
         headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Authorization'=>'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0Y2VmYTg1MDQxZjYwNjJjODkzZGNhZmNmYzFjOWU0OSIsInN1YiI6IjYxMmQ0MjViZDA0ZDFhMDA2NWU5NmJkYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.iptPkyYT4S15vd2ZZq4SUMXjFL0qo5umJHH_3mbr4J4',
        'User-Agent'=>'Faraday v1.7.0'
         }).
       to_return(status: 200, body: response_body_2, headers: {})
end

describe 'Movies Index Page' do
  it 'has button to find top rated movies' do
    expect(page).to have_button('Find Top Rated Movies')
  end

  it 'has form for search by title' do
    expect(page).to have_button('Find Top Rated Movies')
    expect(page).to have_field('filter')
  end
end

describe "Movie index page after user clicks 'Find Top Rate Movies' button" do
  it 'should return list of top rated movies with vote average' do
    click_on 'Find Top Rated Movies'
    
      expect(page).to have_content("Dilwale Dulhania Le Jayenge")
      expect(page).to have_content('8.8')
      expect(current_path).to eq(movies_path)
    end
  end
end
