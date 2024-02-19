defmodule Hello.Repo.Migrations.CreatePersonnes do
  use Ecto.Migration

  def change do
    create table(:personnes) do
      add :nom, :string
      add :prenom, :string

      timestamps(type: :utc_datetime)
    end
  end
end
