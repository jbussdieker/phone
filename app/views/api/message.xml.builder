xml.instruct!
xml.Response do
    xml.Say "Begin recording after the beep. Press any key when finished."
    xml.Record(:action => api_message_path)
    xml.Redirect "/api"
end

