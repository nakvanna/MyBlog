defmodule BlogBackend.Helpers.QueryUtil do
  import Ecto.Query, warn: false
  alias BlogBackend.Helpers.QueryUtil
  alias BlogBackend.Repo


  def query_where(args) do
    Enum.reduce(
      args.condition,
      dynamic(true),
      fn {key, value}, dynamic ->
        [field_string, operation] = String.split(key, ["-"])
        case operation do
          "eq" -> dynamic([p], ^dynamic and field(p, ^String.to_atom(field_string)) == ^value)
          "neq" -> dynamic([p], ^dynamic and field(p, ^String.to_atom(field_string)) != ^value)
          "gt" -> dynamic([p], ^dynamic and field(p, ^String.to_atom(field_string)) > ^value)
          "lt" -> dynamic([p], ^dynamic and field(p, ^String.to_atom(field_string)) < ^value)
          "gte" -> dynamic([p], ^dynamic and field(p, ^String.to_atom(field_string)) >= ^value)
          "lte" -> dynamic([p], ^dynamic and field(p, ^String.to_atom(field_string)) <= ^value)
          "ilike" -> dynamic([p], ^dynamic and ilike(field(p, ^String.to_atom(field_string)), ^"%#{value}%"))
          "like" -> dynamic([p], ^dynamic and like(field(p, ^String.to_atom(field_string)), ^"%#{value}%"))
          "in" -> dynamic([p], ^dynamic and field(p, ^String.to_atom(field_string)) in ^value)
        end
      end
    )
  end
  def query_where(args, tbl_alias) do
    Enum.reduce(
      args.condition,
      dynamic(true),
      fn {key, value}, dynamic ->
        [field_string, operation] = String.split(key, ["-"])
        case operation do
          "eq" ->
            dynamic([{^tbl_alias, p}], ^dynamic and field(p, ^String.to_atom(field_string)) == ^value)
          "neq" ->
            dynamic([{^tbl_alias, p}], ^dynamic and field(p, ^String.to_atom(field_string)) != ^value)
          "gt" ->
            dynamic([{^tbl_alias, p}], ^dynamic and field(p, ^String.to_atom(field_string)) > ^value)
          "lt" ->
            dynamic([{^tbl_alias, p}], ^dynamic and field(p, ^String.to_atom(field_string)) < ^value)
          "gte" ->
            dynamic([{^tbl_alias, p}], ^dynamic and field(p, ^String.to_atom(field_string)) >= ^value)
          "lte" ->
            dynamic([{^tbl_alias, p}], ^dynamic and field(p, ^String.to_atom(field_string)) <= ^value)
          "ilike" ->
            dynamic([{^tbl_alias, p}], ^dynamic and ilike(field(p, ^String.to_atom(field_string)), ^"%#{value}%"))
          "like" ->
            dynamic([{^tbl_alias, p}], ^dynamic and like(field(p, ^String.to_atom(field_string)), ^"%#{value}%"))
          "in" ->
            dynamic([{^tbl_alias, p}], ^dynamic and field(p, ^String.to_atom(field_string)) in ^value)
        end
      end
    )
  end

  def filter_order_by(args) do
    if Map.has_key?(args, :order_by) && check_value(args.order_by) do
      [atom, op] = Regex.split(~r{-}, args.order_by)

      case op do
        "desc" -> [desc: dynamic([p], field(p, ^String.to_atom(atom)))]
        "asc" -> dynamic([p], field(p, ^String.to_atom(atom)))
        _ -> []
      end
    else
      []
    end
  end
  def filter_order_by(args, tbl_alias) do
    if Map.has_key?(args, :order_by) && check_value(args.order_by) do
      [atom, op] = Regex.split(~r{-}, args.order_by)

      case op do
        "desc" -> [desc: dynamic([{^tbl_alias, p}], field(p, ^String.to_atom(atom)))]
        "asc" -> dynamic([{^tbl_alias, p}], field(p, ^String.to_atom(atom)))
        _ -> []
      end
    else
      []
    end
  end

  defp check_value(value) do
    value != nil && String.length(String.trim value) != 0
  end

  def apply_pagination(query, args) do
    count = query
            |> where(^QueryUtil.query_where(args))
            |> Repo.aggregate(:count, :id)
    result = query
             |> where(^QueryUtil.query_where(args))
             |> Absinthe.Relay.Connection.from_query(&Repo.all/1, args)
    {:ok, edges} = result
    {:ok, Map.put(edges, :count, count)}
  end
end