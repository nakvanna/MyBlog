defmodule BlogBackendWeb.Plug.Context do
  @behaviour Plug
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _) do
    context = build_context(conn)
    Absinthe.Plug.put_options(conn, context: context)
  end

  @doc """
  Return the current user context based on the authorization header
  """
  def build_context(conn) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, claims} <- BlogBackend.Guardian.decode_and_verify(token),
         {:ok, user} <- BlogBackend.Guardian.resource_from_claims(claims) do
      %{current_user: user}
    else
      _ -> %{}
    end
  end

end