# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Libp2p::Core::Identity::Ed25519 do
  let(:private_key) { described_class::PrivateKey.generate }
  let(:public_key) { private_key.public_key }

  let(:message) { 'Hello, World!' }

  let(:signature) { private_key.sign message }

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

  specify do
    expect(public_key.verify(message, signature)).to equal true
  end

  context 'with other message' do
    let(:other_message) { 'Hi, Universe!' }

    specify do
      expect(public_key.verify(other_message, signature)).to equal false
    end
  end

  context 'with other signature' do
    let :other_signature do
      other_signature = signature.dup
      index = rand other_signature.length

      other_signature[index] =
        if other_signature[index] == "\0"
          "\1"
        else
          (other_signature[index].ord - 1).chr
        end

      other_signature
    end

    specify do
      expect(public_key.verify(message, other_signature)).to equal false
    end
  end
end
