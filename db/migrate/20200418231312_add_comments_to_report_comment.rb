class AddCommentsToReportComment < ActiveRecord::Migration[6.0]
  def change
    add_column :report_comments, :comment, :string
  end
end
