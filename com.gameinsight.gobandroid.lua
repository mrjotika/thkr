-- lib function made by CmP
function metaDataOffsets()
  startAddressDat = 0
  endAddressDat = 0
  local rangesDat = gg.getRangesList("metadata.dat")
  for i, v in ipairs(rangesDat) do
    if v.state == "O" then
      startAddressDat = v.start
      endAddressDat   = rangesDat[i]["end"]
      break
    end
  end
end

metaDataOffsets()

-- string names
function stringNames()
  Class_AssemblyCSharp      = "h00417373656d626c792d4353686172702e646c6c00"
  Class_ControllerSettings  = "h00436f6e74726f6c6c657253657474696e677300"
  Class_Skills              = "h00536b696c6c7300"
  Class_vp_FPCCameraPreset  = "h0076705f465043616d65726150726573657400"
  Class_Weapons             = "h00576561706f6e7300"
  Class_ChatDataVO          = "h004368617444617461564f00"
end
stringNames()

function searchString(className)
  gg.clearResults()
  gg.searchNumber(className, gg.TYPE_BYTE, nil, nil, startAddressDat, endAddressDat)
  local t = gg.getResults(2)
  tableMetadataOffsets = t[2].address
  gg.clearResults()
  return tableMetadataOffsets
end

	 
-- instruction set architecture
-- credits CmP
function isProcess64Bit()
  local regions = gg.getRangesList()
  local lastAddress = regions[#regions]["end"]
  return (lastAddress >> 32) ~= 0
end
-- end credits

function validISA()
  instructionSetArchitecture = 0
	if isProcess64Bit() == true then
		instructionSetArchitecture = 64
	elseif isProcess64Bit() == false then
		instructionSetArchitecture = 32
	end
  return instructionSetArchitecture
end
validISA()
-- offsets
function instructionsOffset()
  if instructionSetArchitecture == 32 then -- if true then 32 bit else 64 bit
    hexConvert = 0xFFFFFFFF
    dataType = 4
    classOffset = 0x8
    cdOffsetBig =  0xB58
  elseif instructionSetArchitecture == 64 then
    dataType = 32
    classOffset = 0x10
    cdOffsetBig = 0x16B0
  end
end
instructionsOffset()

function controllerSettingOffsets()
  if instructionSetArchitecture == 32 then -- if true then 32 bit else 64 bit
    headHitOffset = 0x78
    cameraLockOffset = 0x28
  elseif instructionSetArchitecture == 64 then
    headHitOffset = 0x80
    cameraLockOffset = 0x30
  end
end
controllerSettingOffsets()

function weaponSettingsOffsets()
  if instructionSetArchitecture == 32 then
    weaponPointerToIdOffset = 0x8
    weaponPointerToAmmoOffset = 0x48
    weaponPointerToRecoilOffset = 0x78
    weaponPointerToReloadOffset = 0x88
    weaponPointerToAccumulationFullOffset = 0xD0
    weaponPointerToAccumulationResetOffset = 0xE0
    weaponPointerToRecoilAimOffset = 0xB0
  elseif instructionSetArchitecture == 64 then
    weaponPointerToIdOffset = 0x10
    weaponPointerToAmmoOffset = 0x60
    weaponPointerToRecoilOffset = 0x90
    weaponPointerToReloadOffset = 0xA0
    weaponPointerToRecoilAimOffset = 0xC8
    weaponPointerToAccumulationFullOffset = 0xE8
    weaponPointerToAccumulationResetOffset = 0xF8
  end
end
weaponSettingsOffsets()

function teleportOffsets()
  if instructionSetArchitecture == 32 then -- if true then 32 bit else 64 bit
    playerSeperator = 0x3C
    playerPointer = 0x14
    playerPointerToCoordinate = 0x50
    playerUpdateAddress = 0x38
    playerUpdate = 0x10
  elseif instructionSetArchitecture == 64 then
    playerSeperator = 0x60
    playerPointer = 0x20
    playerPointerToCoordinate = 0x78
    playerUpdateAddress = 0x58
    playerUpdate = 0x18
  end
end
teleportOffsets()

function skillsOffsets()
  if instructionSetArchitecture == 32 then
    skillIdOffset = 0x8
    skillIdExtraOffset = 0x10
  elseif instructionSetArchitecture == 64 then
    skillIdOffset = 0x10
    skillIdExtraOffset = 0x18
  end
end
skillsOffsets()

function zoomScopeOffsets()
  if instructionSetArchitecture == 32 then
    zoomOffset = 0xC
  elseif instructionSetArchitecture == 64 then
    zoomOffset = 0x18
  end
end
zoomScopeOffsets()

function freezingOffsets()
  if instructionSetArchitecture == 32 then
    anonFreezeScreen = 0x87
    anonFreezeControl = 0x54
  elseif instructionsOffset == 64 then
    anonFreezeScreen = 0x97
    anonFreezeControl = 0x64
  end
end
freezingOffsets()

function libraryOffsets()
  if instructionSetArchitecture == 32 then
    userIdOffset = 0xC
    controllerOffset = 0x28
    nicknameOffset = 0x14
    pointerToStringStart = 0xA
    pointerToEmptyBool = 0xA
    stringLengthAddress = 0x8
  elseif instructionSetArchitecture == 64 then
    userIdOffset = 0x14
    controllerOffset = 0x3C
    nicknameOffset = 0x20
    pointerToStringStart = 0x12
    pointerToEmptyBool = 0x12
    stringLengthAddress = 0x10
  end
end
libraryOffsets()
-- check 
if gg.isVisible() then
  gg.setVisible(false)
end

function assemblyAddressCheck()
  gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC | gg.REGION_OTHER)
  searchString(Class_AssemblyCSharp)
  gg.searchNumber(tableMetadataOffsets, dataType) -- dataType: 32bit = 4(dword) | 64bit = 32(qword)
  if gg.getResultsCount() == 0 then
    gg.alert('game has been updated, so script needs an update. Reach out to the creator "Nok1a" by responding in the forum at the same post where you downloaded the script')
    os.exit()
  end
  assembly = gg.getResults(1)
  gg.clearResults()
  return assembly
end
assemblyAddressCheck()

local old = gg.getRanges();

-- main feature settings

loopControllerSettings = 0
function controllerSettings()
  -- START: this code only runs once
  loopControllerSettings = loopControllerSettings + 1
  if loopControllerSettings <= 1 then
    gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC | gg.REGION_OTHER)
    searchString(Class_ControllerSettings)
    gg.searchNumber(tableMetadataOffsets, dataType)
    a = gg.getResults(5)
    for i, v in ipairs(a) do
      v.address = v.address - classOffset -- classOffset: 32bit = 0x8 | 64bit = 0x10
    end
    a = gg.getValues(a)
    gg.clearResults()
    b = {}
    for i,v in ipairs(a) do
      if instructionSetArchitecture == 32 then
        v.value = v.value & hexConvert -- hexConvert: 32bit = 0xFFFFFFFF
      end
      if v.value == assembly[1].address then
        b[#b + 1] = v
      end
    end

    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC | gg.REGION_OTHER)
    gg.searchNumber(b[1].address, dataType)
    a = gg.getResults(500)
    gg.clearResults()
    headHitBox = {}
    cameraLock = {}
    for i, v in ipairs(a) do
      headHitBox[i] = {address = v.address + headHitOffset, flags = gg.TYPE_DOUBLE} -- headHitOffset: 32bit = 0x78 | 64bit = 0x80
      cameraLock[i] = {address = v.address + cameraLockOffset, flags = gg.TYPE_DOUBLE}
    end
    headHitBox = gg.getValues(headHitBox)
    cameraLock = gg.getValues(cameraLock)
    gg.toast('hitbox ready')
    gg.toast('aim assist ready')
    return headHitBox, cameraLock
  end
end
controllerSettings()

loopSkills = 0
function skillsGroup()
  loopSkills = loopSkills + 1
  if loopSkills <= 1 then
    searchString(Class_Skills)
    gg.searchNumber(tableMetadataOffsets, dataType, gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC | gg.REGION_OTHER))
    a = gg.getResults(15)
    for i, v in ipairs(a) do
      v.address = v.address - classOffset -- 32bit = 0x8, 64bit = 0x10
    end
    a = gg.getValues(a)
    teser = {}
    for i, v in ipairs(a) do
      if instructionSetArchitecture == 32 then
      v.value = v.value & hexConvert -- hexConvert: 32bit = 0xFFFFFFFF
      end
      if (v.value == assembly[1].address) then
        teser[#teser + 1] = v
      end
    end
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC | gg.REGION_OTHER)
    gg.searchNumber(teser[1].address, dataType) -- dataType: 32bit = 4(dword) | 64bit = 32(qword)
    if gg.getResultsCount() <= 50 then 
      gg.clearResults()
      gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC | gg.REGION_OTHER)
      gg.searchNumber(teser[2].address, dataType)
    end
    a = gg.getResults(10000)
    for i, v in ipairs(a) do
      v.address = v.address + skillIdOffset -- skillIdOffset: 32bit = 0x8 | 64bit = 0x10
      v.flags = gg.TYPE_DWORD
    end
    gg.clearResults()
    end
    skills = gg.getValues(a)
  return skills
end
skillsGroup()


-- weaponsSettingsTables
function weaponsSettingsTableOn()
  recoilTableOn = {}
  recoilAimTableOn = {}
  reloadTimeTableOn = {}
  maxAmmoCapacityTableOn = {}
  accumulationFullTableOn = {}
  accumulationResetTableOn = {}
end
weaponsSettingsTableOn()
function weaponsSettingsTableOff()
  recoilTableOff = {}
  recoilAimTableOff = {}
  reloadTimeTableOff = {}
  maxAmmoCapacityTableOff = {}
  accumulationFullTableOff = {}
  accumulationResetTableOff = {}
end
weaponsSettingsTableOff()


function weaponsSettings()
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC | gg.REGION_OTHER)
  searchString(Class_Weapons)
  gg.searchNumber(tableMetadataOffsets, dataType)
  a = gg.getResults(5)
  for i, v in ipairs(a) do
    v.address = v.address - classOffset -- classOffset: 32bit = 0x8 | 64bit = 0x10
  end
  a = gg.getValues(a)
  gg.clearResults()
  compareWeaponsToAssembly = {}
  for i,v in ipairs(a) do
    if instructionSetArchitecture == 32 then
      v.value = v.value & hexConvert -- hexConvert: 32bit = 0xFFFFFFFF
    end
    if v.value == assembly[1].address then
      compareWeaponsToAssembly[#compareWeaponsToAssembly + 1] = v
    end
  end
  gg.searchNumber(compareWeaponsToAssembly[1].address, dataType)
  weaponPointers = gg.getResults(1141)
  gg.clearResults()
  weaponId = {}
  for i, v in ipairs(weaponPointers) do
    v.address = v.address + weaponPointerToIdOffset
    v.flags = gg.TYPE_DWORD
  end
  weaponPointers = gg.getValues(weaponPointers)
  for i, v in ipairs(weaponPointers) do
    if v.value >= 253 and v.value <= 99644 then
      weaponId[#weaponId + 1] = {address = v.address - weaponPointerToIdOffset, flags = dataType}
    end
  end

  for i, v in ipairs(weaponId) do
    recoilTableOn[i] = {address = v.address + weaponPointerToRecoilOffset, flags = gg.TYPE_DOUBLE, value = '0'}
    recoilAimTableOn[i] = {address = v.address + weaponPointerToRecoilAimOffset, flags = gg.TYPE_DOUBLE, value = '0'}
    reloadTimeTableOn[i] = {address = v.address + weaponPointerToReloadOffset, flags = gg.TYPE_DOUBLE, value = '0'}
    maxAmmoCapacityTableOn[i] = {address = v.address + weaponPointerToAmmoOffset, flags = gg.TYPE_DWORD, value = '5000'}
    accumulationFullTableOn[i] = {address = v.address + weaponPointerToAccumulationFullOffset, flags = gg.TYPE_BYTE, value = '0'}
    accumulationResetTableOn[i] = {address = v.address + weaponPointerToAccumulationResetOffset, flags = gg.TYPE_BYTE, value = '0'}
  end
  recoilTableOff = gg.getValues(recoilTableOn)
  recoilAimTableOff = gg.getValues(recoilAimTableOn)
  reloadTimeTableOff = gg.getValues(reloadTimeTableOn)
  maxAmmoCapacityTableOff = gg.getValues(maxAmmoCapacityTableOn)
  accumulationFullTableOff = gg.getValues(accumulationFullTableOn)
  accumulationResetTableOff = gg.getValues(accumulationResetTableOn)
  gg.toast('recoil, reload, max ammo, accumulation ready')
end
weaponsSettings()

loopZoom = 0
function zoomScope() 
  loopZoom = loopZoom + 1
  if loopZoom <= 1 then
    gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC | gg.REGION_OTHER)
    searchString(Class_vp_FPCCameraPreset)
    gg.searchNumber(tableMetadataOffsets, dataType) -- dataType: 32bit = 4(dword) | 64bit = 32(qword)
    a = gg.getResults(10)
    for i, v in ipairs(a) do
      v.address = v.address - classOffset -- classOffset: 32bit = 0x8 | 64bit = 0x10
    end
    a = gg.getValues(a)
    pointerClassCamera = {}
    for i, v in ipairs(a) do
      if instructionSetArchitecture == 32 then
      v.value = v.value & hexConvert -- hexConvert: 32bit = 0xFFFFFFFF
      end
      if (v.value == assembly[1].address) then
        pointerClassCamera[#pointerClassCamera + 1] = v
      end
    end -- END of lifetime code
    gg.clearResults()
  else
    gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC | gg.REGION_OTHER)
    gg.searchNumber(pointerClassCamera[1].address, dataType) -- dataType: 32bit = 4(dword) | 64bit = 32(qword)
    a = gg.getResults(500)
    gg.clearResults()
    taddress = {}
    for i, v in ipairs(a) do
      taddress[i] = {address = v.address + zoomOffset, flags = gg.TYPE_FLOAT} -- zoomOffset: 32bit = 0xC | 64bit = 0x18
    end
    zoomer = gg.getValues(taddress)
    zoomFilter = {}
    for i,v in ipairs(zoomer) do
      if v.value == 2.5 then
        zoomFilter[#zoomFilter + 1] = v
      end
    end
    
    scopeHeightZoomTable = {}
    scopeDeepZoomTable = {}
    for i, v in ipairs(zoomFilter) do
      scopeHeightZoomTable[i] = {address = v.address + 0x28, flags = gg.TYPE_FLOAT}
      scopeDeepZoomTable[i] = {address = v.address + 0x2C, flags = gg.TYPE_FLOAT}
    end
    scopeHeightZoomTable = gg.getValues(scopeHeightZoomTable)    
    scopeDeepZoomTable = gg.getValues(scopeDeepZoomTable)
  end
  return scopeHeightZoomTable, scopeDeepZoomTable
end
zoomScope()

loopFreez = 0
function freezingTable()
  -- START: this code only runs once
  loopFreez = loopFreez + 1
  if loopFreez <= 1 then
    gg.setRanges(gg.REGION_CODE_APP)
    gg.searchNumber('h 6A 6F 79 73 74 69 63 6B 20 31 36 20 62 75 74 74 6F 6E 20 31 39', gg.TYPE_BYTE)
    a = gg.getResults(1)
    gg.clearResults()
    gg.setRanges(gg.REGION_C_DATA | gg.REGION_OTHER)
    gg.searchNumber(a[1].address, dataType) -- dataType: 32bit = 4(dword) | 64bit = 32(qword)
    a = gg.getResults(1)
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC | gg.REGION_OTHER)
    gg.searchNumber(a[1].address - cdOffsetBig, dataType) -- cdOffsetBig: 32bit = 0xB58 | 64bit = 0x16B0 / dataType: 32bit = 4(dword) | 64bit = 32(qword)
    freezeScreenOriginal = gg.getResults(1)
    gg.clearResults()
    freezingOffsets = {
      {address = freezeScreenOriginal[1].address + 0x97, flags = gg.TYPE_BYTE},
      {address = freezeScreenOriginal[1].address + 64, flags = gg.TYPE_FLOAT}}
    freezeTable = gg.getValues(freezingOffsets)
end
  return freezeTable
end
freezingTable()


-- controll setting features
loopHeadHitbox = 0
function headHitBoxSize()
  loopHeadHitbox = loopHeadHitbox + 1
  if loopHeadHitbox <= 1 then
    box = {}
    for i, v in ipairs(headHitBox) do
      if v.value == '1.25'
      or v.value == '3.25'
      or v.value == '7.25'
      or v.value == '15.25' then
        box[#box + 1] = v
      end
    end
  else
    
    gg.clearResults()
    if hitboxs == 1 then
      hitt = off
      box[1].value = "1.25"
      toast = gg.toast('hitbox normal')
    elseif hitboxs == 2 then
      hitt = on
      box[1].value = "3.25"
      toast = gg.toast('hitbox weak')
    elseif hitboxs == 3 then
      hitt = on
      box[1].value = "7.25"
      toast = gg.toast('hitbox medium')
    elseif hitboxs == 4 then
      hitt = on
      box[1].value = "15.25"
      toast = gg.toast('hitbox strong')
    end
    gg.clearResults()
    gg.setValues(box)
  end
  return box[1].value, toast
end   
headHitBoxSize()

loopCameraLock = 0
function cameraLockF()
  loopCameraLock = loopCameraLock + 1
  if loopCameraLock <= 1 then
    cameraLockTable = {}
    for i, v in ipairs(cameraLock) do
      if v.value == 200 then
        cameraLockTable[#cameraLockTable + 1] = v
      end
    end
  else
    if aimlock == on then
      cameraLockTable[1].value = '400'
      toast = gg.toast('Aim lock activated in lobby')
    else
      cameraLockTable[1].value = '200'
      toast = gg.toast('Aim lock activated in lobby')
    end
    gg.setValues(cameraLockTable)
  end
  return
end
cameraLockF()


-- standalone features
loopAdmin = 0
function adminPanel()
  if instructionSetArchitecture == 64 then
    gg.toast('Admin can not be used, only 32bits apk')
    pane = off
  else 
    -- START: this code only runs once
    loopAdmin = loopAdmin + 1
    if loopAdmin <= 1 then
      gg.setRanges(gg.REGION_CODE_APP)
      gg.searchNumber('h 01 00 00 1A 00 00 A0 E3 70 8C BD E8 18 10 9F E5 01 10 9F E7', gg.TYPE_BYTE)
      pan = gg.getResults(1)
      gg.clearResults()
    else
      if pane == on then
        pan[1].value = '0'
        toast = gg.toast('panel activated')
      else
        pan[1].value = '1'
        toast = gg.toast('panel deactivated')
      end
      gg.setValues(pan)
    end
    return pan[1].value, toast
  end
end
adminPanel()

function chamsF()
  gg.clearResults()
  gg.setRanges(gg.REGION_VIDEO)
  gg.searchNumber('1,081,081,858D;537,137,236D:5', gg.TYPE_DWORD)
  if gg.getResultsCount() == 0 then
    gg.toast('Chambs not possible on this device')
  else
    if chams == on then
      gg.refineNumber('1,081,081,858', gg.TYPE_DWORD)
      gg.getResults(100)
      gg.editAll('5592', gg.TYPE_DWORD)
      gg.clearResults()
    else
      gg.searchNumber('5592', gg.TYPE_DWORD)
      gg.getResults(100)
      gg.editAll('1,081,081,858', gg.TYPE_DWORD)
      gg.clearResults()
    end
  end
end

function theGiant()
  if giants == on then
    gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_OTHER)
    gg.clearResults()
    gg.searchNumber('h 85 EB 91 3F 6F 12 03 3C', gg.TYPE_BYTE) -- corrected the type here
    gg.refineNumber('h 85', gg.TYPE_BYTE)
    local results = gg.getResults(50)
    gg.clearResults()
    -- function has been optimized (credit -> CmP)
    local heightValuesCheck = {}
    for i, v in ipairs(results) do
      heightValuesCheck[(i - 1) * 3 + 1] = {address = v.address - 0x104, flags = gg.TYPE_FLOAT}
      heightValuesCheck[(i - 1) * 3 + 2] = {address = v.address - 0x100, flags = gg.TYPE_FLOAT}
      heightValuesCheck[(i - 1) * 3 + 3] = {address = v.address - 0xFC, flags = gg.TYPE_FLOAT}
    end

    heightValuesCheck = gg.getValues(heightValuesCheck)
    
    -- filtering the tables, so that only tables with value '1' are left to avoid possible crashing during editing.
    heightValues = {}
    for i, v in ipairs(heightValuesCheck) do
      if v.value == 1 then
        heightValues[#heightValues + 1] = v
      end
    end
    -- editing, user input = ON
    for i, v in ipairs(heightValues) do
      v.value = '2.125478'
    end
    gg.setValues(heightValues) -- calling the function once, after desired values are set for all table elements
  else
    -- editing, user input = OFF
    for i, v in ipairs(heightValues) do
      v.value = '1'
    end
    gg.setValues(heightValues) -- calling the function once likewise
  end
end


-- freeze features
function screenFreeze()
  freezeTable[1].value = '-55'
  freezeTable[1].freeze = true
  gg.addListItems(freezeTable)
  gg.toast('Screen freeze activated')
  gg.sleep(20000)
  freezeTable[1].freeze = false
  gg.addListItems(freezeTable)
  gg.toast('Screen freeze deactivated')
end

function joystickFreeze()
  freezeTable[2].value = '0'
  freezeTable[2].freeze = true
  gg.addListItems(freezeTable)
  gg.toast('Control freeze activated')
  gg.sleep(100)
  freezeTable[2].freeze = false
  gg.toast('Control freeze deactivated')
end


-- zoom features
function zoomScopeHeight()
  if zoomHeigh == on then
    zoomScope()
    for i, v in ipairs(scopeHeightZoomTable) do
      v.value = '4.29600000381'
    end
    gg.toast('high zoom activated')
    zoom = off -- if zoom scope Height is ON then zoom scope must be OFF to avoid ban
    zoomScopeDepth()
  else
    for i, v in ipairs(scopeHeightZoomTable) do
      v.value = '1.64800000191'
    end
    gg.toast('high zoom deactivated')
  end
  gg.setValues(scopeHeightZoomTable)
end

function zoomScopeDepth()
  if zoom == on then
    zoomScope()
    for i, v in ipairs(scopeDeepZoomTable) do
      v.value = '4.50954008102'
      gg.toast('zoom scope activated')
    end
    zoomHeigh = off  -- if zoom scope is ON then zoom scope Height must be OFF to avoid ban
    zoomScopeHeight() 
  else
    for i, v in ipairs(scopeDeepZoomTable) do
      v.value = '0'
    end
    gg.toast('zoom scope dactivated')
  end
  gg.setValues(scopeDeepZoomTable)
end


-- teleport frame
teleportLoop = 0
function teleportOriginal()
  gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC | gg.REGION_OTHER)
  gg.searchNumber('1113104', gg.TYPE_QWORD)
  a = gg.getResults(10)
  gg.addListItems(a)
  gg.clearResults()
  gg.searchNumber('26278928', gg.TYPE_QWORD)
  a = gg.getResults(10)
  gg.addListItems(a)
  a = gg.getListItems()
  gg.loadResults(a)
  if gg.getResultsCount(a) < 2 then
    gg.toast("no results, are you in a match ?")
    gg.clearResults()
    teleportLoop = 0
  else
    gg.clearResults()
    for i, v in ipairs(a) do
      a[i] = {address = v.address + playerUpdate, flags = dataType}
    end
    a = gg.getValues(a)
    aOne = {} 
    for i, v in ipairs(a) do
      if instructionSetArchitecture == 32 then
        v.value = v.value & 0xFFFFFFFF
        if v.value > 0xFFFFFFF then
          aOne[#aOne + 1] = v
        end
      elseif instructionSetArchitecture == 64 then
        if v.value > 0xFFFFFFFFF then
          aOne[#aOne + 1] = v
        end    
      end
    end
    for i, v in ipairs(aOne) do
      aOne[i] = {address = v.address - playerUpdate, flags = dataType}
    end
    a = gg.getValues(aOne)
    teleportFilter()
    return a, teleportLoop
  end
end

function teleportFilter()
  gg.clearResults()
  gg.clearList()
  for i, v in ipairs(a) do
    v.address = v.address - playerSeperator
  end
  a = gg.getValues(a)
  testMeFirst = {}
  testOther = {}
  for i, v in ipairs(a) do
    if v.value > 30000 then
      testMeFirst[#testMeFirst +1] = v
    elseif v.value < 20000 then
      testOther[#testOther +1] = v
    end
  end
  
  for i, v in ipairs(testMeFirst) do
    testMeFirst[i] = {address = v.address + playerPointer, flags = dataType} -- only has 1 sub table
  end
  testMeFirst = gg.getValues(testMeFirst)
  testMe = {}
  for i, v in ipairs(testMeFirst) do
    if instructionSetArchitecture == 32 then
      v.value = v.value & 0xFFFFFFFF
    end
    if v.value == v.address + playerPointerToCoordinate then
      testMe[#testMe + 1] = v
    end
  end
  
  testMe = gg.getValues(testMe)
  coordinateChange = {}
  for i, v in ipairs(testMe) do
    coordinateChange[i] = {address = v.address + playerUpdateAddress, flags = dataType}
  end
  
  tableCheckCoordZero = gg.getValues(coordinateChange)
  for i, v in ipairs(testOther) do
    testOther[i] = {address = v.address + playerPointer, flags = dataType}
  end
  
  testO = gg.getValues(testOther)
  testOther = {}
  for i, v in ipairs(testO) do
    if instructionSetArchitecture == 32 then
      v.value = v.value & 0xFFFFFFFF
    end
    if v.value == v.address + playerPointerToCoordinate then
      testOther[#testOther + 1] = v
    end
  end

  testOther = gg.getValues(testOther)
  original = gg.getValues(testOther)
  teleportMenu()
  return testMe, testOther, original, tableCheckCoordZero
end

function checkerTable()
  gg.loadResults(testMe) 
  testMes = gg.getResults(1)
  gg.clearResults()
  gg.loadResults(testOther)
  testOthers = gg.getResults(12)
  gg.clearResults()
  gg.loadResults(tableCheckCoordZero)
  tableCheckCoord = gg.getResults(1)
  gg.clearResults()
  
  if instructionSetArchitecture == 32 then
    testMes[1].value = testMes[1].value & 0xFFFFFFFF
    testOthers[1].value = testOthers[1].value & 0xFFFFFFFF
  end
  if testMes[1].value ~= testMe[1].address + playerPointerToCoordinate
  or testOthers[1].value ~= testOther[1].address + playerPointerToCoordinate
  or tableCheckCoord[1].value ~= tableCheckCoordZero[1].value then
    gg.toast('Player coordinates changed addresses -> tracing new addresses')
    teleportOriginal()
  end
end



function fighterStats()
    searchString(Class_ChatDataVO)
    gg.searchNumber(tableMetadataOffsets, dataType, gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC | gg.REGION_OTHER))
    a = gg.getResults(15)
    for i, v in ipairs(a) do
      v.address = v.address - classOffset -- 32bit = 0x8, 64bit = 0x10
    end
    a = gg.getValues(a)
    teser = {}
    for i, v in ipairs(a) do
      if instructionSetArchitecture == 32 then
      v.value = v.value & hexConvert -- hexConvert: 32bit = 0xFFFFFFFF
      end
      if (v.value == assembly[1].address) then
        teser[#teser + 1] = v
      end
    end
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS | gg.REGION_C_ALLOC | gg.REGION_OTHER)
    gg.searchNumber(teser[1].address, dataType) -- dataType: 32bit = 4(dword) | 64bit = 32(qword)
    test = gg.getResults(500)
    if #test == 0 then
      gg.toast("No players found")
    else
    isEmptyBool = {}
    for i ,v in ipairs(test) do
      isEmptyBool[i] = {address = v.address + pointerToEmptyBool, flags = gg.TYPE_BYTE}
    end
    isEmptyBool = gg.getValues(isEmptyBool)
    
    isFilterdPointer = {}
    isEmpty = {}
    isBotBool = {}
    isNicknamePointer = {}
    for i, v in ipairs(isEmptyBool) do
      if v.value == 1 then
        isFilterdPointer[#isFilterdPointer + 1] = {address = v.address - pointerToEmptyBool, flags = dataType}
      end
    end
    
    for i, v in ipairs(isFilterdPointer) do
      isEmpty[i] = {address = v.address + userIdOffset, flags = gg.TYPE_DWORD}
      isBotBool[i] = {address = v.address + controllerOffset, flags = gg.TYPE_BYTE}
      isNicknamePointer[i] = {address = v.address + nicknameOffset, flags = gg.TYPE_QWORD}
    end
    
    isBotBool = gg.getValues(isBotBool)
    isNicknamePointer = gg.getValues(isNicknamePointer)
    for i, v in ipairs(isNicknamePointer) do
      if instructionSetArchitecture == 32 then
        v.value = v.value & hexConvert -- hexConvert: 32bit = 0xFFFFFFFF
      end
      v.address = v.value
    end
    isNickname = gg.getValues(isNicknamePointer)
    isUser = gg.getValues(isEmpty)
    
    gg.clearResults()

  -- START: credits to Lover1500 -> source: https://gameguardian.net/forum/topic/35418-optimizing-script-utf16/?do=findComment&comment=130241
  local stringLength = {}
  for i, v in ipairs(isNickname) do
    stringLength[i] = {address = v.address + stringLengthAddress, flags = gg.TYPE_BYTE} -- value on those addresses == length of the string to be copied
  end
  stringLength = gg.getValues(stringLength)
  local stringStore = {}
  local id = {}
  for i, v in ipairs(isNickname) do
      for strlen=1, stringLength[i].value do
          stringStore[#stringStore+1] = {address=v.address+pointerToStringStart +((strlen)*2), flags=gg.TYPE_BYTE}
          id[#id+1] = i
      end
  end
  stringStore = gg.getValues(stringStore) --all strings will be stored here. They will be determined according to id(index for tables)
  for i, v in ipairs(stringStore) do
      local index = id[i]
      if isUser[index].name==nil then isUser[index].name='' end
      isUser[index].name = isUser[index].name..string.char(v.value&0xff)
  end
  -- END credits
  testSetting = {}
  isUserSetting = {}
  for i, v in ipairs(isUser) do
    if isBotBool[i].value == 1 then
      isBotValue = "A.I."
    elseif isBotBool[i].value == 0 then
      isBotValue = "Human"
    end
    isUserSetting[i] = "Nickname: "..v.name.." |User ID: "..v.value.." |Controller: "..isBotValue..""
    testSetting[i] = {address = v.address, flags = gg.TYPE_DWORD, name = isUserSetting[i]}
  end
  testof = gg.choice(isUserSetting)
  gg.addListItems(testSetting)
  gg.toast("Player saved in the saved list")
end
end

-- skills features
loopAutoFire = 0
function autoF()
  loopAutoFire = loopAutoFire + 1
  if loopAutoFire <= 1 then
    auto = {}
    for i, v in ipairs(skills) do
      if v.value == 217 then
        auto[#auto + 1] = v
      end
    end
    
    for i, v in ipairs(auto) do
      v.address = v.address + skillIdExtraOffset -- skillIdExtraOffset: 32bit = 0x10 | 64bit = 0x18
      v.flags = gg.TYPE_DOUBLE
    end
    
    auto = gg.getValues(auto)
    gg.clearResults()
    gg.toast('autoFire ready')
  else
    if autoFi == on then
      auto[1].value = '500'
      toast = gg.toast('autoFire activated in lobby')
    else
      auto[1].value = '0'
      toast = gg.toast('autoFire deactivated in lobby')
    end
    gg.setValues(auto)
    gg.clearResults()
  end
  return auto[1].value, toast
end
autoF()

loopBulletFraction = 0
function bulletFractionInc()
    -- START: this code only runs once
  loopBulletFraction = loopBulletFraction + 1
  if loopBulletFraction <= 1 then
    damg = {}
    for i, v in ipairs(skills) do
      if v.value == 224 then
        damg[#damg + 1] = v
      end
    end
    
    for i, v in ipairs(damg) do
      v.address = v.address + skillIdExtraOffset -- skillIdExtraOffset: 32bit = 0x10 | 64bit = 0x18
      v.flags = gg.TYPE_DOUBLE
    end
    
    damg = gg.getValues(damg)
    gg.clearResults()
    gg.toast('damage ready')
  else
    if damge == on then
      damg[1].value = '2'
      toast = gg.toast('Damage activated in lobby')
    else
      damg[1].value = '1'
      toast = gg.toast('Damage deactivated in lobby')
    end
    gg.setValues(damg)
    gg.clearResults()
  end
  return damg[1].value, toast
end
bulletFractionInc()

loopAmmo = 0
function ammoHolderInc()
    -- START: this code only runs once
  loopAmmo = loopAmmo + 1
  if loopAmmo <= 1 then
    ammoClip = {}
    for i, v in ipairs(skills) do
      if v.value == 2998 then
        ammoClip[#ammoClip + 1] = v
      end
    end
    for i, v in ipairs(ammoClip) do
      v.address = v.address + skillIdExtraOffset -- skillIdExtraOffset: 32bit = 0x10 | 64bit = 0x18
      v.flags = gg.TYPE_DOUBLE
    end
    gg.clearResults()
    gg.toast('ammo ready')
  else
  if magz == on then
    ammoClip[1].value = '1000'
    toast = gg.toast('ammo activated')
  else
    ammoClip[1].value = '0'
    toast = gg.toast('ammo deactivated')
  end
  gg.setValues(ammoClip)
  end
  return ammoClip[1].value, toast
end
ammoHolderInc()

-- weapons features
function weaponSettingsRecoil()
  if recoil == on then
    gg.setValues(recoilTableOn)
    gg.setValues(recoilAimTableOn)
    gg.toast('recoil activated')
  elseif recoil == off then
    gg.setValues(recoilTableOff)
    gg.setValues(recoilAimTableOff)
    gg.toast('recoil deactivated')
  end
end

function weaponSettingsReload()
  if reload == on then
    gg.setValues(reloadTimeTableOn)
    gg.toast('reload activated')
  elseif reload == off then
    gg.setValues(reloadTimeTableOff)
    gg.toast('reload deactivated')
  end
end

function weaponSettingsMaxAmmo()
  if maxAmmo == on then
    gg.setValues(maxAmmoCapacityTableOn)
    gg.toast('maxAmmo activated')
  elseif maxAmmo == off then
    gg.setValues(maxAmmoCapacityTableOff)
    gg.toast('maxAmmo deactivated')
  end  
end
function weaponSettingsAccumulation()
  if accum == on then
    gg.setValues(accumulationFullTableOn)
    gg.setValues(accumulationResetTableOn)
    gg.toast('accumulation activated')
  elseif accum == off then
    gg.setValues(accumulationFullTableOff)
    gg.setValues(accumulationResetTableOff)
    gg.toast('accumulation deactivated')
  end
end


-- bools
function boolsOff()
  on = "[ON]"
  off = "[OFF]"

  aimlock = off
  damge = off
  pane = off
  hitt = off
  magz = off
  chams = off
  zoom = off
  zoomHeigh = off
  giants = off
  autoFi = off
  recoil = off
  reload = off
  maxAmmo = off
  accum = off
end
boolsOff()

-- menus
function START()
  menu = gg.choice
  (
    {
      hitt..'Head hitbox [LOBBY]',
      zoom..'Zoom Scope [MATCH]',
      'Freeze player screen [MATCH]',
      giants..'Giant [MATCH]',
      'Freeze player controls(not bots) [MATCH]',
      chams..'chams (not emulators) [MATCH]',
      pane..'Admin panel [32 bit apk]',
      zoomHeigh..'Zoom scope Height [MATCH]',
      'Teleport [MATCH]',
      'Weapon settings [LOBBY]',
      'Player info [MATCH]',
      'EXIT'
    }
  )
  
  if menu == nil then
    noselect()
  else
    if menu == 12 then
      gg.clearList()
      os.exit()
    end
    
    if menu == 1 then
      headHitBoxMenu()
    end
    
    if menu == 2 then
      if zoom == on then
        zoom = off
      else        zoom = on
      end
      zoomScopeDepth()
    end

    if menu == 3 then
      screenFreeze()
    end
    
    if menu == 4 then
      if giants == on then
        giants = off
      else
        giants = on
      end
      theGiant()
    end
    
    if menu == 5 then
      joystickFreeze()
    end
      
    if menu == 6 then
      if chams == on then
        chams = off
      else
        chams = on
      end
      chamsF()
    end
      
    if menu == 7 then
      if pane == on then
        pane = off
      else
        pane = on
      end
      adminPanel()
    end
    
    if menu == 8 then
      if zoomHeigh == on then
        zoomHeigh = off
      else
        zoomHeigh = on
      end
      zoomScopeHeight()
    end
    
    if menu == 9 then
      teleportLoop = teleportLoop + 1
      if teleportLoop <= 1 then
        teleportOriginal()
      else
        teleportMenu()
      end
    end
    
    if menu == 10 then
      weaponTableMenu()
    end
    
    if menu == 11 then
      fighterStats()
    end
    
  end
end

function weaponTableMenu()
  weaponMenu = gg.multiChoice
  (
    {
      damge..'Damage x2 [LOBBY]',
      magz..'Ammo hack - magazine [LOBBY]',
      autoFi..'Auto Fire [LOBBY]',
      aimlock..'Aim lock [LOBBY]',
      recoil..'No Recoil [LOBBY]',
      reload..'Quick Reload [LOBBY]',
      maxAmmo..'Max ammo clip/magazine [LOBBY]',
      accum..'No accumulation [LOBBY]',
      'BACK'
    }
  )

  
  if weaponMenu == nil then
    noselect()
  else
    if weaponMenu[9] then
      START()
    else
      
      if weaponMenu[1] then
        if damge == on then
          damge = off
        else
          damge = on
        end
        bulletFractionInc(fraction, toast)
      end
    
      if weaponMenu[2] then
        if magz == on then
          magz = off
        else
          magz = on
        end
        ammoHolderInc(ammoMax, toast)
      end
    
      if weaponMenu[3] then
        if autoFi == on then
          autoFi = off
        else
          autoFi = on
        end
        autoF(autoFire, toast)    
      end
      
      if weaponMenu[4] then
        if aimlock == on then
          aimlock = off
        else
          aimlock = on
        end
        cameraLockF() 
      end
    
      if weaponMenu[5] then
        if recoil == on then
          recoil = off
        else
          recoil = on
        end
        weaponSettingsRecoil()   
      end
    
      if weaponMenu[6] then
        if reload == on then
          reload = off
        else
          reload = on
        end
        weaponSettingsReload()
      end
    
      if weaponMenu[7] then
        if maxAmmo == on then
          maxAmmo = off
        else
          maxAmmo = on
        end
        weaponSettingsMaxAmmo()
      end
      
      if weaponMenu[8] then
        if accum == on then
          accum = off
        else
          accum = on
        end
        weaponSettingsAccumulation()
      end
    end
  end
end

function teleportMenu()
  c = "player"
  toast = "This player did not exist during executing of function"
  changed = "Coordinates of this player changed"
  
  menuTeleport = gg.multiChoice
  (
    {
      c..' 1',
      c..' 2',
      c..' 3',
      c..' 4',
      c..' 5',
      c..' 6',
      c..' 7',
    }
  )
  
  if menuTeleport == nil then
    noselect()
  else
    
    if menuTeleport[1] then
      checkerTable()
      if testOther[1] == nil then
        gg.toast(toast)
      else
        gg.loadResults(testOther)
        checkEqual = gg.getResults(12)
        gg.clearResults()
        if checkEqual[1].value ~= testOther[1].value then
          gg.toast(changed)
          teleportOriginal()
        else
          testOther[1].value = testMe[1].value
          gg.setValues(testOther)
          gg.sleep(100)
          testOther[1].value = original[1].value
          gg.setValues(testOther)
        end
      end
    end
    
    if menuTeleport[2] then
      checkerTable()
      if testOther[2] == nil then
        gg.toast(toast)
      else
        gg.loadResults(testOther)
        checkEqual = gg.getResults(12)
        gg.clearResults()
        if checkEqual[2].value ~= testOther[2].value then
          gg.toast(changed)
          teleportOriginal()
        else
          testOther[2].value = testMe[1].value
          gg.setValues(testOther)
          gg.sleep(100)
          testOther[2].value = original[2].value
          gg.setValues(testOther)
        end
      end
    end
  
    if menuTeleport[3] then
      checkerTable()
      if testOther[3] == nil then
        gg.toast(toast)
      else
        gg.loadResults(testOther)
        checkEqual = gg.getResults(12)
        gg.clearResults()
        if checkEqual[3].value ~= testOther[3].value then
          gg.toast(changed)
          teleportOriginal()
        else
          testOther[3].value = testMe[1].value
          gg.setValues(testOther)
          gg.sleep(100)
          testOther[3].value = original[3].value
          gg.setValues(testOther)
        end
      end
    end
  
    if menuTeleport[4] then
      checkerTable()
      if testOther[4] == nil then
        gg.toast(toast)
      else
        gg.loadResults(testOther)
        checkEqual = gg.getResults(12)
        gg.clearResults()
        if checkEqual[4].value ~= testOther[4].value then
          gg.toast(changed)
          teleportOriginal()
        else
          testOther[4].value = testMe[1].value
          gg.setValues(testOther)
          gg.sleep(100)
          testOther[4].value = original[4].value
          gg.setValues(testOther)
        end
      end
    end
  
    if menuTeleport[5] then
      checkerTable()
      if testOther[5] == nil then
        gg.toast(toast)
      else
        gg.loadResults(testOther)
        checkEqual = gg.getResults(12)
        gg.clearResults()
        if checkEqual[5].value ~= testOther[5].value then
          gg.toast(changed)
          teleportOriginal()
        else
          testOther[5].value = testMe[1].value
          gg.setValues(testOther)
          gg.sleep(100)
          testOther[5].value = original[5].value
          gg.setValues(testOther)
        end
      end
    end
  
    if menuTeleport[6] then
      checkerTable()
      if testOther[6] == nil then
        gg.toast(toast)
      else
        gg.loadResults(testOther)
        checkEqual = gg.getResults(12)
        gg.clearResults()
        if checkEqual[6].value ~= testOther[6].value then
          gg.toast(changed)
          teleportOriginal()
        else
          testOther[6].value = testMe[1].value
          gg.setValues(testOther)
          gg.sleep(100)
          testOther[6].value = original[6].value
          gg.setValues(testOther)
        end
      end
    end
  
    if menuTeleport[7] then
      checkerTable()
      if testOther[7] == nil then
        gg.toast(toast)
      else
        gg.loadResults(testOther)
        checkEqual = gg.getResults(12)
        gg.clearResults()
        if checkEqual[7].value ~= testOther[7].value then
          gg.toast(changed)
          teleportOriginal()
        else
          testOther[7].value = testMe[1].value
          gg.setValues(testOther)
          gg.sleep(100)
          testOther[7].value = original[7].value
          gg.setValues(testOther)
        end
      end
    end
  end
end

function headHitBoxMenu()
  hitboxs = gg.choice
  (
    {
      'normal',
      'weak',
      'medium',
      'strong'
    }
    ,nil,
    'ONLY USE ASSAULT/SHOTGUNS ON WEAK! AVOID ONLY HEADSHOTS!, HEADSHOTS FOR SNIPERS ONLY :D'
  )
  if hitboxs == nil then 
    noselect() 
  else
    headHitBoxSize(box, toast)
  end
end


-- defaults
function wiping()
  gg.clearList()
end

function noselect()
  gg.toast('You not select anything')
end

START()
while (true) do
  if gg.isVisible() then
    gg.setVisible(false)
    START()
  end
  gg.sleep(100) 
end