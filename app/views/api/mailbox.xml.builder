xml.instruct!
xml.Response do
    if params["Digits"] == "1"
      xml.Redirect "/api/messages?mailbox=#{@mailbox.id}"
    elsif params["Digits"] == "2"
      xml.Redirect "/api/message"
    end

    xml.Gather(:numDigits => 1) do
      if @new_messages.count > 0
        xml.Say "You have #{pluralize(@new_messages.count, "new message")}"
        if @saved_messages.count > 0
          xml.Say "and #{pluralize(@saved_messages.count, "saved message")}"
        end
      elsif @messages.count > 0
        xml.Say "You have #{pluralize(@messages.count, "message")}"
      else
        xml.Say "You have no messages"
      end

      if @messages.count > 0
        xml.Say "Press 1 to play your messages."
      end

      xml.Say "Press 2 to leave a message."
      xml.Redirect "/api"
    end
end
