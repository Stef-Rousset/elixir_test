defmodule HelloWeb.PersonneLive.FormComponent do
  use HelloWeb, :live_component

  alias Hello.Accounts

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage personne records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="personne-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:nom]} type="text" label="Nom" />
        <.input field={@form[:prenom]} type="text" label="Prenom" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Personne</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{personne: personne} = assigns, socket) do
    changeset = Accounts.change_personne(personne)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"personne" => personne_params}, socket) do
    changeset =
      socket.assigns.personne
      |> Accounts.change_personne(personne_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"personne" => personne_params}, socket) do
    save_personne(socket, socket.assigns.action, personne_params)
  end

  defp save_personne(socket, :edit, personne_params) do
    case Accounts.update_personne(socket.assigns.personne, personne_params) do
      {:ok, personne} ->
        notify_parent({:saved, personne})

        {:noreply,
         socket
         |> put_flash(:info, "Personne updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_personne(socket, :new, personne_params) do
    case Accounts.create_personne(personne_params) do
      {:ok, personne} ->
        notify_parent({:saved, personne})

        {:noreply,
         socket
         |> put_flash(:info, "Personne created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
