require "securerandom"

module Support
  module MethodPatchMacro

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def with_module_method(mod, meth, &block)
        tag = SecureRandom.hex(8)
        orig_meth = "_#{tag}_#{meth}".to_sym
        before do
          mod.module_eval do
            alias_method orig_meth, meth
            define_method meth, &block
          end
        end
        after do
          mod.module_eval do
            alias_method meth, orig_meth
            remove_method orig_meth
          end
        end
      end
    end

  end
end
