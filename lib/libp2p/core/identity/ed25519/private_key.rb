# frozen_string_literal: true

module Libp2p
  module Core
    module Identity
      module Ed25519
        ##
        # An Ed25519 secret key.
        #
        class PrivateKey
          def self.generate
            new ::Ed25519::SigningKey.generate
          end

          def initialize(lib_ed25519_signing_key)
            unless lib_ed25519_signing_key.instance_of? ::Ed25519::SigningKey
              raise TypeError, "Expected #{::Ed25519::SigningKey}, " \
                               "got #{lib_ed25519_signing_key.class}"
            end

            @lib_ed25519_signing_key = lib_ed25519_signing_key
          end

          def public_key
            PublicKey.new @lib_ed25519_signing_key.verify_key
          end

          def sign(message)
            @lib_ed25519_signing_key.sign message
          end
        end
      end
    end
  end
end
