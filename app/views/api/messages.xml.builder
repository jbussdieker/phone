xml.instruct!
xml.Response do
  if params["Digits"] == "0"
    xml.Redirect api_path
  elsif params["Digits"] == "7"
    xml.Say "Message deleted"
  end

  if @index == -1
    xml.Say "End of messages"
    xml.Redirect api_path
  else
    if @messages[@index].new == true
      xml.Say "New Message #{@index+1}"
    else
      xml.Say "Message #{@index+1}"
    end

    xml.Gather(:action => "/api/messages?index=#{@index}", :numDigits => 1) do
      xml.Play @messages[@index].url
      if @messages[@index].new == true
        xml.Say "Press 1 to keep this message new"
      end
      xml.Say "Press 4 for the previous message, Press 5 to replay this message, Press 6 for the next message, Press 7 to delete this message, Press 0 to return"
    end

    xml.Redirect "/api/messages?index=#{@index}"
  end
end
