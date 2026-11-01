--made by BORTHAISHACKIER
local IgnoreAssetLoading = true -- turn on if asset is under rewiew
local SeeCreation = true -- turn on if loading is taking a while
local Selected = world
local Ignore = {}
local Objects = game and game.HttpGet and loadstring and loadstring(game:HttpGet("https://raw.githubusercontent.com/BROTHAISHACKIER/PolyUse/refs/heads/main/objects.lua"))() or require(script.Objects)
local Icons = game and game.HttpGet and loadstring and loadstring(game:HttpGet("https://raw.githubusercontent.com/BROTHAISHACKIER/PolyUse/refs/heads/main/icons.lua"))() or require(script.Icons)
local LoadedIcons = {}
local InsAmnt = world.InstanceCount
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
Loader.Text = "Waiting for game to be finished loading"

local Amount = 0

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
    if not IgnoreAssetLoading then
        coroutine.wrap(function()
            if v.Loading then
                v.Loaded:Wait()
            end
            Index += 1
            Loader.Text = "Loading Assets "..Index.."/"..Amount
        end)()
    end
end
repeat
	wait(0.01)
until Index >= Amount or IgnoreAssetLoading
Loader.Text = "Loading UI"
local Explorer = Instance.New("UIView",GUI)
Explorer.Name = RandomString()
Explorer.PositionOffset = Vector2.Zero
Explorer.PositionRelative = Vector2.New(1,0)
Explorer.SizeOffset = Vector2.New(350,0)
Explorer.SizeRelative = Vector2.New(0,0.5)
Explorer.PivotPoint = Vector2.New(1,0)
Explorer.Color = Color.FromRGB(31,31,31)
Explorer.Visible = SeeCreation

local Properties = Instance.New("UIView",GUI)
Properties.Name = RandomString()
Properties.PositionOffset = Vector2.Zero
Properties.PositionRelative = Vector2.One
Properties.SizeOffset = Vector2.New(350,0)
Properties.SizeRelative = Vector2.New(0,0.5)
Properties.PivotPoint = Vector2.One
Properties.Color = Color.FromRGB(31,31,31)
Properties.Visible = SeeCreation

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
		if Objects[ClassName] and Objects[ClassName].Properties ~= {} then
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
					Box.JustifyText = Enums.HorizontalAlignment.Center
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
				elseif Type == "Vector2" then
					local X = Instance.New("UITextInput", EditHolder)
					X.Name = RandomString()
					X.SizeOffset = Vector2.Zero
					X.SizeRelative = Vector2.New(0.49,1)
					X.PositionOffset = Vector2.Zero
					X.PositionRelative = Vector2.Zero
					X.PivotPoint = Vector2.Zero
					X.JustifyText = Enums.HorizontalAlignment.Center
					X.Text = tostring(Object[Property].X)
					X.FontSize = 12
					X.Placeholder = ""
					X.TextColor = Color.FromRGB(210,20,60)
					X.BorderColor = Color.FromRGB(35,150,245)
					X.Color = Color.FromRGB(22,22,22)
					X.CornerRadius = 5.5
					X.FocusEnter:Connect(function()
						X.BorderWidth = 2.5
					end)
					X.FocusExit:Connect(function()
						X.BorderWidth = 0
					end)
					X.Submitted:Connect(function(Text)
						pcall(function()
							Object[Property] = Vector2.New(tonumber(Text),Object[Property].Y)
						end)
						X.Text = tostring(Object[Property].X)
					end)
					local Y = Instance.New("UITextInput", EditHolder)
					Y.Name = RandomString()
					Y.SizeOffset = Vector2.Zero
					Y.SizeRelative = Vector2.New(0.49,1)
					Y.PositionOffset = Vector2.Zero
					Y.PositionRelative = Vector2.New(1,0)
					Y.PivotPoint = Vector2.New(1,0)
					Y.JustifyText = Enums.HorizontalAlignment.Center
					Y.Text = tostring(Object[Property].Y)
					Y.FontSize = 12
					Y.Placeholder = ""
					Y.TextColor = Color.FromRGB(50,200,50)
					Y.BorderColor = Color.FromRGB(35,150,245)
					Y.Color = Color.FromRGB(22,22,22)
					Y.CornerRadius = 5.5
					Y.FocusEnter:Connect(function()
						Y.BorderWidth = 2.5
					end)
					Y.FocusExit:Connect(function()
						Y.BorderWidth = 0
					end)
					Y.Submitted:Connect(function(Text)
						pcall(function()
							Object[Property] = Vector2.New(Object[Property].X,tonumber(Text))
						end)
						Y.Text = tostring(Object[Property].Y)
					end)
					Object.PropertyChanged:Connect(function(Prop)
						if Prop == Property then
							X.Text = tostring(Object[Property].X)
							Y.Text = tostring(Object[Property].Y)
						end
					end)
				elseif Type == "Vector3" then
					local X = Instance.New("UITextInput", EditHolder)
					X.Name = RandomString()
					X.SizeOffset = Vector2.Zero
					X.SizeRelative = Vector2.New(1/3 - 0.02,1)
					X.PositionOffset = Vector2.Zero
					X.PositionRelative = Vector2.Zero
					X.PivotPoint = Vector2.Zero
					X.JustifyText = Enums.HorizontalAlignment.Center
					X.Text = tostring(Object[Property].X)
					X.FontSize = 12
					X.Placeholder = ""
					X.TextColor = Color.FromRGB(210,20,60)
					X.BorderColor = Color.FromRGB(35,150,245)
					X.Color = Color.FromRGB(22,22,22)
					X.CornerRadius = 5.5
					X.FocusEnter:Connect(function()
						X.BorderWidth = 2.5
					end)
					X.FocusExit:Connect(function()
						X.BorderWidth = 0
					end)
					X.Submitted:Connect(function(Text)
						pcall(function()
							Object[Property] = Vector3.New(tonumber(Text),Object[Property].Y,Object[Property].Z)
						end)
						X.Text = tostring(Object[Property].X)
					end)
					local Y = Instance.New("UITextInput", EditHolder)
					Y.Name = RandomString()
					Y.SizeOffset = Vector2.Zero
					Y.SizeRelative = Vector2.New(1/3 - 0.02,1)
					Y.PositionOffset = Vector2.Zero
					Y.PositionRelative = Vector2.New(0.5,0)
					Y.PivotPoint = Vector2.New(0.5,0)
					Y.JustifyText = Enums.HorizontalAlignment.Center
					Y.Text = tostring(Object[Property].Y)
					Y.FontSize = 12
					Y.Placeholder = ""
					Y.TextColor = Color.FromRGB(50,200,50)
					Y.BorderColor = Color.FromRGB(35,150,245)
					Y.Color = Color.FromRGB(22,22,22)
					Y.CornerRadius = 5.5
					Y.FocusEnter:Connect(function()
						Y.BorderWidth = 2.5
					end)
					Y.FocusExit:Connect(function()
						Y.BorderWidth = 0
					end)
					Y.Submitted:Connect(function(Text)
						pcall(function()
							Object[Property] = Vector3.New(Object[Property].X,tonumber(Text),Object[Property].Z)
						end)
						Y.Text = tostring(Object[Property].Y)
					end)
					local Z = Instance.New("UITextInput", EditHolder)
					Z.Name = RandomString()
					Z.SizeOffset = Vector2.Zero
					Z.SizeRelative = Vector2.New(1/3 - 0.02,1)
					Z.PositionOffset = Vector2.Zero
					Z.PositionRelative = Vector2.New(1,0)
					Z.PivotPoint = Vector2.New(1,0)
					Z.JustifyText = Enums.HorizontalAlignment.Center
					Z.Text = tostring(Object[Property].Z)
					Z.FontSize = 12
					Z.Placeholder = ""
					Z.TextColor = Color.FromRGB(30,145,255)
					Z.BorderColor = Color.FromRGB(35,150,245)
					Z.Color = Color.FromRGB(22,22,22)
					Z.CornerRadius = 5.5
					Z.FocusEnter:Connect(function()
						Z.BorderWidth = 2.5
					end)
					Z.FocusExit:Connect(function()
						Z.BorderWidth = 0
					end)
					Z.Submitted:Connect(function(Text)
						pcall(function()
							Object[Property] = Vector3.New(Object[Property].X,Object[Property].Y,tonumber(Text))
						end)
						Z.Text = tostring(Object[Property].Z)
					end)
					Object.PropertyChanged:Connect(function(Prop)
						if Prop == Property then
							X.Text = tostring(Object[Property].X)
							Y.Text = tostring(Object[Property].Y)
							Z.Text = tostring(Object[Property].Z)
						end
					end)
				elseif Type == "Color" then
					local R = Instance.New("UITextInput", EditHolder)
					R.Name = RandomString()
					R.SizeOffset = Vector2.Zero
					R.SizeRelative = Vector2.New(1/4 - 0.03,1)
					R.PositionOffset = Vector2.Zero
					R.PositionRelative = Vector2.Zero
					R.PivotPoint = Vector2.Zero
					R.JustifyText = Enums.HorizontalAlignment.Left
					R.Text = tostring(math.floor(Object[Property].R*255))
					R.FontSize = 12
					R.Placeholder = ""
					R.TextColor = Color.FromRGB(210,20,60)
					R.BorderColor = Color.FromRGB(35,150,245)
					R.Color = Color.FromRGB(22,22,22)
					R.CornerRadius = 5.5
					R.FocusEnter:Connect(function()
						R.BorderWidth = 2.5
					end)
					R.FocusExit:Connect(function()
						R.BorderWidth = 0
					end)
					R.Submitted:Connect(function(Text)
						pcall(function()
							Object[Property] = Color.FromRGB(tonumber(Text),Object[Property].G,Object[Property].B,Object[Property].A)
						end)
						R.Text = tostring(Object[Property].R*255)
					end)
					local G = Instance.New("UITextInput", EditHolder)
					G.Name = RandomString()
					G.SizeOffset = Vector2.Zero
					G.SizeRelative = Vector2.New(1/4 - 0.03,1)
					G.PositionOffset = Vector2.Zero
					G.PositionRelative = Vector2.New(1/4 + 0.01,0)
					G.PivotPoint = Vector2.Zero
					G.JustifyText = Enums.HorizontalAlignment.Left
					G.Text = tostring(math.floor(Object[Property].G*255))
					G.FontSize = 12
					G.Placeholder = ""
					G.TextColor = Color.FromRGB(50,200,50)
					G.BorderColor = Color.FromRGB(35,150,245)
					G.Color = Color.FromRGB(22,22,22)
					G.CornerRadius = 5.5
					G.FocusEnter:Connect(function()
						G.BorderWidth = 2.5
					end)
					G.FocusExit:Connect(function()
						G.BorderWidth = 0
					end)
					G.Submitted:Connect(function(Text)
						pcall(function()
							Object[Property] = Color.FromRGB(Object[Property].R,tonumber(Text),Object[Property].B,Object[Property].A)
						end)
						G.Text = tostring(Object[Property].G)
					end)
					local B = Instance.New("UITextInput", EditHolder)
					B.Name = RandomString()
					B.SizeOffset = Vector2.Zero
					B.SizeRelative = Vector2.New(1/4 - 0.03,1)
					B.PositionOffset = Vector2.Zero
					B.PositionRelative = Vector2.New(2/4 + 0.02,0)
					B.PivotPoint = Vector2.Zero
					B.JustifyText = Enums.HorizontalAlignment.Left
					B.Text = tostring(math.floor(Object[Property].B*255))
					B.FontSize = 12
					B.Placeholder = ""
					B.TextColor = Color.FromRGB(30,145,255)
					B.BorderColor = Color.FromRGB(35,150,245)
					B.Color = Color.FromRGB(22,22,22)
					B.CornerRadius = 5.5
					B.FocusEnter:Connect(function()
						B.BorderWidth = 2.5
					end)
					B.FocusExit:Connect(function()
						B.BorderWidth = 0
					end)
					B.Submitted:Connect(function(Text)
						pcall(function()
							Object[Property] = Color.FromRGB(Object[Property].R,Object[Property].G,tonumber(Text),Object[Property].A)
						end)
						B.Text = tostring(Object[Property].B)
					end)
					local A = Instance.New("UITextInput", EditHolder)
					A.Name = RandomString()
					A.SizeOffset = Vector2.Zero
					A.SizeRelative = Vector2.New(1/4 - 0.03,1)
					A.PositionOffset = Vector2.Zero
					A.PositionRelative = Vector2.New(1,0)
					A.PivotPoint = Vector2.New(1,0)
					A.JustifyText = Enums.HorizontalAlignment.Left
					A.Text = tostring(math.floor(Object[Property].A*255))
					A.FontSize = 12
					A.Placeholder = ""
					A.TextColor = Color.FromRGB(200,200,200)
					A.BorderColor = Color.FromRGB(35,150,245)
					A.Color = Color.FromRGB(22,22,22)
					A.CornerRadius = 5.5
					A.FocusEnter:Connect(function()
						A.BorderWidth = 2.5
					end)
					A.FocusExit:Connect(function()
						A.BorderWidth = 0
					end)
					A.Submitted:Connect(function(Text)
						pcall(function()
							Object[Property] = Color.FromRGB(Object[Property].R,Object[Property].G,Object[Property].B,tonumber(Text))
						end)
						A.Text = tostring(Object[Property].A)
					end)
					Object.PropertyChanged:Connect(function(Prop)
						if Prop == Property then
							R.Text = tostring(math.floor(Object[Property].R*255))
							G.Text = tostring(math.floor(Object[Property].G*255))
							B.Text = tostring(math.floor(Object[Property].B*255))
							A.Text = tostring(math.floor(Object[Property].A*255))
						end
					end)
				elseif Type == "Quaternion" then
					local X = Instance.New("UITextInput", EditHolder)
					X.Name = RandomString()
					X.SizeOffset = Vector2.Zero
					X.SizeRelative = Vector2.New(1/4 - 0.03,1)
					X.PositionOffset = Vector2.Zero
					X.PositionRelative = Vector2.Zero
					X.PivotPoint = Vector2.Zero
					X.JustifyText = Enums.HorizontalAlignment.Left
					X.Text = tostring(Object[Property].X)
					X.FontSize = 12
					X.Placeholder = ""
					X.TextColor = Color.FromRGB(210,20,60)
					X.BorderColor = Color.FromRGB(35,150,245)
					X.Color = Color.FromRGB(22,22,22)
					X.CornerRadius = 5.5
					X.FocusEnter:Connect(function()
						X.BorderWidth = 2.5
					end)
					X.FocusExit:Connect(function()
						X.BorderWidth = 0
					end)
					X.Submitted:Connect(function(Text)
						pcall(function()
							Object[Property] = Quaternion.New(tonumber(Text),Object[Property].Y,Object[Property].Z,Object[Property].W)
						end)
						X.Text = tostring(Object[Property].X*255)
					end)
					local Y = Instance.New("UITextInput", EditHolder)
					Y.Name = RandomString()
					Y.SizeOffset = Vector2.Zero
					Y.SizeRelative = Vector2.New(1/4 - 0.03,1)
					Y.PositionOffset = Vector2.Zero
					Y.PositionRelative = Vector2.New(1/4 + 0.01,0)
					Y.PivotPoint = Vector2.Zero
					Y.JustifyText = Enums.HorizontalAlignment.Left
					Y.Text = tostring(Object[Property].Y)
					Y.FontSize = 12
					Y.Placeholder = ""
					Y.TextColor = Color.FromRGB(50,200,50)
					Y.BorderColor = Color.FromRGB(35,150,245)
					Y.Color = Color.FromRGB(22,22,22)
					Y.CornerRadius = 5.5
					Y.FocusEnter:Connect(function()
						Y.BorderWidth = 2.5
					end)
					Y.FocusExit:Connect(function()
						Y.BorderWidth = 0
					end)
					Y.Submitted:Connect(function(Text)
						pcall(function()
							Object[Property] = Quaternion.New(Object[Property].X,tonumber(Text),Object[Property].Z,Object[Property].W)
						end)
						Y.Text = tostring(Object[Property].Y)
					end)
					local Z = Instance.New("UITextInput", EditHolder)
					Z.Name = RandomString()
					Z.SizeOffset = Vector2.Zero
					Z.SizeRelative = Vector2.New(1/4 - 0.03,1)
					Z.PositionOffset = Vector2.Zero
					Z.PositionRelative = Vector2.New(2/4 + 0.02,0)
					Z.PivotPoint = Vector2.Zero
					Z.JustifyText = Enums.HorizontalAlignment.Left
					Z.Text = tostring(Object[Property].Z)
					Z.FontSize = 12
					Z.Placeholder = ""
					Z.TextColor = Color.FromRGB(30,145,255)
					Z.BorderColor = Color.FromRGB(35,150,245)
					Z.Color = Color.FromRGB(22,22,22)
					Z.CornerRadius = 5.5
					Z.FocusEnter:Connect(function()
						Z.BorderWidth = 2.5
					end)
					Z.FocusExit:Connect(function()
						Z.BorderWidth = 0
					end)
					Z.Submitted:Connect(function(Text)
						pcall(function()
							Object[Property] = Quaternion.New(Object[Property].X,Object[Property].Y,tonumber(Text),Object[Property].W)
						end)
						Z.Text = tostring(Object[Property].Z)
					end)
					local W = Instance.New("UITextInput", EditHolder)
					W.Name = RandomString()
					W.SizeOffset = Vector2.Zero
					W.SizeRelative = Vector2.New(1/4 - 0.03,1)
					W.PositionOffset = Vector2.Zero
					W.PositionRelative = Vector2.New(1,0)
					W.PivotPoint = Vector2.New(1,0)
					W.JustifyText = Enums.HorizontalAlignment.Left
					W.Text = tostring(Object[Property].W)
					W.FontSize = 12
					W.Placeholder = ""
					W.TextColor = Color.FromRGB(200,200,200)
					W.BorderColor = Color.FromRGB(35,150,245)
					W.Color = Color.FromRGB(22,22,22)
					W.CornerRadius = 5.5
					W.FocusEnter:Connect(function()
						W.BorderWidth = 2.5
					end)
					W.FocusExit:Connect(function()
						W.BorderWidth = 0
					end)
					W.Submitted:Connect(function(Text)
						pcall(function()
							Object[Property] = Quaternion.New(Object[Property].X,Object[Property].Y,Object[Property].Z,tonumber(Text))
						end)
						W.Text = tostring(Object[Property].W)
					end)
					Object.PropertyChanged:Connect(function(Prop)
						if Prop == Property then
							X.Text = tostring(Object[Property].X)
							Y.Text = tostring(Object[Property].Y)
							Z.Text = tostring(Object[Property].Z)
							W.Text = tostring(Object[Property].W)
						end
					end)
				elseif Type == "number" then
					local Box = Instance.New("UITextInput", EditHolder)
					Box.Name = RandomString()
					Box.SizeOffset = Vector2.Zero
					Box.SizeRelative = Vector2.New(1,1)
					Box.PositionOffset = Vector2.Zero
					Box.PositionRelative = Vector2.Zero
					Box.PivotPoint = Vector2.Zero
					Box.JustifyText = Enums.HorizontalAlignment.Center
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
							if Text == "inf" then
								Object[Property] = math.huge
							else
								Object[Property] = tonumber(Text)
							end
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
					
					local Tick = Instance.New("UIImage",Indicated)
					Tick.Name = RandomString()
					Tick.SizeOffset = Vector2.Zero
					Tick.SizeRelative = Vector2.New(0.9,0.9)
					Tick.PositionOffset = Vector2.Zero
					Tick.PositionRelative = Vector2.New(0.5,0.5)
					Tick.PivotPoint = Vector2.New(0.5,0.5)
					Tick.Image = LoadedIcons["Tick"]
					Tick.Color = Color.FromRGB(50,50,50)
					
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
		elseif Objects[ClassName] then
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
local Round = 0
local Finished = false
local function Make(Object, Holder, Offsetpar)
	wait()
    if not Finished then
        Loader.Text = "Creating Hierarchy "..Round.."/"..InsAmnt
        Round += 1
    end
    local IsWorld = Object == world
    local WorldGC = {
        Environment,
        Lighting,
        Players,
        ScriptService,
        Hidden,
        ServerHidden,
        PlayerDefaults,
        PlayerGUI,
        Achievements,
        CoreUI,
        Stats,
        Teams,
        Capture
    }
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
	Icon.Name = RandomString()
	Icon.Image = Objects[Object.ClassName] and Objects[Object.ClassName].Icon and LoadedIcons[Objects[Object.ClassName].Icon] or LoadedIcons[Object.ClassName] or LoadedIcons["Unknown"]
	Icon.PositionRelative = Vector2.Zero
	Icon.PositionOffset = Vector2.Zero
	Icon.SizeOffset = Vector2.New(30,30)
	Icon.SizeRelative = Vector2.Zero
	Icon.PivotPoint = Vector2.Zero
	
	local Name = Instance.New("UILabel",OG)
	Name.Name = RandomString()
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
	PropOpen.Name = RandomString()
	PropOpen.PositionRelative = Vector2.Zero
	PropOpen.PositionOffset = Vector2.Zero
	PropOpen.SizeOffset = Vector2.Zero
	PropOpen.SizeRelative = Vector2.New(1,1)
	PropOpen.PivotPoint = Vector2.Zero
	PropOpen.Color = Color.Transparent
	PropOpen.Text = ""
	
    local function HasChild()
		for _,v in ipairs(IsWorld and WorldGC or Object:GetChildren()) do
			if not table.find(Ignore,v) then return true end
		end
		return false
	end

	local Indicator = Instance.New("UIImage",OG)
	Indicator.Name = RandomString()
	Indicator.Image = LoadedIcons["ArrowClosed"]
	Indicator.PositionRelative = Vector2.New(0,0.5)
	Indicator.PositionOffset = Vector2.New(0,0)
	Indicator.SizeOffset = Vector2.New(20,20)
	Indicator.SizeRelative = Vector2.Zero
	Indicator.PivotPoint = Vector2.New(1,0.5)
	Indicator.Visible = HasChild()
	
	local Closer = Instance.New("UIButton",OGH)
	Closer.Name = RandomString()
	Closer.PositionRelative = Vector2.Zero
	Closer.PositionOffset = Vector2.Zero
	Closer.SizeOffset = Vector2.New(-Offsetpar+20,0)
	Closer.SizeRelative = Vector2.New(0,1)
	Closer.PivotPoint = Vector2.Zero
	Closer.Text = ""
	Closer.Color = Color.Transparent
	Closer.Visible = HasChild()

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
	local bfr = CHolder.Visible
	ExpSearch.Changed:Connect(function(Input)
		if Input == "" then
			CHolder.Visible = bfr
            Closer.Visible = CHolder.Visible
			OGH.Visible = true
			Indicator.Image = CHolder.Visible and Indicator.Visible and LoadedIcons["ArrowOpen"] or LoadedIcons["ArrowClosed"]
		else
			local Yeah = false
			for i,v in ipairs(Object:GetDescendants()) do
				Yeah = Yeah or Input:lower():sub(1, #v.Name) == v.Name:lower() or v.Name:lower():sub(1, #Input) == Input:lower()
			end
			Yeah = Yeah or Input:lower():sub(1, #Object.Name) == Object.Name:lower() or Object.Name:lower():sub(1, #Input) == Input:lower()
			if Yeah then
				OGH.Visible = true
				CHolder.Visible = true
                Closer.Visible = CHolder.Visible
				Indicator.Image = CHolder.Visible and Indicator.Visible and LoadedIcons["ArrowOpen"] or LoadedIcons["ArrowClosed"]
			else
				OGH.Visible = false
				CHolder.Visible = false
                Closer.Visible = CHolder.Visible
				Indicator.Image = CHolder.Visible and Indicator.Visible and LoadedIcons["ArrowOpen"] or LoadedIcons["ArrowClosed"]
			end
		end
	end)
	
	Closer.Clicked:Connect(function()
		CHolder.Visible = not CHolder.Visible and Indicator.Visible
        Closer.Visible = CHolder.Visible
		bfr = CHolder.Visible
		Indicator.Image = CHolder.Visible and Indicator.Visible and LoadedIcons["ArrowOpen"] or LoadedIcons["ArrowClosed"]
	end)
	for _,v in ipairs(IsWorld and WorldGC or Object:GetChildren()) do
		Make(v,CHolder,Offsetpar + -20)
	end
	Object.ChildAdded:Connect(function(v)
		Indicator.Visible = HasChild()
        Closer.Visible = CHolder.Visible
		Make(v,CHolder,Offsetpar + -20)
	end)
	Object.ChildRemoved:Connect(function(v)
		Indicator.Visible = HasChild()
        Closer.Visible = CHolder.Visible
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
Finished = true
