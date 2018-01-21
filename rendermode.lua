RenderModeWrapper = {}
RenderModeWrapper.__index = RenderModeWrapper
local RenderModeCloseList = Array.new()
function RenderModeWrapper.new(order, renderModeList, isAppending)
  if nil == renderModeList then
    return nil
  end
  if nil == order then
    return nil
  end
  if nil == isAppending then
    isAppending = false
  end
  local newWrapper = {}
  setmetatable(newWrapper, RenderModeWrapper)
  newWrapper:setKey(-1)
  newWrapper._isAppending = isAppending
  newWrapper._order = order
  newWrapper._renderModeValue = PAUIRenderModeBitSet(renderModeList)
  newWrapper._closeFunctor = nil
  newWrapper._preFunctor = nil
  RenderModeCloseList:push_back(newWrapper)
  return newWrapper
end
function RenderModeWrapper:setKey(key)
  self._renderModekey = key
end
function RenderModeWrapper:getKey()
  return self._renderModekey
end
function RenderModeWrapper:setClosefunctor(renderMode, functor)
  self._closeFunctor = functor
end
function RenderModeWrapper:setPrefunctor(renderMode, functor)
  self._preFunctor = functor
end
function RenderModeAllClose()
  for key, value in pairs(RenderModeCloseList) do
    if value:getKey() ~= -1 then
      value._closeFunctor()
    end
  end
end
function RenderModeWrapper:set()
  if self._preFunctor ~= nil then
    self._preFunctor()
  end
  self:reset()
  self:setKey(ToClient_SetUIRenderMode(self._order, self._renderModeValue))
end
function RenderModeWrapper:reset()
  if nil == self._renderModekey or self._renderModekey < 0 then
    return
  end
  ToClient_ResetRenderMode(self._renderModekey)
  self._renderModekey = -1
end
function RenderModeWrapper:setRenderMode(renderModeList)
  if nil == renderModeList then
    return
  end
  self._renderModeValue = PAUIRenderModeBitSet(renderModeList)
end
local default_renderModeList = {
  Defines.RenderMode.eRenderMode_Default
}
function CheckRenderModebyGameMode(nextRenderModeList)
  return CheckRenderMode(nextRenderModeList, default_renderModeList)
end
function CheckRenderMode(nextRenderModeList, renderModeArray)
  for key, renderModevalue in pairs(nextRenderModeList) do
    for key2, arrayValue in pairs(renderModeArray) do
      if renderModevalue == arrayValue then
        return true
      end
    end
  end
  return false
end
