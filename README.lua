local Library = {}

-- Create the main UI
function Library:CreateWindow(title)
    local ScreenGui = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Title = Instance.new("TextLabel")
    local Container = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    
    ScreenGui.Parent = game.CoreGui
    ScreenGui.Name = title
    
    Main.Name = "Main"
    Main.Parent = ScreenGui
    Main.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    Main.Position = UDim2.new(0.3, 0, 0.3, 0)
    Main.Size = UDim2.new(0, 400, 0, 300)
    Main.Active = true
    Main.Draggable = true
    
    UICorner.Parent = Main
    UICorner.CornerRadius = UDim.new(0, 8)
    
    Title.Name = "Title"
    Title.Parent = Main
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0, 10, 0, 5)
    Title.Size = UDim2.new(1, -20, 0, 30)
    Title.Font = Enum.Font.GothamBold
    Title.Text = title
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 16
    
    Container.Name = "Container"
    Container.Parent = Main
    Container.BackgroundTransparency = 1
    Container.Position = UDim2.new(0, 10, 0, 45)
    Container.Size = UDim2.new(1, -20, 1, -55)
    Container.ScrollBarThickness = 3
    Container.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
    
    UIListLayout.Parent = Container
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 5)
    
    local Window = {}
    
    -- Create Section
    function Window:CreateSection(sectionName)
        local Section = Instance.new("Frame")
        local SectionTitle = Instance.new("TextLabel")
        local SectionContainer = Instance.new("Frame")
        local SectionUIListLayout = Instance.new("UIListLayout")
        
        Section.Name = "Section"
        Section.Parent = Container
        Section.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        Section.Size = UDim2.new(1, 0, 0, 30)
        Section.AutomaticSize = Enum.AutomaticSize.Y
        
        local UICorner = Instance.new("UICorner")
        UICorner.Parent = Section
        UICorner.CornerRadius = UDim.new(0, 6)
        
        SectionTitle.Name = "SectionTitle"
        SectionTitle.Parent = Section
        SectionTitle.BackgroundTransparency = 1
        SectionTitle.Position = UDim2.new(0, 10, 0, 0)
        SectionTitle.Size = UDim2.new(1, -20, 0, 30)
        SectionTitle.Font = Enum.Font.GothamSemibold
        SectionTitle.Text = sectionName
        SectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        SectionTitle.TextSize = 14
        SectionTitle.TextXAlignment = Enum.TextXAlignment.Left
        
        SectionContainer.Name = "SectionContainer"
        SectionContainer.Parent = Section
        SectionContainer.BackgroundTransparency = 1
        SectionContainer.Position = UDim2.new(0, 5, 0, 30)
        SectionContainer.Size = UDim2.new(1, -10, 0, 0)
        SectionContainer.AutomaticSize = Enum.AutomaticSize.Y
        
        SectionUIListLayout.Parent = SectionContainer
        SectionUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        SectionUIListLayout.Padding = UDim.new(0, 5)
        
        local SectionElements = {}
        
        -- Create Label
        function SectionElements:CreateLabel(text)
            local Label = Instance.new("TextLabel")
            
            Label.Name = "Label"
            Label.Parent = SectionContainer
            Label.BackgroundTransparency = 1
            Label.Size = UDim2.new(1, 0, 0, 20)
            Label.Font = Enum.Font.Gotham
            Label.Text = text
            Label.TextColor3 = Color3.fromRGB(200, 200, 200)
            Label.TextSize = 14
            Label.TextXAlignment = Enum.TextXAlignment.Left
        end
        
        -- Create Toggle
        function SectionElements:CreateToggle(text, callback)
            local Toggle = Instance.new("Frame")
            local ToggleButton = Instance.new("TextButton")
            local ToggleIndicator = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            
            Toggle.Name = "Toggle"
            Toggle.Parent = SectionContainer
            Toggle.BackgroundTransparency = 1
            Toggle.Size = UDim2.new(1, 0, 0, 25)
            
            ToggleButton.Name = "ToggleButton"
            ToggleButton.Parent = Toggle
            ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
            ToggleButton.Size = UDim2.new(1, 0, 1, 0)
            ToggleButton.Font = Enum.Font.Gotham
            ToggleButton.Text = "  " .. text
            ToggleButton.TextColor3 = Color3.fromRGB(200, 200, 200)
            ToggleButton.TextSize = 14
            ToggleButton.TextXAlignment = Enum.TextXAlignment.Left
            
            UICorner.Parent = ToggleButton
            UICorner.CornerRadius = UDim.new(0, 4)
            
            ToggleIndicator.Name = "ToggleIndicator"
            ToggleIndicator.Parent = ToggleButton
            ToggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 65, 65)
            ToggleIndicator.Position = UDim2.new(1, -35, 0.5, -8)
            ToggleIndicator.Size = UDim2.new(0, 30, 0, 16)
            
            local IndicatorUICorner = Instance.new("UICorner")
            IndicatorUICorner.Parent = ToggleIndicator
            IndicatorUICorner.CornerRadius = UDim.new(0, 8)
            
            local enabled = false
            
            ToggleButton.MouseButton1Click:Connect(function()
                enabled = not enabled
                ToggleIndicator.BackgroundColor3 = enabled and Color3.fromRGB(65, 255, 65) or Color3.fromRGB(255, 65, 65)
                callback(enabled)
            end)
        end
        
        -- Create Dropdown
        function SectionElements:CreateDropdown(text, options, callback)
            local Dropdown = Instance.new("Frame")
            local DropdownButton = Instance.new("TextButton")
            local DropdownContainer = Instance.new("Frame")
            local UIListLayout = Instance.new("UIListLayout")
            
            Dropdown.Name = "Dropdown"
            Dropdown.Parent = SectionContainer
            Dropdown.BackgroundTransparency = 1
            Dropdown.Size = UDim2.new(1, 0, 0, 30)
            Dropdown.ClipsDescendants = true
            
            DropdownButton.Name = "DropdownButton"
            DropdownButton.Parent = Dropdown
            DropdownButton.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
            DropdownButton.Size = UDim2.new(1, 0, 0, 30)
            DropdownButton.Font = Enum.Font.Gotham
            DropdownButton.Text = text .. ": " .. options[1]
            DropdownButton.TextColor3 = Color3.fromRGB(200, 200, 200)
            DropdownButton.TextSize = 14
            
            local UICorner = Instance.new("UICorner")
            UICorner.Parent = DropdownButton
            UICorner.CornerRadius = UDim.new(0, 4)
            
            DropdownContainer.Name = "DropdownContainer"
            DropdownContainer.Parent = Dropdown
            DropdownContainer.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
            DropdownContainer.Position = UDim2.new(0, 0, 0, 35)
            DropdownContainer.Size = UDim2.new(1, 0, 0, 0)
            DropdownContainer.Visible = false
            
            local ContainerUICorner = Instance.new("UICorner")
            ContainerUICorner.Parent = DropdownContainer
            ContainerUICorner.CornerRadius = UDim.new(0, 4)
            
            UIListLayout.Parent = DropdownContainer
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            
            local isOpen = false
            
            local function CreateOption(optionText)
                local Option = Instance.new("TextButton")
                Option.Name = "Option"
                Option.Parent = DropdownContainer
                Option.BackgroundTransparency = 1
                Option.Size = UDim2.new(1, 0, 0, 25)
                Option.Font = Enum.Font.Gotham
                Option.Text = "  " .. optionText
                Option.TextColor3 = Color3.fromRGB(200, 200, 200)
                Option.TextSize = 14
                Option.TextXAlignment = Enum.TextXAlignment.Left
                
                Option.MouseButton1Click:Connect(function()
                    DropdownButton.Text = text .. ": " .. optionText
                    isOpen = false
                    DropdownContainer.Visible = false
                    Dropdown.Size = UDim2.new(1, 0, 0, 30)
                    callback(optionText)
                end)
            end
            
            for _, option in ipairs(options) do
                CreateOption(option)
            end
            
            DropdownButton.MouseButton1Click:Connect(function()
                isOpen = not isOpen
                DropdownContainer.Visible = isOpen
                if isOpen then
                    Dropdown.Size = UDim2.new(1, 0, 0, 35 + (#options * 25))
                else
                    Dropdown.Size = UDim2.new(1, 0, 0, 30)
                end
            end)
        end
        
        -- Create Slider
        function SectionElements:CreateSlider(text, min, max, default, callback)
            local Slider = Instance.new("Frame")
            local SliderTitle = Instance.new("TextLabel")
            local SliderFrame = Instance.new("Frame")
            local SliderButton = Instance.new("TextButton")
            local SliderFill = Instance.new("Frame")
            local SliderValue = Instance.new("TextLabel")
            
            Slider.Name = "Slider"
            Slider.Parent = SectionContainer
            Slider.BackgroundTransparency = 1
            Slider.Size = UDim2.new(1, 0, 0, 45)
            
            SliderTitle.Name = "SliderTitle"
            SliderTitle.Parent = Slider
            SliderTitle.BackgroundTransparency = 1
            SliderTitle.Size = UDim2.new(1, 0, 0, 20)
            SliderTitle.Font = Enum.Font.Gotham
            SliderTitle.Text = text
            SliderTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
            SliderTitle.TextSize = 14
            SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
            
            SliderFrame.Name = "SliderFrame"
            SliderFrame.Parent = Slider
            SliderFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
            SliderFrame.Position = UDim2.new(0, 0, 0, 25)
            SliderFrame.Size = UDim2.new(1, 0, 0, 6)
            
            local UICorner = Instance.new("UICorner")
            UICorner.Parent = SliderFrame
            UICorner.CornerRadius = UDim.new(0, 3)
            
            SliderButton.Name = "SliderButton"
            SliderButton.Parent = SliderFrame
            SliderButton.BackgroundTransparency = 1
            SliderButton.Size = UDim2.new(1, 0, 1, 0)
            SliderButton.Text = ""
            
            SliderFill.Name = "SliderFill"
            SliderFill.Parent = SliderFrame
            SliderFill.BackgroundColor3 = Color3.fromRGB(65, 165, 255)
            SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
            
            local FillUICorner = Instance.new("UICorner")
            FillUICorner.Parent = SliderFill
            FillUICorner.CornerRadius = UDim.new(0, 3)
            
            SliderValue.Name = "SliderValue"
            SliderValue.Parent = Slider
            SliderValue.BackgroundTransparency = 1
            SliderValue.Position = UDim2.new(0, 0, 0, 32)
            SliderValue.Size = UDim2.new(1, 0, 0, 20)
            SliderValue.Font = Enum.Font.Gotham
            SliderValue.Text = tostring(default)
            SliderValue.TextColor3 = Color3.fromRGB(200, 200, 200)
            SliderValue.TextSize = 12
            
            local function UpdateSlider(input)
                local pos = UDim2.new(math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1), 0, 1, 0)
                SliderFill.Size = pos
                local value = math.floor(min + ((max - min) * pos.X.Scale))
                SliderValue.Text = tostring(value)
                callback(value)
            end
            
            SliderButton.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    local connection
                    connection = game:GetService("RunService").RenderStepped:Connect(function()
                        if input.UserInputState == Enum.UserInputState.End then
                            connection:Disconnect()
                            return
                        end
                        UpdateSlider(input)
                    end)
                end
            end)
        end
        
        return SectionElements
    end
    
    return Window
end

return Library
