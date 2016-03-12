json.merge! book.attributes.reject { |k, v| [:id, :product_id, :created_at, :updated_at].include?(k.to_sym) }
