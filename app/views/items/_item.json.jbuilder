json.extract! item, :id, :description, :logs , :academy, :created_at, :updated_at

if item.current != nil
  json.current do
    json.extract! item.current, :id, :item_id, :return_date, :lender_id, :borrower_id, :returned_to_id, :created_at, :updated_at, :due_date
    json.url log_url(item.current, format: :json)
  end
end

json.url item_url(item, format: :json)
