
defmodule FoursquareVenues do
  
  use HTTPotion.Base

  defrecord VenuesURI, base: 'https://api.foursquare.com/v2/venues/'


  def process_url(url) do
    :string.concat VenuesURI.new.base, url
  end

  def process_response_body(body) do

    primitive_parse = :jsx.decode to_binary(body)
    parameters = convert_binary_keys_to_atoms_in primitive_parse
    # :orddict.from_list parameters
  
  end

  def convert_binary_keys_to_atoms_in ( list ) do

    Enum.map list, fn( inner_item ) ->
      case inner_item do

        item when is_list( item ) ->
          convert_binary_keys_to_atoms_in item
        
        { k, v } when is_list( v )  ->
          convert_binary_keys_to_atoms_in v
        
        { k, v } ->
          { binary_to_atom( k ), v }

        unknown ->
          unknown

      end
    end
    
  end

  @doc """
  Returns a list of venues near the locatin given, optionally matching the search term.

  Notices:
    * Make sure Foursquare.start has been called before.
    * Right now, search only supports userless-access. You need to provide your client_id, and client_secret

  Parameters:
    client_id: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
      (required) a token that identifies your foursquare application. 
      you can find it at <https://foursquare.com/developers/apps>

    client_secret: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
      (required) a token that authenticates your foursquare application. 
      you can find it at <https://foursquare.com/developers/apps>

    ll: "44.3,37.2" 
      required unless near is provided. Latitude and longitude of the user's location. (Required for query searches). Optional if using intent=global

    near: "Chicago, IL"
      required unless ll is provided. A string naming a place in the world.

    limit: 10
      Number of results to return, up to 50.

    intent: [ "checkin" | "browse" | "global" | "match" ]
      One of the values below, indicating your intent in performing the search. If no value is specified, defaults to checkin.

      checkin: 
        Finds results that the current user (or, for userless requests, a typical user) is likely to check in to at the provided ll at the current moment in time.
      browse:  
        Find venues within a given area. Unlike the checkin intent, browse searches an entire region instead of only finding Venues closest to a point. You must define a region to search be including either the ll and radius parameters, or the sw and ne. The region will be a spherical cap if you include the ll and radius parameters, or it will be a bounding quadrangle if you include the sw and ne parameters.
      global:  
        Finds the most globally relevant venues for the search, independent of location. Ignores all other parameters other than query and limit.
      match: 
        Finds venues that are are nearly-exact matches for the given query and ll. This is helpful when trying to correlate an existing place database with foursquare's. It is highly sensitive to the provided location. The results will be sorted best match first, taking distance and spelling mistakes/variations into account.

    radius: 800
      Limit results to venues within this many meters of the specified location. Defaults to a city-wide area. Only valid for requests with intent=browse.

    v: "20120916"
      A date in YYYYMMDD format for use of cache purposes.


  Returns:
      A complex List structure which is result of json decoding.

  Example:

      parameters = [
        ll: "41.004743,29.031544", 
        client_id: "YOUR_CLIENT_ID", 
        client_secret: "YOUR_CLIENT_KEY", 
        v: "20120916"
      ]

      FoursquareVenues.search parameters

      # =>
      [
        {"meta",[{"code",200}]},
        {"response",[{"venues",[
          [ {"id","4e210d0162e1964dbb63b74d"},
            {"name","Koşuyolu Köprüsü"},
            {"contact",[{}]},
            {"location", [
              {"address","E-5 üzeri, Koşuyolu"},
              {"lat",4.10043121131520251765e+01},
              {"lng",2.90339200326919595341e+01},
              {"distance",205},
              {"city","Istanbul"},
              {"country","Turkey"},
              {"cc","TR"}
            ]},
            {"categories",[
              [ {"id","4bf58dd8d48988d1df941735"},
                {"name","Bridge"},
                {"pluralName","Bridges"},
                {"shortName","Bridge"},
                {"icon",[
                  {"prefix","https://foursquare.com/img/categories_v2/parks_outdoors/bridge_"},
                  {"suffix",".png"}
                ]},
                {"primary",true}
              ]
            ]},
            {"verified",false},
            {"stats",[
              {"checkinsCount",3051},
              {"usersCount",1482},
              {"tipCount",4}
            ]},
            {"likes",[
              {"count",0},
              {"groups",[]}
            ]},
            {"specials",[
              {"count",0},
              {"items",[]}
            ]},
            {"hereNow",[
              {"count",2},
              {"groups",[[{"type","others"},{"name","Other people here"},{"count",2},{"items",[]}]]}
            ]},
            {"referralId","v-1347825739"}
          ],
          ... //some_more venue

  """
  def search( arguments // [] ) do

    search_uri = 'search?#{URI.encode_query( arguments )}'

    get( search_uri ).body

  end

  def test( "cekmekoy" ) do

    test "41.015268,29.139004" 

  end

  def test( "acibadem" ) do

    test "41.004,29.03"

  end

  def test( ll ) do

    search [
      ll: ll,
      client_id: "WIJ5B1CH1LM0XIE3Q1TDTAQCBXTJTBQE25MOAL4BL50SPS4H", 
      client_secret: "41XBSOAKTLNKEFAD0TCLXME2RUIZGUNFAOOO4TO0QNDZ2HDZ",
      v: "20120918"
    ]

  end
  

end
