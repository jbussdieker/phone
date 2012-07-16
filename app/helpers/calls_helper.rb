module CallsHelper
  def render_call_status(call)
    classname = "badge"
    classname << " badge-success" if call.CallStatus != "completed"

    content_tag(:span, call.CallStatus, :class => classname)
  end
end
