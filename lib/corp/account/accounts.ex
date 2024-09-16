defmodule Corp.Accounts do
  use Ash.Domain

  resources do
    resource Corp.Accounts.User
    resource Corp.Accounts.Token
  end
end
