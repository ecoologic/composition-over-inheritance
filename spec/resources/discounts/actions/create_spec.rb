require 'spec_helper'

module Resources::Discounts
  RSpec.describe Actions::Create do
    subject(:action) { described_class.new(payload) }

    let :valid_payload do
      {
        'discount' => {
          'name'            => "Early bird",
          'description'     => "If you buy it early",
          'code'            => 'EB',
          'percentage'      => 10,
          'expiration_date' => Date.current + 1
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
  end
end
