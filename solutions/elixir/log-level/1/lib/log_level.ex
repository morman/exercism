defmodule LogLevel do
  # return the logging code label, based on log level and legacy support
  def to_label(level, legacy?) do
    cond do
      level == 0 && !legacy? -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 && !legacy? -> :fatal
      # having found nothing else true yet, we have an unknown log level
      true -> :unknown
    end
  end

  # send alert to ops, dev1, or dev2 team based on error type
  def alert_recipient(level, legacy?) do
    cond do
      to_label(level, legacy?) == :error -> :ops
      to_label(level, legacy?) == :fatal -> :ops
      to_label(level, legacy?) == :unknown && legacy? -> :dev1
      to_label(level, legacy?) == :unknown && !legacy? -> :dev2
      # having found nothing else true yet, we have a false alert
      true -> false
    end
  end
end
