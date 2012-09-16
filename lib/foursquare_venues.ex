
defmodule FoursquareVenues do
  
  use HTTPotion.Base

  # def start do
  #   :ok = :application.start(:foursquare_venues)
  # end

  def process_url(url) do
    :string.concat 'https://api.foursquare.com/v2/venues/', url
  end

  def process_response_body(body) do
    json = :jsx.decode to_binary(body)
    json2 = Enum.map json, fn ({k, v}) -> { binary_to_atom(k), v } end
    :orddict.from_list json2
  end
  

end
