defmodule GetcheckWeb.Esl do
  @behaviour Crawly.Spider

  @impl Crawly.Spider
  def base_url() do
    "https://www.erlang-solutions.com"
  end

  @impl Crawly.Spider
  def init() do
    [
      start_urls: ["https://www.erlang-solutions.com/blog.html"]
    ]
  end

  @impl Crawly.Spider
  def parse_item(_response) do
    %Crawly.ParsedItem{:items => [], :requests => []}
  end

  def fetch_iob() do
    response = Crawly.fetch("https://www.iob.in/iob_Forex-rates.aspx")
    {:ok, document} = Floki.parse_document(response.body)
    data = Enum.map(2..14, fn(index) ->
      Enum.map(2..6, fn(inner_index) ->
        Floki.find(document, "table#ctl00_ContentPlaceHolder1_gv tr:nth-child(#{index}) td:nth-child(#{inner_index})") |> Floki.text
      end)
    end)
    data
  end

  def fetch_icici() do
    #ICICI

    response = Crawly.fetch("https://www.icicibank.com/nri-banking/money_transfer/money-transfer-rates.page")
    {:ok, document} = Floki.parse_document(response.body)
    data =  Enum.map(1..6, fn(index) -> 
      Enum.map(1..2, fn(inner_index) ->
        [first | _] = Floki.find(document, "div.table-container tbody tr:nth-child(#{index}) td:nth-child(#{inner_index})")
        Floki.text(first)
      end)
    end)
    data
  end
end