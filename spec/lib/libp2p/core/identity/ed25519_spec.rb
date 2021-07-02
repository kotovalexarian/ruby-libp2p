# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Libp2p::Core::Identity::Ed25519 do
  specify do
    private_key = described_class::PrivateKey.generate
    public_key = private_key.public_key

    message = 'Hello, World!'
    signature = private_key.sign message
    expect(public_key.verify(message, signature)).to equal true
  end

  specify do
    expect { described_class::PrivateKey.new 123 }.to raise_error(
      TypeError,
      "Expected #{::Ed25519::SigningKey}, got #{Integer}",
    )
  end

  specify do
    expect { described_class::PublicKey.new 123 }.to raise_error(
      TypeError,
      "Expected #{::Ed25519::VerifyKey}, got #{Integer}",
    )
  end
end
