defmodule Events.Types.Status do
  use Ash.Type

  @impl Ash.Type
  def storage_type(_), do: :integer

  @impl Ash.Type
  def cast_in_query?(_), do: true

  @impl Ash.Type
  def cast_input(value, _), do: to_type(value)

  @impl Ash.Type
  def cast_stored(value, _), do: to_type(value)

  @impl Ash.Type
  def dump_to_native(nil, _), do: {:ok, nil}
  def dump_to_native(:processing, _), do: {:ok, 0}
  def dump_to_native(:done, _), do: {:ok, 1}
  def dump_to_native(:error, _), do: {:ok, -1}

  def dump_to_native(_, _),
    do: {:error, "Invalid status value. Allowed values are :processing, :done, :error, or nil"}

  defp to_type(0), do: {:ok, :processing}
  defp to_type(1), do: {:ok, :done}
  defp to_type(-1), do: {:ok, :error}
  defp to_type(:processing), do: {:ok, :processing}
  defp to_type(:done), do: {:ok, :done}
  defp to_type(:error), do: {:ok, :error}
  defp to_type(nil), do: {:ok, nil}

  defp to_type(_),
    do: {:error, "Invalid status value. Allowed values are :processing, :done, :error, or nil"}
end
