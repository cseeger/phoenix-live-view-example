defmodule HelloWeb.WelcomeLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <div>
      <h2><%= @salutation %></h2>
    </div>
    """
  end

  def mount(_session, socket) do
    salutation = "Welcome!!!"
    {:ok, assign(socket, salutation: salutation)}
  end
end
