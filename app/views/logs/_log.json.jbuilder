json.extract! log, :id, :item_id, :return_date, :lender_id, :borrower_id, :returned_to_id, :created_at, :updated_at, :due_date

json.url log_url(log, format: :json)
