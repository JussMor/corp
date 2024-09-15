defmodule Corp.Support do
  use Ash.Domain

  resources do
    resource Corp.Support.Ticket
    resource Corp.Support.Representative
  end
end
