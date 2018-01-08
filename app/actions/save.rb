class Actions::Save
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

  # Template Pattern

  def model
    # @model ||= Model.new(model_params)
    raise NotImplementedError
  end

  def model_params
    raise NotImplementedError
  end
end
