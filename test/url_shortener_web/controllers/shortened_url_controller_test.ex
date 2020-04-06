defmodule UrlShortenerWeb.ShortenedUrlControllerTest do
  use UrlShortenerWeb.ConnCase

  test "show/2 redirects to the correct url from a code", %{conn: conn} do
    expected_url = "https://mytest.dev"
    UrlShortener.ShortenedUrl.create_url("abc123", expected_url)

    conn = get(build_conn(), "/abc123")

    assert redirected_to(conn) =~ expected_url
  end
end