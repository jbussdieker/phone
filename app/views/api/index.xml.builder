xml.instruct!
xml.Response do
    if @new_messages
      if @new_messages.count > 0
        xml.Say "You have #{pluralize(@new_messages.count, "new message")}"
      end
    end

    xml.Gather(:action => api_menu_path, :numDigits => 1) do
      xml.Play "http://api.twilio.com/2010-04-01/Accounts/ACe739cc5b6d5c37a5a23c10f50c1460a9/Recordings/REae62a7ac8e2132fc2fd8361528f4f249"
      xml.Say "Press 9 for voicemail"
    end
end
