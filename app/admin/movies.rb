ActiveAdmin.register Movie do
   # remove_filter :image_attachments

  # insert_tag renderer_for(:index)
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :release_date, :image
  config.batch_actions = false
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :release_date, :theaters_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  index do
    selectable_column
    id_column
    column :name
    column :release_date
    column :image, as: :file
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :release_date, as: :datetime_picker
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :release_date
      row :image do |ad|
        image_tag url_for(ad.image),size: "200x200"
      end
    end
  end
end
