defmodule BlogBackendWeb.Graphql.Middleware do
  @behaviour Absinthe.Middleware

  def call(resolution, roles) do
    with %{current_user: current_user} <- resolution.context, true <- correct_role(roles, current_user) do
      resolution
    else
      _ -> Absinthe.Resolution.put_result(resolution, {:error, "Unauthorized"})
    end
  end

  defp correct_role(:any, %{}), do: true
  defp correct_role(roles, %{role: role}) do
    Enum.member?(roles, role)
  end
  defp correct_role(_, _), do: false
end