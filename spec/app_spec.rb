require 'app'
require 'rspec'
require 'rack/test'

describe App do
  include Rack::Test::Methods

  def app
    App
  end


  it "should give the anagram of crepitus word" do
    get '/crepitus'
    expect(last_response.body).to eq("{\"crepitus\":[\"cuprites\",\"pictures\",\"piecrust\"]}")
  end

  it "should give the anagram of paste word" do
    get '/paste'
    expect(last_response.body).to eq("{\"paste\":[\"pates\",\"peats\",\"septa\",\"spate\",\"tapes\",\"tepas\"]}")
  end
it "should give the anagram of crepitus,paste word" do
    get '/crepitus,paste'
    expect(last_response.body).to eq("{\"crepitus\":[\"cuprites\",\"pictures\",\"piecrust\"],\"paste\":[\"pates\",\"peats\",\"septa\",\"spate\",\"tapes\",\"tepas\"]}")
  end

  it "should give the anagram of team's word" do
    get "/team's"
    expect(last_response.body).to eq("{\"team's\":[\"mate's\",\"meat's\"]}")
  end

  it "should return an empty array for non existing words" do
    get '/sdfwehrtgegfg'
    expect(last_response.body).to eq("{\"sdfwehrtgegfg\":[]}")
  end

  it "should not return the word he's as anagram in the array when the word is she" do
    get '/she'
    expect(last_response.body).not_to include("{\"she\":[\"he's\"]}")
  end

  it "should not return the word she as anagram in the array when the word is he's" do
    get "/he's"
    expect(last_response.body).not_to include("{\"he's\":[\"she\"]}")
  end

  it "should not return the word Meta as anagram in the array when the word is meat" do
    get '/meat'
    expect(last_response.body).not_to include("{\"meat\":[\"Meta\"]}")
  end

end