defmodule DbProj.EntriesTest do
  use DbProj.DataCase

  alias DbProj.Entries

  describe "entries" do
    alias DbProj.Entries.Entry

    @valid_attrs %{additionalNotes: "some additionalNotes", continuousDrugTesting: true, drugTesting: true}
    @update_attrs %{additionalNotes: "some updated additionalNotes", continuousDrugTesting: false, drugTesting: false}
    @invalid_attrs %{additionalNotes: nil, continuousDrugTesting: nil, drugTesting: nil}

    def entry_fixture(attrs \\ %{}) do
      {:ok, entry} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Entries.create_entry()

      entry
    end

    test "list_entries/0 returns all entries" do
      entry = entry_fixture()
      assert Entries.list_entries() == [entry]
    end

    test "get_entry!/1 returns the entry with given id" do
      entry = entry_fixture()
      assert Entries.get_entry!(entry.id) == entry
    end

    test "create_entry/1 with valid data creates a entry" do
      assert {:ok, %Entry{} = entry} = Entries.create_entry(@valid_attrs)
      assert entry.additionalNotes == "some additionalNotes"
      assert entry.continuousDrugTesting == true
      assert entry.drugTesting == true
    end

    test "create_entry/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Entries.create_entry(@invalid_attrs)
    end

    test "update_entry/2 with valid data updates the entry" do
      entry = entry_fixture()
      assert {:ok, %Entry{} = entry} = Entries.update_entry(entry, @update_attrs)
      assert entry.additionalNotes == "some updated additionalNotes"
      assert entry.continuousDrugTesting == false
      assert entry.drugTesting == false
    end

    test "update_entry/2 with invalid data returns error changeset" do
      entry = entry_fixture()
      assert {:error, %Ecto.Changeset{}} = Entries.update_entry(entry, @invalid_attrs)
      assert entry == Entries.get_entry!(entry.id)
    end

    test "delete_entry/1 deletes the entry" do
      entry = entry_fixture()
      assert {:ok, %Entry{}} = Entries.delete_entry(entry)
      assert_raise Ecto.NoResultsError, fn -> Entries.get_entry!(entry.id) end
    end

    test "change_entry/1 returns a entry changeset" do
      entry = entry_fixture()
      assert %Ecto.Changeset{} = Entries.change_entry(entry)
    end
  end
end
