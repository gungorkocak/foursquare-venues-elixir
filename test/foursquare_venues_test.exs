Code.require_file "../test_helper", __FILE__

defmodule FoursquareVenuesTest do
  use ExUnit.Case

  def mock_serch_with( ll ) do

    FoursquareVenues.search [
      ll: ll,
      client_id: "WIJ5B1CH1LM0XIE3Q1TDTAQCBXTJTBQE25MOAL4BL50SPS4H", 
      client_secret: "41XBSOAKTLNKEFAD0TCLXME2RUIZGUNFAOOO4TO0QNDZ2HDZ",
      v: "20120918"
    ]

  end

  test "search cekmekoy" do
    parameters = mock_serch_with "41.015268,29.139004" # this is "latitude,longitude"
    assert parameters[:meta][:code] == 200 # response should be ok.
    assert is_list(parameters[:response][:venues])
  end

  test "search acibadem" do
    parameters = mock_serch_with "41.004,29.03" # this is "latitude,longitude"
    assert parameters[:meta][:code] == 200 # response should be ok.
    assert is_list(parameters[:response][:venues])
  end
end
