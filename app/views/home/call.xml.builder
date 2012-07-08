xml.instruct!
xml.Response do
    xml.Gather(:action => "selection", :numDigits => 1) do
        xml.Say "Hello my love"
        xml.Say "Press 1 for All Around You, Press 2 for Master Plan, Press 3 for Wagon Wheel, Press 4 for Flight 180, Press 5 for Only Fools Rush In"
    end
end
