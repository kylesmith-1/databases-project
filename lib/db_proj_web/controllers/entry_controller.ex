defmodule DbProjWeb.EntryController do
  use DbProjWeb, :controller
  require Logger

  alias DbProj.Entries
  alias DbProj.Entries.Entry
  alias DbProj.Users
  alias DbProj.Companies
  alias DbProj.Coopterms

  def index(conn, _params) do
    entries = Entries.list_entries()
    render(conn, "index.html", entries: entries)
  end

  def new(conn, _params) do
    changeset = Entries.change_entry(%Entry{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"entry" => entry_params}) do
    if (String.downcase(entry_params["coopterm_id"]) === "spring") do
      entry_params_correct = %{entry_params | "coopterm_id" => 1}
      case Entries.create_entry(entry_params_correct) do
      {:ok, entry} ->
        conn
        |> put_flash(:info, "Entry created successfully.")
        |> redirect(to: Routes.entry_path(conn, :show, entry))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
      end
    else
      entry_params_correct = %{entry_params | "coopterm_id" => 2}
      case Entries.create_entry(entry_params_correct) do
      {:ok, entry} ->
        conn
        |> put_flash(:info, "Entry created successfully.")
        |> redirect(to: Routes.entry_path(conn, :show, entry))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
      end
    end 
  end

  def show(conn, %{"id" => id}) do
    entry = Entries.get_entry!(id)
    user = Users.get_user!(entry.user_id)
    company = Companies.get_company!(entry.company_id)
    coopterm = Coopterms.get_coopterm!(entry.coopterm_id)
    render(conn, "show.html", entry: entry, user: user, company: company, coopterm: coopterm)
  end

  def edit(conn, %{"id" => id}) do
    entry = Entries.get_entry!(id)
    user = "http://localhost:4000/users/"<> to_string(entry.user_id) <> "/edit"
    company = "http://localhost:4000/companies/"<> to_string(entry.company_id) <> "/edit"
    changeset = Entries.change_entry(entry)
    render(conn, "edit.html", entry: entry, user: user, company: company, changeset: changeset)
  end

  def update(conn, %{"id" => id, "entry" => entry_params}) do
    entry = Entries.get_entry!(id)

    case Entries.update_entry(entry, entry_params) do
      {:ok, entry} ->
        conn
        |> put_flash(:info, "Entry updated successfully.")
        |> redirect(to: Routes.entry_path(conn, :show, entry))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", entry: entry, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    entry = Entries.get_entry!(id)
    {:ok, _entry} = Entries.delete_entry(entry)

    conn
    |> put_flash(:info, "Entry deleted successfully.")
    |> redirect(to: Routes.entry_path(conn, :index))
  end
end
