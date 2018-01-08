module Resources::Discounts
  class Actions::Create
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
        name:        params['discount']['name'],
        description: params['discount']['description'],
        code:        params['discount']['code'],
        value:       params['discount']['percentage'],
        expires_on:  params['discount']['expiration_date']
      }
    end
  end
end
