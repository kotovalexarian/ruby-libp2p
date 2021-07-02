# frozen_string_literal: true

module Libp2p
  module Core
    module Identity
      module Ed25519
        ##
        # An Ed25519 public key.
        #
        class PublicKey
          def initialize(lib_ed25519_verify_key)
            unless lib_ed25519_verify_key.instance_of? ::Ed25519::VerifyKey
              raise TypeError, "Expected #{::Ed25519::VerifyKey}, " \
                               "got #{lib_ed25519_verify_key.class}"
            end

            @lib_ed25519_verify_key = lib_ed25519_verify_key
          end

          def verify(message, signature)
            @lib_ed25519_verify_key.verify signature, message
          end
        end
      end
    end
  end
end
