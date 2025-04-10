# frozen_string_literal: true

require 'omniauth'
require 'ruby-saml'
require 'omniauth/strategies/xikolo_saml'

module OmniAuth
  module Strategies
    class EGovCampus < XikoloSAML
      info do
        {
          email: @attributes['urn:oid:0.9.2342.19200300.100.1.3'],
          name: full_name,
          user_name: @attributes['urn:oid:2.5.4.3'],
          user_id: @attributes['urn:oid:0.9.2342.19200300.100.1.1'],
        }
      end

      uid { @name_id }

      def full_name
        "#{@attributes['urn:oid:2.5.4.42']} #{@attributes['urn:oid:2.5.4.4']}"
      end
    end
  end
end

OmniAuth.config.add_camelization 'egovcampus', 'EGovCampus'
