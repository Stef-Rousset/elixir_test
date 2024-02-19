defmodule Hello.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Hello.Repo

  alias Hello.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  alias Hello.Accounts.Personne

  @doc """
  Returns the list of personnes.

  ## Examples

      iex> list_personnes()
      [%Personne{}, ...]

  """
  def list_personnes do
    Repo.all(Personne)
  end

  @doc """
  Gets a single personne.

  Raises `Ecto.NoResultsError` if the Personne does not exist.

  ## Examples

      iex> get_personne!(123)
      %Personne{}

      iex> get_personne!(456)
      ** (Ecto.NoResultsError)

  """
  def get_personne!(id), do: Repo.get!(Personne, id)

  @doc """
  Creates a personne.

  ## Examples

      iex> create_personne(%{field: value})
      {:ok, %Personne{}}

      iex> create_personne(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_personne(attrs \\ %{}) do
    %Personne{}
    |> Personne.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a personne.

  ## Examples

      iex> update_personne(personne, %{field: new_value})
      {:ok, %Personne{}}

      iex> update_personne(personne, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_personne(%Personne{} = personne, attrs) do
    personne
    |> Personne.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a personne.

  ## Examples

      iex> delete_personne(personne)
      {:ok, %Personne{}}

      iex> delete_personne(personne)
      {:error, %Ecto.Changeset{}}

  """
  def delete_personne(%Personne{} = personne) do
    Repo.delete(personne)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking personne changes.

  ## Examples

      iex> change_personne(personne)
      %Ecto.Changeset{data: %Personne{}}

  """
  def change_personne(%Personne{} = personne, attrs \\ %{}) do
    Personne.changeset(personne, attrs)
  end
end
