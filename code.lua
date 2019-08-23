-- This file is loaded from "God.toc"


-- UTILITY FUNCTIONS
	-- Arrow Keys Work in Text Chat
	for i=1,10 do b=_G["ChatFrame"..i.."EditBox"] b:SetAltArrowKeyMode(false) end
	-- Extra slash commands
		-- /clc to clear combat log
		SlashCmdList["CLCE"] = function() CombatLogClearEntries() end
		SLASH_CLCE1 = "/clc"
		-- /gm to opan a GMM ticket
		SlashCmdList["TICKET"] = function() ToggleHelpFrame() end
		SLASH_TICKET1 = "/gm"
		-- /rc for readycheck
		SlashCmdList["READYCHECK"] = function() DoReadyCheck() end
		SLASH_READYCHECK1 = '/rc'
		-- /cr for check role
		SlashCmdList["CHECKROLE"] = function() InitiateRolePoll() end
		SLASH_CHECKROLE1 = '/cr'
-- Character Frames
	-- Class color in HP bar
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
	-- Class icons instead of portraits
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
-- Minimap
	-- Hide Zoom Buttons
	MinimapZoomIn:Hide()
	MinimapZoomOut:Hide()
	-- Enable Scroll to Zoom
	Minimap:EnableMouseWheel(true)
	Minimap:SetScript('OnMouseWheel', function(self, delta)
	    if delta > 0 
	    	then Minimap_ZoomIn()
	    	else Minimap_ZoomOut()
	    end
	end)
-- Micro Buttons
	-- Reposition
	CharacterMicroButton:ClearAllPoints()
	CharacterMicroButton:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 10, 0)

-- Main Action Bar
	--Restructure Button Points Without MainMenuBarArtFrame(Because it's hiddden)
	for i = 1, 12 do _G["ActionButton"..i]:ClearAllPoints() end
	for i = 1, 12 do
		if i < 7 then _G["ActionButton"..i]:SetPoint("RIGHT", _G["ActionButton"..i + 1], "LEFT", -3, 0) end
		if i == 7 then _G["ActionButton"..i]:SetPoint("BOTTOM", MainMenuBar, "BOTTOM", 10, 0) end
		if i > 7 then _G["ActionButton"..i]:SetPoint("LEFT", _G["ActionButton"..i - 1], "RIGHT", 3, 0) end
	end
	-- Hide Backgrounds
	for i = 0, 3 do _G["MainMenuBarTexture"..i]:Hide() end
	-- Hide Gryphons
	MainMenuBarLeftEndCap:Hide()
	MainMenuBarRightEndCap:Hide()
	-- Bags
		-- Create new frame
		local f = CreateFrame("Frame","Bags",UIParent)
		f:SetSize(195, 40) -- Set these to whatever height/width is needed 
		f:SetPoint("BOTTOMRIGHT",0,0)
		f:Show()
		f:SetAlpha(0)
		-- Do stuff to primary bag button
		MainMenuBarBackpackButton:ClearAllPoints()
		MainMenuBarBackpackButton:SetScale(0.8)
		MainMenuBarBackpackButtonNormalTexture:Hide()
		MainMenuBarBackpackButton:SetPoint("BOTTOMRIGHT", Bags, "BOTTOMRIGHT", 0, 0)
		MainMenuBarBackpackButton:SetParent(Bags)
		MainMenuBarBackpackButton:SetScript("OnEnter", function(StatusTrackingBarManager) Bags:SetAlpha(1) end)
		MainMenuBarBackpackButton:SetScript("OnLeave", function(StatusTrackingBarManager) Bags:SetAlpha(0) end)
		-- Do stuff to equippable bag buttons
		CharacterBag0Slot:SetPoint("RIGHT", MainMenuBarBackpackButton, "LEFT", 0, -1)
		for i = 0, 3 do 
			_G["CharacterBag"..i.."SlotNormalTexture"]:Hide() 
			if i > 0 then _G["CharacterBag"..i.."Slot"]:SetPoint("RIGHT", _G["CharacterBag"..(i - 1).."Slot"] , "LEFT", 0, 0) end
			_G["CharacterBag"..i.."Slot"]:SetScale(0.8) 
			_G["CharacterBag"..i.."Slot"]:SetParent(Bags) 
			_G["CharacterBag"..i.."Slot"]:SetScript("OnEnter", function(StatusTrackingBarManager) Bags:SetAlpha(1) end) 
			_G["CharacterBag"..i.."Slot"]:SetScript("OnLeave", function(StatusTrackingBarManager) Bags:SetAlpha(0) end) 
		end
	-- Ping Meter
		--Reposition
		MainMenuBarPerformanceBarFrame:ClearAllPoints()
		MainMenuBarPerformanceBarFrame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 0, -10)
	-- XP Bar
		-- Reposition
		MainMenuExpBar:ClearAllPoints()
		MainMenuExpBar:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 0)
		-- Hover to show
		MainMenuExpBar:SetAlpha(0)
		MainMenuExpBar:SetScript("OnEnter", function(StatusTrackingBarManager) MainMenuExpBar:SetAlpha(1) end)
		MainMenuExpBar:SetScript("OnLeave", function(StatusTrackingBarManager) MainMenuExpBar:SetAlpha(0) end)
	-- Hide Action Button Borders
	for i = 1, 12 do _G["ActionButton"..i.."NormalTexture"]:Hide() end
	-- Reposition
	MainMenuBar:SetPoint("BOTTOM", UIParent, "BOTTOM", -4, 30)
	-- Reposition Page Select Arrow Buttons
	ActionBarDownButton:ClearAllPoints()
	ActionBarDownButton:SetPoint("LEFT", ActionButton12, "BOTTOMRIGHT", 1, 3)
	ActionBarUpButton:ClearAllPoints()
	ActionBarUpButton:SetPoint("LEFT", ActionButton12, "TOPRIGHT", 1, -3)
	MainMenuBarPageNumber:ClearAllPoints()
	MainMenuBarPageNumber:SetPoint("LEFT", ActionButton12, "RIGHT", 11, 0)
-- Bottom Left Action Bar
	-- Reposition
	MultiBarBottomLeftButton1:ClearAllPoints()
	MultiBarBottomLeftButton1:SetPoint("BOTTOMLEFT", ActionButton1, "TOPLEFT",  0, 10)
	-- Hide Button Borders
	for i = 1, 12 do
		_G["MultiBarBottomLeftButton"..i]:SetNormalTexture("") 
		_G["MultiBarBottomLeftButton"..i.."FloatingBG"]:SetAlpha(0) 
	end
-- Bottom Right Action Bar
	-- Hide Button Borders
	for i = 1, 12 do
		_G["MultiBarBottomRightButton"..i]:SetNormalTexture("") 
		_G["MultiBarBottomRightButton"..i.."FloatingBG"]:SetAlpha(0) 
	end
	--Reposition
	MultiBarBottomRight:ClearAllPoints()
	MultiBarBottomRight:SetPoint("BOTTOMLEFT", MultiBarBottomLeftButton1, "TOPLEFT", 0, 3) MultiBarBottomRight.SetPoint = function() end
--Framerate Text
	-- Hide Label
	FramerateLabel:SetAlpha(0)
	-- Reposition
	FramerateText:ClearAllPoints() 
	FramerateText:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0) 
	-- Scale
	FramerateText:SetScale(0.9) FramerateText.SetScale = function() end



--Turn MultiBarRight into 3 4 button rows
	-- for i = 2, 4 do 
	-- 	local n = "MultiBarRightButton" 
	-- 	local btn = _G[n..i] 
	-- 	btn:ClearAllPoints() 
	-- 	btn:SetPoint("LEFT", n..i - 1, "RIGHT", 6, 0)
	-- end
	-- for i = 5, 8 do
	-- 	local n = "MultiBarRightButton" 
	-- 	local btn = _G[n..i] 
	-- 	btn:ClearAllPoints() 
	-- 	btn:SetPoint("TOP", n..i - 4, "BOTTOM", 0, -6)
	-- end
	-- for i = 9, 12 do
	-- 	local n = "MultiBarRightButton" 
	-- 	local btn = _G[n..i] 
	-- 	btn:ClearAllPoints() 
	-- 	btn:SetPoint("TOP", n..i - 4, "BOTTOM", 0, -6)
	-- end

	-- MultiBarRight:ClearAllPoints() 
	-- MultiBarRight:SetPoint("TOP", UIParent, "TOP", 0, 0) MultiBarRight.SetPoint = function() end