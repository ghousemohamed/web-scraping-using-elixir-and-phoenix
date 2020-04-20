defmodule GetcheckWeb.Esl do

  alias GetcheckWeb.FdUrls, as: Urls
  @urls(Urls.getUrls)

  @behaviour Crawly.Spider

  @impl Crawly.Spider
  def parse_item(_response) do
    %Crawly.ParsedItem{:items => [], :requests => []}
  end
  
  def fd_iob() do
    response = Crawly.fetch(@urls["IOB"])
    {:ok, document} = Floki.parse_document(response.body)
    data = Enum.map(2..14, fn(index) ->
      Enum.map(1..3, fn(inner_index) ->
        Floki.find(document, "table tbody tr:nth-child(#{index}) td:nth-child(#{inner_index})") |> Floki.text
      end)
    end)
    IO.inspect(data)
  end

  def fd_icici() do
    response = Crawly.fetch(@urls["ICICI"])
    {:ok, document} = Floki.parse_document(response.body)
    data = Enum.map(1..17, fn(index) ->
      Enum.map(1..3, fn(inner_index) ->
        Floki.find(document, "div:nth-child(2) > div > div:nth-child(5) > div > table > tbody > tr:nth-child(#{index}) > td:nth-child(#{inner_index})") |> Floki.text   
      end)
    end)
    data_bulk = "Bulk data"
    IO.inspect(data)
  end

  def fd_hsbc() do
    response = Crawly.fetch(@urls["HSBC"])
    {:ok, document} = Floki.parse_document(response.body)
    data = Enum.map(2..27, fn(index) ->
      [
        Floki.find(document, "#pp_main_basicTable_1 > table > tbody > tr:nth-child(#{index}) > th") |> Floki.text,
        Floki.find(document, "#pp_main_basicTable_1 > table > tbody > tr:nth-child(#{index}) > td:nth-child(2)") |> Floki.text,
        Floki.find(document, "#pp_main_basicTable_1 > table > tbody > tr:nth-child(#{index}) > td:nth-child(3)") |> Floki.text
      ]
    end)
    IO.inspect(data)
  end

  def fd_sbi() do
    response = Crawly.fetch(@urls["SBI"])
    {:ok, document} = Floki.parse_document(response.body)
    data = Enum.map(2..9, fn(index) ->
      Enum.map(1..3, fn(inner_index) ->
        Floki.find(document, "#menu_0 > div.table-responsive > table > tbody > tr:nth-child(#{index}) > td:nth-child(#{inner_index})") |> Floki.text
      end)
    end)   
    IO.inspect(data)
  end

  def fd_indusind() do
    response = Crawly.fetch(@urls["IndusInd Bank"])
    {:ok, document} = Floki.parse_document(response.body)
     data = Enum.map(4..23, fn(index) ->
      Enum.map(1..5, fn(inner_index) ->
        Floki.find(document, "table:nth-child(2) > tbody > tr:nth-child(#{index}) > td:nth-child(#{inner_index})") |> Floki.text
      end)
    end) 
    IO.inspect(data)
  end

  def fd_bank_of_india() do
    response = Crawly.fetch(@urls["Bank of India"])
    {:ok, document} = Floki.parse_document(response.body)
     data = Enum.map(3..14, fn(index) ->
      Enum.map(1..3, fn(inner_index) ->
        Floki.find(document, "body > div.innercontent > div.container-fluid > div.midpannel.col-sm-9.col-md-9.col-xs-12.tab-content > div > ul > li:nth-child(1) > div > div > div > table > tbody > tr:nth-child(#{index}) > td:nth-child(#{inner_index})") |> Floki.text
      end)
    end) 
    IO.inspect(data)
  end

  def fd_syndicate() do
    response = Crawly.fetch(@urls["Syndicate Bank"])
    {:ok, document} = Floki.parse_document(response.body)
    {:ok, document} = Floki.parse_document(response.body)
    data = Enum.map(1..9, fn(index) ->
      Enum.map(2..6, fn(inner_index) ->
        Floki.find(document, "#block-custom-content > div > article > div > div.clearfix.text-formatted.field.field--name-body.field--type-text-with-summary.field--label-hidden.field__item > table:nth-child(3) > tbody > tr:nth-child(#{index}) > td:nth-child(#{inner_index})") |> Floki.text
      end)
    end) 
    IO.inspect(data)
  end

  def fd_union_bank_of_india() do
    response = Crawly.fetch(@urls["Union Bank of India"])
    {:ok, document} = Floki.parse_document(response.body)
    data = Enum.map(2..16, fn(index) ->
      Enum.map(1..2, fn(inner_index) ->
        Floki.find(document, "#fa-tab9 > table.fontfamilyarial.font12 > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(#{index}) > td:nth-child(#{inner_index})") |> Floki.text
      end)
    end) 
    IO.inspect(data)
  end

  def fd_pnb() do
    {:ok, response} = HTTPoison.get(@urls["Punjab National Bank"], [], [ssl: [{:verify, :verify_none}]])
    {:ok, document} = Floki.parse_document(response.body)
    data = Enum.map(2..17, fn(index) ->
      Enum.map(2..10, fn(inner_index) ->
        string = Floki.find(document, "table:nth-child(8) tbody tr:nth-child(#{index}) td:nth-child(#{inner_index})") |> Floki.text
        string = String.split(string, "\r\n\t\t\t\t\t\t\t\t\t\t")
        List.last(string)
      end)
    end) 
    IO.inspect(data)
  end

  def fd_city_union_bank() do
    {:ok, response} = HTTPoison.get(@urls["City Union Bank"], [], [ssl: [{:verify, :verify_none}]])
    {:ok, document} = Floki.parse_document(response.body)
    data = Enum.map(5..13, fn(index) ->
      Enum.map(1..2, fn(inner_index) ->
        Floki.find(document, "body > div.container > div > div > div > div:nth-child(2) > table > tbody > tr:nth-child(#{index}) > td:nth-child(#{inner_index})") |> Floki.text
      end)
    end) 
    IO.inspect(data)
  end

  def fd_central_bank_of_india() do
    response = Crawly.fetch(@urls["Central Bank of India"])
    {:ok, document} = Floki.parse_document(response.body)
    data = Enum.map(2..16, fn(index) ->
      Enum.map(2..4, fn(inner_index) ->
        Floki.find(document, "table.#ContentPlaceHolder1_dispgrid2 tr:nth-child(#{index}) td:nth-child(#{inner_index})") |> Floki.text
      end)
    end) 
    IO.inspect(data)
  end

  def fd_uco_bank() do
    #Less than 2crs.
    response = Crawly.fetch(@urls["UCO Bank"])
    {:ok, document} = Floki.parse_document(response.body)
    data = Enum.map(2..13, fn(index) ->
      Enum.map(2..3, fn(inner_index) ->
        Floki.find(document, "#mainbody > div.col-lg-9.col-sm-9.col-md-9.col-xs-12.text-justify.nopadding > div:nth-child(14) > table > tbody > tr:nth-child(#{index}) > td:nth-child(#{inner_index})") |> Floki.text
      end)
    end) 
    IO.inspect(data)
  end

  def fd_corp_bank() do
    {:ok, response} = HTTPoison.get(@urls["Corporation Bank"], [], [ssl: [{:verify, :verify_none}]])
    {:ok, document} = Floki.parse_document(response.body)
    data = Enum.map(2..16, fn(index) ->
      Enum.map(1..2, fn(inner_index) ->
        Floki.find(document, "table table table tr:nth-child(#{index}) td:nth-child(#{inner_index})") |> Floki.text
      end)
    end) 
    IO.inspect(data)
  end

  def fd_allahabad_bank() do
    {:ok, response} = HTTPoison.get(@urls["Allahabad Bank"], [], [ssl: [{:verify, :verify_none}]])
    {:ok, document} = Floki.parse_document(response.body)
    data = Enum.map(2..15, fn(index) ->
      Enum.map(1..2, fn(inner_index) ->
        Floki.find(document, "#feat > table:nth-child(2) > tbody > tr:nth-child(#{index}) > td:nth-child(#{inner_index})") |> Floki.text
      end)
    end) 
    IO.inspect(data)
  end  

  def fd_punjab_and_sind_bank() do
    response = Crawly.fetch(@urls["Punjab and Sind Bank"])
    {:ok, document} = Floki.parse_document(response.body)
    data = Enum.map(3..15, fn(index) ->
      Enum.map(1..2, fn(inner_index) ->
        Floki.find(document, "table:nth-child(5) tr:nth-child(#{index}) td:nth-child(#{inner_index})") |> Floki.text
      end)
    end) 
    IO.inspect(data)
  end 

  def fd_andhra_bank() do
    response = Crawly.fetch(@urls["Andhra Bank"])
    {:ok, document} = Floki.parse_document(response.body)
    data = Enum.map(2..16, fn(index) ->
      Enum.map(1..2, fn(inner_index) ->
        Floki.find(document, "table:nth-child(3) tbody tr:nth-child(5) td table tbody tr td div:nth-child(4) strong table tbody tr:nth-child(#{index}) td:nth-child(#{inner_index})") |> Floki.text
      end)
    end) 
    IO.inspect(data)
  end

  def fd_jk_bank() do
    response = Crawly.fetch(@urls["J&K Bank"])
    {:ok, document} = Floki.parse_document(response.body)
    data = Enum.map(2..11, fn(index) ->
      Enum.map(1..3, fn(inner_index) ->
        Floki.find(document, "#accordion1_1 > div > div:nth-child(2) > table:nth-child(1) > tbody > tr:nth-child(#{index}) > td:nth-child(#{inner_index})") |> Floki.text
      end)
    end) 
    IO.inspect(data)
  end
  
  def fd_south_indian_bank() do
    response = Crawly.fetch(@urls["South Indian Bank"])
    {:ok, document} = Floki.parse_document(response.body)
    data = Enum.map(3..11, fn(index) ->
      Enum.map(1..3, fn(inner_index) ->
        Floki.find(document, "div.panel.panel-primary div table.table.table-responsive.table-striped.table-bordered:nth-child(2) tr:nth-child(#{index}) td:nth-child(#{inner_index})") |> Floki.text
      end)
    end)  
    IO.inspect(data)
  end

  def fd_nainital_bank() do
    response = Crawly.fetch(@urls["Nainital Bank"])
    {:ok, document} = Floki.parse_document(response.body)
    data = Enum.map(3..15, fn(index) ->
      Enum.map(1..2, fn(inner_index) ->
        Floki.find(document, "#PglayoutGeneral1_GetPgContent1_lblContent > div.deposit > div:nth-child(2) > section > div:nth-child(1) > article > div:nth-child(3) > article > table > tbody > tr:nth-child(#{index}) > td:nth-child(#{inner_index})") |> Floki.text
      end)
    end)
    IO.inspect(data)
  end

  def fd_federal_bank() do
    response = Crawly.fetch(@urls["Federal Bank"])
    {:ok, document} = Floki.parse_document(response.body)
    data = Enum.map(2..10, fn(index) ->
      Enum.map(1..2, fn(inner_index) ->
        Floki.find(document, "table.common_Table:nth-child(3) tr:nth-child(#{index}) td:nth-child(#{inner_index})") |> Floki.text
      end)
    end)
    IO.inspect(data)
  end

  def fd_standard_chartered_bank() do
    response = Crawly.fetch(@urls["Standard Chartered Bank"])
    {:ok, document} = Floki.parse_document(response.body)
    data = Enum.map(1..4, fn(index) ->
      Enum.map(1..2, fn(inner_index) ->
        Floki.find(document, "#sc-lb-module-fee-and-rate-2-1 > div.table-wrapper > table > tbody > tr:nth-child(#{index}) > td:nth-child(#{inner_index})") |> Floki.text
      end)
    end)
    IO.inspect(data)
  end

  #Pending
  def fd_hdfc() do
    IO.inspect(@urls.hello)
    # response = Crawly.fetch("https://www.hdfcbank.com/personal/resources/rates")
    # {:ok, document} = Floki.parse_document(response.body)
    # data = Enum.map(1..50, fn(index) ->
    #   Enum.map(1..5, fn(inner_index) ->
    #     Floki.find(document, "table tbody tr:nth-child(#{index}) td:nth-child(#{inner_index})") |> Floki.text
    #   end)
    # end)
    # IO.inspect(data)
  end

  #Pending
  def fd_canara() do
    response = Crawly.fetch("https://canarabank.com/english/quick-access/interest-rates/deposit-accounts-rates-at-a-quick-glance-as-per-rbi-format/")
    {:ok, document} = Floki.parse_document(response.body)
    data = Floki.find(document, "table tbody tr:nth-child(1) td:nth-child(2)")
    IO.inspect(data)
  end

  #Pending
  def fd_dhanalakshmi_bank() do
    response = Crawly.fetch("https://www.dhanbank.com/header/interest_rates.aspx")
    {:ok, document} = Floki.parse_document(response.body)
    data = Enum.map(3..9, fn(index) ->
      Enum.map(1..2, fn(inner_index) ->
        Floki.find(document, "table:nth-child(9) tr:nth-child(#{index}) td:nth-child(#{inner_index})") |> Floki.text
      end)
    end)
    IO.inspect(data)
  end

  #Pending
  def fd_yes_bank() do
    response = Crawly.fetch("https://www.yesbank.in/personal-banking/yes-individual/deposits/fixed-deposit-residents")
    {:ok, document} = Floki.parse_document(response.body)   
    IO.inspect(document) 
    data = Floki.find(document, "#wrapper > div:nth-child(10) > div > div:nth-child(6) > table > tbody > tr:nth-child(5) > td:nth-child(1)") |> Floki.text
    IO.inspect(data)
  end

  #Pending
  def fd_idbi() do
    response = Crawly.fetch("https://www.idbibank.in/interest-rates.asp/")
    {:ok, document} = Floki.parse_document(response.body)
    IO.inspect(document)
  end

  #Pending
  def fd_bank_of_baroda() do
    #Below 2cr
    response = Crawly.fetch("https://www.bankofbaroda.in/interest-rates-charges.htm")
    {:ok, document} = Floki.parse_document(response.body)
    data = Floki.find(document, "table.tableData.intresrateTwoCol tbody tr:nth-child(1) td:nth-child(1) ")
    IO.inspect(data)
    # data = Floki.find(document, "") |> Floki.text
    # IO.inspect(data)
    # "#tab-1 > div:nth-child(2) > table > tbody > tr:nth-child(1) > td:nth-child(1)"
    #Above 2cr
    #Above 10cr
  end

  #Pending
  def fd_kvb() do
    response = Crawly.fetch("https://www.kvb.co.in/interest-rates/resident-nro-deposits")
    {:ok, document} = Floki.parse_document(response.body)
    IO.inspect(document)
    data = Floki.find(document, "table.table.table-bordered") |> Floki.text
    IO.inspect(data)
  end

  #Pending
  def fd_kotak() do
    response = Crawly.fetch("http://www.kotak.com/bank/common/allrates.htm")
    {:ok, document} = Floki.parse_document(response.body)
    # data = Floki.find(document, "table tr:nth-child(1) td:nth-child(1)") |> Floki.text  
    data = Floki.find(document, "table tbody tr:nth-child(2) td table:nth-child(3) tbody tr:nth-child(4) td:nth-child(1)") |> Floki.text 
    data = Floki.find(document, "") |> Floki.text 
    IO.inspect(data) 
  end

  #Pending
  def fd_citibank() do
    response = Crawly.fetch("https://www.online.citibank.co.in/products-services/investments/deposits/deposits.htm")
    {:ok, document} = Floki.parse_document(response.body)
    data = Floki.find(document, " div.tabContentWrap > div.tabContent.active_content > div:nth-child(3) > div > div > div > table > tbody > tr:nth-child(1) > td:nth-child(2)") |> Floki.text 
    IO.inspect(data)
  end
  
end