ActiveAdmin.register Seat do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :seat_no, :screen_id, :create_seat,:status
   config.batch_actions = false
  #
  # or
  #
  # permit_params do
  #   permitted = [:seat_no, :screen_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs do
      f.input :screen
      f.input :seat_no, placeholder:"Enter number of seats you want to create"
    end
    f.actions
  end


  controller do
     def create 
      screen_id = params[:seat][:screen_id].to_i
      seat_create = params[:seat][:seat_no].to_i
      Seat.create_seats(screen_id, seat_create)
      redirect_to "/admin/seats"
     end
  end
  
end
