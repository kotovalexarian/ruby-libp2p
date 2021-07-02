# frozen_string_literal: true

module Libp2p
  module Core
    ##
    # Validated multihash wrapper.
    #
    class Multihash
      def initialize(multihash_string)
        multihash_string = String(multihash_string).freeze
        ::Multihashes.decode multihash_string
        @string = multihash_string
      rescue ::Multihashes::DigestLengthError,
             ::Multihashes::HashFunctionNotImplemented
        raise InvalidMultihashStringError, 'Invalid multihash string'
      end

      class InvalidMultihashStringError < RuntimeError; end
    end
  end
end
