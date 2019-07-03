defmodule HelloWeb.PicturesView do
  use HelloWeb, :view

  def picture_url(img, :thumb),
    do: "#{img}?w=250fit=crop"

  def picture_url(img, :big),
    do: "#{img}?w=800&h=500fit=crop"
end
