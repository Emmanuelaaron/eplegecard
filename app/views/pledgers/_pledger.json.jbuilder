json.extract! pledger, :id, :name, :phonenumber, :amount, :expecteddate, :fullfilled, :created_at, :updated_at
json.url pledger_url(pledger, format: :json)
