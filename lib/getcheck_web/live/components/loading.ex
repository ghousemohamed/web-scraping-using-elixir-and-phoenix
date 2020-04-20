defmodule GetcheckWeb.Loading do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~L"""
      <div>
        <h1>Hello World from the phoenix application</h1>
        <h1><%= @text%></h1>
        <button phx-click="load">Click ME</button>
        <%= if @loading do %>
        <div class="spinner-border" role="status">
          <span class="sr-only">Loading...</span>
        </div>
        <% end %>
      </div>
    """
  end

  # icici_data: icici_data,
          # iob_data: iob_data,
          # loan_rates: loan_rates,
          # home_loan_rates: home_loan_rates,
          # credit_card_rates: credit_card_rates,
          # fd_rates: fd_rates
end