xml.instruct!
xml.Response do
    xml.Say "Begin recording after the beep. Press any key when finished."
    xml.Record(:action => "message")
end

