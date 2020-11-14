

-- addon frame
local frame = BPAframe or CreateFrame("FRAME", "BPAframe")
local classcolor = {["Priest"] = {1.00, 1.00, 1.00}, ["Paladin"] = {0.96, 0.55, 0.73}, ["Druid"] = {1.00, 0.49, 0.04}, ["Shaman"] = {0.96, 0.55, 0.73}, ["Warrior"] = {0.78, 0.61, 0.43}}
potentialTanks = {}


for i=1,40 do
      local name, _, _, _, class, _, _, _, _, role, _, _ = GetRaidRosterInfo(i);
      if class == "Warrior" or class == "Druid" then
        tank = {"class" = class, "name" = name}
        table.insert(potentialTanks, tank)
      end
   end
   -- print all potential tanks
   for i=1,#potentialTanks do
     print(potentialTanks[i].name)
     print(potentialTanks[i].class)
   end


-- Main ui window
local BPA = BPA or CreateFrame("frame", "BPA")
BPA:Hide()

BPA:SetBackdrop({
  bgFile = "Interface\\AddOns\\BloodPactAssignments\\Resources\\backdrop",
  edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
  tile = false, tileSize = 32, edgeSize = 32,
  insets = {left = 11, right = 12, top = 12, bottom = 11}
})
BPA:SetBackdropColor(0,0,0,0.6)
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

BPA.heal = BPA:CreateFontString(nil, "ARTWORK")
BPA.heal:SetFontObject(GameFontNormalSmall)
BPA.heal:SetPoint("TOP", 0 , - 12)
BPA.heal:SetText("Blood Pact Raid Assignments")




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
