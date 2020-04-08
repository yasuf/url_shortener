defmodule UrlShortener.ShortenedUrl do
  use Ecto.Schema

  schema "shortened_urls" do
    field :code, :string
    field :url, :string
    
    timestamps()
  end

  def changeset(shortened_url, params \\ %{}) do
    shortened_url
    |> Ecto.Changeset.cast(params, [:code, :url])
    |> Ecto.Changeset.validate_required([:code, :url])
  end

  def get_url(code) do
    UrlShortener.ShortenedUrl |> UrlShortener.Repo.get_by!(code: code)
  end

  def create_url(code, url) do
    new_url = %UrlShortener.ShortenedUrl{}
    normalized_url = normalize_url(url)
    changeset = UrlShortener.ShortenedUrl.changeset(new_url, %{code: code, url: normalized_url})
    UrlShortener.Repo.insert(changeset)
  end

  def normalize_url(url) do
    if !String.match?(url, ~r/^https?:\/\//) do
      "http://" <> url
    else
      url
    end
  end
end