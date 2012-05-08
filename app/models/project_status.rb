class ProjectStatus < Enum
  with_values %w(not_started on_going finalized cancelled)

  def self.active_values
    %w(not_started on_going)
  end
end