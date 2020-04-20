defmodule GetcheckWeb.RootLive do
  use Phoenix.LiveView
  alias GetcheckWeb.Esl, as: Esl

  def render(assigns) do
    ~L"""
    <div class="container" style="padding: 20px">
    <!-- Button trigger modal for icici-->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#icici_modal">
      Check ICICI Rates
    </button>
    <!-- Modal for ICICI -->
    <div class="modal fade" id="icici_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">ICICI Exchange Rates</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <table class="table">
              <thead>
                <tr>
                  <th scope="col">Country</th>
                  <th scope="col">Rates</th>
                </tr>
              </thead>
              <tbody>
                <%= for row <- @icici_data do %>
                  <tr>
                  <%= for item <- row do %>
                    <th scope="row"><%= item %></th>
                  <% end %>
                  </tr>
                <% end %>
              </tbody>
            </table>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#iob_modal">
      Check IOB Rates
    </button>
    <!-- Modal for IOB -->
    <div class="modal fade" id="iob_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">IOB Exchange Rates</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <table class="table">
              <thead>
                <tr>
                  <th scope="col">Currency</th>
                  <th scope="col" colspan="2">Selling Rate</th>
                  <th scope="col" colspan="2">Buying Rate</th>
                </tr>
              </thead>
              <thead>
                <tr>
                  <th scope="col">Country</th>
                  <th scope="col">TT</th>
                  <th scope="col">Bills</th>
                  <th scope="col">TT</th>
                  <th scope="col">Bills</th>
                </tr>
              </thead>
              <tbody>
                <%= for row <- @iob_data do %>
                  <tr>
                  <%= for item <- row do %>
                    <th scope="row"><%= item %></th>
                  <% end %>
                  </tr>
                <% end %>
              </tbody>
            </table>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    Esl.fd_iob()
    {:ok, assign(socket, icici_data: [[]], iob_data: [[]])}
  end

end