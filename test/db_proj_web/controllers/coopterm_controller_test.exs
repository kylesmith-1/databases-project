defmodule DbProjWeb.CooptermControllerTest do
  use DbProjWeb.ConnCase

  alias DbProj.Coopterms

  @create_attrs %{term: "some term"}
  @update_attrs %{term: "some updated term"}
  @invalid_attrs %{term: nil}

  def fixture(:coopterm) do
    {:ok, coopterm} = Coopterms.create_coopterm(@create_attrs)
    coopterm
  end

  describe "index" do
    test "lists all coopterms", %{conn: conn} do
      conn = get(conn, Routes.coopterm_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Coopterms"
    end
  end

  describe "new coopterm" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.coopterm_path(conn, :new))
      assert html_response(conn, 200) =~ "New Coopterm"
    end
  end

  describe "create coopterm" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.coopterm_path(conn, :create), coopterm: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.coopterm_path(conn, :show, id)

      conn = get(conn, Routes.coopterm_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Coopterm"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.coopterm_path(conn, :create), coopterm: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Coopterm"
    end
  end

  describe "edit coopterm" do
    setup [:create_coopterm]

    test "renders form for editing chosen coopterm", %{conn: conn, coopterm: coopterm} do
      conn = get(conn, Routes.coopterm_path(conn, :edit, coopterm))
      assert html_response(conn, 200) =~ "Edit Coopterm"
    end
  end

  describe "update coopterm" do
    setup [:create_coopterm]

    test "redirects when data is valid", %{conn: conn, coopterm: coopterm} do
      conn = put(conn, Routes.coopterm_path(conn, :update, coopterm), coopterm: @update_attrs)
      assert redirected_to(conn) == Routes.coopterm_path(conn, :show, coopterm)

      conn = get(conn, Routes.coopterm_path(conn, :show, coopterm))
      assert html_response(conn, 200) =~ "some updated term"
    end

    test "renders errors when data is invalid", %{conn: conn, coopterm: coopterm} do
      conn = put(conn, Routes.coopterm_path(conn, :update, coopterm), coopterm: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Coopterm"
    end
  end

  describe "delete coopterm" do
    setup [:create_coopterm]

    test "deletes chosen coopterm", %{conn: conn, coopterm: coopterm} do
      conn = delete(conn, Routes.coopterm_path(conn, :delete, coopterm))
      assert redirected_to(conn) == Routes.coopterm_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.coopterm_path(conn, :show, coopterm))
      end
    end
  end

  defp create_coopterm(_) do
    coopterm = fixture(:coopterm)
    %{coopterm: coopterm}
  end
end
