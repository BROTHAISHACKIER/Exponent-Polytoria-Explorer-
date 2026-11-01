local Selected = world
local Ignore = {}
local Objects = game and game.HttpGet and loadstring and loadstring(game:HttpGet("https://raw.githubusercontent.com/BROTHAISHACKIER/PolyUse/refs/heads/main/objects.lua"))() or require(script.Objects)
local Icons = game and game.HttpGet and loadstring and loadstring(game:HttpGet("https://raw.githubusercontent.com/BROTHAISHACKIER/PolyUse/refs/heads/main/icons.lua"))() or require(script.Icons)
local LoadedIcons = {}
local function RandomString()
    local Chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$¤%&/{[()]}=?+-\\'¨.,<>| §"
    local Result = ""

    for i = 1, math.random(30,50) do
        local Index = math.random(1, #Chars)
        Result = Result .. Chars:sub(Index, Index)
    end

    return Result
end
local GUI = Instance.New("GUI",PlayerGUI)
GUI.Name = RandomString()
GUI.AvoidCoreUI = true
table.insert(Ignore,GUI)

local Loader = Instance.New("UILabel", GUI)

local Amount = #Icons
for _ in pairs(Icons) do
    Amount += 1
end
for i,v in pairs(Icons) do
	local Asset = PTImageAsset.New()
	Asset.ImageID = v
	LoadedIcons[i] = Asset
end
local Index = 0
Loader.Text = "Loading Assets "..Index.."/"..Amount
for _,v in pairs(LoadedIcons) do
	Index += 1
	if v.Loading then
		v.Loaded:Wait()
	end
	Loader.Text = "Loading Assets "..Index.."/"..Amount
end
Loader.Text = "Loading UI"
local Explorer = Instance.New("UIView",GUI)
Explorer.Name = RandomString()
Explorer.PositionOffset = Vector2.Zero
Explorer.PositionRelative = Vector2.New(1,0)
Explorer.SizeOffset = Vector2.New(350,0)
Explorer.SizeRelative = Vector2.New(0,0.5)
Explorer.PivotPoint = Vector2.New(1,0)
Explorer.Color = Color.FromRGB(31,31,31)
Explorer.Visible = false

local Properties = Instance.New("UIView",GUI)
Properties.Name = RandomString()
Properties.PositionOffset = Vector2.Zero
Properties.PositionRelative = Vector2.One
Properties.SizeOffset = Vector2.New(350,0)
Properties.SizeRelative = Vector2.New(0,0.5)
Properties.PivotPoint = Vector2.One
Properties.Color = Color.FromRGB(31,31,31)
Properties.Visible = false

local ExpBGM = Instance.New("UIView", Explorer)
ExpBGM.Name = RandomString()
ExpBGM.PositionOffset = Vector2.Zero
ExpBGM.PositionRelative = Vector2.New(0.5,1)
ExpBGM.SizeOffset = Vector2.Zero
ExpBGM.SizeRelative = Vector2.New(1,0.9)
ExpBGM.PivotPoint = Vector2.New(0.5,1)
ExpBGM.Color = Color.FromRGB(31,31,31)

local ExpUSV = Instance.New("UIScrollView", ExpBGM)
ExpUSV.Name = RandomString()
ExpUSV.PositionOffset = Vector2.Zero
ExpUSV.PositionRelative = Vector2.Zero
ExpUSV.SizeOffset = Vector2.Zero
ExpUSV.SizeRelative = Vector2.One
ExpUSV.PivotPoint = Vector2.Zero

local ProBGM = Instance.New("UIView", Properties)
ProBGM.Name = RandomString()
ProBGM.PositionOffset = Vector2.Zero
ProBGM.PositionRelative = Vector2.New(0.5,1)
ProBGM.SizeOffset = Vector2.Zero
ProBGM.SizeRelative = Vector2.New(1,0.94)
ProBGM.PivotPoint = Vector2.New(0.5,1)
ProBGM.Color = Color.FromRGB(38,38,38)

local ProUSV = Instance.New("UIScrollView", ProBGM)
ProUSV.Name = RandomString()
ProUSV.PositionOffset = Vector2.Zero
ProUSV.PositionRelative = Vector2.Zero
ProUSV.SizeOffset = Vector2.Zero
ProUSV.SizeRelative = Vector2.One
ProUSV.PivotPoint = Vector2.Zero

local ExpUIVL = Instance.New("UIVLayout", ExpUSV)
ExpUIVL.Name = RandomString()
ExpUIVL.PositionOffset = Vector2.Zero
ExpUIVL.PositionRelative = Vector2.New(0.5,0.5)
ExpUIVL.SizeOffset = Vector2.Zero
ExpUIVL.SizeRelative = Vector2.One
ExpUIVL.PivotPoint = Vector2.New(0.5,0.5)

local ProUIVL = Instance.New("UIVLayout", ProUSV)
ProUIVL.Name = RandomString()
ProUIVL.PositionOffset = Vector2.Zero
ProUIVL.PositionRelative = Vector2.New(0.5,0.5)
ProUIVL.SizeOffset = Vector2.Zero
ProUIVL.SizeRelative = Vector2.One
ProUIVL.PivotPoint = Vector2.New(0.5,0.5)

local ExpTitle = Instance.New("UILabel", Explorer)
ExpTitle.Name = RandomString()
ExpTitle.PositionOffset = Vector2.Zero
ExpTitle.PositionRelative = Vector2.Zero
ExpTitle.SizeOffset = Vector2.New(100,0)
ExpTitle.SizeRelative = Vector2.New(0,0.05)
ExpTitle.PivotPoint = Vector2.Zero
ExpTitle.Text = "Explorer"
ExpTitle.FontSize = 12
ExpTitle.TextColor = Color.White
ExpTitle.Color = Color.FromRGB(28,28,28)

local ProTitle = Instance.New("UILabel", Properties)
ProTitle.Name = RandomString()
ProTitle.PositionOffset = Vector2.Zero
ProTitle.PositionRelative = Vector2.Zero
ProTitle.SizeOffset = Vector2.New(100,0)
ProTitle.SizeRelative = Vector2.New(0,0.05)
ProTitle.PivotPoint = Vector2.Zero
ProTitle.Text = "Properties"
ProTitle.FontSize = 12
ProTitle.TextColor = Color.White
ProTitle.Color = Color.FromRGB(28,28,28)

local ExpTitleHint = Instance.New("UIView", ExpTitle)
ExpTitleHint.Name = RandomString()
ExpTitleHint.PositionOffset = Vector2.Zero
ExpTitleHint.PositionRelative = Vector2.Zero
ExpTitleHint.SizeOffset = Vector2.Zero
ExpTitleHint.SizeRelative = Vector2.New(1,0.05)
ExpTitleHint.PivotPoint = Vector2.Zero

local ProTitleHint = Instance.New("UIView", ProTitle)
ProTitleHint.Name = RandomString()
ProTitleHint.PositionOffset = Vector2.Zero
ProTitleHint.PositionRelative = Vector2.Zero
ProTitleHint.SizeOffset = Vector2.Zero
ProTitleHint.SizeRelative = Vector2.New(1,0.05)
ProTitleHint.PivotPoint = Vector2.Zero

local ExpSBG = Instance.New("UIView", Explorer)
ExpSBG.Name = RandomString()
ExpSBG.PositionOffset = Vector2.Zero
ExpSBG.PositionRelative = Vector2.New(0.5,0.06)
ExpSBG.SizeOffset = Vector2.New(0,25)
ExpSBG.SizeRelative = Vector2.New(0.98,0)
ExpSBG.PivotPoint = Vector2.New(0.5,0)
ExpSBG.Color = Color.FromRGB(22,22,22)
ExpSBG.BorderColor = Color.FromRGB(35,150,245)
ExpSBG.CornerRadius = 5.5

local ExpSearch = Instance.New("UITextInput", ExpSBG)
ExpSearch.Name = RandomString()
ExpSearch.PositionOffset = Vector2.Zero
ExpSearch.PositionRelative = Vector2.New(0.5,0.5)
ExpSearch.SizeOffset = Vector2.Zero
ExpSearch.SizeRelative = Vector2.New(0.96,1)
ExpSearch.PivotPoint = Vector2.New(0.5,0.5)
ExpSearch.FontSize = 10
ExpSearch.Placeholder = "Search..."
ExpSearch.Color = Color.Transparent
ExpSearch.TextColor = Color.White
ExpSearch.PlaceholderColor = Color.FromRGB(100,100,100)
ExpSearch.FocusEnter:Connect(function()
	ExpSBG.BorderWidth = 2.5
end)
ExpSearch.FocusExit:Connect(function()
	ExpSBG.BorderWidth = 0
end)

local Update = Instance.New("BindableEvent")
Update.Invoked:Connect(function(Object)
	Selected = Object
	for _,v in ipairs(ProUIVL:GetChildren()) do
		v:Destroy()
	end
	local function Update(ClassName)
		if Objects[ClassName] then
			local Class = Objects[ClassName]
			local Icon = Class.Icon and LoadedIcons[Class.Icon] or LoadedIcons[ClassName] or LoadedIcons["Unknown"]
			local DropDown = Instance.New("UIView", ProUIVL)
			DropDown.Name = RandomString()
			DropDown.SizeOffset = Vector2.New(0,30)
			DropDown.SizeRelative = Vector2.New(0.975,0)
			DropDown.Color = Color.FromRGB(22,22,22)
			DropDown.CornerRadius = 5.5
			
			local Image = Instance.New("UIImage",DropDown)
			Image.Name = RandomString()
			Image.Image = Icon
			Image.PositionOffset = Vector2.Zero
			Image.PositionRelative = Vector2.Zero
			Image.SizeOffset = Vector2.New(30,30)
			Image.SizeRelative = Vector2.Zero
			Image.PivotPoint = Vector2.Zero
			
			local Title = Instance.New("UILabel",DropDown)
			Title.Name = RandomString()
			Title.PositionOffset = Vector2.New(35,0)
			Title.PositionRelative = Vector2.Zero
			Title.SizeOffset = Vector2.New(-70,30)
			Title.SizeRelative = Vector2.New(1,0)
			Title.PivotPoint = Vector2.Zero
			Title.Text = ClassName
			Title.FontSize = 12
			Title.TextColor = Color.FromRGB(200,200,200)
			Title.Color = Color.Transparent
			Title.HorizontalAlignment = Enums.HorizontalAlignment.Left
			
			local Indicator = Instance.New("UIImage",DropDown)
			Indicator.Name = RandomString()
			Indicator.PositionOffset = Vector2.Zero
			Indicator.PositionRelative = Vector2.New(1,0.5)
			Indicator.SizeOffset = Vector2.New(30,30)
			Indicator.SizeRelative = Vector2.Zero
			Indicator.PivotPoint = Vector2.New(1,0.5)
			Indicator.Image = LoadedIcons["ArrowOpen"]
			Indicator.Color = Color.New(130,130,130)
			
			local Toggle = Instance.New("UIButton",DropDown)
			Toggle.Name = RandomString()
			Toggle.SizeOffset = Vector2.Zero
			Toggle.SizeRelative = Vector2.New(1,1)
			Toggle.Color = Color.Transparent
			Toggle.Text = ""	
			
			for Property,Type in pairs(Class.Properties) do
				local Proper = Instance.New("UIView", ProUIVL)
				Proper.Name = RandomString()
				Proper.SizeOffset = Vector2.New(0,30)
				Proper.SizeRelative = Vector2.New(0.975,0)
				Proper.Color = Color.Transparent
				Toggle.Clicked:Connect(function()
					Proper.Visible = not Proper.Visible
					Indicator.Image = Proper.Visible and LoadedIcons["ArrowOpen"] or LoadedIcons["ArrowClosed"]
				end)
				
				local Name = Instance.New("UILabel", Proper)
				Name.Name = RandomString()
				Name.Text = Property
				Name.Color = Color.Transparent
				Name.FontSize = 12
				Name.TextColor = Color.FromRGB(200,200,200)
				Name.HorizontalAlignment = Enums.HorizontalAlignment.Left
				Name.TextTrimming = Enums.TextTrimming.CharacterEllipsis
				Name.SizeOffset = Vector2.Zero
				Name.SizeRelative = Vector2.New(0.4,1)
				Name.PositionOffset = Vector2.Zero
				Name.PositionRelative = Vector2.New(0,0.5)
				Name.PivotPoint = Vector2.New(0,0.5)
				
				local EditHolder = Instance.New("UIView", Proper)
				EditHolder.Name = RandomString()
				EditHolder.SizeOffset = Vector2.Zero
				EditHolder.SizeRelative = Vector2.New(0.6,1)
				EditHolder.PositionOffset = Vector2.Zero
				EditHolder.PositionRelative = Vector2.New(1,0.5)
				EditHolder.PivotPoint = Vector2.New(1,0.5)
				EditHolder.Color = Color.Transparent
				
				if Type == "string" then
					local Box = Instance.New("UITextInput", EditHolder)
					Box.Name = RandomString()
					Box.SizeOffset = Vector2.Zero
					Box.SizeRelative = Vector2.New(1,1)
					Box.PositionOffset = Vector2.Zero
					Box.PositionRelative = Vector2.Zero
					Box.PivotPoint = Vector2.Zero
					Box.Text = tostring(Object[Property])
					Box.FontSize = 12
					Box.Placeholder = ""
					Box.TextColor = Color.FromRGB(200,200,200)
					Box.BorderColor = Color.FromRGB(35,150,245)
					Box.Color = Color.FromRGB(22,22,22)
					Box.CornerRadius = 5.5
					Object.PropertyChanged:Connect(function(Prop)
						if Prop == Property then
							Box.Text = tostring(Object[Property])
						end
					end)
					Box.FocusEnter:Connect(function()
						Box.BorderWidth = 2.5
					end)
					Box.FocusExit:Connect(function()
						Box.BorderWidth = 0
					end)
					Box.Submitted:Connect(function(Text)
						pcall(function()
							Object[Property] = tostring(Text)
						end)
						Box.Text = tostring(Object[Property])
					end)
				elseif Type == "number" then
					local Box = Instance.New("UITextInput", EditHolder)
					Box.Name = RandomString()
					Box.SizeOffset = Vector2.Zero
					Box.SizeRelative = Vector2.New(1,1)
					Box.PositionOffset = Vector2.Zero
					Box.PositionRelative = Vector2.Zero
					Box.PivotPoint = Vector2.Zero
					Box.Text = tostring(Object[Property])
					Box.FontSize = 12
					Box.Placeholder = ""
					Box.TextColor = Color.FromRGB(200,200,200)
					Box.BorderColor = Color.FromRGB(35,150,245)
					Box.Color = Color.FromRGB(22,22,22)
					Box.CornerRadius = 5.5
					Object.PropertyChanged:Connect(function(Prop)
						if Prop == Property then
							Box.Text = tostring(Object[Property])
						end
					end)
					Box.FocusEnter:Connect(function()
						Box.BorderWidth = 2.5
					end)
					Box.FocusExit:Connect(function()
						Box.BorderWidth = 0
					end)
					Box.Submitted:Connect(function(Text)
						pcall(function()
							Object[Property] = tonumber(Text)
						end)
						Box.Text = tostring(Object[Property])
					end)
				elseif Type == "boolean" then
					local Box = Instance.New("UIView", EditHolder)
					Box.Name = RandomString()
					Box.SizeOffset = Vector2.New(25,25)
					Box.SizeRelative = Vector2.Zero
					Box.PositionOffset = Vector2.Zero
					Box.PositionRelative = Vector2.New(0.5,0.5)
					Box.PivotPoint = Vector2.New(0.5,0.5)
					Box.CornerRadius = 5
					Box.Color = Color.FromRGB(50,50,50)
					
					local Indicated = Instance.New("UIView", Box)
					Indicated.Name = RandomString()
					Indicated.SizeOffset = Vector2.Zero
					Indicated.SizeRelative = Vector2.New(0.8,0.8)
					Indicated.PositionOffset = Vector2.Zero
					Indicated.PositionRelative = Vector2.New(0.5,0.5)
					Indicated.PivotPoint = Vector2.New(0.5,0.5)
					Indicated.CornerRadius = 4
					Indicated.Color = Color.FromRGB(0,150,255)
					Indicated.Visible = Object[Property] or false
					
					local Toggle = Instance.New("UIButton", Box)
					Toggle.Name = RandomString()
					Toggle.SizeOffset = Vector2.Zero
					Toggle.SizeRelative = Vector2.New(1,1)
					Toggle.PositionOffset = Vector2.Zero
					Toggle.PositionRelative = Vector2.New(0.5,0.5)
					Toggle.PivotPoint = Vector2.New(0.5,0.5)
					Toggle.Color = Color.Transparent
					Toggle.Text = ""
					
					Object.PropertyChanged:Connect(function(Prop)
						if Prop == Property then
							Indicated.Visible = Object[Property]
						end
					end)
					Toggle.Clicked:Connect(function()
						pcall(function()
							Object[Property] = not Object[Property]
						end)
					end)
				elseif Enums[Type] then
					local Text = Instance.New("UILabel", EditHolder)
					Text.Name = RandomString()
					Text.Text = "[Enums."..Type.."]"
					Text.Color = Color.Transparent
					Text.FontSize = 12
					Text.TextColor = Color.FromRGB(200,200,200)
					Text.SizeOffset = Vector2.Zero
					Text.SizeRelative = Vector2.New(1,1)
					Text.PositionOffset = Vector2.Zero
					Text.PositionRelative = Vector2.Zero
					Text.PivotPoint = Vector2.Zero
				else
					local Text = Instance.New("UILabel", EditHolder)
					Text.Name = RandomString()
					Text.Text = "["..Type.."]"
					Text.Color = Color.Transparent
					Text.FontSize = 12
					Text.TextColor = Color.FromRGB(200,200,200)
					Text.SizeOffset = Vector2.Zero
					Text.SizeRelative = Vector2.New(1,1)
					Text.PositionOffset = Vector2.Zero
					Text.PositionRelative = Vector2.Zero
					Text.PivotPoint = Vector2.Zero
				end
			end
			Update(Class.Inherits)
		end
	end
	Update(Object.ClassName)
	if Object.Parent then
		Object.Parent.ChildDeleted:Connect(function(ss)
			if ss == Object then
				for _,v in ipairs(ProUIVL:GetChildren()) do
					v:Destroy()
				end
			end
		end)
	end
end)
Update:Invoke(Selected)

local function Make(Object, Holder, Offsetpar)
	if table.find(Ignore,Object) then return end
	local OGH = Instance.New("UIView",Holder)
	OGH.Name = RandomString()
	OGH.PositionRelative = Vector2.Zero
	OGH.PositionOffset = Vector2.New(0,0)
	OGH.SizeOffset = Vector2.New(0,30)
	OGH.SizeRelative = Vector2.New(1,0)
	OGH.PivotPoint = Vector2.New(1,0)
	OGH.Color = Color.Transparent
	
	local OG = Instance.New("UIView",OGH)
	OG.Name = RandomString()
	OG.PositionRelative = Vector2.New(1,0)
	OG.PositionOffset = Vector2.New(0,0)
	OG.SizeOffset = Vector2.New(Offsetpar + -20,0)
	OG.SizeRelative = Vector2.New(1,1)
	OG.PivotPoint = Vector2.New(1,0)
	OG.CornerRadius = 2.5
	OG.BorderColor = Color.FromRGB(30,150,240)
	OG.BorderWidth = Object == Selected and 1 or 0
	OG.Color = Object == Selected and Color.FromRGB(30,75,110) or Color.Transparent
	
	local Icon = Instance.New("UIImage",OG)
	Icon.Image = Objects[Object.ClassName] and Objects[Object.ClassName].Icon and LoadedIcons[Objects[Object.ClassName].Icon] or LoadedIcons[Object.ClassName] or LoadedIcons["Unknown"]
	Icon.PositionRelative = Vector2.Zero
	Icon.PositionOffset = Vector2.Zero
	Icon.SizeOffset = Vector2.New(30,30)
	Icon.SizeRelative = Vector2.Zero
	Icon.PivotPoint = Vector2.Zero
	
	local Name = Instance.New("UILabel",OG)
	Name.PositionRelative = Vector2.New(1,0)
	Name.PositionOffset = Vector2.Zero
	Name.SizeOffset = Vector2.New(-30,0)
	Name.SizeRelative = Vector2.New(1,1)
	Name.PivotPoint = Vector2.New(1,0)
	Name.Color = Color.Transparent
	Name.TextColor = Color.FromRGB(200,200,200)
	Name.Text = Object.Name
	Name.FontSize = 12
	Name.TextTrimming = Enums.TextTrimming.CharacterEllipsis
	Name.HorizontalAlignment = Enums.HorizontalAlignment.Left
	
	local PropOpen = Instance.New("UIButton",OG)
	PropOpen.PositionRelative = Vector2.Zero
	PropOpen.PositionOffset = Vector2.Zero
	PropOpen.SizeOffset = Vector2.Zero
	PropOpen.SizeRelative = Vector2.New(1,1)
	PropOpen.PivotPoint = Vector2.Zero
	PropOpen.Color = Color.Transparent
	PropOpen.Text = ""
	
	local Indicator = Instance.New("UIImage",OG)
	Indicator.Image = LoadedIcons["ArrowClosed"]
	Indicator.PositionRelative = Vector2.New(0,0.5)
	Indicator.PositionOffset = Vector2.New(0,0)
	Indicator.SizeOffset = Vector2.New(20,20)
	Indicator.SizeRelative = Vector2.Zero
	Indicator.PivotPoint = Vector2.New(1,0.5)
	Indicator.Visible = #Object:GetChildren() > 0
	
	local Closer = Instance.New("UIButton",OGH)
	Closer.PositionRelative = Vector2.Zero
	Closer.PositionOffset = Vector2.Zero
	Closer.SizeOffset = Vector2.New(-Offsetpar+20,0)
	Closer.SizeRelative = Vector2.New(0,1)
	Closer.PivotPoint = Vector2.Zero
	Closer.Text = ""
	Closer.Color = Color.Transparent
	
	local CHolder = Instance.New("UIVLayout", Holder)
	CHolder.Name = RandomString()
	CHolder.PositionOffset = Vector2.Zero
	CHolder.PositionRelative = Vector2.New(0.5,0.5)
	CHolder.SizeOffset = Vector2.Zero
	CHolder.SizeRelative = Vector2.New(1,0)
	CHolder.PivotPoint = Vector2.New(0.5,0.5)
	CHolder.Visible = false
	
	PropOpen.Clicked:Connect(function()
		Update:Invoke(Object)
	end)
	
	Update.Invoked:Connect(function(obj)
		if obj == Object then
			OG.BorderWidth = 1
			OG.Color = Color.FromRGB(30,75,110)
		else
			OG.BorderWidth = 0
			OG.Color = Color.Transparent
		end
	end)
	
	Closer.Clicked:Connect(function()
		CHolder.Visible = not CHolder.Visible and Indicator.Visible
		Indicator.Image = CHolder.Visible and Indicator.Visible and LoadedIcons["ArrowOpen"] or LoadedIcons["ArrowClosed"]
	end)
	for _,v in ipairs(Object:GetChildren()) do
		Make(v,CHolder,Offsetpar + -20)
	end
	Object.ChildAdded:Connect(function(v)
		Indicator.Visible = #Object:GetChildren() > 0
		Make(v,CHolder,Offsetpar + -20)
	end)
	Object.ChildRemoved:Connect(function(v)
		Indicator.Visible = #Object:GetChildren() > 0
		CHolder[v]:Destroy()
	end)
	Object.PropertyChanged:Connect(function(Prop)
		if Prop == "Name" then
			Name.Text = Object.Name
		end
	end)
end

Make(Selected,ExpUIVL,0)

Explorer.Visible = true
Properties.Visible = true
Loader:Destroy()
