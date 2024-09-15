defmodule Corp.Support.Representative do
  use Ash.Resource,
    otp_app: :corp,
    domain: Corp.Support

  actions do
    defaults [:read, create: [:name]]
  end

  attributes do
    uuid_primary_key :id

    attribute :name, :string do
      allow_nil? false
      public? true
    end
  end

  relationships do
    has_many :tickets, Corp.Support.Ticket do
      public? true
    end
  end
end
