defmodule TidyTasking.Repo.Migrations.CreateListss do
  use Ecto.Migration

  def change do
    create table(:lists, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :status, :string

      timestamps()
    end
  end
end
