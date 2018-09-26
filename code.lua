-- This file is loaded from "God.toc"


--Turn MultiBarRight into 3 4 button rows
for i = 2, 4 do 
	local n = "MultiBarRightButton" 
	local btn = _G[n..i] 
	btn:ClearAllPoints() 
	btn:SetPoint("LEFT", n..i - 1, "RIGHT", 6, 0)
end
for i = 5, 8 do
	local n = "MultiBarRightButton" 
	local btn = _G[n..i] 
	btn:ClearAllPoints() 
	btn:SetPoint("TOP", n..i - 4, "BOTTOM", 0, -6)
end
for i = 9, 12 do
	local n = "MultiBarRightButton" 
	local btn = _G[n..i] 
	btn:ClearAllPoints() 
	btn:SetPoint("TOP", n..i - 4, "BOTTOM", 0, -6)
end

MultiBarRight:ClearAllPoints() 
MultiBarRight:SetPoint("TOP", MicroButtonAndBagsBar, "TOP", 8, 77) MultiBarRight.SetPoint = function() end


--Hide Stuff
MainMenuBarArtFrameBackground:Hide()
MainMenuBarArtFrame.RightEndCap:Hide()
MainMenuBarArtFrame.LeftEndCap:Hide()
MainMenuBarArtFrame.PageNumber:Hide()
MicroButtonAndBagsBar:Hide()
ActionBarUpButton:Hide()
ActionBarDownButton:Hide()
QuickJoinToastButton:Hide()


-- Hide Action Button Borders
for i = 1, 12 do
 _G["ActionButton"..i]:SetNormalTexture("") 
end

--Hide Multi Bar Bottom Left Button Borders
for i = 1, 12 do
 _G["MultiBarBottomLeftButton"..i.."FloatingBG"]:SetAlpha(0)
 _G["MultiBarBottomLeftButton"..i.."NormalTexture"]:SetAlpha(0) 
end

--Hide Multi Bar Right Button Borders
for i = 1, 12 do
 _G["MultiBarRightButton"..i.."FloatingBG"]:SetAlpha(0)
 _G["MultiBarRightButton"..i.."NormalTexture"]:SetAlpha(0) 
end

--MAKE NAMEPLATE DEBUFFS BIGGER
local function fn(...) for _,v in pairs(C_NamePlate.GetNamePlates()) do local bf=v.UnitFrame.BuffFrame bf:SetScale(1.5) end end NamePlateDriverFrame:HookScript("OnEvent",fn)

--Scale Stuff Bigger
PlayerFrame:SetScale(1.5) PlayerFrame.SetScale = function() end 
TargetFrame:SetScale(1.5) TargetFrame.SetScale = function() end 
BuffFrame:SetScale(1.2) BuffFrame.SetScale = function() end 
ClassNameplateBarRogueDruidFrame:SetScale(1.1) ClassNameplateBarRogueDruidFrame.SetScale = function() end 
MainMenuBar:SetScale(1.3) MainMenuBar.SetScale = function() end 
MultiBarRight:SetScale(1.2) MultiBarRight.SetScale = function() end 

--Make Arrow Keys Work in Text Chat
for i=1,10 do b=_G["ChatFrame"..i.."EditBox"] b:SetAltArrowKeyMode(false) end

--Move ObjectiveTracker to right of screen(eliminate rightactionbar spacing) Fucks up progress traker in dungeons and raids
-- ObjectiveTrackerFrame:ClearAllPoints() ObjectiveTrackerFrame.ClearAllPoints = function() end
-- ObjectiveTrackerFrame:SetPoint("TOPRIGHT", "MinimapBorder", "BOTTOMRIGHT", -10, 15) ObjectiveTrackerFrame.SetPoint = function() end

--FramerateText Stuff
FramerateLabel:SetAlpha(0)
FramerateText:ClearAllPoints() FramerateText.ClearAllPoints = function() end 
FramerateText:SetPoint("BOTTOMLEFT", UIParent, 5, 5) FramerateText.SetPoint = function() end
FramerateText:SetScale(0.9) FramerateText.SetScale = function() end

--ToolTip Stuff
-- GameTooltip:ClearAllPoints() GameTooltip.ClearAllPoints = function() end 
-- GameTooltip:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -220, 80) GameTooltip.SetPoint = function() end


-- Only Show Azerite Power Bar on Hover
StatusTrackingBarManager:Show()
StatusTrackingBarManager.SingleBarSmall:SetAlpha(0)
StatusTrackingBarManager:SetAlpha(0)
StatusTrackingBarManager:SetScript("OnEnter", function(StatusTrackingBarManager) StatusTrackingBarManager:SetAlpha(1) end)
StatusTrackingBarManager:SetScript("OnLeave", function(StatusTrackingBarManager) StatusTrackingBarManager:SetAlpha(0) end)



-- /NOTES\
	
-- /fstack


--ToolTip - Needs work
-- GameTooltip
