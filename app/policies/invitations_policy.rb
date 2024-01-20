module Admin
    class InvitationsPolicy < AdminPolicy
        def create?
            admin
        end
    end
end