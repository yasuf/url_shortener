defmodule UrlShortenerWeb.ShortenedUrlController do
  use UrlShortenerWeb, :controller

  def show(conn, %{"code" => code}) do
    shortened_url = UrlShortener.ShortenedUrl.get_url(code)
    
    redirect(conn, external: shortened_url.url)
  end

  def create(conn, %{"url" => url}) do
    code = Shortener.generate_code(6)
    new_url = %UrlShortener.ShortenedUrl{}
    changeset = UrlShortener.ShortenedUrl.changeset(new_url, %{code: code, url: url})
    case UrlShortener.Repo.insert(changeset) do
      {:ok, url} ->
        conn
        |> put_status(:created)
    end
    json(conn, %{ code: code, url: url })
  end
end