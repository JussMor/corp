defmodule CorpWeb.LiveCounter do
  use CorpWeb, :live_view

  def render(assigns) do
    ~H"""
    <div>
      <%!-- <.vue --%>
      <%!--   id="counter" --%>
      <%!--   count={@count} --%>
      <%!--   v-component="Counter" --%>
      <%!--   v-socket={@socket} --%>
      <%!--   v-ssr={true} --%>
      <%!--   v-on:inc={JS.push("inc")} --%>
      <%!-- /> check  --%>
      <.vue id="component" v-component="Component" v-socket={@socket} />
    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 10)}
  end

  def handle_event("inc", %{"value" => diff}, socket) do
    socket = update(socket, :count, &(&1 + diff * 2))

    {:noreply, socket}
  end
end
