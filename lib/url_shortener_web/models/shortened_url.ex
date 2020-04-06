defmodule UrlShortener.ShortenedUrl do
  use Ecto.Schema

  schema "shortened_urls" do
    field :code, :string
    field :url, :string
  end

  def changeset(shortened_url, params \\ %{}) do
    shortened_url
    |> Ecto.Changeset.cast(params, [:code, :url])
    |> Ecto.Changeset.validate_required([:code, :url])
  end

  def get_url(code) do
    UrlShortener.ShortenedUrl |> UrlShortener.Repo.get_by!(code: code)
  end
end