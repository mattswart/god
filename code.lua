-- This file is loaded from "God.toc"


-- EXTRA UTILITY FUNCTIONS
	-- Make Arrow Keys Work in Text Chat
	for i=1,10 do b=_G["ChatFrame"..i.."EditBox"] b:SetAltArrowKeyMode(false) end
-- Micro Buttons
	-- Reposition
	CharacterMicroButton:ClearAllPoints()
	CharacterMicroButton:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 10, 0)
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
	-- Hide Bag Buttons
	for i = 0, 3 do _G["CharacterBag"..i.."Slot"]:Hide() end
	MainMenuBarBackpackButton:Hide()
	-- Hide Button Borders
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