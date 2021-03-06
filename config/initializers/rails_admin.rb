RailsAdmin.config do |config|

  # == Cancan ==
  config.authorize_with :cancan
  config.current_user_method &:current_user

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
