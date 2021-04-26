defmodule DbProj.CooptermsTest do
  use DbProj.DataCase

  alias DbProj.Coopterms

  describe "coopterms" do
    alias DbProj.Coopterms.Coopterm

    @valid_attrs %{term: "some term"}
    @update_attrs %{term: "some updated term"}
    @invalid_attrs %{term: nil}

    def coopterm_fixture(attrs \\ %{}) do
      {:ok, coopterm} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Coopterms.create_coopterm()

      coopterm
    end

    test "list_coopterms/0 returns all coopterms" do
      coopterm = coopterm_fixture()
      assert Coopterms.list_coopterms() == [coopterm]
    end

    test "get_coopterm!/1 returns the coopterm with given id" do
      coopterm = coopterm_fixture()
      assert Coopterms.get_coopterm!(coopterm.id) == coopterm
    end

    test "create_coopterm/1 with valid data creates a coopterm" do
      assert {:ok, %Coopterm{} = coopterm} = Coopterms.create_coopterm(@valid_attrs)
      assert coopterm.term == "some term"
    end

    test "create_coopterm/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Coopterms.create_coopterm(@invalid_attrs)
    end

    test "update_coopterm/2 with valid data updates the coopterm" do
      coopterm = coopterm_fixture()
      assert {:ok, %Coopterm{} = coopterm} = Coopterms.update_coopterm(coopterm, @update_attrs)
      assert coopterm.term == "some updated term"
    end

    test "update_coopterm/2 with invalid data returns error changeset" do
      coopterm = coopterm_fixture()
      assert {:error, %Ecto.Changeset{}} = Coopterms.update_coopterm(coopterm, @invalid_attrs)
      assert coopterm == Coopterms.get_coopterm!(coopterm.id)
    end

    test "delete_coopterm/1 deletes the coopterm" do
      coopterm = coopterm_fixture()
      assert {:ok, %Coopterm{}} = Coopterms.delete_coopterm(coopterm)
      assert_raise Ecto.NoResultsError, fn -> Coopterms.get_coopterm!(coopterm.id) end
    end

    test "change_coopterm/1 returns a coopterm changeset" do
      coopterm = coopterm_fixture()
      assert %Ecto.Changeset{} = Coopterms.change_coopterm(coopterm)
    end
  end
end
