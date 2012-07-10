xml.instruct!
xml.Response do
    xml.Say("Knock Knock", :voice => "man")
    xml.Say("Who's there?", :voice => "woman")
    xml.Say("Cash", :voice => "man")
    xml.Say("Cash who?", :voice => "woman")
    xml.Say("No thanks, but I’d like some peanuts!", :voice => "man")
    xml.Redirect "call"
end

