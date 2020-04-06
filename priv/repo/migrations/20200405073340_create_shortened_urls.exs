defmodule UrlShortener.Repo.Migrations.CreateShortenedUrls do
  use Ecto.Migration

  def change do
    create table(:shortened_urls) do
      add :code, :string, null: false
      add :url, :string, null: false

      timestamps()
    end

    create unique_index(:shortened_urls, [:code])
  end
end
