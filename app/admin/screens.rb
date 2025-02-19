ActiveAdmin.register Screen do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :screen_name, :theater_id
   # config.batch_actions = false
  #
  # or
  #
  # permit_params do
  #   permitted = [:screen_name, :theater_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column :screen_name
    column :theater_id
    
    actions
  end
  # form do |f|
  #   f.inputs do
  #     f.input :first_name
  #     f.input :last_name, required: false
  #     f.input :email
  #   end
  #   f.actions
  # end

  


  
end
