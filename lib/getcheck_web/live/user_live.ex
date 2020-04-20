defmodule GetcheckWeb.UserLive.Index do
  use Phoenix.LiveView
  alias Getcheck.Accounts
  alias Getcheck.Accounts.User
  alias Getcheck.Accounts.Photo
  alias Getcheck.Repo
  alias GetcheckWeb.Esl, as: Esl

  def render(assigns) do
    ~L"""
      <div>
        <h1><%= @value %> for all the CRUD Applications</h1>
        <button phx-click="create-user">Click me to create user</button>
        <button phx-click="get-user">Get User from Database</button>
      </div>
    """
  end

  def mount(_params, _session, socket) do
    Esl.fd_pnb()
    {:ok, assign(socket, value: "Hello World")}
  end

  def handle_event("create-user", _, socket) do
    new_user = %{name: "", email: "ghousemohamed@gmail.com", phone_number: "7397312496"}
    case Accounts.create_user(new_user) do
      {:ok, user} ->
        IO.inspect("User created Successfully")
        IO.inspect(user)
      
      {:error, %Ecto.Changeset{} = changeset} ->
        IO.inspect("Error Creating a user")
    end
    {:noreply, assign(socket, value: "Changing initital Value on click")}
  end

  def handle_event("get-user", _, socket) do
    user = %{name: "Ghouse", email: "email@rmail.com", password: "somepassword"}
    Accounts.custom_query(user)
    {:noreply, socket}
  end


end