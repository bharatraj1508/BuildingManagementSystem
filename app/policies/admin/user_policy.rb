module Admin
    class UserPolicy < AdminPolicy
        # include PolicyHelper

        def create?
            only_user_admins_and_admins?
        end

        def new?
            only_user_admins_and_admins?
        end

        def index?
            admin || super_admin
        end

        def destroy?
            super_admin
        end

        def update_roles?
            only_user_admins_and_admins?
        end

        def only_super_admin?
            super_admin
        end

        def only_admins?
            admin || super_admin
        end

        private
        
        def only_user_admins_and_admins?
            admin || super_admin || manager? || supervisor?
        end
        
    end
end