class CreateReportComments < ActiveRecord::Migration[6.0]
  def change
    create_table :report_comments do |t|

      t.timestamps
    end
  end
end
