class Users::InvitationsPolicy < ApplicationPolicy

    def index?
      user.has_attribute?(:admin)
    end
  
    # GET /structures/1
    # GET /structures/1.json
    def show?
      authorize @user
    end
  
    # GET /structures/new
    def new?
      user.has_role?(:admin)
    end
  
  
    def edit?
      user.has_role?(:manager)
    end

  
  
  end