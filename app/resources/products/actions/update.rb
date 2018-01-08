module Resources::Products
  class Actions::Update < ::Actions::Save
    private

    def model
      @model ||= Model.new(model_params)
    end

    # Indirect mapping
    def model_params
      {
        id:          params['product_id'],
        name:        params['product']['name'],
        description: params['product']['description']
      }
    end
  end
end
