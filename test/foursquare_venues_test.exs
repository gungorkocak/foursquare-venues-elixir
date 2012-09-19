Code.require_file "../test_helper", __FILE__

defmodule FoursquareVenuesTest do
  use ExUnit.Case

  def test( ll ) do

    search [
      ll: ll,
      client_id: "WIJ5B1CH1LM0XIE3Q1TDTAQCBXTJTBQE25MOAL4BL50SPS4H", 
      client_secret: "41XBSOAKTLNKEFAD0TCLXME2RUIZGUNFAOOO4TO0QNDZ2HDZ",
      v: "20120918"
    ]

  end

  test "search cekmekoy" do
    parameters = search
    
    assert true
  end
end
