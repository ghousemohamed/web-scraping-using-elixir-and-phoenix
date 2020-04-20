defmodule Getcheck.Cron do
    use GenServer
    alias GetcheckWeb.Esl


    def start_link do
      GenServer.start_link(__MODULE__, %{}, name: CronJob)    
    end

    def init(state) do
        run()
        {:ok, state}
    end

    def handle_info(:update, state) do
        IO.inspect("This is the scheduled event that will run every 60 seconds")
        run()
        {:noreply, state}
    end

    defp run do
       Process.send_after(self(), :update, 60_000)
        IO.inspect("Running this cron job every few minutes")
    end
end
