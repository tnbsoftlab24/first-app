class UserPolicy < ApplicationPolicy

    def index?
      user.admin?
    end
  
    def show?
      true
    end
  
  end
  