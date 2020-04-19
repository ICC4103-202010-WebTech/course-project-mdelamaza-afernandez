class CreateReportEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :report_events do |t|

      t.timestamps
    end
  end
end
