local eutil = CS.Torappu.Lua.Util
local Animation = CS.UnityEngine.Animation
local AVGController = CS.Torappu.AVG.AVGController
local AVGExecuteMode = CS.Torappu.AVG.AVGExecuteMode
local SpellStickerPanel = CS.Torappu.AVG.AVGSpellStickerPanel

local DEFAULT_ACTION = "show"
local DEFAULT_STYLE = "sami"


local AVGStickerAutoClickHotfixer = Class("AVGStickerAutoClickHotfixer", HotfixBase)






local function _DurationToMessageLength(controller, duration)
  local perText = controller.autoWaitTimePerText
  if perText == nil or perText <= 0 then
    return 0
  end
  
  local extra = duration - controller.autoWaitBaseTime
  if extra <= 0 then
    return 0
  end
  
  
  return math.ceil(extra / perText)
end

local function _RaiseAutoClick(duration)
  if not AVGController.hasInstance then
    return
  end
  local controller = AVGController.instance
  
  
  if controller.executeMode ~= AVGExecuteMode.Normal then
    return
  end
  controller:RaiseAutoClick(_DurationToMessageLength(controller, duration))
end

local function _GetStringParam(command, key, defaultValue)
  if command == nil or command.param == nil then
    return defaultValue
  end
  local found, value = command.param:TryGetValue(key)
  if not found or value == nil then
    return defaultValue
  end
  return string.lower(tostring(value))
end

local function _FindStyleEntry(panel, styleKey)
  local styles = panel._spellStickerStyles
  if styles == nil then
    return nil
  end
  for i = 0, styles.Length - 1 do
    local entry = styles[i]
    if entry ~= nil and entry.styleKey ~= nil and string.lower(entry.styleKey) == styleKey then
      return entry
    end
  end
  return nil
end




local function _SpellStickerAnimDuration(panel, command)
  if _GetStringParam(command, "action", DEFAULT_ACTION) == "hide" then
    return 0
  end

  local entry = _FindStyleEntry(panel, _GetStringParam(command, "style", DEFAULT_STYLE))
  local prefab = entry ~= nil and entry.prefab or nil
  if prefab == nil then
    return 0
  end

  local animation = prefab:GetComponent(typeof(Animation))
  if animation == nil then
    return 0
  end

  local clipName = entry.clipName
  local clip
  if clipName == nil or clipName == "" then
    clip = animation.clip
  else
    clip = animation:GetClip(clipName)
  end
  if clip == nil then
    return 0
  end
  return clip.length
end

local function _RaiseAutoClickBySpellStickerAnim(panel, command)
  _RaiseAutoClick(_SpellStickerAnimDuration(panel, command))
end




local function _FixExecuteSpellSticker(self, command)
  local block = self:_ExecuteSpellSticker(command)
  if block then
    local ok, err = xpcall(_RaiseAutoClickBySpellStickerAnim, debug.traceback, self, command)
    if not ok then
      eutil.LogError("[AVGStickerAutoClickHotfixer] _ExecuteSpellSticker " .. tostring(err))
    end
  end
  return block
end

local function _FixExecuteSpellStickerClear(self, command)
  local block = self:_ExecuteSpellStickerClear(command)
  if block then
    local ok, err = xpcall(_RaiseAutoClick, debug.traceback, 0)
    if not ok then
      eutil.LogError("[AVGStickerAutoClickHotfixer] _ExecuteSpellStickerClear " .. tostring(err))
    end
  end
  return block
end

function AVGStickerAutoClickHotfixer:OnInit()
  xlua.private_accessible(SpellStickerPanel)

  self:Fix_ex(SpellStickerPanel, "_ExecuteSpellSticker", _FixExecuteSpellSticker)
  self:Fix_ex(SpellStickerPanel, "_ExecuteSpellStickerClear", _FixExecuteSpellStickerClear)
end

function AVGStickerAutoClickHotfixer:OnDispose()
end

return AVGStickerAutoClickHotfixer
