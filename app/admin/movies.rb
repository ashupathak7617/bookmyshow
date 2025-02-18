ActiveAdmin.register Movie do
   # remove_filter :image_attachments

  # insert_tag renderer_for(:index)
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :release_date, :image, :theaters_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :release_date, :theaters_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
   
  # form do |f|
  #   f.inputs do
  #     f.input :id, as: :hidden unless f.object.new_record?  # Required
  #     f.input :name
  #     f.input :release_date
  #     f.input :theaters, collection: Theater.all
  #     # ... other fields
  #   end
  #   f.actions
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
      f.input :release_date
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :release_date
      row :image do |ad|
        image_tag url_for(ad.image)
      end
    end
  end
end
