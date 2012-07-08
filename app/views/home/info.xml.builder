xml.instruct!
xml.Response do
    xml.Gather(:action => "info", :numDigits => 1) do
        xml.Play "http://api.twilio.com/2010-04-01/Accounts/ACe739cc5b6d5c37a5a23c10f50c1460a9/Recordings/RE3f840a36c85fa2ad163e3eef7be72fb2"
    end
end

