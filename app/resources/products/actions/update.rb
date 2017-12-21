module Resources::Products
  class Actions::Update
    def initialize(params)
      @params = params
    end

    def call
      if model.valid?
        model.save!
        Notifier.call(self, model)
        Server.respond(:ok, model)
      else
        Server.respond(:bad_request, errors: model.errors)
      end
    end

    private

    attr_reader :params

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
