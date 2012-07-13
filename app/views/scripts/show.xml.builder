xml.instruct!
xml.Response do
  xml.Say "Running the #{@script.name} script"
  @script.items.each do |item|
    if item.type_id == 1
      xml.Say(item.value, :voice => "man")
    elsif item.type_id == 2
      xml.Say(item.value, :voice => "woman")
    elsif item.type_id == 3
      xml.Play item.value
    elsif item.type_id == 8
      xml.Redirect "scripts/#{item.value}.xml"
    end
  end
end

