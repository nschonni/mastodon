# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    include Authorization
    include AccountableConcern

    layout 'admin'

    before_action :set_cache_headers
    before_action :set_referrer_policy_header

    after_action :verify_authorized

    private

    def set_cache_headers
      response.cache_control.replace(private: true, no_store: true)
    end

    def set_referrer_policy_header
      response.headers['Referrer-Policy'] = 'same-origin'
    end

    def set_user
      @user = Account.find(params[:account_id]).user || raise(ActiveRecord::RecordNotFound)
    end
  end
end
