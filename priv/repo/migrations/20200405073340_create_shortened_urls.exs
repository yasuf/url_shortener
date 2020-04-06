defmodule UrlShortener.Repo.Migrations.CreateShortenedUrls do
  use Ecto.Migration

  def change do
    create table(:shortened_urls) do
      add :code, :string
      add :url, :string
    end
  end
end
