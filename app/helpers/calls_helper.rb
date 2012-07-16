module CallsHelper
  def render_call_status(call)
    classname = "label"
    classname << " label-warning" if call.CallStatus != "ringing"
    classname << " label-success" if call.CallStatus != "in-progress"

    content_tag(:span, call.CallStatus, :class => classname)
  end
end
