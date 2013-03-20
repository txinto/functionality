class SubSystemsController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def show
    @sub_system = find_instance
    @functions = @sub_system.functions.
      search(params[:search], :title).
      order_by(parse_sort_param(:title, :function_type))
    if (params[:function_type]) then
      if (params[:function_type]!="") then
        @functions = @functions.function_type_is(params[:function_type])
      end
    end
    hobo_show
  end


end
