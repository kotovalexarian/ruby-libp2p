# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Libp2p::Core::Multihash do
  subject(:multihash) { described_class.new multihash_string }

  let(:multihash_string) { Multihashes.encode digest_string, digest_method }
  let(:digest_string) { Digest::SHA256.digest message }
  let(:digest_method) { 'sha2-256' }
  let(:message) { 'Hello, World!' }

  specify do
    expect { multihash }.not_to raise_error
  end

  context 'when multihash string is invalid' do
    let :multihash_string do
      Multihashes.encode(digest_string, digest_method)[...-1]
    end

    specify do
      expect { multihash }.to raise_error(
        described_class::InvalidMultihashStringError,
        'Invalid multihash string',
      )
    end
  end
end
