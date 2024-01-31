class User < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name, 
                  against: [:first_name, :last_name], 
                  using: {
                    tsearch: { prefix: true }
                  }             
  pg_search_scope :search_by_email, 
                  against: [:email],
                  using: {
                    tsearch: { prefix: true }
                  }
  pg_search_scope :search_by_roles, 
                  against: [:roles],
                  using: {
                    tsearch: { prefix: true }
                  }
  pg_search_scope :search_by_phone, 
                  against: :contact_details,
                  using: {
                    tsearch: { prefix: true }
                  }
  pg_search_scope :search_all, 
                  against: [:email, :first_name, :last_name, :roles, :contact_details, :vehicle_details],
                  using: {
                    tsearch: { prefix: true }
                  }

  has_secure_password
  has_person_name
  store_accessor :contact_details, :phone, :work, :emergency_person_one, :emergency_person_one_number, :emergency_person_two, :emergency_person_two_number
  store_accessor :vehicle_details, :vehicle_company, :vehicle_model, :vehicle_color, :vehicle_plate_number

  generates_token_for :email_verification, expires_in: 2.days do
    email
  end
  generates_token_for :password_reset, expires_in: 20.minutes do
    password_salt.last(10)
  end


  has_many :sessions, dependent: :destroy
  has_many :events, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, allow_nil: true, length: { minimum: 8 }
  # validates :password, not_pwned: { message: "might easily be guessed" }

  normalizes :email, with: -> { _1.strip.downcase }

  before_validation if: :email_changed?, on: :update do
    self.verified = false
  end

  after_update if: :password_digest_previously_changed? do
    sessions.where.not(id: Current.session).delete_all
  end

  after_update if: :email_previously_changed? do
    events.create! action: "email_verification_requested"
  end

  after_update if: :password_digest_previously_changed? do
    events.create! action: "password_changed"
  end

  after_update if: [:verified_previously_changed?, :verified?] do
    events.create! action: "email_verified"
  end

end
