-- This file is loaded from "God.toc"


--UTILITY FUNCTIONS
	--Arrow Keys Work in Text Chat
	for i=1,10 do b=_G["ChatFrame"..i.."EditBox"] b:SetAltArrowKeyMode(false) end
	--Extra slash commands
		-- /clc to clear combat log
		SlashCmdList["CLCE"] = function() CombatLogClearEntries() end
		SLASH_CLCE1 = '/clc'
		-- /gm to opan a GMM ticket
		SlashCmdList["TICKET"] = function() ToggleHelpFrame() end
		SLASH_TICKET1 = '/gm'
		-- /rc for readycheck
		SlashCmdList["READYCHECK"] = function() DoReadyCheck() end
		SLASH_READYCHECK1 = '/rc'
		-- /cr for check role
		SlashCmdList["CHECKROLE"] = function() InitiateRolePoll() end
		SLASH_CHECKROLE1 = '/cr'
		-- /x or /' for reload ui
		SlashCmdList["RELOAD"] = function() ReloadUI() end
		SLASH_RELOAD1 = "/'"
		SLASH_RELOAD2 = '/x'


--Character Frames
	--Class color in HP bar
	local function colour(statusbar, unit)
	    local _, class, c
	    if UnitIsPlayer(unit) and UnitIsConnected(unit) and unit == statusbar.unit and UnitClass(unit) then
	        _, class = UnitClass(unit)
	        c = CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class] or RAID_CLASS_COLORS[class]
	        statusbar:SetStatusBarColor(c.r, c.g, c.b)
	        PlayerFrameHealthBar:SetStatusBarColor(0,1,0)
	    end
	end
	hooksecurefunc("UnitFrameHealthBar_Update", colour)
	hooksecurefunc("HealthBar_OnValueChanged", function(self)
	    colour(self, self.unit)
	end)
	--Class icons instead of portraits
	hooksecurefunc("UnitFramePortrait_Update",function(self)
	    if self.portrait then
	        if UnitIsPlayer(self.unit) then                
	            local t = CLASS_ICON_TCOORDS[select(2, UnitClass(self.unit))]
	            if t then
	                self.portrait:SetTexture("Interface\\TargetingFrame\\UI-Classes-Circles")
	                self.portrait:SetTexCoord(unpack(t))
	            end
	        else
	            self.portrait:SetTexCoord(0,1,0,1)
	        end
	    end
	end)


--Minimap
	--Hide Zoom Buttons
	MinimapZoomIn:Hide()
	MinimapZoomOut:Hide()
	--Enable Scroll to Zoom
	Minimap:EnableMouseWheel(true)
	Minimap:SetScript('OnMouseWheel', function(self, delta)
	    if delta > 0 
	    	then Minimap_ZoomIn()
	    	else Minimap_ZoomOut()
	    end
	end)


--Micro Buttons
	--Reposition
	CharacterMicroButton:ClearAllPoints()
	CharacterMicroButton:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", -3, -3) CharacterMicroButton.SetPoint = function() end


--Main Action Bar
	--Restructure Button Points Without MainMenuBarArtFrame(Because it's hiddden)
	for i = 1, 12 do _G["ActionButton"..i]:ClearAllPoints() end
	for i = 1, 12 do
		if i < 7 then _G["ActionButton"..i]:SetPoint("RIGHT", _G["ActionButton"..i + 1], "LEFT", -6, 0) end
		if i == 7 then _G["ActionButton"..i]:SetPoint("BOTTOM", MainMenuBar, "BOTTOM", 20, 0) end
		if i > 7 then _G["ActionButton"..i]:SetPoint("LEFT", _G["ActionButton"..i - 1], "RIGHT", 6, 0) end
	end
	--Hide Backgrounds
	for i = 0, 3 do _G["MainMenuBarTexture"..i]:Hide() end
	--Hide Gryphons
	MainMenuBarLeftEndCap:Hide()
	MainMenuBarRightEndCap:Hide()
	--Hide Action Button Borders
	for i = 1, 12 do _G["ActionButton"..i.."NormalTexture"]:Hide() end
	--Reposition
	MainMenuBar:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 20) MainMenuBar.SetPoint = function() end
	MainMenuBar:SetSize(500, 37)
	--Hide Page Select Arrow Buttons
	ActionBarDownButton:Hide()
	ActionBarUpButton:Hide()
	MainMenuBarPageNumber:Hide()


--Bottom Left Action Bar
	--Reposition
	MultiBarBottomLeftButton1:ClearAllPoints()
	MultiBarBottomLeftButton1:SetPoint("BOTTOMLEFT", ActionButton1, "TOPLEFT",  0, 3) MultiBarBottomLeftButton1.SetPoint = function() end
	--Hide Button Borders
	for i = 1, 12 do
		_G["MultiBarBottomLeftButton"..i]:SetNormalTexture("") 
		_G["MultiBarBottomLeftButton"..i.."FloatingBG"]:SetAlpha(0) 
	end


--Bottom Right Action Bar
	--Hide Button Borders
	for i = 1, 12 do
		_G["MultiBarBottomRightButton"..i]:SetNormalTexture("") 
		_G["MultiBarBottomRightButton"..i.."FloatingBG"]:SetAlpha(0) 
	end
	--Reposition
	MultiBarBottomRight:ClearAllPoints()
	MultiBarBottomRight:SetPoint("BOTTOMLEFT", MultiBarBottomLeftButton1, "TOPLEFT", 0, 3) MultiBarBottomRight.SetPoint = function() end


--MultiBarLeft
	--Make buttons into 3 rows of 4 buttons
	for i = 1, 12 do 
		_G["MultiBarLeftButton"..i]:ClearAllPoints()
	end
	for i = 9, 11 do 
		local n = "MultiBarLeftButton" 
		local btn = _G[n..i] 
		btn:SetPoint("RIGHT", n..i + 1, "LEFT", -6, 0)
	end
	for i = 5, 8 do
		local n = "MultiBarLeftButton" 
		local btn = _G[n..i] 
		btn:SetPoint("BOTTOM", n..i + 4, "TOP", 0, 3)
	end
	for i = 1, 4 do
		local n = "MultiBarLeftButton" 
		local btn = _G[n..i] 
		btn:SetPoint("BOTTOM", n..i + 4, "TOP", 0, 3)
	end
	-- Hide Button Borders
	for i = 1, 12 do 
		_G["MultiBarLeftButton"..i.."NormalTexture"]:Hide()
		_G["MultiBarLeftButton"..i.."FloatingBG"]:SetAlpha(0) 
	end
	--Reposition
	MultiBarLeftButton12:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -5, 35) MultiBarLeftButton12.SetPoint = function() end


--MultiBarRight
	--Reposition
	MultiBarRightButton1:ClearAllPoints()
	MultiBarRightButton1:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", 0, -195) MultiBarRightButton1.SetPoint = function() end


--Framerate Text
	-- Hide Label
	FramerateLabel:SetAlpha(0)
	--Reposition
	FramerateText:ClearAllPoints() 
	FramerateText:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -2, -140) FramerateText.SetPoint = function() end
	--Scale
	FramerateText:SetScale(0.9) FramerateText.SetScale = function() end
	--Enable on launch
	ToggleFramerate()

--Gear Durability Frame
 	--Reposition
	 DurabilityFrame:ClearAllPoints()
	 DurabilityFrame:SetPoint("BOTTOMRIGHT", MinimapCluster, "BOTTOMLEFT", 40, 12) DurabilityFrame.SetPoint = function() end


--Bag Buttons
	--Create new frame
	local f = CreateFrame("Frame","Bags",UIParent)
	f:SetSize(150, 40) -- Set these to whatever height/width is needed 
	f:SetPoint("BOTTOMRIGHT", 0, 0) f.SetPoint = function() end
	f:Show()
	f:SetAlpha(0)
	--Do stuff to primary bag button
	MainMenuBarBackpackButton:ClearAllPoints()
	MainMenuBarBackpackButton:SetScale(0.8)
	MainMenuBarBackpackButtonNormalTexture:Hide()
	MainMenuBarBackpackButton:SetPoint("BOTTOMRIGHT", Bags, "BOTTOMRIGHT", 0, 0) MainMenuBarBackpackButton.SetPoint = function() end
	MainMenuBarBackpackButton:SetParent(Bags)
	MainMenuBarBackpackButton:SetScript("OnEnter", function(StatusTrackingBarManager) Bags:SetAlpha(1) end)
	MainMenuBarBackpackButton:SetScript("OnLeave", function(StatusTrackingBarManager) Bags:SetAlpha(0) end)
	--Do stuff to equippable bag buttons
	CharacterBag0Slot:SetPoint("RIGHT", MainMenuBarBackpackButton, "LEFT", 0, -1)
	for i = 0, 3 do 
		_G["CharacterBag"..i.."SlotNormalTexture"]:Hide() 
		if i > 0 then _G["CharacterBag"..i.."Slot"]:SetPoint("RIGHT", _G["CharacterBag"..(i - 1).."Slot"] , "LEFT", 0, 0) end
		_G["CharacterBag"..i.."Slot"]:SetScale(0.8) 
		_G["CharacterBag"..i.."Slot"]:SetParent(Bags) 
		_G["CharacterBag"..i.."Slot"]:SetScript("OnEnter", function(StatusTrackingBarManager) Bags:SetAlpha(1) end) 
		_G["CharacterBag"..i.."Slot"]:SetScript("OnLeave", function(StatusTrackingBarManager) Bags:SetAlpha(0) end) 
	end


--Bag Container Frames
	--Reposition
	ContainerFrame1:ClearAllPoints()
	ContainerFrame1:SetPoint("BOTTOMRIGHT", MainMenuBarBackpackButton, "TOPRIGHT", -40, 0) ContainerFrame1.SetPoint = function() end
	ContainerFrame4:ClearAllPoints()
	ContainerFrame4:SetPoint("BOTTOMRIGHT", ContainerFrame1, "BOTTOMLEFT", 0, 21) ContainerFrame4.SetPoint = function() end
	ContainerFrame5:ClearAllPoints()
	ContainerFrame5:SetPoint("BOTTOMRIGHT", ContainerFrame4, "TOPRIGHT", 0, 0) ContainerFrame5.SetPoint = function() end


--Ping Meter
	--Reposition
	MainMenuBarPerformanceBarFrame:ClearAllPoints()
	MainMenuBarPerformanceBarFrame:SetFrameLevel(0)
	MainMenuBarPerformanceBarFrame:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", 7, -37) MainMenuBarPerformanceBarFrame.SetPoint = function() end


--Quest Tracker
	--Reposition
	QuestWatchFrame:ClearAllPoints()
	QuestWatchFrame:SetPoint("TOPRIGHT", MultiBarRightButton1, "TOPLEFT", -6, 0) QuestWatchFrame.SetPoint = function() end


--XP Bar
	--Reposition
	MainMenuExpBar:ClearAllPoints()
	MainMenuExpBar:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 0) MainMenuExpBar.SetPoint = function() end
	--Hover to show
	MainMenuExpBar:SetAlpha(0)
	MainMenuExpBar:SetScript("OnEnter", function(StatusTrackingBarManager) MainMenuExpBar:SetAlpha(1) end)
	MainMenuExpBar:SetScript("OnLeave", function(StatusTrackingBarManager) MainMenuExpBar:SetAlpha(0) end)
	--Hide bar that shows up at level 60
	MainMenuBarMaxLevelBar:SetAlpha(0)

--Casting Bar
	CastingBarFrame:ClearAllPoints()
	CastingBarFrame:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 240) CastingBarFrame.SetPoint = function() end

-- TODO: Move ping meteer to behind minimap

 -- MainMenuBarVehicleLeaveButton:ClearAllPoints()
 -- MainMenuBarVehicleLeaveButton:SetPoint("TOP", UIParent, "CENTER", 0, 0) MainMenuBarVehicleLeaveButton.SetPoint = function() end