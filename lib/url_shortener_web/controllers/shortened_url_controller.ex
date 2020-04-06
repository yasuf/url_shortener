defmodule UrlShortenerWeb.ShortenedUrlController do
  use UrlShortenerWeb, :controller

  def show(conn, %{"code" => code}) do
    shortened_url = UrlShortener.ShortenedUrl.get_url(code)
    
    redirect(conn, external: shortened_url.url)
  end

  def create(conn, %{"url" => url}) do
    code = Shortener.generate_code(6)
    case  UrlShortener.ShortenedUrl.create_url(code, url) do
      {:ok, url} ->
        conn
        |> put_status(:created)
    end
  end
end