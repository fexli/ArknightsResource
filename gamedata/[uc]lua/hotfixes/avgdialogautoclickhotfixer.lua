local eutil = CS.Torappu.Lua.Util
local AVGController = CS.Torappu.AVG.AVGController
local DialogPanel = CS.Torappu.AVG.DialogPanel
local AutoMode = CS.Torappu.AVG.AVGStoryCache.AVGAutoMode
local AVGExecuteMode = CS.Torappu.AVG.AVGExecuteMode


local AVGDialogAutoClickHotfixer = Class("AVGDialogAutoClickHotfixer", HotfixBase)



local prevModeMap = setmetatable({}, { __mode = "k" })





local function _TryRearm(self)
  if not AVGController.hasInstance then
    return
  end
  local controller = AVGController.instance
  local curMode = controller.autoPlayMode
  local prevMode = prevModeMap[self]
  prevModeMap[self] = curMode

  if prevMode == curMode or curMode ~= AutoMode.BUTTON_AUTO then
    return
  end
  
  if controller.executeMode ~= AVGExecuteMode.Normal then
    return
  end
  
  if not controller.m_needResumeAuto then
    return
  end
  
  
  if (not self.isExecuting) or self.isHidden or self.isTyping or controller.isAutoClickRaised then
    return
  end
  controller:RaiseAutoClick(self._typeWriter.messageLength)
  
  controller.m_needResumeAuto = false
end

local function _FixOnValueChanged(self, cache)
  
  self:OnValueChanged(cache)
  local ok, err = xpcall(_TryRearm, debug.traceback, self)
  if not ok then
    eutil.LogError("[AVGDialogAutoClickHotfixer] OnValueChanged " .. tostring(err))
  end
end

function AVGDialogAutoClickHotfixer:OnInit()
  xlua.private_accessible(DialogPanel)
  
  xlua.private_accessible(AVGController)
  self:Fix_ex(DialogPanel, "OnValueChanged", _FixOnValueChanged)
end

function AVGDialogAutoClickHotfixer:OnDispose()
end

return AVGDialogAutoClickHotfixer
