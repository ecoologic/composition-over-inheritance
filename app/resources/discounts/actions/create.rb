module Resources::Discounts
  class Actions::Create < ::Actions::Save
    private

    def model
      @model ||= Model.new(model_params)
    end

    # Indirect mapping
    def model_params
      {
        name:        params['discount']['name'],
        description: params['discount']['description'],
        code:        params['discount']['code'],
        value:       params['discount']['percentage'],
        expires_on:  params['discount']['expiration_date']
      }
    end
  end
end
