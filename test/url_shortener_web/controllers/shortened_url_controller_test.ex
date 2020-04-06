defmodule UrlShortenerWeb.ShortenedUrlControllerTest do
  use UrlShortenerWeb.ConnCase

  test "GET /:code", %{conn: conn} do
    conn = get(conn, "/abc123")
  end
  assert html_response(conn, 200) =~ "Yolo swag!"
end
