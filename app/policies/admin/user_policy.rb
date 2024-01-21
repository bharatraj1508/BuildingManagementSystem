module Admin
    class UserPolicy < AdminPolicy
        def create?
            admin || super_admin
        end
    end
end