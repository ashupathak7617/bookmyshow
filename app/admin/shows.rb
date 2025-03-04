ActiveAdmin.register Show do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
    permit_params :show_time, :end_time, :movie_id, :theater_id, :screen_id
    config.batch_actions = false
  #
  # or
  #
  # permit_params do
  #   permitted = [:show_time, :movie_id, :theater_id, :screen_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

    # form do |f|
    #   f.inputs do
    #     f.input :movie
    #     f.input :screen, as: :nested_select,
    #      level_1: { 
    #       attribute: :theater,
    #       collection: Theater.all
    #     },
    #      level_2: { 
    #       attribute: :screen,
    #       collection: Screen.all
    #     }
    #     # f.input :show_time, as: :date_time_picker
    #   end
    #   f.actions
    # end

  # form do |f|
  #   f.inputs do
  #     f.input :movie
  #   end
  #   f.inputs Theater do
  #     f.has_many :screens, heading: false, allow_destroy: true do |a|
  #       a.input :screen_name
  #     end
  #   end
  #   f.actions
  # end

  form do |f|
    f.inputs do
      f.semantic_errors
      f.input :movie
      f.input :theater
      f.input :screen
      f.input :show_time, as: :datetime_picker 
      f.input :end_time, as: :datetime_picker 
    end
    f.actions
  end


  # controller do
  #    def create 
  #      screen_id = params[:show][:screen_id]
  #      start_time = params[:show][:show_time]
  #      end_time = params[:show][:end_time]
  #    end
  # end


end 
