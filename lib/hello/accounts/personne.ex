defmodule Hello.Accounts.Personne do
  use Ecto.Schema
  import Ecto.Changeset

  schema "personnes" do
    field :nom, :string
    field :prenom, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(personne, attrs) do
    personne
    |> cast(attrs, [:nom, :prenom])
    |> validate_required([:nom, :prenom])
  end
end
