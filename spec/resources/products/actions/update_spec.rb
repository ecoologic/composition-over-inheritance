require 'spec_helper'

module Resources::Products
  RSpec.describe Actions::Update do
    subject(:action) { described_class.new(payload) }

    let :valid_payload do
      {
        'product_id' => 1,
        'product' => {
          'name' => "RC chopper",
          'description' => "It flies!"
        }
      }
    end

    before do
      allow(Server).to receive(:respond)
      allow(Notifier).to receive(:call)
    end

    context "With valid params" do
      let(:payload) { valid_payload }

      describe '#call' do
        it "responds with OK" do
          action.call

          expect(Server)
            .to have_received(:respond)
            .with(:ok, anything)
          expect(Notifier)
            .to have_received(:call)
        end
      end
    end

    context "With INVALID params" do
      let :payload do
        valid_payload.merge 'product' => {
                              'name' => nil, # Invalid
                              'description' => "It's nil" }
      end

      describe '#call' do
        it "responds with BAD REQUEST" do
          action.call

          expect(Server)
            .to have_received(:respond)
            .with(:bad_request, anything)
          expect(Notifier)
            .not_to have_received(:call)
        end
      end
    end
  end
end
