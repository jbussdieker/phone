xml.instruct!
xml.Response do
    xml.Say "Hello #{@caller}"
    xml.Gather(:action => api_menu_path, :numDigits => 1) do
      xml.Play "http://api.twilio.com/2010-04-01/Accounts/ACe739cc5b6d5c37a5a23c10f50c1460a9/Recordings/REae62a7ac8e2132fc2fd8361528f4f249"
      xml.Say "Press 5 for a new song I learned"
    end
end
