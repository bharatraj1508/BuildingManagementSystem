class AdminPolicy < ApplicationPolicy
    attr_reader :user, :record
  
    def initialize(user, record)
      raise Pundit::NotAuthorizedError, "must be logged in" unless user
      @user = user
      @record = record
    end
  
    private
  
    def super_admin
      return true if user.roles == "superadmin"
    end
  
    def admin
      return true if user.roles == "admin"
    end
  end