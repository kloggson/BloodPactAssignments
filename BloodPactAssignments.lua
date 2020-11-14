-- addon frame
local frame = BPAframe or CreateFrame("FRAME", "BPAframe")

-- Main ui window
local BPA = BPA or CreateFrame("frame", "BPA")
BPA:Hide()
BPA:SetBackdrop({
  bgFile = "Interface\\FrameGeneral\\UI-Background-Rock",
  edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
  tile = false, tileSize = 32, edgeSize = 32,
  insets = {left = 11, right = 12, top = 12, bottom = 11}
})
BPA:SetWidth(512)
BPA:SetHeight(400)
BPA:SetPoint("CENTER", UIParent)
BPA:EnableMouse(true)
BPA:SetMovable(true)
BPA:RegisterForDrag("LeftButton")
BPA:SetScript("OnDragStart", function(BPAUI) BPAUI:StartMoving() end)
BPA:SetScript("OnDragStop", function(BPAUI) BPAUI:StopMovingOrSizing() end)
BPA:SetFrameStrata("FULLSCREEN_DIALOG")
 BPA.closeButton = BPA.closeButton or CreateFrame("button", nil, BPA, "UIPanelCloseButton")
 BPA.closeButton:SetPoint("TOPRIGHT", 0, 0)
 BPA.closeButton:SetScript("OnClick", function(self)
   BPA:Hide()
  end)

-- addon Load
local function BPALoad(self, event, arg1, arg2, arg3, arg4, ...)
  if event == "ADDON_LOADED" and arg1 == "bpa" then
  end
end

-- Show UI
SLASH_BPA1 = "/bpa"
SlashCmdList["BPA"] = function(functionName)
  BPA:Show()
end

frame:SetScript("OnEvent", BPALoad)
