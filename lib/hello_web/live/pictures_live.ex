defmodule HelloWeb.PicturesLive do
  use Phoenix.LiveView
  alias HelloWeb.Router.Helpers, as: Routes

  @pictures %{
    "ySMOWp3oBZk" => %{author: "Ludomił", img: "https://images.unsplash.com/photo-1515532718572-84a0ef89c998"},
    "svEN_5NXO3o" => %{author: "George Desipris", img: "https://images.unsplash.com/photo-1520765333005-1966cab37761"},
    "XesILKdmkwM" => %{author: "Ludomił", img: "https://images.unsplash.com/photo-1530717449302-271006cdc1bf"},
    "rgAAcndHGBc" => %{author: "Yuliya Kosolapova", img: "https://images.unsplash.com/photo-1547892549-e197e0456244"},
  }

  def render(assigns) do
    Phoenix.View.render(HelloWeb.PicturesView, "pictures.html", assigns)
  end

  # /pictures/:id
  def handle_params(%{"id" => id}, _uri, socket) do
    picture = @pictures[id]
    socket = socket
      |> assign(:selected_picture, picture)
      |> assign(:pictures, @pictures)
    {:noreply, socket}
  end

  # /pictures
  def handle_params(_, _uri, socket) do
    socket = socket
      |> assign(:selected_picture, nil)
      |> assign(:pictures, @pictures)
    {:noreply, socket}
  end

  def mount(_session, socket) do
    socket = assign(socket, :selected_picture, nil)
    {:ok, socket}
  end
end
