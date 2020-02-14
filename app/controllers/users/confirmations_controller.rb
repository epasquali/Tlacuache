# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
   def show
     super do |resource|
       sign_in(resource) if (resource.errors.empty? && (resource.confirmation_sent_at > (DateTime.now - 2.hours)))
     end
   end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
   def after_confirmation_path_for(resource_name, resource)
     after_sign_in_path_for(resource)
   end
end
