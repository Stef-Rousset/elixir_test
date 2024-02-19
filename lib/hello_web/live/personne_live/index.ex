defmodule HelloWeb.PersonneLive.Index do
  use HelloWeb, :live_view

  alias Hello.Accounts
  alias Hello.Accounts.Personne

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :personnes, Accounts.list_personnes())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Personne")
    |> assign(:personne, Accounts.get_personne!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Personne")
    |> assign(:personne, %Personne{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Personnes")
    |> assign(:personne, nil)
  end

  @impl true
  def handle_info({HelloWeb.PersonneLive.FormComponent, {:saved, personne}}, socket) do
    {:noreply, stream_insert(socket, :personnes, personne)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    personne = Accounts.get_personne!(id)
    {:ok, _} = Accounts.delete_personne(personne)

    {:noreply, stream_delete(socket, :personnes, personne)}
  end
end
