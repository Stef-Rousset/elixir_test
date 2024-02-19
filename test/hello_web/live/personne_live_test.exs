defmodule HelloWeb.PersonneLiveTest do
  use HelloWeb.ConnCase

  import Phoenix.LiveViewTest
  import Hello.AccountsFixtures

  @create_attrs %{nom: "some nom", prenom: "some prenom"}
  @update_attrs %{nom: "some updated nom", prenom: "some updated prenom"}
  @invalid_attrs %{nom: nil, prenom: nil}

  defp create_personne(_) do
    personne = personne_fixture()
    %{personne: personne}
  end

  describe "Index" do
    setup [:create_personne]

    test "lists all personnes", %{conn: conn, personne: personne} do
      {:ok, _index_live, html} = live(conn, ~p"/personnes")

      assert html =~ "Listing Personnes"
      assert html =~ personne.nom
    end

    test "saves new personne", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/personnes")

      assert index_live |> element("a", "New Personne") |> render_click() =~
               "New Personne"

      assert_patch(index_live, ~p"/personnes/new")

      assert index_live
             |> form("#personne-form", personne: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#personne-form", personne: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/personnes")

      html = render(index_live)
      assert html =~ "Personne created successfully"
      assert html =~ "some nom"
    end

    test "updates personne in listing", %{conn: conn, personne: personne} do
      {:ok, index_live, _html} = live(conn, ~p"/personnes")

      assert index_live |> element("#personnes-#{personne.id} a", "Edit") |> render_click() =~
               "Edit Personne"

      assert_patch(index_live, ~p"/personnes/#{personne}/edit")

      assert index_live
             |> form("#personne-form", personne: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#personne-form", personne: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/personnes")

      html = render(index_live)
      assert html =~ "Personne updated successfully"
      assert html =~ "some updated nom"
    end

    test "deletes personne in listing", %{conn: conn, personne: personne} do
      {:ok, index_live, _html} = live(conn, ~p"/personnes")

      assert index_live |> element("#personnes-#{personne.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#personnes-#{personne.id}")
    end
  end

  describe "Show" do
    setup [:create_personne]

    test "displays personne", %{conn: conn, personne: personne} do
      {:ok, _show_live, html} = live(conn, ~p"/personnes/#{personne}")

      assert html =~ "Show Personne"
      assert html =~ personne.nom
    end

    test "updates personne within modal", %{conn: conn, personne: personne} do
      {:ok, show_live, _html} = live(conn, ~p"/personnes/#{personne}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Personne"

      assert_patch(show_live, ~p"/personnes/#{personne}/show/edit")

      assert show_live
             |> form("#personne-form", personne: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#personne-form", personne: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/personnes/#{personne}")

      html = render(show_live)
      assert html =~ "Personne updated successfully"
      assert html =~ "some updated nom"
    end
  end
end
