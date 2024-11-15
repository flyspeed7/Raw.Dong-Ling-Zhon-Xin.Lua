loadstring(game:HttpGet(("https://raw.githubusercontent.com/REDzHUB/LibraryV2/main/redzLib")))()
MakeWindow({
  Hub = {
    Title = "冬凌汉化队 | ESP",
    Animation = "汉化者:Q3E4 主作者:DyDno #4417"
  },
  Key = {
    KeySystem = false,
    Title = "密钥系统",
    Description = "和群公告的密钥一样",
    KeyLink = "群: 884776077",
    Keys = {"@XiaoL"},
    Notifi = {
      Notifications = true,
      CorrectKey = "正在加载 ESP...",
      Incorrectkey = "密钥正确加入中...",
      CopyKeyLink = "QQ 群已复制!"
    }
  }
})

local Main = MakeTab({Name = "冬凌汉化队 | Man's ESP"})
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESP:Toggle(true)
ESP.Players = false
ESP.Tracers = false
ESP.Boxes = false
ESP.Names = false
ESP.TeamColor = false
ESP.TeamMates = false



local Toggle = AddToggle(Main, {
  Name = "开启绘制",
  Default = false,
  Callback = function(Value)
    ESP.Players = Value
  end
})


local Toggle = AddToggle(Main, {
  Name = "绘制名字",
  Default = false,
  Callback = function(Value)
    ESP.Names = Value
  end
})


local Toggle = AddToggle(Main, {
  Name = "绘制盒子",
  Default = false,
  Callback = function(Value)
    ESP.Boxes = Value
  end
})


local Toggle = AddToggle(Main, {
  Name = "绘制射线",
  Default = false,
  Callback = function(Value)
    ESP.Tracers = Value
  end
})


local Toggle = AddToggle(Main, {
  Name = "团队检验",
  Default = false,
  Callback = function(Value)
    ESP.TeamColor = Value
  end
})


local Toggle = AddToggle(Main, {
  Name = "团队颜色",
  Default = false,
  Callback = function(Value)
ESP.TeamMates = Value
  end
})


AddColorPicker(Main, {
  Name = "自定义颜色",
  Default = Color3.fromRGB(255, 255, 0),
  Callback = function(Value)
    ESP.Color = Value
  end
})


