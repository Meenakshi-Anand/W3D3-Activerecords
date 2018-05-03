class AddTimeStamps < ActiveRecord::Migration[5.1]
  def change
    add_timestamps :visits, null: true
    add_timestamps :users, null: true
    add_timestamps :shortened_urls, null: true
  end
end
