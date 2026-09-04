local eutil = CS.Torappu.Lua.Util


local UICharacterTabGroupHotfixer = Class("UICharacterTabGroupHotfixer", HotfixBase)

local function _GetTabButtons(self)
  if self.m_tabButtons == nil then
    local btnType = typeof(CS.Torappu.Battle.UI.UICharacterTabSwitchButton)
    local btnListType = CS.System.Collections.Generic.List(CS.Torappu.Battle.UI.UICharacterTabSwitchButton)
    local comps = self._infoTabRoot:GetComponentsInChildren(btnType, true)
    local list = btnListType()
    for i = 0, comps.Length - 1 do
      list:Add(comps[i])
    end
    self.m_tabButtons = list
  end
  return self.m_tabButtons
end

function UICharacterTabGroupHotfixer:OnInit()
  xlua.private_accessible(CS.Torappu.Battle.UI.UICharacterTabGroup)
  self:Fix_ex(CS.Torappu.Battle.UI.UICharacterTabGroup, "get_tabButtons", function(self)
    local ok, result = xpcall(_GetTabButtons, debug.traceback, self)
    if not ok then
      eutil.LogError("[UICharacterTabGroupHotfixer] get_tabButtons " .. result)
      return self.tabButtons
    end
    return result
  end)
end

function UICharacterTabGroupHotfixer:OnDispose()
end

return UICharacterTabGroupHotfixer
