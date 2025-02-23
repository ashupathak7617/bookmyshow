ActiveAdmin.register Seat do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :seat_no, :screen_id, :status
   config.batch_actions = false
  #
  # or
  #
  # permit_params do
  #   permitted = [:seat_no, :screen_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
