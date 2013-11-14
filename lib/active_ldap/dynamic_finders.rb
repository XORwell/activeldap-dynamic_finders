require "active_ldap/dynamic_finders/version"
require 'active_support/concern'

module ActiveLdap
  module DynamicFinders
    
    extend ActiveSupport::Concern

    included do
      if self.superclass.eql?(ActiveLdap::Base)
        class << self

          # Respond to dynamic finders
          def respond_to?(meth)
            if meth.to_s =~ /^find_by_.*$/
              true
            else
              super
            end
          end
     
          private
     
          # Override method_missing to run dynamic finder
          def method_missing(meth, *args, &block)
            if meth.to_s =~ /^find_by_(.+)$/
              run_find_by_method(Regexp.last_match[1], *args)
            else
              super               
            end
          end
     
          # Run dynamic finder
          # @param [String] attrs (find_by attribute names)
          # @param [Array] args
          #
          # @return [type] [description]      
          def run_find_by_method(attrs, *args)
            attrs = attrs.split('_and_')
            attrs_with_args = [attrs, args].transpose
            conditions = Hash[attrs_with_args]
            self.find(:all, filter: [:and, conditions])
          end
        end
      end
    end
  end
end
