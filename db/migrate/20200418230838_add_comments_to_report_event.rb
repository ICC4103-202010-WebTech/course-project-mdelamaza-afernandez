class AddCommentsToReportEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :report_events, :coment, :string
  end
end
