defmodule DbProj.Coopterms do
  @moduledoc """
  The Coopterms context.
  """

  import Ecto.Query, warn: false
  alias DbProj.Repo

  alias DbProj.Coopterms.Coopterm

  @doc """
  Returns the list of coopterms.

  ## Examples

      iex> list_coopterms()
      [%Coopterm{}, ...]

  """
  def list_coopterms do
    Repo.all(Coopterm)
  end

  @doc """
  Gets a single coopterm.

  Raises `Ecto.NoResultsError` if the Coopterm does not exist.

  ## Examples

      iex> get_coopterm!(123)
      %Coopterm{}

      iex> get_coopterm!(456)
      ** (Ecto.NoResultsError)

  """
  def get_coopterm!(id), do: Repo.get!(Coopterm, id)

  @doc """
  Creates a coopterm.

  ## Examples

      iex> create_coopterm(%{field: value})
      {:ok, %Coopterm{}}

      iex> create_coopterm(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_coopterm(attrs \\ %{}) do
    %Coopterm{}
    |> Coopterm.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a coopterm.

  ## Examples

      iex> update_coopterm(coopterm, %{field: new_value})
      {:ok, %Coopterm{}}

      iex> update_coopterm(coopterm, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_coopterm(%Coopterm{} = coopterm, attrs) do
    coopterm
    |> Coopterm.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a coopterm.

  ## Examples

      iex> delete_coopterm(coopterm)
      {:ok, %Coopterm{}}

      iex> delete_coopterm(coopterm)
      {:error, %Ecto.Changeset{}}

  """
  def delete_coopterm(%Coopterm{} = coopterm) do
    Repo.delete(coopterm)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking coopterm changes.

  ## Examples

      iex> change_coopterm(coopterm)
      %Ecto.Changeset{data: %Coopterm{}}

  """
  def change_coopterm(%Coopterm{} = coopterm, attrs \\ %{}) do
    Coopterm.changeset(coopterm, attrs)
  end
end
