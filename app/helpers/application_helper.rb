module ApplicationHelper

  def is_active_controller(controller_name, class_name = nil)
        puts params
        if params[:controller].include? controller_name
         class_name == nil ? "active" : class_name
        else
           nil
        end
    end

    def is_active_action(action_name)
        params[:action] == action_name ? "active" : nil
    end


  def m(amount, currency)
    Money.new(amount, currency).format
  end
end
