module PolicyHelper
    include ApplicationHelper

    def manager?
        user&.roles == "manager"
    end

    def supervisor?
        user&.roles == "supervisor"
    end

    def security?
        user&.roles == "security"
    end

    def resident?
        user&.roles == "resident"
    end
    
end