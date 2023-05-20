# class Ability
#   include CanCan::Ability

#   def initialize(user)
#     if user.admin?
#       can :manage, :all
#     elsif user.doctor?
#       can :manage, Appointment, doctor_id: user.id
#       can :read, User
#       can :create, Recommendation
#     elsif user.patient?
#       can :create, Appointment
#       can :read, Doctor
#       can :read, Recommendation, appointment: { user_id: user.id }
#     end
#   end
# end
