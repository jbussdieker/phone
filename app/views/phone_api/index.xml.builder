xml.instruct!
xml.Response do
    xml.Gather(:action => "other", :numDigits => 1) do
      xml.Say("Push a button!", :voice => "woman")
    end
end

