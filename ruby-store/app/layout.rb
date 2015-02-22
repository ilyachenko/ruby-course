module Layout
  def self.layout
    file = File.open("app/layout.html", "r")
    data = file.read
    file.close
    data = data.gsub("{{content}}", yield["content"])
    data = data.gsub("{{counter}}", "Visit counter: " + yield["counter"].to_s)
    if yield["last_visit"]
      data = data.gsub("{{last_visit}}", "(last visit " + yield["last_visit"].strftime("%d/%m/%Y %H:%M:%S").to_s + ")")
    else
      data = data.gsub("{{last_visit}}", "")
    end
    data
  end
end
