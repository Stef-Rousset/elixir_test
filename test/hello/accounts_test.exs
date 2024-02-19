defmodule Hello.AccountsTest do
  use Hello.DataCase

  alias Hello.Accounts

  describe "users" do
    alias Hello.Accounts.User

    import Hello.AccountsFixtures

    @invalid_attrs %{name: nil, age: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{name: "some name", age: 42}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.name == "some name"
      assert user.age == 42
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{name: "some updated name", age: 43}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.name == "some updated name"
      assert user.age == 43
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "personnes" do
    alias Hello.Accounts.Personne

    import Hello.AccountsFixtures

    @invalid_attrs %{nom: nil, prenom: nil}

    test "list_personnes/0 returns all personnes" do
      personne = personne_fixture()
      assert Accounts.list_personnes() == [personne]
    end

    test "get_personne!/1 returns the personne with given id" do
      personne = personne_fixture()
      assert Accounts.get_personne!(personne.id) == personne
    end

    test "create_personne/1 with valid data creates a personne" do
      valid_attrs = %{nom: "some nom", prenom: "some prenom"}

      assert {:ok, %Personne{} = personne} = Accounts.create_personne(valid_attrs)
      assert personne.nom == "some nom"
      assert personne.prenom == "some prenom"
    end

    test "create_personne/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_personne(@invalid_attrs)
    end

    test "update_personne/2 with valid data updates the personne" do
      personne = personne_fixture()
      update_attrs = %{nom: "some updated nom", prenom: "some updated prenom"}

      assert {:ok, %Personne{} = personne} = Accounts.update_personne(personne, update_attrs)
      assert personne.nom == "some updated nom"
      assert personne.prenom == "some updated prenom"
    end

    test "update_personne/2 with invalid data returns error changeset" do
      personne = personne_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_personne(personne, @invalid_attrs)
      assert personne == Accounts.get_personne!(personne.id)
    end

    test "delete_personne/1 deletes the personne" do
      personne = personne_fixture()
      assert {:ok, %Personne{}} = Accounts.delete_personne(personne)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_personne!(personne.id) end
    end

    test "change_personne/1 returns a personne changeset" do
      personne = personne_fixture()
      assert %Ecto.Changeset{} = Accounts.change_personne(personne)
    end
  end
end
