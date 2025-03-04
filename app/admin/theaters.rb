ActiveAdmin.register Theater do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
    permit_params :name, :location
    config.batch_actions = false
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :location, :movies_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end


  # index do
  #   selectable_column
  #   id_column
  #   column :name
  #   column :location
  #   actions
  # end
  
  # show do
  #   attributes_table do
  #     row :name
  #     row :location
  #   end
  # end

  # controller do
  #   def index
  #     byebug
  #   end
  #   def show
  #    byebug
  #   end

  # end
end
