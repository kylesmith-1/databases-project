defmodule DbProjWeb.CooptermController do
  use DbProjWeb, :controller

  alias DbProj.Coopterms
  alias DbProj.Coopterms.Coopterm

  def index(conn, _params) do
    coopterms = Coopterms.list_coopterms()
    render(conn, "index.html", coopterms: coopterms)
  end

  def new(conn, _params) do
    changeset = Coopterms.change_coopterm(%Coopterm{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"coopterm" => coopterm_params}) do
    case Coopterms.create_coopterm(coopterm_params) do
      {:ok, coopterm} ->
        conn
        |> put_flash(:info, "Coopterm created successfully.")
        |> redirect(to: Routes.coopterm_path(conn, :show, coopterm))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    coopterm = Coopterms.get_coopterm!(id)
    render(conn, "show.html", coopterm: coopterm)
  end

  def edit(conn, %{"id" => id}) do
    coopterm = Coopterms.get_coopterm!(id)
    changeset = Coopterms.change_coopterm(coopterm)
    render(conn, "edit.html", coopterm: coopterm, changeset: changeset)
  end

  def update(conn, %{"id" => id, "coopterm" => coopterm_params}) do
    coopterm = Coopterms.get_coopterm!(id)

    case Coopterms.update_coopterm(coopterm, coopterm_params) do
      {:ok, coopterm} ->
        conn
        |> put_flash(:info, "Coopterm updated successfully.")
        |> redirect(to: Routes.coopterm_path(conn, :show, coopterm))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", coopterm: coopterm, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    coopterm = Coopterms.get_coopterm!(id)
    {:ok, _coopterm} = Coopterms.delete_coopterm(coopterm)

    conn
    |> put_flash(:info, "Coopterm deleted successfully.")
    |> redirect(to: Routes.coopterm_path(conn, :index))
  end
end
