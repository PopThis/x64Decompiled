local UI_BUFFTYPE = CppEnums.UserChargeType
local enValue = {MaxCharacterTypeList = 7, MaxEquipSlotCount = 18}
local enToggleIndex = {
  Underwear = 0,
  Avater = 1,
  Helmet = 2,
  AwakenWeapon = 3,
  FaceViewHair = 4,
  FaceGuard = 5,
  WarStance = 6
}
function FGlobal_Panel_Dye_ReNew_Reset()
  for idx = 0, 6 do
    local static_BG = UI.getChildControl(Panel_Dye_ReNew, "Static_BG")
    local staticBG_CharacterType = UI.getChildControl(static_BG, "Static_SlotBG_CharacterType_" .. idx)
    local radioButton_CharacterType = UI.getChildControl(staticBG_CharacterType, "RadioButton_CharacterType_" .. idx)
    radioButton_CharacterType:SetCheck(false)
    if 0 == idx then
      radioButton_CharacterType:SetCheck(true)
    end
  end
  local checkButton_ToggleWarStance = UI.getChildControl(Panel_Dye_ReNew, "CheckButton_WarStance")
  local checkButton_ToggleShowUnderwear = UI.getChildControl(Panel_Dye_ReNew, "CheckButton_ShowUnderWear")
  local checkButton_ToggleHideAvatar = UI.getChildControl(Panel_Dye_ReNew, "CheckButton_HideAvatar")
  local checkButton_ToggleHideHair = UI.getChildControl(Panel_Dye_ReNew, "CheckButton_HideHair")
  local checkButton_ToggleHideHelmet = UI.getChildControl(Panel_Dye_ReNew, "CheckButton_HideHelmet")
  local checkButton_ToggleOpenFaceGuard = UI.getChildControl(Panel_Dye_ReNew, "CheckButton_OpenFaceGuard")
  local checkButton_ToggleAwakenWeapon = UI.getChildControl(Panel_Dye_ReNew, "CheckButton_AwakenWeapon")
  local txt_Endurance = UI.getChildControl(Panel_Dye_ReNew, "StaticText_Endurance")
  local slider_Endurance = UI.getChildControl(Panel_Dye_ReNew, "Slider_Endurance")
  checkButton_ToggleWarStance:SetCheck(true)
  checkButton_ToggleShowUnderwear:SetCheck(true)
  checkButton_ToggleHideAvatar:SetCheck(true)
  checkButton_ToggleHideHair:SetCheck(false)
  checkButton_ToggleHideHelmet:SetCheck(false)
  checkButton_ToggleOpenFaceGuard:SetCheck(false)
  checkButton_ToggleAwakenWeapon:SetCheck(false)
  slider_Endurance:SetControlPos(100)
end
local dyePartString = {
  [0] = {
    [0] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_MAINHAND"),
    [1] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_SUBHAND"),
    [3] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CHARACTER_ARMOR"),
    [4] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_GLOVES"),
    [5] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_BOOTS"),
    [6] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_HELM"),
    [18] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_AVATAR_MAINHAND"),
    [19] = PAGetString(Defines.StringSheet_GAME, "PANEL_TOOLTIP_EQUIP_AVATAR_SUBHAND"),
    [14] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_BODY"),
    [15] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_HANDS"),
    [16] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_BOOTS"),
    [17] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_HELM"),
    [20] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_UNDERWEAR"),
    [21] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CHARACTER_ACC_0"),
    [22] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CHARACTER_ACC_1"),
    [23] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CHARACTER_ACC_2"),
    [29] = PAGetString(Defines.StringSheet_GAME, "Lua_EquipSlotNo_String_awakenWeapon"),
    [30] = PAGetString(Defines.StringSheet_GAME, "Lua_EquipSlotNo_String_avatarAwakenWeapon")
  },
  {
    [3] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_BARD"),
    [4] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_STIRRUP"),
    [5] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_SADDLE"),
    [6] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_HORSEHEAD"),
    [12] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_FOOT"),
    [14] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_ARMOR"),
    [15] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_STIRRUP"),
    [16] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_SADDLE"),
    [17] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_FACE")
  },
  {
    [3] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_BODY"),
    [4] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_TIRE"),
    [5] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_FLAG"),
    [6] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_INSIGNIA"),
    [13] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_LAMP"),
    [25] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_CORVER"),
    [14] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_AVATAR_BODY"),
    [15] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_AVATAR_TIRE"),
    [16] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_AVATAR_FLAG"),
    [17] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_AVATAR_INSIGNIA"),
    [26] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_CARRIAGE_AVATAR_CORVER")
  },
  {
    [3] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_BARD"),
    [4] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_STIRRUP"),
    [5] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_SADDLE"),
    [6] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_HORSEHEAD"),
    [12] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_FOOT"),
    [14] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_ARMOR"),
    [15] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_STIRRUP"),
    [16] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_SADDLE"),
    [17] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_FACE")
  },
  {
    [3] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_BARD"),
    [4] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_STIRRUP"),
    [5] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_SADDLE"),
    [6] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_HORSEHEAD"),
    [12] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_FOOT"),
    [14] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_ARMOR"),
    [15] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_STIRRUP"),
    [16] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_SADDLE"),
    [17] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_FACE")
  },
  {
    [3] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_BARD"),
    [4] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_STIRRUP"),
    [5] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_SADDLE"),
    [6] = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_HORSEHEAD"),
    [12] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_FOOT"),
    [14] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_ARMOR"),
    [15] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_STIRRUP"),
    [16] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_SADDLE"),
    [17] = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_DYEPART_HORSE_AVATAR_FACE")
  },
  {
    [3] = PAGetString(Defines.StringSheet_GAME, "LUA_DYERENEW_DYEPART_CAMPTENT_WAREHOUSE"),
    [4] = PAGetString(Defines.StringSheet_GAME, "LUA_DYERENEW_DYEPART_CAMPTENT_REPAIRSHOP"),
    [5] = PAGetString(Defines.StringSheet_GAME, "LUA_DYERENEW_DYEPART_CAMPTENT_SHOP"),
    [6] = PAGetString(Defines.StringSheet_GAME, "LUA_DYERENEW_DYEPART_CAMPTENT_TENT"),
    [14] = PAGetString(Defines.StringSheet_GAME, "LUA_DYERENEW_DYEPART_CAMPTENT_WAREHOUSE"),
    [15] = PAGetString(Defines.StringSheet_GAME, "LUA_DYERENEW_DYEPART_CAMPTENT_REPAIRSHOP"),
    [16] = PAGetString(Defines.StringSheet_GAME, "LUA_DYERENEW_DYEPART_CAMPTENT_SHOP"),
    [17] = PAGetString(Defines.StringSheet_GAME, "LUA_DYERENEW_DYEPART_CAMPTENT_TENT")
  }
}
function FGlobal_Panel_Dye_ReNew_AddEvent()
  local radioButton_CharacterType, staticBG_CharacterType
  local Static_BG = UI.getChildControl(Panel_Dye_ReNew, "Static_BG")
  for ii = 0, enValue.MaxCharacterTypeList - 1 do
    staticBG_CharacterType = UI.getChildControl(Static_BG, "Static_SlotBG_CharacterType_" .. ii)
    radioButton_CharacterType = UI.getChildControl(staticBG_CharacterType, "RadioButton_CharacterType_" .. ii)
    radioButton_CharacterType:addInputEvent("Mouse_LUp", "HandleClicked_DyeReNew_SelectCharacterType( " .. ii .. " )")
    if 3 == ii and false == FGlobal_DyeReNew_GetEnableCamel() then
      radioButton_CharacterType:SetShow(false)
    end
    if 6 == ii and false == FGlobal_DyeReNew_GetEnableTent() then
      radioButton_CharacterType:SetShow(false)
    end
  end
  local buttonQuestion = UI.getChildControl(Panel_Dye_ReNew, "Button_Question")
  buttonQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"Dye\" )")
  buttonQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"Dye\", \"true\")")
  buttonQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"Dye\", \"false\")")
  local slider_Endurance = UI.getChildControl(Panel_Dye_ReNew, "Slider_Endurance")
  local slider_EnduranceController = UI.getChildControl(slider_Endurance, "Slider_Endurance_Button")
  slider_Endurance:addInputEvent("Mouse_LUp", "HandleClicked_DyeReNew_SetEndurance()")
  slider_EnduranceController:addInputEvent("Mouse_LPress", "HandleClicked_DyeReNew_SetEndurance()")
  local txt_Endurance = UI.getChildControl(Panel_Dye_ReNew, "StaticText_Endurance")
  if true == FGlobal_DyeReNew_GetEnableKR2() then
    txt_Endurance:SetShow(false)
    slider_Endurance:SetShow(false)
  end
  local checkButton_ToggleWarStance = UI.getChildControl(Panel_Dye_ReNew, "CheckButton_WarStance")
  checkButton_ToggleWarStance:addInputEvent("Mouse_LUp", "HandleClicked_DyeReNew_ToggleWarStance()")
  checkButton_ToggleWarStance:addInputEvent("Mouse_On", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(true," .. enToggleIndex.WarStance .. ")")
  checkButton_ToggleWarStance:addInputEvent("Mouse_Out", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(false," .. enToggleIndex.WarStance .. ")")
  local checkButton_ToggleShowUnderwear = UI.getChildControl(Panel_Dye_ReNew, "CheckButton_ShowUnderWear")
  checkButton_ToggleShowUnderwear:addInputEvent("Mouse_LUp", "HandleClicked_DyeReNew_SetShowUnderwear()")
  checkButton_ToggleShowUnderwear:addInputEvent("Mouse_On", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(true," .. enToggleIndex.Underwear .. ")")
  checkButton_ToggleShowUnderwear:addInputEvent("Mouse_Out", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(false," .. enToggleIndex.Underwear .. ")")
  if true == FGlobal_DyeReNew_GetEnableKR2() then
    checkButton_ToggleShowUnderwear:SetShow(false)
  end
  if false == ToClient_isAdultUser() then
    checkButton_ToggleShowUnderwear:SetShow(false)
    checkButton_ToggleShowUnderwear:SetIgnore(false)
  end
  local checkButton_ToggleHideAvatar = UI.getChildControl(Panel_Dye_ReNew, "CheckButton_HideAvatar")
  checkButton_ToggleHideAvatar:addInputEvent("Mouse_LUp", "HandleClicked_DyeReNew_SetHideAvartar()")
  checkButton_ToggleHideAvatar:addInputEvent("Mouse_On", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(true," .. enToggleIndex.Avater .. ")")
  checkButton_ToggleHideAvatar:addInputEvent("Mouse_Out", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(false," .. enToggleIndex.Avater .. ")")
  local checkButton_ToggleHideHair = UI.getChildControl(Panel_Dye_ReNew, "CheckButton_HideHair")
  checkButton_ToggleHideHair:addInputEvent("Mouse_LUp", "HandleClicked_DyeReNew_SetFaceViewHair()")
  checkButton_ToggleHideHair:addInputEvent("Mouse_On", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(true," .. enToggleIndex.FaceViewHair .. ")")
  checkButton_ToggleHideHair:addInputEvent("Mouse_Out", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(false," .. enToggleIndex.FaceViewHair .. ")")
  local checkButton_ToggleHideHelmet = UI.getChildControl(Panel_Dye_ReNew, "CheckButton_HideHelmet")
  checkButton_ToggleHideHelmet:addInputEvent("Mouse_LUp", "HandleClicked_DyeReNew_SetHideHelmet()")
  checkButton_ToggleHideHelmet:addInputEvent("Mouse_On", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(true," .. enToggleIndex.Helmet .. ")")
  checkButton_ToggleHideHelmet:addInputEvent("Mouse_Out", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(false," .. enToggleIndex.Helmet .. ")")
  local checkButton_ToggleOpenFaceGuard = UI.getChildControl(Panel_Dye_ReNew, "CheckButton_OpenFaceGuard")
  checkButton_ToggleOpenFaceGuard:addInputEvent("Mouse_LUp", "HandleClicked_DyeReNew_SetFaceGuard()")
  checkButton_ToggleOpenFaceGuard:addInputEvent("Mouse_On", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(true," .. enToggleIndex.FaceGuard .. ")")
  checkButton_ToggleOpenFaceGuard:addInputEvent("Mouse_Out", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(false," .. enToggleIndex.FaceGuard .. ")")
  local checkButton_ToggleAwakenWeapon = UI.getChildControl(Panel_Dye_ReNew, "CheckButton_AwakenWeapon")
  checkButton_ToggleAwakenWeapon:addInputEvent("Mouse_LUp", "HandleClicked_DyeReNew_SetAwakenWeapon()")
  checkButton_ToggleAwakenWeapon:addInputEvent("Mouse_On", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(true," .. enToggleIndex.AwakenWeapon .. ")")
  checkButton_ToggleAwakenWeapon:addInputEvent("Mouse_Out", "HandleOver_DyeReNew_SimpleTooltipCheckbutton(false," .. enToggleIndex.AwakenWeapon .. ")")
  checkButton_ToggleAwakenWeapon:SetShow(FGlobal_DyeReNew_GetEnableAwaken())
  local UIAmpuleTargetBG = UI.getChildControl(Static_BG, "Static_AmpuleTartget_BG")
  local RadioButton_Tab_ALL = UI.getChildControl(UIAmpuleTargetBG, "RadioButton_Tab_ALL")
  local RadioButton_Tab_My = UI.getChildControl(UIAmpuleTargetBG, "RadioButton_Tab_My")
  local RadioButton_Tab_Pearl = UI.getChildControl(UIAmpuleTargetBG, "RadioButton_Tab_Pearl")
  RadioButton_Tab_ALL:addInputEvent("Mouse_LUp", "HandleClicked_LUp_Ampule_SelectedType( true, false )")
  RadioButton_Tab_ALL:addInputEvent("Mouse_On", "HandleOnOut_DyeReNew_Palette_Category_Tooltip( true, " .. 8 .. ")")
  RadioButton_Tab_ALL:addInputEvent("Mouse_Out", "HandleOnOut_DyeReNew_Palette_Category_Tooltip( false, " .. 8 .. ")")
  RadioButton_Tab_My:addInputEvent("Mouse_LUp", "HandleClicked_LUp_Ampule_SelectedType( false, false )")
  RadioButton_Tab_My:addInputEvent("Mouse_On", "HandleOnOut_DyeReNew_Palette_Category_Tooltip( true, " .. 9 .. ")")
  RadioButton_Tab_My:addInputEvent("Mouse_Out", "HandleOnOut_DyeReNew_Palette_Category_Tooltip( false, " .. 9 .. ")")
  RadioButton_Tab_Pearl:addInputEvent("Mouse_LUp", "HandleClicked_LUp_Ampule_SelectedType( true, true )")
  RadioButton_Tab_Pearl:addInputEvent("Mouse_On", "HandleOnOut_DyeReNew_Palette_Category_Tooltip( true, " .. 10 .. ")")
  RadioButton_Tab_Pearl:addInputEvent("Mouse_Out", "HandleOnOut_DyeReNew_Palette_Category_Tooltip( false, " .. 10 .. ")")
  if false == FGlobal_DyeReNew_GetEnableDyePearl() then
    RadioButton_Tab_Pearl:SetShow(false)
  end
  for ii = 0, 7 do
    local UIMaterial = UI.getChildControl(UIAmpuleTargetBG, "RadioButton_Material_" .. ii)
    UIMaterial:addInputEvent("Mouse_LUp", "HandleClicked_LUp_Ampule_SelectCategory( " .. ii .. ")")
    UIMaterial:addInputEvent("Mouse_On", "HandleOnOut_DyeReNew_Palette_Category_Tooltip( true, " .. ii .. ")")
    UIMaterial:addInputEvent("Mouse_Out", "HandleOnOut_DyeReNew_Palette_Category_Tooltip( false, " .. ii .. ")")
    if 0 == ii then
      UIMaterial:SetCheck(true)
    end
  end
  local ButtonDoDye = UI.getChildControl(Panel_Dye_ReNew, "Button_DoDye")
  ButtonDoDye:addInputEvent("Mouse_LUp", "HandleClicked_DeyReNew_DoDye()")
  local buttonQuestion = UI.getChildControl(Panel_Dye_New, "Button_Question")
  _buttonQuestion:addInputEvent("Mouse_LUp", "Panel_WebHelper_ShowToggle( \"Dye\" )")
  _buttonQuestion:addInputEvent("Mouse_On", "HelpMessageQuestion_Show( \"Dye\", \"true\")")
  _buttonQuestion:addInputEvent("Mouse_Out", "HelpMessageQuestion_Show( \"Dye\", \"false\")")
end
function HandleReset_DyeReNew_AmpuleTab_BySelectCharacterType()
  local Static_BG = UI.getChildControl(Panel_Dye_ReNew, "Static_BG")
  local UIAmpuleTargetBG = UI.getChildControl(Static_BG, "Static_AmpuleTartget_BG")
  local RadioButton_Tab_ALL = UI.getChildControl(UIAmpuleTargetBG, "RadioButton_Tab_ALL")
  local RadioButton_Tab_My = UI.getChildControl(UIAmpuleTargetBG, "RadioButton_Tab_My")
  local RadioButton_Tab_Pearl = UI.getChildControl(UIAmpuleTargetBG, "RadioButton_Tab_Pearl")
  RadioButton_Tab_ALL:SetCheck(false)
  RadioButton_Tab_My:SetCheck(true)
  RadioButton_Tab_Pearl:SetCheck(false)
end
function HandleClicked_DyeReNew_SelectCharacterType(idx)
  local self = FGlobal_DyeReNew_GetInstance()
  local oldSelectedCharacterType = self._selected_CharacterTarget
  local oldSelectEquipSlotNo = self._selected_EquipSlotNo
  if idx >= enValue.MaxCharacterTypeList or oldSelectedCharacterType == idx then
    return
  end
  self._selected_EquipSlotNo = -1
  local bChangeSelectedCharacterType = ToClient_RequestSetTargetType(idx)
  if bChangeSelectedCharacterType then
    self._selected_CharacterTarget = idx
    self._paletteShowAll = false
    self._isPearlPalette = false
    self._scrollStartIndex = 0
    self._AmpuleScroll:SetControlTop()
    Inventory_SetFunctor(FGlobal_Panel_DyeReNew_InventoryFilter, FGlobal_Panel_DyeReNew_Interaction_FromInventory, nil, nil)
    HandleReset_DyeReNew_AmpuleTab_BySelectCharacterType()
    self:Change_EquipIcon()
    self:Update_Part()
    self:Update_AmpuleList()
    self._selectedDyePart = {}
    self:Update_Position()
  else
    self._selected_EquipSlotNo = oldSelectEquipSlotNo
    local UIStaticBG = UI.getChildControl(Panel_Dye_ReNew, "Static_BG")
    local UIButtonBGOld = UI.getChildControl(UIStaticBG, "Static_SlotBG_CharacterType_" .. oldSelectedCharacterType)
    local UIRadioButtonOld = UI.getChildControl(UIButtonBGOld, "RadioButton_CharacterType_" .. oldSelectedCharacterType)
    local UIButtonBGNew, UIRadioButtonNew
    UIButtonBGNew = UI.getChildControl(UIStaticBG, "Static_SlotBG_CharacterType_" .. idx)
    UIRadioButtonNew = UI.getChildControl(UIButtonBGNew, "RadioButton_CharacterType_" .. idx)
    UIRadioButtonNew:SetCheck(false)
    UIRadioButtonOld:SetCheck(true)
  end
end
function HandleClicked_RUp_ClearEquipItemByEquipSlotNo(equipSlotNo, equipSlotIndex)
  local self = FGlobal_DyeReNew_GetInstance()
  Panel_Tooltip_Item_hideTooltip()
  ToClient_RequestClearDyeingTargetSlot(equipSlotNo)
  local removeCount = 0
  for key, value in pairs(self._selectedDyePart) do
    if value == equipSlotNo then
      removeCount = removeCount + 1
    end
  end
  for ii = 0, removeCount - 1 do
    table.remove(self._selectedDyePart, self._selectedDyePart[equipSlotNo])
  end
  self._arrEquipSlotItem[equipSlotIndex].icon:SetColor(4286019447)
  if equipSlotNo == self._selected_EquipSlotNo then
    self._selected_EquipSlotNo = -1
    self:Reset_Part(true)
  end
end
function HandleClicked_OnOut_ShowEquipItemToolTip(isShow, equipSlotNo, slotIdx)
  local self = FGlobal_DyeReNew_GetInstance()
  if true == isShow then
    local itemWrapper = ToClient_RequestGetDyeingTargetItemWrapper(equipSlotNo)
    local SlotIcon = self._arrEquipSlotItem[slotIdx].icon
    Panel_Tooltip_Item_Show(itemWrapper, SlotIcon, false, true)
  else
    Panel_Tooltip_Item_hideTooltip()
  end
end
function HandleClicked_LUp_SelectEquipItem(equipSlotNo, equipSlotIndex)
  local self = FGlobal_DyeReNew_GetInstance()
  for ii = 0, enValue.MaxEquipSlotCount - 1 do
    if ii == equipSlotIndex then
      self._arrEquipSlotItem[ii].icon:SetColor(4294967295)
    else
      self._arrEquipSlotItem[ii].icon:SetColor(4286019447)
    end
  end
  self._selected_EquipSlotNo = equipSlotNo
  ToClient_RequestSelectedEquipItem(equipSlotNo)
  self._nowClickPartId = -1
  self._nowClickPartSlotId = -1
  self:Reset_Part(true)
  self:Change_EquipIcon()
  self:Update_Part()
end
function HandleClicked_LUp_EquipPartReset(equipSlotNo, partId, slotId, uiIdx)
  local self = FGlobal_DyeReNew_GetInstance()
  local resetBtn = self._arrEquipPartReset[uiIdx]
  ToClient_RequestClearUsedDyeingPalette(equipSlotNo, partId, slotId)
  table.remove(self._selectedDyePart, self._selectedDyePart[equipSlotNo])
  self:Update_Part()
  self:Update_AmpuleList()
end
function HandleClicked_LUp_SelectEquipPart(partID, slotID, UIidx)
  local self = FGlobal_DyeReNew_GetInstance()
  ToClient_RequestSelectedDyeingPartSlot(self._selected_EquipSlotNo, partID, slotID)
  self._nowClickPartId = partID
  self._nowClickPartSlotId = slotID
end
function HandleOnOut_DeyReNew_Ampule_Color(isShow, itemEnchantKey, UIIndex)
  local self = FGlobal_DyeReNew_GetInstance()
  local uiControl = self._arrAmpuleSlotBG[UIIndex]
  local itemEnchantSSW = getItemEnchantStaticStatus(ItemEnchantKey(itemEnchantKey))
  local itemEnchantSS = itemEnchantSSW:get()
  local itemName = getItemName(itemEnchantSS)
  local desc
  registTooltipControl(uiControl, Panel_Tooltip_SimpleText)
  if true == isShow then
    TooltipSimple_Show(uiControl, itemName, desc)
  else
    TooltipSimple_Hide()
  end
end
function HandleScroll_DyeReNew_Ampule_ScrollUpdate(isScrollUp)
  local self = FGlobal_DyeReNew_GetInstance()
  local movingValue = 2
  self._scrollStartIndex = UIScroll.ScrollEvent(self._AmpuleScroll, isScrollUp, movingValue, self._scrollMaxRow, self._scrollStartIndex, 1)
  self:Update_AmpuleList()
end
function HandleClicked_DyeReNew_PressAmpuleScroll()
  local self = FGlobal_DyeReNew_GetInstance()
  self._scrollStartIndex = math.ceil((self._scrollMaxRow - 2) * self._AmpuleScroll:GetControlPos())
  self:Update_AmpuleList()
end
function HandleClicked_LUp_Ampule_SelectCategory(categoryIdx)
  local self = FGlobal_DyeReNew_GetInstance()
  self._nowPaletteCategoryIndex = categoryIdx
  self._scrollStartIndex = 0
  UI.getChildControl(self._AmpuleScroll, "Scroll_CtrlButton"):SetPosY(self._scrollStartIndex)
  self:Update_AmpuleList()
end
function HandleOnOut_DyeReNew_Palette_Category_Tooltip(isOn, ButtonIndex)
  local name = ""
  local desc
  local Static_BG = UI.getChildControl(Panel_Dye_ReNew, "Static_BG")
  local UIAmpuleTargetBG = UI.getChildControl(Static_BG, "Static_AmpuleTartget_BG")
  if true == isOn then
    if ButtonIndex > 7 then
      local UICategory
      if 8 == ButtonIndex then
        UICategory = UI.getChildControl(UIAmpuleTargetBG, "RadioButton_Tab_ALL")
        name = PAGetString(Defines.StringSheet_GAME, "LUA_PALETTE_TAB_ALL")
      elseif 9 == ButtonIndex then
        UICategory = UI.getChildControl(UIAmpuleTargetBG, "RadioButton_Tab_My")
        name = PAGetString(Defines.StringSheet_GAME, "LUA_PALETTE_TAB_MY")
      elseif 10 == ButtonIndex then
        UICategory = UI.getChildControl(UIAmpuleTargetBG, "RadioButton_Tab_Pearl")
        name = PAGetString(Defines.StringSheet_GAME, "LUA_SELFPLAYEREXPGAUGE_DYEINGPACKEAGE_TITLE")
        desc = PAGetString(Defines.StringSheet_GAME, "LUA_PALETTE_TAB_MATERIAL_DESC_8")
      end
      registTooltipControl(UICategory, Panel_Tooltip_SimpleText)
      TooltipSimple_Show(UICategory, name, desc)
    else
      local UIMaterial = UI.getChildControl(UIAmpuleTargetBG, "RadioButton_Material_" .. ButtonIndex)
      name = PAGetString(Defines.StringSheet_GAME, "LUA_PALETTE_TAB_MATERIAL_" .. ButtonIndex)
      desc = PAGetString(Defines.StringSheet_GAME, "LUA_PALETTE_TAB_MATERIAL_DESC_" .. ButtonIndex)
      registTooltipControl(UIMaterial, Panel_Tooltip_SimpleText)
      TooltipSimple_Show(UIMaterial, name, desc)
    end
  else
    TooltipSimple_Hide()
  end
end
function HandleClicked_LUp_Ampule_SelectedType(isShowAll, isPearl)
  local self = FGlobal_DyeReNew_GetInstance()
  local selfPlayer = getSelfPlayer()
  if isShowAll and isPearl then
    local dyeingPackageTime = selfPlayer:get():isApplyChargeSkill(UI_BUFFTYPE.eUserChargeType_DyeingPackage)
    if not dyeingPackageTime then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_MUST_ACTIVE_PEARLCOLOR"))
      return
    end
  end
  if isPearl ~= self._isPearlPalette then
    ToClient_RequestClearDyeingSlot(self._selected_EquipSlotNo)
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DYE_NEW_PALETTE_PREVIEW_ACK"))
  end
  self._paletteShowAll = isShowAll
  self._scrollStartIndex = 0
  self._selectedCategoryIdx = 0
  self._isPearlPalette = isPearl
  UI.getChildControl(self._AmpuleScroll, "Scroll_CtrlButton"):SetPosY(self._scrollStartIndex)
  self:Update_AmpuleList()
end
function HandleClicked_DeyReNew_Palette_SelectColor(dataIdx)
  local self = FGlobal_DyeReNew_GetInstance()
  if true == self._checkButtonDyeAll:IsCheck() then
    local infoCount = ToClient_getDyeingTargetInformationCount()
    if 0 == infoCount then
      return
    end
    for ii = 0, infoCount - 1 do
      self._nowPaletteDataIndex = dataIdx
      self._nowClickPartId = self._partDyeInfo[ii][1]
      self._nowClickPartSlotId = self._partDyeInfo[ii][2]
      if -1 == self._selected_EquipSlotNo or -1 == self._nowClickPartId then
        return
      end
      local DyeingPaletteCategoryInfo = ToClient_requestGetPaletteCategoryInfo(self._nowPaletteCategoryIndex, self._paletteShowAll)
      local isDyeUI = true
      local ampuleCount = DyeingPaletteCategoryInfo:getCount(self._nowPaletteDataIndex, isDyeUI)
      local convertCount = tostring(ampuleCount)
      convertCount = tonumber(convertCount)
      if convertCount >= 1 then
        self._ampuleCountCheck = false
      else
        self._ampuleCountCheck = true
        if true == self._isPearlPalette then
          self._ampuleCountCheck = false
        end
      end
      ToClient_RequestSelectedDyeingPalette(self._selected_EquipSlotNo, self._nowClickPartId, self._nowClickPartSlotId, self._nowPaletteCategoryIndex, self._nowPaletteDataIndex, self._paletteShowAll)
      if 0 < ToClient_RequestGetPartDyeingSlotCount(self._selected_EquipSlotNo, 0) then
        table.insert(self._selectedDyePart, self._selected_EquipSlotNo)
      end
    end
  else
    self._nowPaletteDataIndex = dataIdx
    if -1 == self._selected_EquipSlotNo or -1 == self._nowClickPartId then
      return
    end
    local DyeingPaletteCategoryInfo = ToClient_requestGetPaletteCategoryInfo(self._nowPaletteCategoryIndex, self._paletteShowAll)
    local isDyeUI = true
    local ampuleCount = DyeingPaletteCategoryInfo:getCount(self._nowPaletteDataIndex, isDyeUI)
    local convertCount = tostring(ampuleCount)
    convertCount = tonumber(convertCount)
    if convertCount >= 1 then
      self._ampuleCountCheck = false
    else
      self._ampuleCountCheck = true
      if true == self._isPearlPalette then
        self._ampuleCountCheck = false
      end
    end
    ToClient_RequestSelectedDyeingPalette(self._selected_EquipSlotNo, self._nowClickPartId, self._nowClickPartSlotId, self._nowPaletteCategoryIndex, self._nowPaletteDataIndex, self._paletteShowAll)
    if 0 < ToClient_RequestGetPartDyeingSlotCount(self._selected_EquipSlotNo, 0) then
      table.insert(self._selectedDyePart, self._selected_EquipSlotNo)
    end
  end
  Panel_Tooltip_Item_hideTooltip()
  self:Update_Part()
  self:Update_AmpuleList()
end
function HandleOpen_RadioButton_AmpuleReset()
  local Static_BG = UI.getChildControl(Panel_Dye_ReNew, "Static_BG")
  local UIAmpuleTargetBG = UI.getChildControl(Static_BG, "Static_AmpuleTartget_BG")
  local RadioButton_Tab_ALL = UI.getChildControl(UIAmpuleTargetBG, "RadioButton_Tab_ALL")
  local RadioButton_Tab_My = UI.getChildControl(UIAmpuleTargetBG, "RadioButton_Tab_My")
  local RadioButton_Tab_Pearl = UI.getChildControl(UIAmpuleTargetBG, "RadioButton_Tab_Pearl")
  RadioButton_Tab_ALL:SetCheck(false)
  RadioButton_Tab_My:SetCheck(true)
  RadioButton_Tab_Pearl:SetCheck(false)
end
function HandleClicked_DyeReNew_SetEndurance()
  local index = UI.getChildControl(Panel_Dye_ReNew, "Slider_Endurance"):GetSelectIndex()
  ToClient_RequestChangeEndurance(index)
end
function HandleClicked_DyeReNew_SetShowUnderwear()
  local self = FGlobal_DyeReNew_GetInstance()
  self._bShowUnderwear = not self._bShowUnderwear
  ToClient_RequestToggleShowUnderwear()
end
function HandleClicked_DyeReNew_SetHideAvartar()
  local self = FGlobal_DyeReNew_GetInstance()
  self._bShowAvater = not self._bShowAvater
  ToClient_RequestToggleHideAvatar()
  self._selected_EquipSlotNo = -1
  self:Change_EquipIcon()
  self:Update_Part()
  self:Update_AmpuleList()
end
function HandleClicked_DyeReNew_ToggleWarStance()
  local self = FGlobal_DyeReNew_GetInstance()
  self._bWarStance = not self._bWarStance
  ToClient_RequestSetBattleView(self._bWarStance)
end
function HandleClicked_DyeReNew_SetFaceViewHair()
  local self = FGlobal_DyeReNew_GetInstance()
  self._bFaceVeiwHair = not self._bFaceVeiwHair
  ToClient_setFaceViewHair(self._bFaceVeiwHair)
end
function HandleClicked_DyeReNew_SetHideHelmet()
  local self = FGlobal_DyeReNew_GetInstance()
  self._bHideHelmet = not self._bHideHelmet
  ToClient_RequestHideHelmet(self._bHideHelmet)
end
function HandleClicked_DyeReNew_SetFaceGuard()
  local self = FGlobal_DyeReNew_GetInstance()
  self._bOpenFaceGuard = not self._bOpenFaceGuard
  ToClient_RequestHideBattleHelmet(self._bOpenFaceGuard)
end
function HandleClicked_DyeReNew_SetAwakenWeapon()
  local self = FGlobal_DyeReNew_GetInstance()
  self._bShowAwakenWeapon = not self._bShowAwakenWeapon
  ToClient_SetAwakenWeaponShow(self._bShowAwakenWeapon)
end
function HandleOver_DyeReNew_SimpleTooltipCheckbutton(isShow, tipType)
  local name, desc, control
  if enToggleIndex.Underwear == tipType then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_SHOWUNDERWEAR")
    control = UI.getChildControl(Panel_Dye_ReNew, "CheckButton_ShowUnderWear")
  elseif enToggleIndex.Avater == tipType then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_HIDEAVATAR")
    control = UI.getChildControl(Panel_Dye_ReNew, "CheckButton_HideAvatar")
  elseif enToggleIndex.Helmet == tipType then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_HIDEHELM")
    control = UI.getChildControl(Panel_Dye_ReNew, "CheckButton_HideHelmet")
  elseif enToggleIndex.AwakenWeapon == tipType then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_AWAKENWEAPON")
    control = UI.getChildControl(Panel_Dye_ReNew, "CheckButton_AwakenWeapon")
  elseif enToggleIndex.FaceViewHair == tipType then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_HIDHAIR")
    control = UI.getChildControl(Panel_Dye_ReNew, "CheckButton_HideHair")
  elseif enToggleIndex.FaceGuard == tipType then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_OPENHELM")
    control = UI.getChildControl(Panel_Dye_ReNew, "CheckButton_OpenFaceGuard")
  elseif enToggleIndex.WarStance == tipType then
    name = PAGetString(Defines.StringSheet_GAME, "LUA_INGAMECASHSHOP_SETEQUIP_TOOLTIP_WARSTANCE")
    control = UI.getChildControl(Panel_Dye_ReNew, "CheckButton_WarStance")
  end
  registTooltipControl(control, Panel_Tooltip_SimpleText)
  if isShow == true then
    TooltipSimple_Show(control, name, desc)
  else
    TooltipSimple_Hide()
  end
end
function HandleClicked_DeyReNew_DoDye()
  local self = FGlobal_DyeReNew_GetInstance()
  local _dyePartString = ""
  local equipSlotNo = self._selected_EquipSlotNo
  if -1 == self._nowPaletteDataIndex then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DYE_NEW_FIRSTSELECTDYENOGETITEM"))
    return
  end
  if true == self._ampuleCountCheck then
    Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DYE_AMPULEALERT"))
    return
  end
  local noAction = function()
    return
  end
  local function doDye()
    ToClient_RequestDye(self._isPearlPalette)
    FGlobal_Panel_DyeReNew_Hide()
  end
  local function askDoDye()
    local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE")
    local messageBoxMemo = PAGetStringParam1(Defines.StringSheet_GAME, "PANEL_DYENEW_SURE_DYE_THIS_PART", "partString", _dyePartString)
    local messageBoxData = {
      title = messageBoxTitle,
      content = messageBoxMemo,
      functionYes = doDye,
      functionNo = noAction,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageBoxData)
    return
  end
  local function alreadyPearlDye()
    local messageBoxTitle = PAGetString(Defines.StringSheet_GAME, "LUA_ALERT_DEFAULT_TITLE")
    local messageBoxMemo = PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_ALREADY_PEARLCOLOR")
    local messageBoxData = {
      title = messageBoxTitle,
      content = messageBoxMemo,
      functionYes = askDoDye,
      functionNo = noAction,
      priority = CppEnums.PAUIMB_PRIORITY.PAUIMB_PRIORITY_LOW
    }
    MessageBox.showMessageBox(messageBoxData)
    return
  end
  table.sort(self._selectedDyePart)
  for index, value in pairs(self._selectedDyePart) do
    if "" == _dyePartString then
      _dyePartString = "<" .. dyePartString[self._selected_CharacterTarget][self._selectedDyePart[index]] .. ">"
    elseif self._selectedDyePart[index] ~= self._selectedDyePart[index - 1] then
      _dyePartString = _dyePartString .. ", <" .. dyePartString[self._selected_CharacterTarget][self._selectedDyePart[index]] .. ">"
    end
  end
  if self._isPearlPalette then
    local isAlreadyDye = ToClient_isAllreadyDyeing(equipSlotNo)
    if true == isAlreadyDye then
      Proc_ShowMessage_Ack(PAGetString(Defines.StringSheet_GAME, "LUA_DYENEW_ALREADY_NORMALCOLOR"))
      return
    elseif "" == _dyePartString then
      doDye()
    else
      askDoDye()
    end
  else
    local isAlreadyPearlDye = ToClient_isExpirationDyeing(equipSlotNo)
    if true == isAlreadyPearlDye then
      alreadyPearlDye()
    elseif "" == _dyePartString then
      doDye()
    else
      askDoDye()
    end
  end
end
function HandleClicked_DyeReNew_SetShowUI()
  if Panel_Dye_ReNew:GetShow() then
    Panel_Dye_ReNew:SetShow(false)
    Panel_Window_Inventory:SetShow(false)
  else
    Panel_Dye_ReNew:SetShow(true)
    Panel_Window_Inventory:SetShow(true)
  end
end
