--Mod By GODOFGODS
local day = "20240520"
local versionCode = 26
local check1 = loadfile(gg.EXT_FILES_DIR.."/"..day.."."..versionCode)
local check2 = loadfile(gg.EXT_STORAGE.."/"..day.."."..versionCode)
local check3 = loadfile(gg.FILES_DIR.."/"..day.."."..versionCode)


if os.date("%Y%m%d") >= day or check1 or check2 or check3 then 
gg.alert("EXPIRED! Please contact me (hdbk1986@gmail.com) to get help more")
--gg.alert(gg.EXT_FILES_DIR)
x={1}
gg.saveVariable(x, gg.EXT_FILES_DIR.."/"..day.."."..versionCode)
gg.saveVariable(x, gg.FILES_DIR.."/"..day.."."..versionCode)
gg.saveVariable(x, gg.EXT_STORAGE.."/Download/"..day.."."..versionCode)
os.exit() 
end


--USER & PASSWORD CODE  - كود اسم مستخدم و كلمة المرور

--Username = "GoGOfGods"
--Password = "GoG"
--Result = gg.prompt({"👤 Usᴇʀɴᴀᴍᴇ","🔒 Pᴀssᴡᴏʀᴅ"},nil,{"text",
--"text"})
--if Result[1] == Username and Result[2] == Password then
--gg.toast('ON ✅')
--else
--gg.toast("⚠️SOMETHING WENT WRONG⚠️")
--os.exit()
--end

is64 = true
gversion = 2029
isOn = '[ON] '
isOff = '[OFF] '
chStatus = {isOff, isOff, isOff, isOff, isOff, isOff, isOff, isOff}
expLevel = {0.0, 50.0, 100.0, 175.0, 250.0, 350.0, 500.0, 650.0, 800.0, 1000.0, 1200.0, 1400.0, 1600.0, 1800.0,  2000.0,
2250.0, 2500.0, 2750.0, 3000.0, 3300.0, 3600.0, 3900.0, 4200.0, 4500.0, 5000.0, 5500.0, 6000.0, 6500.0, 7000.0, 7500.0, 
8000.0, 8500.0, 9000.0, 9500.0, 10000.0, 10800.0, 11600.0, 12400.0, 13200.0, 14000.0, 14800.0, 15600.0, 16400.0, 17200.0,
18000.0, 19000.0, 20000.0, 21000.0, 22000.0, 23000.0, 24000.0, 25000.0, 26000.0, 27000.0, 28000.0, 29000.0, 30000.0, 32000.0,
34000.0, 36000.0, 38000.0, 40000.0, 44000.0, 48000.0, 52000.0, 56000.0, 60000.0, 68000.0, 76000.0, 84000.0, 92000.0, 100000.0, 
120000.0, 140000.0, 160000.0, 180000.0, 200000.0, 250000.0, 300000.0, 350000.0, 400000.0, 450000.0, 500000.0, 600000.0, 700000.0, 
800000.0, 900000.0, 1000000.0, 1200000.0, 1400000.0, 1600000.0, 1800000.0, 2000000.0, 2500000.0, 3000000.0, 4000000.0, 5000000.0,
10000000.0, 20000000.0, 39999990.0}
backupPlayerID = 0
currentID = 0
range = gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS
currentLevel = 0
currentLevelUpgraded = 0
deV = {0,0,0,0,0,0,0,0,0,0, 200.0}
currentExp = 0
currentEngrams = 0
listID = {'body_r','body_g','body_b','body_a','foot_r','foot_g','foot_b','foot_a','chest_r','chest_g','chest_b','chest_a', 'gradient_b', 'gradient_a'}
PlistID = {'Pbody_r','Pbody_g','Pbody_b','Pbody_a','Phair_r','Phair_g','Phair_b','Phair_a','Peyes_r','Peyes_g','Peyes_b','Peyes_a'}
listIDValueDefault = {0,0,0,1,0,0,0,1,0,0,0,1,1,1}
PlistIDValueDefault = {0,0,0,1,0,0,0,1,0,0,0,1,1,1}


curKeyDino = {"CurrentHP","DCurrentStamina","DCurrentOxygen","DCurrentFood","DCurrentWeight","DCurrentMeleeDame","DCurrentMoveSPD","DCurrentTorpor"}

maxKeyDino ={"MaxHP","DmaxStamina","DmaxOxygen","DmaxFood","DmaxWeight","DMeleeDamage","DMovementSP","DTorpor"}
maxKeyValueDino ={"vHP","vStamina","vOxygen","vFood","vWeight","vMeleeDamage","vMovementSP","vTorpor"}
rateDino = {0.2, 0.1, 0.1, 0.1, 0.02, 0.037, 0, 0.0637}
max1devDino = {0,0,0,0,0,0,0,0}
max2devDino = {0,0,0,0,0,0,0,0}
baseDino = {0,0,0,0,0,0,0,0}
valueDino = {0,0,0,0,0,0,0,0}
currentTameLvD =0
currentLvUpD =0
currentExpDino =0
currentScaleDodo =0
currentEquusPower =0
currentMammothCapacity =0
currentFishSize =0
imprinting =0
maturation =0
function Status(cheat)

    if chStatus[cheat] == isOn then
        chStatus[cheat] = isOff
    else
        chStatus[cheat] = isOn
    end

end

function checkLevel(experience)
local lv = 1;
for i = 1, #expLevel do
	if (experience > expLevel[i]) then
	lv = i
	end
end
return lv
end

function testData()
local testAd = 0
local te = gg.getListItems()
local t ={}
for i, v in ipairs(te) do
  if v.name == "Player_ID" then
	testAd = 1
	t[1] = {}
	t[1].address = te[i].address
	t[1].flags = gg.TYPE_DWORD
	t[2] = {}
	if is64 then 
	t[2].address = te[i].address + 0x9A0
	else
	t[2].address = te[i].address + 0x77c
	end
	t[2].flags = gg.TYPE_FLOAT
	t = gg.getValues(t)
	if (t[1].value>100000 and math.abs(t[2].value-2200) < 0.1) then
		testAd = 2
	end	
  end
end
if testAd < 2 then
return false
else
return true
end
end

function MenuSelectVersion()
local info = gg.getTargetInfo()
local ins = ""
if info.x64 then
  is64 = true
  ins = "Game processor: 64 bit"
else
  is64 = false
  ins = "Game processor: 32 bit"
end
gg.toast(ins..". Script Version: "..versionCode)
gg.clearList()
gg.clearResults()
--FreeCreaturesBK()
menu = gg.choice({"🔱 ARK game version: 2.0.28", "🔱 ARK game version: 2.0.29",

"🔚 EXIT"
},nil,"SELECTION GAME VERSION FOR WORK")

if menu == 1 then
gversion = 2028 
MainMenu() 
end

if menu == 2 then 
gversion = 2029 
MainMenu() 
end

if menu == 3 then 
gg.toast("Script Version is "..versionCode..". Made by GodOfGods (hdbk1986@gmail.com)")
Exit() end

--if menu == 4 then TestArray() end

if menu == nil then 
noselect()
end
end



function MainMenu()
menu = gg.choice({"💾 USE MEMORY CA+ANONYMOUS (Default)\nSelection if OTHER memory does'n work.", "💾 USE MEMORY OTHER\nSelection if CA+ANONYMOUS memory does'n work.",

"🔚 EXIT"
},nil,"Game version: "..gversion)

if menu == 1 then 
range = gg.REGION_C_ALLOC | gg.REGION_ANONYMOUS
gg.toast("Finding World. Please wait")
GetArray(0)
StartCheat() 
end

if menu == 2 then 
range = gg.REGION_OTHER
gg.toast("Finding World. Please wait")
GetArray(0)
StartCheat() 
end

if menu == 3 then 
gg.toast("Script Version is "..versionCode..". Made by GodOfGods (hdbk1986@gmail.com)")
Exit() end

--if menu == 4 then TestArray() end

if menu == nil then 
noselect()
end
end


addItem = {}
defaultID = "/Game/PrimalEarth/CoreBlueprints/Items/Consumables/PrimalItemConsumable_DungeonSalve_Temperature_Minor.PrimalItemConsumable_DungeonSalve_Temperature_Minor_C"
defaultIDCreature = "/Game/PrimalEarth/Dinos/Basilosaurus/Basilosaurus_Character_BP.Basilosaurus_Character_BP_C"
defaultIDCreatureReplace = "/Game/PrimalEarth/Dinos/Equus/Equus_Character_BP_Unicorn.Equus_Character_BP_Unicorn_C"

function FreeCreaturesBK()
local testAdd = false
local addCreatures = {}
n = gg.prompt({
	'String creature ID Search: \nThis is ID of creature from Implant in your inventor\nExample ID: Basilosaurus',
	'String Creature ID Replace: \nExample ID: Unicorn',
	},
		{defaultIDCreature,defaultIDCreatureReplace}, 
		{'text', 'text'})
	if n == nil then 
		gg.sleep(1)
		gg.toast("CANCELLED")
		DinosOption()
	else
		--string.char(97) == "a"
		--string.byte("a") == 97
		local strS = string.gsub(n[1], "%s+", "")
		local strR = string.gsub(n[2], "%s+", "")
		
		--gg.alert("|"..strS.."|"..strR.."|")
		
		if #strS < #strR then
			gg.alert("You can not replace a creature with lenght ID bigger creature id source")
			FreeCreatures()
			return
		end
		
		if #addCreatures>0 then
			for i=1,#addCreatures do
			--gg.alert(#addItem)
				if addCreatures[i][2] == strS then
					testAdd = true
				end
			end
		end
		
		if testAdd == false then
			local strValueSearch=""
			local fields = {}
			local fieldR = {}
			for i = 1, #strS do
				fields[i] = strS:sub(i, i)
			end
			for j = 1, #strR do
				 fieldR[j] = strR:sub(j, j)
			end
			--local fields = { strS:match( (strS:gsub(".", "(.)")) ) }
			--local fieldR = { strR:match( (strR:gsub(".", "(.)")) ) }
			if (#fields>0) then
				local s = ""
				for i=1, #fields do
					if i==1 then
					s = string.byte(fields[i])
					else
					s = s..";"..string.byte(fields[i])
					end
				end
				strValueSearch = s.."::"..((#fields-1)*4+1)
				gg.alert(#fields.."|"..strValueSearch)
			end	
			------------------	
			if  #fields>0 then
				gg.clearResults()
				gg.setVisible(false)
				gg.setRanges(range)
				--gg.setRanges(gg.REGION_C_ALLOC)
				gg.searchNumber(strValueSearch, gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
				gg.refineNumber(string.byte(fields[#fields]), gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
				m = gg.getResultsCount()
				if m==0 then
					gg.alert("Not found results. You are sure with true ID creature?")
					--DinosOption()
				else
					x = gg.getResults(m)
					q = {}
					for i = 1, m do
						q[i] ={}
						q[i][1] = {}
						q[i][1].address = x[i].address-- last character
						q[i][1].flags = gg.TYPE_DWORD
						q[i][1].name = "EndStr"
						q[i][2] = {}
						q[i][2].address = x[i].address - 0x4 * (#fields-1)-- first character
						q[i][2].flags = gg.TYPE_DWORD
						q[i][2].name = "StartStr"
						
						q[i] = gg.getValues(q[i])
						if validStringAddress(q[i][2].address, strS) then
								addCreatures[#addCreatures + 1] = {q[i][2].address, strS}
								testAdd = true	
								x[i] = nil
						end						
					end
					gg.removeResults(x)				
				end
			end
		end
		
		if testAdd == true then
			local v = {}
			for i = 1, #addCreatures do
				if addCreatures[i][2] == strS then
					v[i] = {}
					for j = 1, #strS do
						v[i][j] = {}
						v[i][j].address = addCreatures[i][1]+0x4*(j-1)
						v[i][j].flags = gg.TYPE_DWORD
						if #strR>0 and #strR<=#strS then
							if (j<=#strR) then
								v[i][j].value = string.byte(strR:sub(j, j))
							else
								v[i][j].value = 0
							end
						end
					end
					--gg.addListItems(v[i])
					if #strR>0 and #strR<=#strS then							
						gg.setValues(v[i])
						defaultIDCreature = strS
					end
				end
			end
			gg.alert("Replaced! Go to Revival platform or Obelisk for Revival creature from Implant that changed")	
		end
	end
end

function FreeCreatures()
local testAdd = false
local addCreatures = {}
n = gg.prompt({
	'Blueprint Path Creature ID From Implant: \nThis is ID of creature from Implant in your inventor\nExample ID: Basilosaurus',
	'Blueprint Path Creature ID Replace: \nExample ID: Unicorn',
	},
		{defaultIDCreature,defaultIDCreatureReplace}, 
		{'text', 'text'})
	if n == nil then 
		gg.sleep(1)
		gg.toast("CANCELLED")
		DinosOption()
	else
		--string.char(97) == "a"
		--string.byte("a") == 97
		local strS = string.gsub(n[1], "%s+", "")
		local strR = string.gsub(n[2], "%s+", "")
		
		--gg.alert("|"..strS.."|"..strR.."|")
		
		if #strS < #strR then
			gg.alert("You can only replace the id of a creature with a character length shorter than the original creature in the implant")
			FreeCreatures()
			return
		end
		
		if #addCreatures>0 then
			for i=1,#addCreatures do
			--gg.alert(#addItem)
				if addCreatures[i][2] == strS then
					testAdd = true
				end
			end
		end
		
		if testAdd == false then
			if  #strS>0 then
				local strValueSearch = "-1;0;0;"..(#strS+1)..";"..(#strS+1).."::29"
				gg.clearResults()
				gg.setVisible(false)
				gg.setRanges(range)
				gg.searchNumber(strValueSearch, gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
				gg.refineNumber("-1", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
				m = gg.getResultsCount()
				if m==0 then
					gg.alert("Not found results. You are sure with true ID creature? Let's try again with restart game")
					DinosOption()
				else
					x = gg.getResults(m)
					q = {}
					for i = 1, m do
						q[i] ={}
						q[i][1] = {}
						q[i][1].address = x[i].address + 0x4
						q[i][1].flags = gg.TYPE_DWORD
						q[i][2] = {}
						q[i][2].address = x[i].address + 0x8
						q[i][2].flags = gg.TYPE_DWORD
						q[i][3] = {}
						if is64 then 
						q[i][3].address = x[i].address + 0x18
						else
						q[i][3].address = x[i].address + 0x14
						end
						q[i][3].flags = gg.TYPE_DWORD
						q[i][4] = {}
						q[i][4].address = q[i][3].address + 0x4
						q[i][4].flags = gg.TYPE_DWORD
						q[i][5] = {}
						q[i][5].address = x[i].address + 0x10
						q[i][5].flags = gg.TYPE_QWORD
						q[i] = gg.getValues(q[i])
						q[i][5].address = q[i][5].value
						q[i][5].flags = gg.TYPE_DWORD
						q[i] = gg.getValues(q[i])
						if math.abs(q[i][1].value) <0.1 and math.abs(q[i][2].value) <0.1 and math.abs(q[i][3].value - (#strS+1)) <0.1 and math.abs(q[i][4].value - (#strS+1)) <0.1 and validStringAddress(q[i][5].address, strS) then
								addCreatures[#addCreatures + 1] = {q[i][5].address, strS}
								testAdd = true	
								x[i] = nil
						end						
					end
					gg.removeResults(x)				
				end
			end
		end
		
		if testAdd == true then
			local v = {}
			for i = 1, #addCreatures do
				if addCreatures[i][2] == strS then
					v[i] = {}
					for j = 1, #strS do
						v[i][j] = {}
						v[i][j].address = addCreatures[i][1]+0x4*(j-1)
						v[i][j].flags = gg.TYPE_DWORD
						if #strR>0 and #strR<=#strS then
							if (j<=#strR) then
								v[i][j].value = string.byte(strR:sub(j, j))
							else
								v[i][j].value = 0
							end
							if (j%10 ==0) then
								gg.toast("Process Changed "..j.."/"..#strS, true)
							end
						end
					end
					--gg.addListItems(v[i])
					if #strR>0 and #strR<=#strS then							
						gg.setValues(v[i])
						defaultIDCreature = strS
					end
				end
			end
			gg.alert("Replaced! Go to Revival platform or Obelisk for Revival creature from Implant that changed")	
		else
			gg.alert("Not found results. You are sure with true ID creature? Let's try again with restart game")
			DinosOption()
		end
	end
end

function FreeItems()
local testAdd = false
n = gg.prompt({
	'Blueprint Path Item ID From Shop: \nDefault: Minor Adaptogenic Serum Consumable\nYou can change this id for another item amber from amber shop',
	'Blueprint Path Item ID Replace: ',
	'Change price to: (value with - if you want buy item but get add amber)',
	'Change quantity buy: (>0)',
	},
		{defaultID,"", 0, 1000}, 
		{'text', 'text', 'number', 'number'})
	if n == nil then 
		gg.sleep(1)
		gg.toast("CANCELLED")
		FreeShopAndItems()
	else
		--string.char(97) == "a"
		--string.byte("a") == 97
		local strS = string.gsub(n[1], "%s+", "")
		local strR = string.gsub(n[2], "%s+", "")
		
		if #strS < #strR then
			gg.alert("You can only replace an item's id with a character length shorter than the original item")
			FreeItems()
			return
		end
	
		
		if #addItem>0 then
			local u = {}
			for i=1,#addItem do
			--gg.alert(#addItem)
				if addItem[i][2] == strS then
					u[i] = {}
					u[i][1] = {}
					if is64 then
					u[i][1].address = addItem[i][1] + 0x10
					else
					u[i][1].address = addItem[i][1] + 0xc
					end
					u[i][1].flags = gg.TYPE_DWORD

					u[i][2] = {}
					u[i][2].address = u[i][1].address + 0xc
					u[i][2].flags = gg.TYPE_DWORD
					
					u[i][3] = {}
					u[i][3].address = u[i][1].address - 0x4
					u[i][3].flags = gg.TYPE_DWORD
					
					u[i][4] = {}
					u[i][4].address = u[i][1].address - 0x8
					u[i][4].flags = gg.TYPE_DWORD
					u[i] = gg.getValues(u[i])
					if math.abs(u[i][3].value- (#strS+1)) < 1 and math.abs(u[i][4].value- (#strS+1)) < 1 then							

					testAdd = true
					end

				end
			end
		end
		
		if testAdd == false then	
			local t = 0
			if  #strS>0 then
				local strValueSearch = (#strS+1)..";"..(#strS+1)..";1~10;0::13"
				gg.clearResults()
				gg.setVisible(false)
				gg.setRanges(range)
				gg.searchNumber(strValueSearch, gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
				gg.refineNumber("1~10", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
				m = gg.getResultsCount()
				if m==0 then
					gg.alert("Not found results.")
					--StartCheat()
				else
					x = gg.getResults(m)
					q = {}
					ad = 0
					for i = 1, m do
						q[i] ={}
						q[i][1] = {}
						if is64 then
						q[i][1].address = x[i].address -0x10
						else
						q[i][1].address = x[i].address -0xc
						end
						q[i][1].flags = gg.TYPE_QWORD
						ad = q[i][1].address
						q[i] = gg.getValues(q[i])
						q[i][1].address = q[i][1].value
						q[i][1].flags = gg.TYPE_DWORD
						q[i][2] = {}
						q[i][2].address = x[i].address +0xC
						q[i][2].flags = gg.TYPE_DWORD
						q[i][3] = {}
						q[i][3].address = x[i].address +0x8
						q[i][3].flags = gg.TYPE_DWORD
						q[i] = gg.getValues(q[i])
						if q[i][3].value==0 and q[i][2].value > 0 and validStringAddress(q[i][1].address, strS) then
							t = #addItem + 1
							addItem[t] = {ad, strS}
							testAdd = true	
						end	
					end		
				end
			end
		end
		
		if testAdd == true then
			local v = {}
			local u = {}
			local s = {}
			for i = 1, #addItem do
				if addItem[i][2] == strS then
					v[i] = {}
					s[i] = {}
					u[i] = {}
					u[i][1] = {}
					u[i][1].address = addItem[i][1] - 0xc
					u[i][1].flags = gg.TYPE_DWORD
					u[i][1].value = -1
					u[i][1].freeze = true
					u[i][2] = {}
					if is64 then
					u[i][2].address = addItem[i][1] + 0x10
					else
					u[i][2].address = addItem[i][1] + 0xc
					end
					u[i][2].flags = gg.TYPE_DWORD
					u[i][2].value = tonumber(n[4])
					u[i][3] = {}
					u[i][3].address = u[i][2].address + 0xc
					u[i][3].flags = gg.TYPE_DWORD
					u[i][3].value = tonumber(n[3])
					s[i][1] = {}
					s[i][1].address = addItem[i][1]
					s[i][1].flags = gg.TYPE_QWORD
					s[i] = gg.getValues(s[i])
					s[i][1].address = s[i][1].value
					s[i][1].flags = gg.TYPE_DWORD
					for j = 1, #strS do
						v[i][j] = {}
						v[i][j].address = s[i][1].address+0x4*(j-1)
						v[i][j].flags = gg.TYPE_DWORD
						if #strR>0 and #strR<=#strS then
							if (j<=#strR) then
								v[i][j].value = string.byte(strR:sub(j, j))
							else
								v[i][j].value = 0
							end
							
							if (j%10 ==0) then
								gg.toast("Process Changed "..j.."/"..#strS, true)
							end
						end
					end
					--gg.addListItems(v[i])
					if #strR>0 and #strR<=#strS then							
						gg.setValues(v[i])
						gg.setValues(u[i])
						defaultID = strS
					end
				end
			end
			gg.alert("Actived! Save and restart game from Main menu if items that you bought are not same items showed")	
		else
			gg.alert("Not found results. Try again with kill and then restart game")
			FreeShopAndItems()
		end
	end
end

function validStringAddress(ad, st)
local w = true
local a = {}
for i=1, #st do
	a[1] = {}
	a[1].address = tonumber(ad) + 0x4 * (i-1)
	a[1].flags = gg.TYPE_DWORD
	a = gg.getValues(a)
	if (math.abs(tonumber(string.byte(st:sub(i, i)))-a[1].value)>0.5) then
		w = false
		break
	end
end
return w
end


playerChecked = false

function GetInfoArrayMenuDino(vl)
	if #ArrayDinos>0 then
		menuL = nil
		menuL = {}
		menuID = nil
		menuID = {}
		count = 0
		for i=1,#ArrayDinos do
			if (vl==2) then 
				if (ArrayDinos[i][2]>100000 and ArrayDinos[i][1] ~= "PLAYER") then  -- tamed
					count = count + 1
					if tonumber(ArrayDinos[i][6])~=0 and ArrayDinos[i][5]~=0 then
						menuL[count] = count..":"..ArrayDinos[i][1].." - LV: "..(tonumber(ArrayDinos[i][3])+ tonumber(ArrayDinos[i][4])).." | Tamed\n   HP: "..round(ArrayDinos[i][5]).."/"..round(ArrayDinos[i][6])
						menuID[count] = i
					else
						if (tonumber(ArrayDinos[i][6])==0 and ArrayDinos[i][5]==0) then
							menuL[count] = count..":"..ArrayDinos[i][1].." - LV: "..(tonumber(ArrayDinos[i][3])+ tonumber(ArrayDinos[i][4])).." | Tamed\n   HP: Unknown - too far or not yet spawn"
						end
						if (tonumber(ArrayDinos[i][6])~=0 and ArrayDinos[i][5]==0) then
							menuL[count] = count..":"..ArrayDinos[i][1].." - LV: "..(tonumber(ArrayDinos[i][3])+ tonumber(ArrayDinos[i][4])).." | Tamed | Dead\n   HP: "..round(ArrayDinos[i][5]).."/"..round(ArrayDinos[i][6])
						end
						menuID[count] = i
					end
				end
			elseif vl == 3 then
				if (ArrayDinos[i][2]<100000 and ArrayDinos[i][1] ~= "PLAYER") then  -- WILD
					count = count + 1
					if tonumber(ArrayDinos[i][6])~=0 and ArrayDinos[i][5]~=0 then
						menuL[count] = count..":"..ArrayDinos[i][1].." - LV: "..(tonumber(ArrayDinos[i][3])+ tonumber(ArrayDinos[i][4])).." | Wild\n   HP: "..round(ArrayDinos[i][5]).."/"..round(ArrayDinos[i][6])
						menuID[count] = i
					else
						if (tonumber(ArrayDinos[i][6])==0 and ArrayDinos[i][5]==0) then
							menuL[count] = count..":"..ArrayDinos[i][1].." - LV: "..(tonumber(ArrayDinos[i][3])+ tonumber(ArrayDinos[i][4])).." | Wild\n   HP: Unknown - too far or not yet spawn"
						end
						if (tonumber(ArrayDinos[i][6])~=0 and ArrayDinos[i][5]==0) then
							menuL[count] = count..":"..ArrayDinos[i][1].." - LV: "..(tonumber(ArrayDinos[i][3])+ tonumber(ArrayDinos[i][4])).." | Wild | Dead\n   HP: "..round(ArrayDinos[i][5]).."/"..round(ArrayDinos[i][6])
						end
						menuID[count] = i
					end
				end
			elseif vl ==1 then	
				if (ArrayDinos[i][2]>100000 and ArrayDinos[i][1] ~= "PLAYER") then  -- tamed
					count = count + 1
					if tonumber(ArrayDinos[i][6])~=0 and ArrayDinos[i][5]~=0 then
						menuL[count] = count..":"..ArrayDinos[i][1].." - LV: "..(tonumber(ArrayDinos[i][3])+ tonumber(ArrayDinos[i][4])).." | Tamed\n   HP: "..round(ArrayDinos[i][5]).."/"..round(ArrayDinos[i][6])
						menuID[count] = i
					else
						if (tonumber(ArrayDinos[i][6])==0 and ArrayDinos[i][5]==0) then
							menuL[count] = count..":"..ArrayDinos[i][1].." - LV: "..(tonumber(ArrayDinos[i][3])+ tonumber(ArrayDinos[i][4])).." | Tamed\n   HP: Unknown - too far or not yet spawn"
						end
						if (tonumber(ArrayDinos[i][6])~=0 and ArrayDinos[i][5]==0) then
							menuL[count] = count..":"..ArrayDinos[i][1].." - LV: "..(tonumber(ArrayDinos[i][3])+ tonumber(ArrayDinos[i][4])).." | Tamed | Dead\n   HP: "..round(ArrayDinos[i][5]).."/"..round(ArrayDinos[i][6])
						end
						menuID[count] = i
					end
				end
					if tonumber(ArrayDinos[i][6])~=0 and ArrayDinos[i][5]~=0 then
						menuL[count] = count..":"..ArrayDinos[i][1].." - LV: "..(tonumber(ArrayDinos[i][3])+ tonumber(ArrayDinos[i][4])).." | Wild\n   HP: "..round(ArrayDinos[i][5]).."/"..round(ArrayDinos[i][6])
						menuID[count] = i
					else
						if (tonumber(ArrayDinos[i][6])==0 and ArrayDinos[i][5]==0) then
							menuL[count] = count..":"..ArrayDinos[i][1].." - LV: "..(tonumber(ArrayDinos[i][3])+ tonumber(ArrayDinos[i][4])).." | Wild\n   HP: Unknown - too far or not yet spawn"
						end
						if (tonumber(ArrayDinos[i][6])~=0 and ArrayDinos[i][5]==0) then
							menuL[count] = count..":"..ArrayDinos[i][1].." - LV: "..(tonumber(ArrayDinos[i][3])+ tonumber(ArrayDinos[i][4])).." | Wild | Dead\n   HP: "..round(ArrayDinos[i][5]).."/"..round(ArrayDinos[i][6])
						end
						menuID[count] = i
					end
			end
		end
		multi = gg.choice(menuL,nil,"Total: "..#menuL..". Let's select a creature to continue")

		if multi == nil then 
			noselect()
			DinosOption()
		else
			for i=1, #menuL do
				if multi == i then 
					local x={{address = ArrayDinos[menuID[i]][8], flags = gg.TYPE_FLOAT}}
					if (math.abs(gg.getValues({{address = x[1].address -0x8 , flags = gg.TYPE_FLOAT}})[1].value - 1) <0.1 and gg.getValues({{address = x[1].address -0xC , flags = gg.TYPE_FLOAT}})[1].value >= 2200) then
						FindDino(menuID[i]) 
					else
						gg.alert("The creature did not exist, was too far away from the player, or was dead. Selection Refine creatures to update new creatures nearby")
						DinosOption()
					end
				end
			end
		end
	else
		gg.alert("Not found anything. Let's try again later")
	end
end

--name,ownid,Baselevel,Uplevel,CurrentHP,MaxHP,MaxHPAddress,ForceMaxHP,ForceMaxHPAddress,X,Y,Z

ArrayDinos = nil
ArrayDinos = {}
ArrayPlayer = nil
ArrayPlayer = {}

ArrayStructures = nil
ArrayStructures = {}

function GetArray(vln)
if (vln>0) then
gg.toast("Finding creatures. Please wait")
else
--gg.toast("Finding info world. Please wait")
gg.clearList()
gg.clearResults()
end
local ADinos = nil
local ADinos = {}
local AStructure = nil
local AStructure = {}
--string.char(97) == "a"
--string.byte("a") == 97

	local del = {}
	local te = gg.getListItems()
	for i, v in ipairs(te) do
	  if (v.name == "BASE_ID") then
		table.insert(del, te[i].address)
	  end
	end
		gg.removeListItems(del)

local t = {}
local tt = {}
local ttt = {}
local value ={}

t = {"libUE4.so", "Cd"}
if is64 then
	if gversion==2028 then
		tt = {0x417C38, 0x100, 0x20, 0xA0, 0x0} -- 2.0.28
	else 
		tt = {0x418CD8, 0x100, 0x20, 0xA0, 0x0} -- 2.0.29
	end
else
	if gversion==2028 then
	tt = {0x20B2E8, 0x3C, 0x7C, 0x0}
	else
	tt = {0x20B568, 0x3C, 0x70, 0x0}
	end
end

ttt = S_Pointer(t, tt, true)

if tonumber(ttt)==nil then
return
end
local baseID = nil
	baseID = {}
	baseID = {{address = ttt, flags = gg.TYPE_QWORD, name = "BASE_ID"}}
	--baseID = {{address = 0xB2AA6480, flags = gg.TYPE_QWORD, name = "BASE_ID"}}
	if baseID[1]~=nil and gg.getValues(baseID)[1].value ~=0 then
		gg.addListItems(baseID)
	end
	local countArray =0
	local crVal=0
	local value =nil
	local value ={}
	local before = os.clock()
	local check0 = 0;
	if (is64) then	
		for j=1, 100000 do
			value ={}
			value = {{address = baseID[1].address + 0x8*j, flags = gg.TYPE_QWORD}}
			value[14] = {}
			value[14].address = value[1].address + 0x4
			value[14].flags = gg.TYPE_DWORD
			value = gg.getValues(value)
			
			if (value[14].value==0) then
				if (check0<15) then
					check0 = check0+1
				else
					local after = os.clock()
					gg.toast("Found "..#ADinos.." creatures and player in "..j.." objects on map "..string.format("in %0.6f seconds", round(after - before)))
					ArrayDinos = ADinos
					ArrayStructures = AStructure
					if (vln>0) then
						DinosOption()
					end				
					break
				end
			else
				if (check0<15) then
					check0 = 0
				end
				if (math.abs(crVal-value[14].value)<1.1) then
					if (j==1) then
					crVal = value[14].value
					else
						local after = os.clock()
						gg.toast("Found "..#ADinos.." creatures and player in "..j.." objects on map "..string.format("in %0.6f seconds", round(after - before)))
						ArrayDinos = ADinos
						ArrayStructures = AStructure
						if (vln>0) then
							DinosOption()
						end				
						break
					end
				end
			end
			
			if (value[1].value~=0 and value[14].value~=0) then
				value[15] = {}
				value[15].address = value[1].value + 0x690  -- maxDuration
				value[15].flags = gg.TYPE_FLOAT
				value[16] = {}
				value[16].address = value[1].value + 0x29d -- ownid
				value[16].flags = gg.TYPE_DWORD
				value[1].address = value[1].value + 0xc3c  -- forcemax - 0xc48 > base
				value[1].flags = gg.TYPE_FLOAT
				value[10] = {}
				value[10].address = value[1].address + 0x4
				value[10].flags = gg.TYPE_FLOAT
				value = gg.getValues(value)
				
				if value[15].value > 90 and value[16].value > 100000 then  -- structures
					value[17] = {}
					value[17].address = value[15].address + 0x1e8  -- z pointer 1
					value[17].flags = gg.TYPE_QWORD	
					value = gg.getValues(value)
					value[17].address = value[17].value + 0x290 -- x real
					value[17].flags = gg.TYPE_FLOAT
					value[18] = {}
					value[18].address = value[17].address + 0x4  -- y
					value[18].flags = gg.TYPE_FLOAT	
					value[19] = {}
					value[19].address = value[17].address + 0x8 -- z
					value[19].flags = gg.TYPE_FLOAT	
					value[21] = {}
					value[21].address = value[15].address + 0x1a8 -- limitHeight
					value[21].flags = gg.TYPE_FLOAT	
					value[22] = {}
					value[22].address = value[15].address + 0x558 -- limitWeightElevator
					value[22].flags = gg.TYPE_FLOAT						
					value[23] = {}
					value[23].address = value[15].address + 0x558-- limitStorage pointer
					value[23].flags = gg.TYPE_QWORD		
					value = gg.getValues(value)	
					if value[23].value~=0 then
						value[23].address = value[23].value + 0x2ac-- limitStorage	
						value[23].flags = gg.TYPE_DWORD	
					end					
					value[20] = {}
					value[20].address = value[15].address + 0x68 -- currentHP pointer					
					value[20].flags = gg.TYPE_QWORD
					value = gg.getValues(value)
					value[20].address = value[20].value -- currentHP
					value[20].flags = gg.TYPE_FLOAT
					value = gg.getValues(value)
					if (value[15].value>90) then
						---ownID,CurHP, maxHP, curHP address, maxhp address, x ad, y ad, z ad, limitheight, limit weight, limit storage, limit storage Address, x vl, y vl, z vl
						AStructure[#AStructure+1] = {value[16].value, value[20].value, value[15].value, value[20].address, value[15].address, value[17].address, value[18].address, value[19].address, value[21].value, value[22].value, value[23].value, value[23].address, value[17].value, value[18].value, value[19].value}
						--if (value[23].value>0 and value[23].value< 2000) then
							--gg.addListItems({{address = value[15].address, name = value[20].value.."", flags = gg.TYPE_FLOAT}})
						--end
						if (#AStructure%100==0) then
							local title = "Found: structure "..#AStructure.." HP: "..round(AStructure[#AStructure][2]).."/"..round(AStructure[#AStructure][3])
							gg.toast(title, true)
						end
					end
				end
				if value[1].value>=2200 and math.abs(value[10].value-1) < 0.01 then  -- creatures
					value[2] = {}
					value[2].address = value[1].address + 0x8  -- currenthp
					value[2].flags = gg.TYPE_FLOAT	
					value[3] = {}
					value[3].address = value[1].address + 0xc  -- forcemaxhp
					value[3].flags = gg.TYPE_FLOAT
					value[4] = {}
					value[4].address = value[3].address -0x9ac -- ownid
					value[4].flags = gg.TYPE_DWORD
					value[5] = {}
					value[5].address = value[3].address - 0x600 -- z pointer
					value[5].flags = gg.TYPE_QWORD
					value = gg.getValues(value)
					value[5].address = value[5].value + 0x298 -- z
					value[5].flags = gg.TYPE_FLOAT
					value[6] = {}
					value[6].address = value[5].address - 0x4 -- y
					value[6].flags = gg.TYPE_FLOAT
					value[7] = {}
					value[7].address = value[5].address - 0x8 -- x
					value[7].flags = gg.TYPE_FLOAT
					value[8] = {}
					value[8].address = value[3].address + 0x348 -- string name Pointer
					value[8].flags = gg.TYPE_QWORD
					value = gg.getValues(value)
					value[8].address = value[8].value + 0x8 -- string name Pointer
					value[8].flags = gg.TYPE_QWORD
					value = gg.getValues(value)
					value[8].address = value[8].value -- string name Pointer
					value[8].flags = gg.TYPE_QWORD
					value = gg.getValues(value)
					value[8].address = value[8].value -- string name
					value[8].flags = gg.TYPE_DWORD
					value[9] = {}
					value[9].address = value[3].address + 0x8f0 -- string name tamed pointer
					value[9].flags = gg.TYPE_QWORD
					value = gg.getValues(value)
					value[9].address = value[9].value -- string name tamed
					value[9].flags = gg.TYPE_DWORD
					value = gg.getValues(value)
					value[11] = {}
					value[11].address = value[3].address + 0x420 -- MaxHP pointer
					value[11].flags = gg.TYPE_QWORD
					value = gg.getValues(value)
					value[11].address = value[11].value + 0x1E8 --MaxHP
					value[11].flags = gg.TYPE_FLOAT
					value[12] = {}
					value[12].address = value[11].address + 0x63C -- BaseLevel
					value[12].flags = gg.TYPE_DWORD
					value[13] = {}
					value[13].address = value[12].address + 0x4 -- UpLevel
					value[13].flags = gg.TYPE_DWORD
					value = gg.getValues(value)
					local na = ""
					local bna = ""
					local nameDino = ""
					--local count=0
					--local nameID =0
					local vl
					if (math.abs(value[9].value) < 0.1) then --wild	
						for k=0, 200 do
							vl=nil
							vl = {}
							vl = {{address = value[8].address + 0x4*k, flags = gg.TYPE_DWORD}}
							vl = gg.getValues(vl)
							if (vl[1].value>0 and vl[1].value<=255) then
								bna = bna..string.char(vl[1].value)
							else
								nameDino = bna
								break
							end
						end	

					
						--for k=18, 80 do
							--vl = {{address = value[8].address + 0x4*k, flags = gg.TYPE_DWORD}}
							--vl = gg.getValues(vl)
							--if (vl[1].value~=0 and vl[1].value<=255) then
								--na = na..string.char(vl[1].value)
							--else
								--gg.alert(na)
								--break
							--end
						--end
						--count=0
						--nameID =0
						--for s in string.gmatch(na, "[^/]+") do
							--if (s~=nil or s~="") then
								--count=count+1
								--if s =="Dinos" then
									--nameID = count + 1
								--end
								
								--if (count == nameID) then
									--nameDino = s
								--end
							--end
						--end
					else  -- tamed
						for k=0, 200 do
							vl=nil
							vl = {}
							vl = {{address = value[9].address + 0x4*k, flags = gg.TYPE_DWORD}}
							vl = gg.getValues(vl)
							if (vl[1].value>0 and vl[1].value<=255) then
								na = na..string.char(vl[1].value)
							else
								--nameDino = na
								break
							end
						end
						gg.sleep(1)			
						for q=0, 200 do
							vl=nil
							vl = {}
							vl = {{address = value[8].address + 0x4*q, flags = gg.TYPE_DWORD}}
							vl = gg.getValues(vl)
							if (vl[1].value>0 and vl[1].value<=255) then
								bna = bna..string.char(vl[1].value)
							else
								nameDino = na..", "..bna
								break
							end
						end		
					end
					if (nameDino~="") then
						countArray = countArray +1
						--name,ownid,Baselevel,Uplevel,CurrentHP,MaxHP,MaxHPAddress,ForceMaxHPAddress,X,Y,Z
						ADinos[countArray] = {nameDino, value[4].value, value[12].value, value[13].value, value[2].value, value[3].value, value[11].address, value[3].address, value[7].address, value[6].address, value[5].address}
						if (#AStructure%5==0) then			
							local title = "Found: "..ADinos[countArray][1].." | Lv: "..(tonumber(ADinos[countArray][3])+ tonumber(ADinos[countArray][4])).." | HP: "..round(ADinos[countArray][5]).."/"..round(ADinos[countArray][6])
							gg.toast(title, true)
						end	
					else
						if (value[4].value>=1000000 and value[2].value>0) then
							ArrayPlayer = {"PLAYER", value[4].value, value[12].value, value[13].value, value[2].value, value[3].value, value[11].address, value[3].address, value[7].address, value[6].address, value[5].address}
							backupPlayerID = value[4].value
							gg.addListItems({{address = value[4].address, flags = gg.TYPE_DWORD, name = "Player_ID"}})
							playerChecked = true
							--gg.alert(ArrayPlayer[6].."|"..ArrayPlayer[7].."|"..ArrayPlayer[8])
						end
					end
				end
			end
		end	
	else
		for j=1, 100000 do
			value = {{address = baseID[1].address + 0x4*j, flags = gg.TYPE_DWORD}}
			value = gg.getValues(value)
			
			if (math.abs(value[1].value)<10000) then
				if (check0<15) then
					check0 = check0+1
				else
					local after = os.clock()
					gg.toast("Found "..#ADinos.." creatures and player in "..j.." objects on map "..string.format("in %0.6f seconds", round(after - before)))
					ArrayDinos = ADinos
					ArrayStructures = AStructure
					if (vln>0) then
						DinosOption()
					end				
					break
				end
			else
				if (check0<15) then
					check0 = 0
				end
			end

			if (value[1].value~=0) then
				value[15] = {}
				value[15].address = value[1].value + 0x530
				value[15].flags = gg.TYPE_FLOAT
				value[16] = {}
				value[16].address = value[1].value + 0x214
				value[16].flags = gg.TYPE_DWORD
				value[1].address = value[1].value + 0x990 -- forcemax - 0x99c > base
				value[1].flags = gg.TYPE_FLOAT
				value[10] = {}
				value[10].address = value[1].address + 0x4
				value[10].flags = gg.TYPE_FLOAT
				value = gg.getValues(value)
				
				if value[15].value > 90 and value[16].value > 100000 then
					value[17] = {}
					value[17].address = value[15].address + 0x190  -- z pointer 1
					value[17].flags = gg.TYPE_QWORD	
					value = gg.getValues(value)
					value[17].address = value[17].value + 0x230 -- x real
					value[17].flags = gg.TYPE_FLOAT
					value[18] = {}
					value[18].address = value[17].address + 0x4  -- y
					value[18].flags = gg.TYPE_FLOAT	
					value[19] = {}
					value[19].address = value[17].address + 0x8 -- z
					value[19].flags = gg.TYPE_FLOAT	
					value[21] = {}
					value[21].address = value[15].address + 0x160 -- limitHeight
					value[21].flags = gg.TYPE_FLOAT	
					value[22] = {}
					value[22].address = value[15].address + 0x450 -- limitWeightElevator
					value[22].flags = gg.TYPE_FLOAT	
					value[23] = {}
					value[23].address = value[15].address + 0x450-- limitStorage pointer
					value[23].flags = gg.TYPE_QWORD		
					value = gg.getValues(value)	
					value[23].address = value[23].value + 0x224-- limitStorage	
					value[23].flags = gg.TYPE_DWORD		
					value[20] = {}
					value[20].address = value[15].address + 0x50 -- currentHP pointer					
					value[20].flags = gg.TYPE_QWORD
					value = gg.getValues(value)
					value[20].address = value[20].value -- currentHP
					value[20].flags = gg.TYPE_FLOAT
					value = gg.getValues(value)
					if (value[15].value>90) then
						---ownID,CurHP, maxHP, curHP address, maxhp address, x ad, y ad, z ad, limitheight, limit weight, limit storage, limit storage Address, x vl, y vl, z vl
						AStructure[#AStructure+1] = {value[16].value, value[20].value, value[15].value, value[20].address, value[15].address, value[17].address, value[18].address, value[19].address, value[21].value, value[22].value, value[23].value, value[23].address, value[17].value, value[18].value, value[19].value}						--if #AStructure == 1 then
						--gg.addListItems({{address = value[15].address, flags = gg.TYPE_FLOAT}})

						if (#AStructure%100==0) then
							local title = "Found: structure "..#AStructure.." HP: "..round(AStructure[#AStructure][2]).."/"..round(AStructure[#AStructure][3])
							gg.toast(title, true)
						end
					end
				end
				
				if value[1].value>=2200 and math.abs(value[10].value-1) < 0.01 then
					value[2] = {}
					value[2].address = value[1].address + 0x8  -- currenthp
					value[2].flags = gg.TYPE_FLOAT	
					value[3] = {}
					value[3].address = value[1].address + 0xc  -- forcemaxhp
					value[3].flags = gg.TYPE_FLOAT
					value[4] = {}
					value[4].address = value[3].address -0x788 -- ownid
					value[4].flags = gg.TYPE_DWORD
					value[5] = {}
					value[5].address = value[3].address - 0x4a4 -- z pointer
					value[5].flags = gg.TYPE_DWORD
					value = gg.getValues(value)
					value[5].address = value[5].value + 0x238 -- z
					value[5].flags = gg.TYPE_FLOAT
					value[6] = {}
					value[6].address = value[5].address - 0x4 -- y
					value[6].flags = gg.TYPE_FLOAT
					value[7] = {}
					value[7].address = value[5].address - 0x8 -- x
					value[7].flags = gg.TYPE_FLOAT
					value[8] = {}
					value[8].address = value[3].address + 0x304 -- string name Pointer
					value[8].flags = gg.TYPE_DWORD
					value = gg.getValues(value)
					value[8].address = value[8].value + 0x4 -- string name Pointer
					value[8].flags = gg.TYPE_DWORD
					value = gg.getValues(value)
					value[8].address = value[8].value -- string name Pointer
					value[8].flags = gg.TYPE_DWORD
					value = gg.getValues(value)
					value[8].address = value[8].value -- string name
					value[8].flags = gg.TYPE_DWORD
					value[9] = {}
					value[9].address = value[3].address + 0x7CC -- string name tamed pointer
					value[9].flags = gg.TYPE_DWORD
					value = gg.getValues(value)
					value[9].address = value[9].value -- string name tamed
					value[9].flags = gg.TYPE_DWORD
					value = gg.getValues(value)
					value[11] = {}
					value[11].address = value[3].address + 0x3BC -- MaxHP pointer
					value[11].flags = gg.TYPE_DWORD
					value = gg.getValues(value)
					value[11].address = value[11].value + 0x198 --MaxHP
					value[11].flags = gg.TYPE_FLOAT
					value[12] = {}
					value[12].address = value[11].address + 0x548 -- BaseLevel
					value[12].flags = gg.TYPE_DWORD
					value[13] = {}
					value[13].address = value[12].address + 0x4 -- UpLevel
					value[13].flags = gg.TYPE_DWORD
					value = gg.getValues(value)
					if (value[12].value~=0) then
						local na = ""
						local bna = ""
						local nameDino = ""
						--local count=0
						--local nameID =0
						local vl
						if (math.abs(value[9].value) < 0.1) then --wild	
							for k=0, 200 do
								vl=nil
								vl = {}
								vl = {{address = value[8].address + 0x4*k, flags = gg.TYPE_DWORD}}
								vl = gg.getValues(vl)
								if (vl[1].value>0 and vl[1].value<=255) then
									bna = bna..string.char(vl[1].value)
								else
									nameDino = bna
									break
								end
							end	

						
							--for k=18, 80 do
								--vl = {{address = value[8].address + 0x4*k, flags = gg.TYPE_DWORD}}
								--vl = gg.getValues(vl)
								--if (vl[1].value~=0 and vl[1].value<=255) then
									--na = na..string.char(vl[1].value)
								--else
									--gg.alert(na)
									--break
								--end
							--end
							--count=0
							--nameID =0
							--for s in string.gmatch(na, "[^/]+") do
								--if (s~=nil or s~="") then
									--count=count+1
									--if s =="Dinos" then
										--nameID = count + 1
									--end
									
									--if (count == nameID) then
										--nameDino = s
									--end
								--end
							--end
						else  -- tamed
							for k=0, 200 do
								vl=nil
								vl = {}
								vl = {{address = value[9].address + 0x4*k, flags = gg.TYPE_DWORD}}
								vl = gg.getValues(vl)
								if (vl[1].value>0 and vl[1].value<=255) then
									na = na..string.char(vl[1].value)
								else
									--nameDino = na
									break
								end
							end
							gg.sleep(1)			
							for q=0, 200 do
								vl=nil
								vl = {}
								vl = {{address = value[8].address + 0x4*q, flags = gg.TYPE_DWORD}}
								vl = gg.getValues(vl)
								if (vl[1].value>0 and vl[1].value<=255) then
									bna = bna..string.char(vl[1].value)
								else
									nameDino = na..", "..bna
									break
								end
							end		
						end
						if (nameDino~="") then
							countArray = countArray +1
							--name,ownid,Baselevel,Uplevel,CurrentHP,MaxHP,MaxHPAddress,ForceMaxHPAddress,X,Y,Z
							ADinos[countArray] = {nameDino, value[4].value, value[12].value, value[13].value, value[2].value, value[3].value, value[11].address, value[3].address, value[7].address, value[6].address, value[5].address}	
							if (#AStructure%5==0) then
								local title = "Found: "..ADinos[countArray][1].." | Lv: "..(tonumber(ADinos[countArray][3])+ tonumber(ADinos[countArray][4])).." | HP: "..round(ADinos[countArray][5]).."/"..round(ADinos[countArray][6])
								gg.toast(title, true)
							end
						else
							if (value[4].value>=1000000 and value[2].value>0) then
								ArrayPlayer = {"PLAYER", value[4].value, value[12].value, value[13].value, value[2].value, value[3].value, value[11].address, value[3].address, value[7].address, value[6].address, value[5].address}
								backupPlayerID = value[4].value
								gg.addListItems({{address = value[4].address, flags = gg.TYPE_DWORD, name = "Player_ID"}})
								playerChecked = true
								--gg.alert(ArrayPlayer[6].."|"..ArrayPlayer[7].."|"..ArrayPlayer[8])
							end
						end
					end	
				end
			end
			
		end
	end
	--if (vln>0) then
		--GetInfoArrayMenuDino(vl)
	--end
	if (#ArrayPlayer>0) then
		local del = {}
		local te = gg.getListItems()
		for i, v in ipairs(te) do
		  if (v.name == "PlayerX" or v.name == "PlayerY" or v.name == "PlayerZ") then
			table.insert(del, te[i].address)
		  end
		end
			gg.removeListItems(del)
		
		
		local PL = nil
		PL = {}
		PL[1] = {}
		PL[1].address = ArrayPlayer[9]
		PL[1].flags = gg.TYPE_FLOAT
		PL[1].name = "PlayerX"
		PL[2] = {}
		PL[2].address = ArrayPlayer[10]
		PL[2].flags = gg.TYPE_FLOAT
		PL[2].name = "PlayerY"
		PL[3] = {}
		PL[3].address = ArrayPlayer[11]
		PL[3].flags = gg.TYPE_FLOAT
		PL[3].name = "PlayerZ"
		--PL = gg.getValues(PL)
		--gg.alert(PL[1].value)
		--gg.addListItems(PL)	
	end
	
	if vln == 1 then
		gg.toast("Updated list creatures. Select menu to continue")
	end
end

function round(number)
  if (number - (number % 0.1)) - (number - (number % 1)) < 0.5 then
    number = number - (number % 1)
  else
    number = (number - (number % 1)) + 1
  end
 return number
end

function FreeShopAndItems()
menu = gg.choice({
"💰 MAX AMBER \nYou need >0 amber to this change work",
"🔱 FREE ITEMS FROM SHOP \n Change item to other item and get them from shop amber",
"🎁 "..chStatus[1] .. "FREE GIFTS",
"💲 FREE AMBER, ITEMS, RESOURCES \n Active at inventory and store",
"🔙 BACK"},nil,"~~~~~~~~~~Made By GodOfGods~~~~~~~~~~")

if menu == 1 then MaxAmber() end

if menu == 2 then 
FreeItems() end

if menu == 3 then 
Status(1)
FreeGifts() end

if menu == 4 then 
FreeAmberShop() end


if menu == 5 then StartCheat() end


if menu == nil then 
noselect()
end


   gg.isVisible(true)
   while true do
  if gg.isVisible() then
    gg.setVisible(false)
    FreeShopAndItems()
  else
    gg.sleep(100) 
    end
    end
end

function StartCheat()
	local testAd = testData()

	if testAd==false then
	gg.toast("Data is null. Need update data. Please wait")
	GetArray(0)
	end

menu = gg.choice({
"💱 FREE SHOP AND FREE ITEMS",
"🏡 STRUCTURE OPTION",
"🏹 UPGRADE EQUIPMENT",
"👸 PLAYER OPTIONS",
"🦄 CREATURES OPTIONS",
"💦 UNLIMIT RESOURCES",
"🔐 GOD CONSOLE MENU",
"🔨 FREE CRAFTING\nAllows crafting no need materials",
"🧬 EGG OPTIONS",
"🔄 EXIT"},nil,"~~~~~~~~~~Made By GodOfGods~~~~~~~~~~")

if menu == 1 then FreeShopAndItems() end

if menu == 2 then 
StructureOption() end

if menu == 3 then 
UpgradeEquipment() end

if menu == 4 then
PlayerOption() 
end

if menu == 5 then 
DinosOption() end--

if menu == 6 then 
UnlimitResource() end

if menu == 7 then 
GodConsole() end

if menu == 8 then 
FreeCrafting() end

if menu == 9 then 
EggOptions() end

if menu == 10 then Exit() end


if menu == nil then 
noselect()
end


   gg.isVisible(true)
   while true do
  if gg.isVisible() then
    gg.setVisible(false)
    StartCheat()
  else
    gg.sleep(100) 
    end
    end
end

function FreeAmberShop()
gg.clearResults()
if is64 == true then
	LibStart=gg.getRangesList('libUE4.so')[1].start
	APEXGG=nil
	APEXGG={}
	APEXGG[1]={}
	APEXGG[2]={}
	if gversion==2028 then
	APEXGG[1].address=LibStart+0x2A57FEC
	else
	APEXGG[1].address=LibStart+0x2A51B14
	end
	APEXGG[1].value='h0000B012'
	APEXGG[1].flags=4
	if gversion==2028 then
	APEXGG[2].address=LibStart+(0x2A57FEC+0x4)
	else
	APEXGG[2].address=LibStart+(0x2A51B14+0x4)
	end
	APEXGG[2].value='hC0035FD6'
	APEXGG[2].flags=4
	gg.setValues(APEXGG)
else
	LibStart=gg.getRangesList('libUE4.so')[1].start
	APEXGG=nil
	APEXGG={}
	APEXGG[1]={}
	APEXGG[2]={}
	if gversion==2028 then
	APEXGG[1].address=LibStart+0x21B0E9C
	else
	APEXGG[1].address=LibStart+0x21AFFDC
	end
	APEXGG[1].value='h0201E0E3'
	APEXGG[1].flags=4
	if gversion == 2028 then
	APEXGG[2].address=LibStart+(0x21B0E9C+0x4)
	else
	APEXGG[2].address=LibStart+(0x21AFFDC+0x4)
	end
	APEXGG[2].value='h1EFF2FE1'
	APEXGG[2].flags=4
	gg.setValues(APEXGG)
--gg.alert("This change is not for 32 bit processor")
end
gg.toast("Actived!")
end

--ArrayDinos[vl][1].."|LV: "..(tonumber(ArrayDinos[vl][3])+ tonumber(ArrayDinos[vl][4])).."|HP: "..round(ArrayDinos[vl][5]).."/"..round(ArrayDinos[vl][6])
function DinosOption()
	if testData()==false then
		gg.toast("Data is null. Need update data. Please wait")
		GetArray(0)
	end
	
if (#ArrayDinos<=0) then
gg.toast("Finding creatures. Please wait")
GetArray(0)
end
menu = gg.choice({
"🦕 REFIND CREATURES",
"🦕 CREATURES TAMED",
"🦕 CREATURES WILD",
"🦕 MANUAL FIND A CREATURE",
"🦕 FREE CREATURES\nReplace creature ID from Implant in inventor and revival to get new creature",
"🔙 Back"},nil,"REFIND CREATURES IF YOU NEED UPDATE CREATURES")

if menu == 1 then 
GetArray(1)
end

if menu == 2 then
--GetArray(2)
GetInfoArrayMenuDino(2)
end

if menu == 3 then 
--GetArray(3)
GetInfoArrayMenuDino(3) 
end

if menu == 4 then 
FindDino(-1) end

if menu == 5 then 
FreeCreatures() end

if menu == 6 then 
StartCheat() end

if menu == nil then 
noselect()
end


   gg.isVisible(true)
   while true do
  if gg.isVisible() then
    gg.setVisible(false)
    DinosOption()
  else
    gg.sleep(100) 
    end
    end
end

function StructureOption()
	if testData()==false then
	gg.toast("Data is null. Need update data. Please wait")
	GetArray(0)
	end
	
if dupe then
chStatus[2] = isOn
else
chStatus[2] = isOff
end
menu = gg.choice({
"🏭 "..chStatus[2] .. "STRUCTURE DUPE AND SWAP\nPlace a structure before use this option",
"🏪 TELEPORT BUILDING\nChange location building and can floating them",
"🔋 UNLIMIT ELECTRICT\nAllows electrical actived without generator",
"🎢 UNLIMITED HEIGHT (FAKE)\nAllows place unlimited structure limited by height\nCan not Save after restart game",
"🧱 UNLIMITED STRUCTURES NEARBY (FAKE)\nAllows place unlimited structure limited by nearby\nCan not Save after restart game",
"💪 UNLIMITED WEIGHT ELEVATOR PLATFORM (FAKE)\nAllows active elevator platform to unlimited weight\nCan not Save after restart game",
"🚢 UNLIMITED STRUCTURE ON RAFT (FAKE)\nAllows unlimited structure on raft\nCan not Save after restart game",
"🏇 UNLIMITED TOTAL BUILDING ON CREATURE PLATFORM SADDLE (FAKE)",
"💎 UNLIMITED STRUCTURE DURATION",
"🧰 UNLIMITED SLOTS STORAGE (FAKE)\nCan not Save after restart game",
"🔙 Back"},nil,"~~~~~~~~~~Made By GodOfGods~~~~~~~~~~")

if menu == 1 then 
Status(2)
structuredupe() end

if menu == 2 then
movingBuild() 
end

if menu == 3 then 
UnlimitElectric() end

if menu == 4 then 
UnlimitHeight() end

if menu == 5 then 
UnlimitNearby() end

if menu == 6 then 
UnlimitedWeightElevator() end

if menu == 7 then 
UnlimitedRaft() end

if menu == 8 then 
UnlimitedPlatform() end

if menu == 9 then 
UnlimitedDuration() end

if menu == 10 then 
UnlimitedSlotsStorage() end

if menu == 11 then StartCheat() end


if menu == nil then 
noselect()
end


   gg.isVisible(true)
   while true do
  if gg.isVisible() then
    gg.setVisible(false)
    StructureOption()
  else
    gg.sleep(100) 
    end
    end
end

function UnlimitNearby()
local testAd = false
local tt = {}
local t = {"libUE4.so", "Cd"}
if is64 then
	if gversion == 2028 then
	tt = {0x4618E8,0x0,0x160,0x700}
	else
	tt = {0x462988,0x0,0x160,0x700}
	end
else
	if gversion==2028 then 
	tt = {0x20B2E8,0xD4,0x5A8}
	else
	tt = {0x20B568,0xD4,0x5A8}
	end
end
local ttt = S_Pointer(t, tt, true)
 local k ={}
if tonumber(ttt)~=nil then
	k[1] = {}
	k[1].address = tonumber(ttt) - 0x4
	k[1].flags = gg.TYPE_DWORD
	k[2] = {}
	k[2].address = tonumber(ttt) + 0x4
	k[2].flags = gg.TYPE_DWORD
	k[3] = {}
	k[3].address = tonumber(ttt) + 0xC
	k[3].flags = gg.TYPE_DWORD
	k = gg.getValues(k)
	if (math.abs(k[1].value - 3550)<1 and math.abs(k[2].value - 10000)<1 and math.abs(k[3].value - 30000)<1) then
		testAd = true
		local a = ttt
		ttt={}
		ttt[1] = a
	end
end

if testAd == false then
	local te = gg.getListItems()
	ttt ={}
	a = nil
	a = {}	
	for i, v in ipairs(te) do
	  if v.name == "Limit_Nearby" then
		a[i] = {}
		a[i][1] = {}
		a[i][1].address = x[i].address -0x4
		a[i][1].flags = gg.TYPE_DWORD
		a[i][2] = {}
		a[i][2].address = x[i].address +0x4
		a[i][2].flags = gg.TYPE_DWORD
		a[i][3] = {}
		a[i][3].address = x[i].address + 0xc
		a[i][3].flags = gg.TYPE_DWORD
		a[i] = gg.getValues(a[i])
		if (math.abs(a[i][1].value - 3550)<1 and math.abs(a[i][2].value - 10000)<1 and math.abs(a[i][3].value - 30000)<1) then
			testAd = true
			ttt[#ttt+1]= te[i].address
		end
	  end
	end
end

if testAd == false then
	local del = {}
	local te = gg.getListItems()
	for i, v in ipairs(te) do
	  if (v.name == "Limit_Nearby") then
		table.insert(del, te[i].address)
	  end
	end
		gg.removeListItems(del)
		
	gg.clearResults()
	gg.setRanges(range)
	gg.setVisible(false)
	gg.searchNumber("3550;200~20000;10000;30000::17", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
	gg.refineNumber("200~20000", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
	m = gg.getResultsCount()
	if m==0 then
	gg.alert("Not found result. ")
	StructureOption()
	else
		x = gg.getResults(m)
		a = nil
		a = {}	
		b = nil
		b = {}
		ttt = {}		
		for i = 1, m do
			a[i] = {}
			a[i][1] = {}
			a[i][1].address = x[i].address -0x4
			a[i][1].flags = gg.TYPE_DWORD
			a[i][2] = {}
			a[i][2].address = x[i].address +0x4
			a[i][2].flags = gg.TYPE_DWORD
			a[i][3] = {}
			a[i][3].address = x[i].address + 0xc
			a[i][3].flags = gg.TYPE_DWORD
			a[i] = gg.getValues(a[i])
			if (math.abs(a[i][1].value - 3550)<1 and math.abs(a[i][2].value - 10000)<1 and math.abs(a[i][3].value - 30000)<1) then
				b[i] = {}
				b[i][1] = {}
				b[i][1].address = x[i].address
				b[i][1].flags = gg.TYPE_DWORD
				b[i][1].name = "Limit_Nearby"
				gg.addListItems(b[i])
				ttt[#ttt+1] = b[i][1].address
				testAd = true
			end
		end
	end
end

if testAd then
	a = nil
	a = {}
	for i = 1, #ttt do
		a[i] = {}
		a[i][1] = {}
		a[i][1].address = tonumber(ttt[i])
		a[i][1].flags = gg.TYPE_DWORD
		a[i][1].value = 200
		gg.setValues(a[i])
	end
	gg.toast("Actived!!!")
else
gg.alert("Not found. Let's try again")
end
	
end

function UnlimitedSlotsStorage()
local menu = gg.alert("Do you want to refind and update structures on map? It is useful if you want to change for new structures that you added. Skip and slelect NO if you don't need refind that will delay for search", "YES", "NO")
	if menu == 0 then --no select
		StructureOption()		
	elseif menu == 1 then -- YES
		gg.toast("Finding information. Please wait")
		GetArray(0)	
	elseif menu == 2 then  -- NO
		--StructureOption()
	end	
	if #ArrayStructures >0 then
		local k = nil
			  k = {}
			  local storage = 2000000000
		for i=1, #ArrayStructures do
			if ArrayStructures[i][11] == 350 or ArrayStructures[i][11] == 45 or ArrayStructures[i][11] == 15 or ArrayStructures[i][11] == 60 or ArrayStructures[i][11] == 48 or ArrayStructures[i][11] == 100 or ArrayStructures[i][11] == 12 then 
				k[1] = {}
				k[1].address = ArrayStructures[i][12]
				k[1].flags = gg.TYPE_DWORD
				k[1].value = storage
				k[2] = {}
				if is64 then
				k[2].address = ArrayStructures[i][12] + 0x114
				else
				k[2].address = ArrayStructures[i][12] + 0xcc
				end
				k[2].flags = gg.TYPE_DWORD
				k[2].value = storage
				gg.setValues(k)
				if (i%50==0) then
				gg.toast("Changed tructure "..i, true)
				end
			end
		end
		gg.toast("Changed for all structures have limit storage")
	else
		local del = {}
		local te = gg.getListItems()
		for i, v in ipairs(te) do
		  if (v.name == "Structure_MaxSlots") then
			table.insert(del, te[i].address)
		  end
		end
			gg.removeListItems(del)

		n = gg.prompt({
		'CURRENT MAX STRUCTURE SLOTS STORAGE? (>0)\n350: Vault, 15: Storage Box, 45: Large Storage Box, 60: Storage Chest, 48: Refrigerator, 100: Tek Trough or BookShelf'
		},
			{0}, 
			{'number'})
		if n == nil then 
			gg.sleep(1)
			gg.toast("CANCELLED")
			StructureOption()
		else
			gg.clearResults()
			gg.setRanges(range)
			gg.setVisible(false)
			gg.searchNumber(n[1]..";0;1D;1f::21", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
			gg.refineNumber(n[1], gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
			m = gg.getResultsCount()
			if m==0 then
			gg.alert("Not found result. ")
			StructureOption()
			else
				x = gg.getResults(m)
				a = nil
				a = {}
				a1 = nil
				a1 = {}
				a2 = nil
				a2 = {}
				a3 = nil
				a3 = {}
				a4 = nil
				a4 = {}
				a5 = nil
				a5 = {}						
				for i = 1, m do
					a1[i] = {}
					a1[i][1] = {}
					a1[i][1].address = x[i].address + 0x4
					a1[i][1].flags = gg.TYPE_DWORD
					a1[i] = gg.getValues(a1[i])
					a2[i] = {}
					a2[i][1] = {}
					a2[i][1].address = x[i].address - 0x4
					a2[i][1].flags = gg.TYPE_DWORD
					a2[i] = gg.getValues(a2[i])
					a3[i] = {}
					a3[i][1] = {}
					a3[i][1].address = x[i].address + 0x10
					a3[i][1].flags = gg.TYPE_DWORD
					a3[i] = gg.getValues(a3[i])	
					a4[i] = {}
					a4[i][1] = {}
					a4[i][1].address = x[i].address + 0x14
					a4[i][1].flags = gg.TYPE_FLOAT
					a4[i] = gg.getValues(a4[i])							
					if tonumber(a1[i][1].value)< 0.01 and tonumber(a2[i][1].value)< 0.01 and math.abs(tonumber(a3[i][1].value)-1)< 0.01 and math.abs(tonumber(a4[i][1].value)-1)< 0.01 then 						
						a[i] = {}
						a[i][1] = {}
						a[i][1].address = x[i].address
						a[i][1].flags = gg.TYPE_DWORD
						a[i][1].name = 'Structure_MaxSlots'
						gg.addListItems(a[i])
						a5[i] = {}
						a5[i][1] = {}
						if is64==true then
						a5[i][1].address = x[i].address + 0x114
						else
						a5[i][1].address = x[i].address + 0xcc
						end
						a5[i][1].flags = gg.TYPE_DWORD
						a5[i][1].name = 'Structure_MaxSlots'
						gg.addListItems(a5[i])
					end
				end
				local ros = gg.getListItems()
				for i, v in ipairs(ros) do
					  if v.name == "Structure_MaxSlots" then
						v.flags = gg.TYPE_DWORD
						v.value = '2147483647'
					  end
					  
				end
				gg.setValues(ros)
				gg.addListItems(ros)
				gg.alert("Changed!")	
			end	
		end
	end
end

function UnlimitedDuration()
	local del = {}
	local te = gg.getListItems()
	for i, v in ipairs(te) do
	  if (v.name == "Structure_Duration") then
		table.insert(del, te[i].address)
	  end
	end
		gg.removeListItems(del)
		
	n = gg.prompt({
	'CURRENT MAX STRUCTURE DURATION? (>0)',
	'CHANGE FOR ALL STRUCTURES SAME MAX DURATION?',
	'REFIND AND UPDATE STRUCTURES?\nUse if you build new structures and need to update them for change'
	},
		{0,true, false}, 
		{'number', 'checkbox', 'checkbox'})
	if n == nil then 
		gg.sleep(1)
		gg.toast("CANCELLED")
		StructureOption()
	else
		local arStruct = {}
		local k = {}
		if n[3]==true then
			gg.toast("Finding World. Please wait")
			GetArray(0)
		end
		if #ArrayStructures >0 then
			for i=1, #ArrayStructures do
				if math.abs(ArrayStructures[i][3]-tonumber(n[1]))< 0.01 then
					arStruct[#arStruct+1] = ArrayStructures[i]
				end
			end
			
			if #arStruct>0 then
				if #arStruct >1 and n[2] == false then
					k = {}
					for i=1, #arStruct do
						k[i] = {}
						k[i][1] = {}
						k[i][1].address = arStruct[i][5] -- maxHP
						k[i][1].flags = gg.TYPE_FLOAT
						k[i][1].value = math.abs(tonumber(n[1])+i)
						gg.setValues(k[i])
					end
					
					o = gg.prompt({'CURRENT MAX DURATION:\n>It changed please check again and type true value'},
					 {0}, {'number'})
					if o == nil then 
						gg.sleep(1)
						gg.toast("CANCELLED")
						k = {}
						for i=1, #arStruct do
							k[1] = {}
							k[1].address = arStruct[i][5] -- maxHP
							k[1].flags = gg.TYPE_FLOAT
							k[1].value = tonumber(n[1])
							gg.setValues(k)
						end
						StructureOption()
					else
						k = {}
						for i=1, #arStruct do
							k[1] = {}
							k[1].address = arStruct[i][5] -- maxHP
							k[1].flags = gg.TYPE_FLOAT
							k = gg.getValues(k)
							if math.abs(k[1].value-tonumber(o[1])) <0.01 then
								k[1].flags = gg.TYPE_DWORD
								k[1].value = "2139095040"
								k[2] = {}
								k[2].address = arStruct[i][4] -- curHp
								k[2].flags = gg.TYPE_DWORD
								k[2].value = "2139095040"
							else
								k[1].value = tonumber(n[1])
							end
							gg.setValues(k)
						end
					end
				else
					k = {}
					for i=1, #arStruct do
						k[1] = {}
						k[1].address = arStruct[i][5] -- maxHP
						k[1].flags = gg.TYPE_DWORD
						k[1].value = "2139095040"
						k[2] = {}
						k[2].address = arStruct[i][4] -- curHp
						k[2].flags = gg.TYPE_DWORD
						k[2].value = "2139095040"
						gg.setValues(k)
						gg.toast("Changed tructure "..i, true)
					end
				end
			else
				gg.alert("Not found result. ")
			end
		else
			gg.clearResults()
			gg.setRanges(range)
			gg.setVisible(false)
			gg.searchNumber(n[1]..";1,017,370,378~1,028,443,341D::5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
			gg.refineNumber(n[1], gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
			m = gg.getResultsCount()
			if m==0 then
			gg.alert("Not found result. ")
			StructureOption()
			else
				if m >1 and n[2] == false then
					x = gg.getResults(m)
					gg.saveVariable(x, gg.EXT_CACHE_DIR.."/Original.value")
					a = nil
					a = {}
					for i = 1, m do
						a[i] = {}
						a[i][1] = {}
						a[i][1].address = x[i].address
						a[i][1].flags = gg.TYPE_FLOAT
						a[i][1].value = math.abs(tonumber(n[1])+i)
						gg.setValues(a[i])
					end
					o = gg.prompt({'CURRENT MAX DURATION:\n>It changed please check again and type true value'},
					 {0}, {'number'})
					if o == nil then 
						gg.sleep(1)
						gg.toast("CANCELLED")
						gg.clearResults()
						local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
						if check then
							local a = check ()
							local b = gg.getValues(a)
							for a, b in next, b do
								--do what you want
							end
							gg.setValues(a)--revert to original
						end
						StructureOption()
					else

						gg.refineNumber(o[1], gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
						t = gg.getResultsCount()
						if t==0 then
							gg.alert("Not found result. You type wrong value. Let try again")
							gg.clearResults()
							local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
							if check then
								local a = check ()
								local b = gg.getValues(a)
								for a, b in next, b do
									--do what you want
								end
								gg.setValues(a)--revert to original
							end
							StructureOption()
						else 
							x = gg.getResults(t)
							a = nil
							a = {}
							for i = 1, t do
								a[i] = {}
								a[i][1] = {}
								a[i][1].address = x[i].address
								a[i][1].flags = gg.TYPE_DWORD
								a[i][1].name = 'Structure_Duration'
								gg.addListItems(a[i])
							end
							gg.clearResults()
							local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
							if check then
								local a = check ()
								local b = gg.getValues(a)
								for a, b in next, b do
									--do what you want
								end
								gg.setValues(a)--revert to original
							end
							
						end
					end
				else
					x = gg.getResults(m)
					a = nil
					a = {}
					for i = 1, m do
						a[i] = {}
						a[i][1] = {}
						a[i][1].address = x[i].address
						a[i][1].flags = gg.TYPE_DWORD
						a[i][1].name = 'Structure_Duration'
						gg.addListItems(a[i])
					end
				end
				local ros = gg.getListItems()
				for i, v in ipairs(ros) do
					  if v.name == "Structure_Duration" then
						v.flags = gg.TYPE_FLOAT
						num = 999999999-i
						v.value = num
					  end
					  
				end
				gg.setValues(ros)
				gg.addListItems(ros)
				gg.alert("Changed! Repair or Heal All if you are using God Console to complete")	
			end	
		end
		

	end
end

function UnlimitedPlatform()
	n = gg.prompt({'TYPE NUMBER MAX HEALTH OF CREATURE FOR CHANGE? (>0)'},
		{0}, 
		{'number'})
	if n == nil then 
		gg.sleep(1)
		gg.toast("CANCELLED")
		StructureOption()
	else
		a1 = nil
		a1 = {}
		a2 = nil
		a2 = {}
		a3 = nil
		a3 = {}
		g = math.abs(n[1]-1)
		h = math.abs(n[1]+1)
		gg.toast("Finding data CREATURE to change. Please wait")	
		gg.clearResults()
		gg.setVisible(false)
		gg.setRanges(range)
		gg.searchNumber("61D;1F;"..g.."~"..h.."::21", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
		gg.refineNumber(g.."~"..h, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
		m = gg.getResultsCount()
		if m==0 then
			gg.alert("Not found results. Are you sure you entered the correct maximum health value?")
			StartCheat()
		else
			x = gg.getResults(m)
			for i = 1, m do
				a1[i] = {}
				a1[i][1] = {}
				a1[i][1].address = x[i].address - 0x14
				a1[i][1].flags = gg.TYPE_DWORD
				a1[i] = gg.getValues(a1[i])
				a2[i] = {}
				a2[i][1] = {}
				a2[i][1].address = x[i].address - 0x8
				a2[i][1].flags = gg.TYPE_FLOAT
				a2[i] = gg.getValues(a2[i])
				if (a1[i][1].value ~=nil and math.abs(a1[i][1].value -61)<0.01 and a2[i][1].value ~=nil and math.abs(a2[i][1].value -1.0)<0.01) then		
					a3[i] = {}
					a3[i][1] = {}
					if is64 == true then
					a3[i][1].address = x[i].address + 0xd80
					else
					a3[i][1].address = x[i].address + 0xBA8
					end
					a3[i][1].flags = gg.TYPE_DWORD
					--a3[i][1].name = 'LimitPlatform'
					a3[i][1].value = '2139095040'
					--gg.addListItems(a3[i])
					gg.setValues(a3[i])
				end
			end	
			gg.toast("Active!")		
		end
	end	
end

function UnlimitedRaft()
	gg.clearResults()
	gg.toast("Finding limit structure. Please wait")
	gg.setRanges(range)
	gg.setVisible(false)
	gg.searchNumber("1100;0;70::9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
	gg.refineNumber("70", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)

	m = gg.getResultsCount()
	if m==0 then
		gg.alert("Not found result")	 
		StructureOption()
	else
		x = gg.getResults(m)
		a = nil
		a = {}
		for i = 1, m do
			a[i] = {}
			a[i][1] = {}
			a[i][1].address = x[i].address
			a[i][1].flags = gg.TYPE_DWORD
			a[i][1].value = '2139095040'
			gg.setValues(a[i])
		end
		
		gg.alert("Unlimited structure on raft now. It will reset to default after reset game. So Let's run this option again")
	end
end

function UnlimitHeight()
	local menu = gg.alert("Do you want to refind and update structures on map? It is useful if you want to change for new structures that you added. Skip and slelect NO if you don't need refind that will delay for search", "YES", "NO")
	if menu == 0 then --no select
		StructureOption()		
	elseif menu == 1 then -- YES
		gg.toast("Finding info Player. Please wait")
		GetArray(0)	
	elseif menu == 2 then  -- NO
		--StructureOption()
	end	
	if #ArrayStructures >0 then
		local k = nil
			  k = {}
		for i=1, #ArrayStructures do
			if ArrayStructures[i][9] >0 then 
				k[1] = {}
				if is64 then
				k[1].address = ArrayStructures[i][5] + 0x1a8
				else
				k[1].address = ArrayStructures[i][5] + 0x160
				end
				k[1].flags = gg.TYPE_DWORD
				k[1].value = "2139095040"
				gg.setValues(k)
				if (i%50==0) then
				gg.toast("Changed tructure "..i, true)
				end
			end
		end
		gg.toast("Changed for all structures")
	else
		gg.clearResults()
		gg.toast("Finding limit structure. Please wait")
		gg.setRanges(range)
		gg.setVisible(false)
		gg.searchNumber("1D;4D;1F;345600F::25", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
		gg.refineNumber("4", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)

		m = gg.getResultsCount()
		if m==0 then
			gg.alert("Not found result")	 
			StructureOption()
		else
			x = gg.getResults(m)
			a = nil
			a = {}
			for i = 1, m do
				a[i] = {}
				a[i][1] = {}
				a[i][1].address = x[i].address + 0x4
				a[i][1].flags = gg.TYPE_DWORD
				a[i][1].value = '2139095040'
				gg.setValues(a[i])
			end
			
			gg.alert("Unlimited all structures on Map now. If you add other structure and get limit height or It will reset to default after reset game. So Let's run this option again")
		end
	end
end

function UnlimitedWeightElevator()
	local menu = gg.alert("Do you want to refind and update structures on map? It is useful if you want to change for new structures that you added. Skip and slelect NO if you don't need refind that will delay for search", "YES", "NO")
	if menu == 0 then --no select
		StructureOption()		
	elseif menu == 1 then -- YES
		gg.toast("Finding info Player. Please wait")
		GetArray(0)	
	elseif menu == 2 then  -- NO
		--StructureOption()
	end	
	if #ArrayStructures >0 then
		local k = nil
			  k = {}
		for i=1, #ArrayStructures do
			if ArrayStructures[i][10] >=700 then 
				k[1] = {}
				if is64 then
				k[1].address = ArrayStructures[i][5] + 0x558
				else
				k[1].address = ArrayStructures[i][5] + 0x450
				end
				k[1].flags = gg.TYPE_DWORD
				k[1].value = "2139095040"
				gg.setValues(k)
				if (i%50==0) then
				gg.toast("Changed tructure "..i, true)
				end
			end
		end
		gg.toast("Changed for all structures")
	else
		gg.clearResults()
		gg.toast("Finding limit structure. Please wait")
		gg.setRanges(range)
		gg.setVisible(false)
		gg.searchNumber("700~3000F;160F;150F;80F;25F::17", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
		gg.refineNumber("700~3000", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)

		m = gg.getResultsCount()
		if m==0 then
			gg.alert("Not found result")	 
			StructureOption()
		else
			x = gg.getResults(m)
			a = nil
			a = {}
			for i = 1, m do
				a[i] = {}
				a[i][1] = {}
				a[i][1].address = x[i].address
				a[i][1].flags = gg.TYPE_DWORD
				a[i][1].value = '2139095040'
				gg.setValues(a[i])
			end
			
			gg.alert("Unlimited elevator weight on Map now. If you add other elevator or It will reset to default after reset game. So Let's run this option again")
		end
	end
end

distance = {148.056640625,146.904296875,141.8671875,142.791015625,142.440429688,141.801757813}
function distance2Points( x1, y1, z1, x2, y2, z2 )
	return math.sqrt( (x2-x1)^2 + (y2-y1)^2 + (z2-z1)^2 )
end


function movingBuild()
	if testData()==false then
		gg.toast("Data is null. Need update data. Please wait")
		GetArray(0)
	end
coordinates = {0,0,0}
testAd = testData()
	local PL = nil
	PL = {}
if (testAd)then
	PL[1] = {}
	PL[1].address = ArrayPlayer[9]
	PL[1].flags = gg.TYPE_FLOAT
	PL[1].name = "PlayerX"
	PL[2] = {}
	PL[2].address = ArrayPlayer[10]
	PL[2].flags = gg.TYPE_FLOAT
	PL[2].name = "PlayerY"
	PL[3] = {}
	PL[3].address = ArrayPlayer[11]
	PL[3].flags = gg.TYPE_FLOAT
	PL[3].name = "PlayerZ"
	PL = gg.getValues(PL)
coordinates = {PL[1].value,PL[2].value,PL[3].value}
else
	gg.toast("Finding World. Please wait")
	GetArray(0)
end
--gg.alert(distance2Points(coordinates[1], coordinates[2], coordinates[3], ArrayStructures[1][13], ArrayStructures[1][14], ArrayStructures[1][15]))

	local o = gg.prompt({'Change to all structures in radius with Player: (>0)',
	'Increases or decreases (+ or - value) Height Z',
	'Increases or decreases (+ or - value) Y',
	'Increases or decreases (+ or - value) X',
	'Only change structures with same height Z',
	"Only change structures with same Duration\nValue <=0 if you don't active this option",
	'Only change for one structure target',
	'Move to player Save location',
	'REFIND AND UPDATE STRUCTURES'
	},
	 {50000, 500, 0, 0, false, 0, false, false, false}, {'number', 'number', 'number', 'number', "checkbox", "number", "checkbox", "checkbox", "checkbox"})
	if o == nil then 
		gg.sleep(1)
		gg.toast("CANCELLED")
		StructureOption()
	else
		if (o[8]==true) then
			local infoLocations = {}
			local config = gg.getFile()..'.saveLocation.cfg'
			local data = loadfile(config)
			if data ~= nil then
				infoLocations = data()
				data = nil
			end
			
			if (#infoLocations > 0) then
				local mn = {}
				for i=1, #infoLocations do
					mn[i] = infoLocations[i][1]
				end
				local menu = gg.choice(mn, nil, "SELECTION LOCATION GO TO")
				for i=1, #mn do
					if menu == i then
						local alert = gg.alert("What do you want to continue?", "Go To Save", "Delete Save", "Back")
						if alert == 0 then --no select
							gg.toast("You are not select anything")
							movingBuild()							
						elseif alert == 1 then -- Go To Save
							o[4] = infoLocations[i][2] - PL[1].value + tonumber(o[4])-- x
							o[3] = infoLocations[i][3] - PL[2].value  + tonumber(o[3]) -- y
							o[2] = infoLocations[i][4] - PL[3].value  + tonumber(o[2]) -- z						
						elseif alert == 2 then -- Delete Save
							table.remove(infoLocations, i)
							gg.saveVariable(infoLocations, config)
							gg.toast("Save deleted!!!")
							movingBuild()
						elseif alert == 3 then -- back
							movingBuild()
						end
					end					
				end
				if menu == nil then 
					gg.toast("You are not select anything")
					Teleport()
				end
			else
				gg.alert("No data saves file. You need >=1 save location before use this option")
				Teleport()
			end
		end
		
		if (o[9]==true) then
			gg.toast("Finding World. Please wait")
			GetArray(0)
		end
		
		if #ArrayStructures>0 then
			local structActive = {}
			local struct = {} 
			if o[7] then
				o[5]=false
			end
			if (o[5]==true) then
				-- Use a hashtable:
				local haveSeen = {}
				for i = 1, #ArrayStructures do
					local element = ArrayStructures[i][15]
					-- Check whether or not any previous place has
					-- recorded `element` into `haveSeen`
					if not haveSeen[element] then
						-- haveSeen[element] is empty
						haveSeen[element] = {i}
					else
						haveSeen[element][#haveSeen[element]+1] = i
						struct[#struct +1] = ArrayStructures[i]
						if #haveSeen[element] == 2 then
							struct[#struct +1] = ArrayStructures[haveSeen[element][1]]
						end
						-- haveSeen[element] is NOT empty --
						-- the element has already been seen
						-- list[ haveSeen[element] ] and list[i] are the same!
					end
				end			
			end
			if o[5] then
				structActive = struct
			else
				structActive = ArrayStructures
			end
		
			if (tonumber(o[6])>0) then
				if #structActive>0 then
					struct = {}
					for i = 1, #structActive do
						if math.abs(structActive[i][3] - tonumber(o[6])) < 0.1 then
							struct[#struct+1] = structActive[i]
						end
					end
					structActive = struct
				end
			end
			
			if o[7] then
				struct = {}
				if #structActive>0 then
					local k = {}
					for i = 1, #structActive do
						k[1] = {}
						k[1].address = structActive[i][5]
						k[1].flags = gg.TYPE_FLOAT
						k = gg.getValues(k)
						k[1].value = k[1].value + i
						gg.setValues(k)
					end
					
					local menu = gg.alert("Max duration structure target has changed. please enter the new value in the next step for refine", "Next", "Back", "Hide For Check")
					if menu == 0 then 
						k = {}
						for i = 1, #structActive do
							k[1] = {}
							k[1].address = structActive[i][5]
							k[1].flags = gg.TYPE_FLOAT
							k = gg.getValues(k)
							k[1].value = k[1].value - i
							gg.setValues(k)
						end
						movingBuild()
					elseif menu == 1 then -- next
						mn = gg.prompt({'ENTER NEW VALUE MAX DURATION OF THE STRUCTURE TARGET:\n>It changed please type true value'},
						 {0}, {'number'})
						if mn == nil then 
							k = {}
							for i = 1, #structActive do
								k[1] = {}
								k[1].address = structActive[i][5]
								k[1].flags = gg.TYPE_FLOAT
								k = gg.getValues(k)
								k[1].value = k[1].value - i
								gg.setValues(k)
							end
							movingBuild()
						else
							k = {}
							for i = 1, #structActive do
								k[1] = {}
								k[1].address = structActive[i][5]
								k[1].flags = gg.TYPE_FLOAT
								k = gg.getValues(k)
								if (math.abs(k[1].value - tonumber(mn[1])) < 0.1) then
									struct[#struct+1] = structActive[i]
								end
								k[1].value = k[1].value - i
								gg.setValues(k)
							end
						end
					elseif menu == 2 then -- back
						k = {}
						for i = 1, #structActive do
							k[1] = {}
							k[1].address = structActive[i][5]
							k[1].flags = gg.TYPE_FLOAT
							k = gg.getValues(k)
							k[1].value = k[1].value - i
							gg.setValues(k)
						end
						movingBuild()
					elseif menu == 3 then -- hide
						gg.setVisible(false)
						while(menu == 3)
						do
							while gg.isVisible(true)
							do--
							  gg.setVisible(false)
							  menu = 1
							  mn = gg.prompt({'ENTER NEW VALUE MAX DURATION OF THE STRUCTURE TARGET:\n>It changed please type true value'},
								 {0}, {'number'})
								if mn == nil then 
									k = {}
									for i = 1, #structActive do
										k[1] = {}
										k[1].address = structActive[i][5]
										k[1].flags = gg.TYPE_FLOAT
										k = gg.getValues(k)
										k[1].value = k[1].value - i
										gg.setValues(k)
									end
									movingBuild()
								else
									k = {}
									for i = 1, #structActive do
										k[1] = {}
										k[1].address = structActive[i][5]
										k[1].flags = gg.TYPE_FLOAT
										k = gg.getValues(k)
										if (math.abs(k[1].value - tonumber(mn[1])) < 0.1) then
											struct[#struct+1] = structActive[i]
										end
										k[1].value = k[1].value - i
										gg.setValues(k)
									end
								end
							end
						end	
					end
					
				end	
				structActive = struct
			end
			
			if #structActive>0 then
				local k = {}
				for i = 1, #structActive do
					if distance2Points(coordinates[1], coordinates[2], coordinates[3], structActive[i][13], structActive[i][14], structActive[i][15]) < tonumber (o[1]) then
						k[1] = {}
						k[1].address = structActive[i][8]
						k[1].flags = gg.TYPE_FLOAT
						k[2] = {}
						k[2].address = structActive[i][7]
						k[2].flags = gg.TYPE_FLOAT
						k[3] = {}
						k[3].address = structActive[i][6]
						k[3].flags = gg.TYPE_FLOAT
						k=gg.getValues(k)
						k[1].value = k[1].value + tonumber(o[2])
						k[2].value = k[2].value + tonumber(o[3])
						k[3].value = k[3].value + tonumber(o[4])
						gg.setValues(k)
						if i%100==0 then
							gg.toast("Moved structure: "..i, true)
						end
					end
				end
					gg.alert("Changed. Save and restart the game for see changes")
			else
				gg.alert("Not found any structure with condition to change. Maybe you need to refind and update new structures or optimize condition for change")
			end
		else
			gg.alert("Not found any structure. Maybe you need to refind and update new structures")
		end
	end
end

function FloatingBuilding() 
coordinates = {0,0,0}
testAd = testData()
	local PL = nil
	PL = {}
if (testAd)then
	PL[1] = {}
	PL[1].address = ArrayPlayer[9]
	PL[1].flags = gg.TYPE_FLOAT
	PL[1].name = "PlayerX"
	PL[2] = {}
	PL[2].address = ArrayPlayer[10]
	PL[2].flags = gg.TYPE_FLOAT
	PL[2].name = "PlayerY"
	PL[3] = {}
	PL[3].address = ArrayPlayer[11]
	PL[3].flags = gg.TYPE_FLOAT
	PL[3].name = "PlayerZ"
	PL = gg.getValues(PL)
coordinates = {PL[1].value,PL[2].value,PL[3].value}
end
gg.clearResults()

--gg.alert(distance2Points(coordinates[1], coordinates[2], coordinates[3], ArrayStructures[1][13], ArrayStructures[1][14], ArrayStructures[1][15]))

local menu = gg.alert("For change. Please stay player on foundations that you want them float", "Next", "Back", "Hide For Moving Player on Foundation")
if menu == 0 then --no select
 StructureOption()
	
elseif menu == 1 then -- next
	o = gg.prompt({'FOUNDATION TYPE FOR FLOAT\n1: Geopolymer Cement foundation.\n2: Stone foundation.\n3: Metal foundation.\n4: Wooden foundation\n5: Thatch foundation.\n6: Tek Foundation. [1;6]',
	'Increases or decreases (+ or - value) Height Z',
	'Increases or decreases (+ or - value) Y',
	'Increases or decreases (+ or - value) X'
	},
	 {5, 1000.0, 0, 0}, {'number', 'number', 'number', 'number'})
	if o == nil then 
		gg.sleep(1)
		gg.toast("CANCELLED")
		StructureOption()
	else--1
		gg.toast("Changing. Please wait")	
		if testAd==false then
			local del = {}
			local te = gg.getListItems()
			for i, v in ipairs(te) do
			  if (v.name == "PlayerX" or v.name == "PlayerY" or v.name == "PlayerZ") then
				table.insert(del, te[i].address)
			  end
			end
				gg.removeListItems(del)
			
			t = 0
			gg.toast("Finding current location. Please wait")
			gg.setRanges(range)
			gg.setVisible(false)
			gg.searchNumber("82F;1F::41", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
			gg.refineNumber("82", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)

			m = gg.getResultsCount()
			if m==0 then
			gg.alert("Not found result")
			StructureOption()
			else
				x = gg.getResults(m)
				a = nil
				a = {}
				b = nil
				b = {}
				c = nil
				c = {}
				d = nil
				d = {}
				q = nil
				q = {}

				for i = 1, m do
					b[i] = {}
					b[i][1] = {}
					b[i][1].address = x[i].address -0x4
					b[i][1].flags = gg.TYPE_FLOAT
					b[i] = gg.getValues(b[i])
					q[i] = {}
					q[i][1] = {}
					if is64 == true then
						q[i][1].address = x[i].address + 0x20  -- +28 32 bit
					else
						q[i][1].address = x[i].address + 0x28 
					end
					q[i][1].flags = gg.TYPE_FLOAT
					q[i] = gg.getValues(q[i])
					if (math.abs(q[i][1].value-1.0)<0.01 and math.abs(b[i][1].value-82.0)<0.5) then
						testAd = true
						t=t+1
						a[i] = {}
						a[i][1] = {}
						if is64 == true then
							a[i][1].address = x[i].address + 0x14
						else
							a[i][1].address = x[i].address + 0x1c
						end 
						a[i][1].flags = gg.TYPE_FLOAT
						a[i][1].name = 'PlayerX'
						--gg.addListItems(a[i])
						PL[1] = a[i][1]
						a[i] = gg.getValues(a[i])
						coordinates[1] = a[i][1].value
						c[i] = {}
						c[i][1] = {}
						if is64 == true then
						c[i][1].address = x[i].address+0x18
						else
						c[i][1].address = x[i].address+0x20
						end
						c[i][1].flags = gg.TYPE_FLOAT
						c[i][1].name = 'PlayerY'
						--gg.addListItems(c[i])
						PL[2] = c[i][1]
						c[i] = gg.getValues(c[i])
						coordinates[2] = c[i][1].value
						d[i] = {}
						d[i][1] = {}
						if is64 == true then
						d[i][1].address = x[i].address +0x1c
						else
						d[i][1].address = x[i].address +0x24
						end
						d[i][1].flags = gg.TYPE_FLOAT
						d[i][1].name = 'PlayerZ'
						--gg.addListItems(d[i])
						PL[3] = d[i][1]
						d[i] = gg.getValues(d[i])
						coordinates[3] = d[i][1].value
					end	
				end
				if (t==0) then
					gg.alert("Not Found. Try moving a bit player on foundations and try again")
					StructureOption()
				end
			end
		end
--------		
		if (testAd==true) then
			--gg.alert(coordinates[3].."|"..distance[tonumber(o[1])])
			structureZ = coordinates[3] - distance[tonumber(o[1])]
			cmin = structureZ-0.1
			cmax = structureZ+0.1
			gg.clearResults()
			gg.setRanges(range)
			gg.setVisible(false)
			gg.searchNumber(cmin.."~"..cmax, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
			m = gg.getResultsCount()
			if m==0 then
				gg.alert("Not found result. Let try again. Are You Sure with on Foundation and Selection true foundation type?")
				StructureOption()
			else
				local x = gg.getResults(m)
				local k = {}
				for i = 1, m do
					k[1] = {}
					k[1].address = x[i].address --z
					k[1].flags = gg.TYPE_FLOAT
					k[2] = {}
					k[2].address = x[i].address - 0x4 -- y
					k[2].flags = gg.TYPE_FLOAT
					k[3] = {}
					k[3].address = x[i].address - 0x8 -- x
					k[3].flags = gg.TYPE_FLOAT
					k=gg.getValues(k)
					k[1].value = k[1].value + tonumber(o[2])
					k[2].value = k[2].value + tonumber(o[3])
					k[3].value = k[3].value + tonumber(o[4])
					gg.setValues(k)
				end
				--x = gg.getResults(m)
				--for i, v in ipairs(x) do
					--v.value = v.value + tonumber(o[2])
				--end
				--gg.setValues(x)
				--structureZ = structureZ + tonumber(o[2])
				--gg.editAll(structureZ, gg.TYPE_FLOAT)
				gg.alert("Foundations is Floating. Save and restart the game for see change and you can build well on foundations")
			end
		end	
		
	end--1
elseif menu == 2 then  -- back
StructureOption()	
elseif menu == 3 then  -- Hide For Moving on Foundation
	gg.setVisible(false)
	while(menu == 3)
	do
	  while gg.isVisible(true)
		do--
		  gg.setVisible(false)
		  menu = 1
			o = gg.prompt({'FOUNDATION TYPE FOR FLOAT\n1: Geopolymer Cement foundation.\n2: Stone foundation.\n3: Metal foundation.\n4: Wooden foundation\n5: Thatch foundation.\n6: Tek Foundation. [1;6]',
			'Height value increases or decreases\n- if decreases'
			},
			 {5, 1000.0}, {'number', 'number'})
			if o == nil then 
				gg.sleep(1)
				gg.toast("CANCELLED")
				StructureOption()
			else--1
				gg.toast("Changing. Please wait")
				if testAd==false then
					local del = {}
					local te = gg.getListItems()
					for i, v in ipairs(te) do
					  if (v.name == "PlayerX" or v.name == "PlayerY" or v.name == "PlayerZ") then
						table.insert(del, te[i].address)
					  end
					end
						gg.removeListItems(del)
					
					t = 0
					gg.toast("Finding current location. Please wait")
					gg.setRanges(range)
					gg.setVisible(false)
					gg.searchNumber("82F;1F::41", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
					gg.refineNumber("82", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)

					m = gg.getResultsCount()
					if m==0 then
					gg.alert("Not found result")
					StructureOption()
					else
						x = gg.getResults(m)
						a = nil
						a = {}
						b = nil
						b = {}
						c = nil
						c = {}
						d = nil
						d = {}
						q = nil
						q = {}

						for i = 1, m do
							b[i] = {}
							b[i][1] = {}
							b[i][1].address = x[i].address -0x4
							b[i][1].flags = gg.TYPE_FLOAT
							b[i] = gg.getValues(b[i])
							q[i] = {}
							q[i][1] = {}
							if is64 == true then
								q[i][1].address = x[i].address + 0x20  -- +28 32 bit
							else
								q[i][1].address = x[i].address + 0x28 
							end
							q[i][1].flags = gg.TYPE_FLOAT
							q[i] = gg.getValues(q[i])
							if (math.abs(q[i][1].value-1.0)<0.01 and math.abs(b[i][1].value-82.0)<0.5) then
								testAd = true
								t=t+1
								a[i] = {}
								a[i][1] = {}
								if is64 == true then
									a[i][1].address = x[i].address + 0x14
								else
									a[i][1].address = x[i].address + 0x1c
								end 
								a[i][1].flags = gg.TYPE_FLOAT
								a[i][1].name = 'PlayerX'
								--gg.addListItems(a[i])
								PL[1] = a[i][1]
								a[i] = gg.getValues(a[i])
								coordinates[1] = a[i][1].value
								c[i] = {}
								c[i][1] = {}
								if is64 == true then
								c[i][1].address = x[i].address+0x18
								else
								c[i][1].address = x[i].address+0x20
								end
								c[i][1].flags = gg.TYPE_FLOAT
								c[i][1].name = 'PlayerY'
								--gg.addListItems(c[i])
								PL[2] = c[i][1]
								c[i] = gg.getValues(c[i])
								coordinates[2] = c[i][1].value
								d[i] = {}
								d[i][1] = {}
								if is64 == true then
								d[i][1].address = x[i].address +0x1c
								else
								d[i][1].address = x[i].address +0x24
								end
								d[i][1].flags = gg.TYPE_FLOAT
								d[i][1].name = 'PlayerZ'
								--gg.addListItems(d[i])
								PL[3] = d[i][1]
								d[i] = gg.getValues(d[i])
								coordinates[3] = d[i][1].value
							end	
						end
						if (t==0) then
							gg.alert("Not Found. Try moving a bit player on foundations and try again")
							StructureOption()
						end
					end
				end
		--------		
				if (testAd==true) then
					--gg.alert(coordinates[3].."|"..distance[tonumber(o[1])])
					structureZ = coordinates[3] - distance[tonumber(o[1])]
					cmin = structureZ-0.1
					cmax = structureZ+0.1
					gg.clearResults()
					gg.setRanges(range)
					gg.setVisible(false)
					gg.searchNumber(cmin.."~"..cmax, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
					m = gg.getResultsCount()
					if m==0 then
						gg.alert("Not found result. Let try again. Are You Sure with on Foundation and Selection true foundation type?")
						StructureOption()
					else
						local x = gg.getResults(m)
						local k = {}
						for i = 1, m do
							k[1] = {}
							k[1].address = x[i].address --z
							k[1].flags = gg.TYPE_FLOAT
							k[2] = {}
							k[2].address = x[i].address - 0x4 -- y
							k[2].flags = gg.TYPE_FLOAT
							k[3] = {}
							k[3].address = x[i].address - 0x8 -- x
							k[3].flags = gg.TYPE_FLOAT
							k=gg.getValues(k)
							k[1].value = k[1].value + tonumber(o[2])
							k[2].value = k[2].value + tonumber(o[3])
							k[3].value = k[3].value + tonumber(o[4])
							gg.setValues(k)
						end
						
						--for i, v in ipairs(x) do
							--v.value = v.value + tonumber(o[2])
						--end
						--gg.setValues(x)
						--structureZ = structureZ + tonumber(o[2])
						--gg.editAll(structureZ, gg.TYPE_FLOAT)
						gg.alert("Foundations is Floating. Save and restart the game for see change and you can build well on foundations")
					end
				end	
				
			end--1			
		
		end--
	end
	
end
end

currentMaxStats = {100,100,100,100,100}
function PlayerOption()
	if testData()==false then
	gg.toast("Data is null. Need update data. Please wait")
	GetArray(0)
	end
gg.clearResults()

if testData() == false then
	local del = {}
	local te = gg.getListItems()
	for i, v in ipairs(te) do
	  if (v.name == "exp"
	  or v.name == "PEngrams"  
	  or v.name == "PCurrentHP"  
	  or v.name == "PCurrentStamina" 
	  or v.name == "PCurrentOxygen" 
	  or v.name == "PCurrentFood" 
	  or v.name == "PCurrentWater" 
	  or v.name == "PCurrentTorpor" 
	  or v.name == "PmaxHP" 
	  or v.name == "PmaxStamina" 
	  or v.name == "PmaxOxygen" 
	  or v.name == "PmaxFood" 
	  or v.name == "PmaxWater"
	  or v.name == "PmaxWeight"
	  or v.name == "PMeleeDamage"
	  or v.name == "PMovementSP"
	  or v.name == "PFortitude"
	  or v.name == "PCraftingSP"
	  or v.name == "PTorpor"
	  or v.name == "ShowPmaxHP" 
	  or v.name == "ShowPmaxStamina" 
	  or v.name == "ShowPmaxOxygen" 
	  or v.name == "ShowPmaxFood" 
	  or v.name == "ShowPmaxWater"
	  or v.name == "ShowPmaxWeight"
	  or v.name == "ShowPMeleeDamage"
	  or v.name == "ShowPMovementSP"
	  or v.name == "ShowPFortitude"
	  or v.name == "ShowPCraftingSP"
	  or v.name == "ShowPTorpor"
	  or v.name == "PForceMaxHP"
	  or v.name == "Pbody_r"
	  or v.name == "Pbody_g"
	  or v.name == "Pbody_b"
	  or v.name == "Pbody_a"
	  or v.name == "Phair_r"
	  or v.name == "Phair_g"
	  or v.name == "Phair_b"
	  or v.name == "Phair_a"
	  or v.name == "Peyes_r"
	  or v.name == "Peyes_g"
	  or v.name == "Peyes_b"
	  or v.name == "Peyes_a"
	  ) then
		table.insert(del, v.address)
		--gg.toast("I am here")
	  end
	end
		gg.removeListItems(del)
	
gg.toast("Finding info Player. Please wait")
GetArray(0)	
end		

if (#ArrayPlayer>0) then
	local a = nil
	a = {}
	local b = nil
	b = {}
	local s1 = nil
	s1 = {}
	local s2 = nil
	s2 = {}
	local s3 = nil
	s3 = {}
	local s4 = nil
	s4 = {}
	local s5 = nil
	s5 = {}
	local s6 = nil
	s6 = {}
	local s7 = nil
	s7 = {}
	local s8 = nil
	s8 = {}
	local s9 = nil
	s9 = {}
	local s10 = nil
	s10 = {}
	local s11 = nil
	s11 = {}
	local s12 = nil
	s12 = {}
	local s13 = nil
	s13 = {}
	local s14 = nil
	s14 = {}
	local s15 = nil
	s15 = {}
	local s16 = nil
	s16 = {}
	local s17 = nil
	s17 = {}
	local s18 = nil
	s18 = {}
	local s19 = nil
	s19 = {}
	local s20 = nil
	s20 = {}
	local s21 = nil
	s21 = {}
	local s22 = nil
	s22 = {}
	local s23 = nil
	s23 = {}
	local s24 = nil
	s24 = {}
	local s25 = nil
	s25 = {}
	local s26 = nil
	s26 = {}
	local s27 = nil
	s27 = {}
	local s28 = nil
	s28 = {}
	local s29 = nil
	s29 = {}	

	local a1 = nil
	a1 = {}
	local a2 = nil
	a2 = {}
	local a3 = nil
	a3 = {}
	local a4 = nil
	a4 = {}
	local a5 = nil
	a5 = {}
	local a6 = nil
	a6 = {}
	local a7 = nil
	a7 = {}
	local a8 = nil
	a8 = {}
	local a9 = nil
	a9 = {}
	local a10 = nil
	a10 = {}
	local a11 = nil
	a11 = {}
	local a12 = nil
	a12 = {}
	local a13 = nil
	a13 = {}
	local a14 = nil
	a14 = {}
	local a15 = nil
	a15 = {}
	local a16 = nil
	a16 = {}	
	
	i=1
	x =  {{address = ArrayPlayer[8], flags = gg.TYPE_QWORD}}
	a15[i] = {}
	a15[i][1] = {}
	a15[i][1].address = x[i].address
	a15[i][1].flags = gg.TYPE_FLOAT
	a15[i][1].name = 'PForceMaxHP'
	--b[i][2].value = '5'
	gg.addListItems(a15[i])
	
	a16[i] = {}
	a16[i][1] = {}
	if is64==true then 
	a16[i][1].address = x[i].address - 0x9ac
	else
	a16[i][1].address = x[i].address -0x788
	end
	a16[i][1].flags = gg.TYPE_DWORD
	a16[i][1].name = 'Player_ID'
	gg.addListItems(a16[i])
	a16[i] = gg.getValues(a16[i])
	backupPlayerID = tonumber(a16[i][1].value)
	
	a3[i] = {}
	a3[i][1] = {}
	if is64==true then 
	a3[i][1].address = x[i].address + 0xe74  
	else
	a3[i][1].address = x[i].address + 0xc60
	end
	a3[i][1].flags = gg.TYPE_FLOAT
	a3[i][1].name = 'Pbody_r'
	gg.addListItems(a3[i])	
	a3[i] = gg.getValues(a3[i])
	PlistIDValueDefault[1] = a3[i][1].value
	a4[i] = {}
	a4[i][1] = {}
	a4[i][1].address = a3[i][1].address + 0x4
	a4[i][1].flags = gg.TYPE_FLOAT
	a4[i][1].name = 'Pbody_g'
	gg.addListItems(a4[i])	
	a4[i] = gg.getValues(a4[i])
	PlistIDValueDefault[2] = a4[i][1].value
	a5[i] = {}
	a5[i][1] = {}
	a5[i][1].address = a3[i][1].address + 0x8
	a5[i][1].flags = gg.TYPE_FLOAT
	a5[i][1].name = 'Pbody_b'
	gg.addListItems(a5[i])	
	a5[i] = gg.getValues(a5[i])
	PlistIDValueDefault[3] = a5[i][1].value
	a6[i] = {}
	a6[i][1] = {}
	a6[i][1].address = a3[i][1].address + 0xc
	a6[i][1].flags = gg.TYPE_FLOAT
	a6[i][1].name = 'Pbody_a'
	gg.addListItems(a6[i])	
	a6[i] = gg.getValues(a6[i])
	PlistIDValueDefault[4] = a6[i][1].value
	a7[i] = {}
	a7[i][1] = {}
	a7[i][1].address = a3[i][1].address + 0x10
	a7[i][1].flags = gg.TYPE_FLOAT
	a7[i][1].name = 'Phair_r'
	gg.addListItems(a7[i])	
	a7[i] = gg.getValues(a7[i])
	PlistIDValueDefault[5] = a7[i][1].value			
	a8[i] = {}
	a8[i][1] = {}
	a8[i][1].address = a3[i][1].address + 0x14
	a8[i][1].flags = gg.TYPE_FLOAT
	a8[i][1].name = 'Phair_g'
	gg.addListItems(a8[i])	
	a8[i] = gg.getValues(a8[i])
	PlistIDValueDefault[6] = a8[i][1].value			
	a9[i] = {}
	a9[i][1] = {}
	a9[i][1].address = a3[i][1].address + 0x18
	a9[i][1].flags = gg.TYPE_FLOAT
	a9[i][1].name = 'Phair_b'
	gg.addListItems(a9[i])	
	a9[i] = gg.getValues(a9[i])
	PlistIDValueDefault[7] = a9[i][1].value			
	a10[i] = {}
	a10[i][1] = {}
	a10[i][1].address = a3[i][1].address + 0x1c
	a10[i][1].flags = gg.TYPE_FLOAT
	a10[i][1].name = 'Phair_a'
	gg.addListItems(a10[i])	
	a10[i] = gg.getValues(a10[i])
	PlistIDValueDefault[8] = a10[i][1].value			
	a11[i] = {}
	a11[i][1] = {}
	a11[i][1].address = a3[i][1].address + 0x20
	a11[i][1].flags = gg.TYPE_FLOAT
	a11[i][1].name = 'Peyes_r'
	gg.addListItems(a11[i])	
	a11[i] = gg.getValues(a11[i])
	PlistIDValueDefault[9] = a11[i][1].value
	a12[i] = {}
	a12[i][1] = {}
	a12[i][1].address = a3[i][1].address + 0x24
	a12[i][1].flags = gg.TYPE_FLOAT
	a12[i][1].name = 'Peyes_g'
	gg.addListItems(a12[i])	
	a12[i] = gg.getValues(a12[i])
	PlistIDValueDefault[10] = a12[i][1].value
	a13[i] = {}
	a13[i][1] = {}
	a13[i][1].address = a3[i][1].address + 0x28
	a13[i][1].flags = gg.TYPE_FLOAT
	a13[i][1].name = 'Peyes_b'
	gg.addListItems(a13[i])	
	a13[i] = gg.getValues(a13[i])
	PlistIDValueDefault[11] = a13[i][1].value
	a14[i] = {}
	a14[i][1] = {}
	a14[i][1].address = a3[i][1].address + 0x2c
	a14[i][1].flags = gg.TYPE_FLOAT
	a14[i][1].name = 'Peyes_a'
	gg.addListItems(a14[i])	
	a14[i] = gg.getValues(a14[i])
	PlistIDValueDefault[12] = a14[i][1].value

-------------------------------------------------
	s19[i] = {}
	s19[i][1] = {}
	s19[i][1].address = ArrayPlayer[7]
	s19[i][1].flags = gg.TYPE_FLOAT
	s19[i][1].name = 'ShowPmaxHP'
	gg.addListItems(s19[i])	
	s19[i] = gg.getValues(s19[i])
	currentMaxStats[1] = s19[i][1].value
	
	s20[i] = {}
	s20[i][1] = {}
	s20[i][1].address = s19[i][1].address + 0x4
	s20[i][1].flags = gg.TYPE_FLOAT
	s20[i][1].name = 'ShowPmaxStamina'
	gg.addListItems(s20[i])	
	s20[i] = gg.getValues(s20[i])
	currentMaxStats[2] = s20[i][1].value
	
	s21[i] = {}
	s21[i][1] = {}
	s21[i][1].address = s19[i][1].address + 0xc
	s21[i][1].flags = gg.TYPE_FLOAT
	s21[i][1].name = 'ShowPmaxOxygen'
	gg.addListItems(s21[i])	
	s21[i] = gg.getValues(s21[i])
	currentMaxStats[3] = s21[i][1].value

	s22[i] = {}
	s22[i][1] = {}
	s22[i][1].address = s19[i][1].address + 0x10
	s22[i][1].flags = gg.TYPE_FLOAT
	s22[i][1].name = 'ShowPmaxFood'
	gg.addListItems(s22[i])	
	s22[i] = gg.getValues(s22[i])
	currentMaxStats[4] = s22[i][1].value

	s23[i] = {}
	s23[i][1] = {}
	s23[i][1].address = s19[i][1].address + 0x14
	s23[i][1].flags = gg.TYPE_FLOAT
	s23[i][1].name = 'ShowPmaxWater'
	gg.addListItems(s23[i])	
	s23[i] = gg.getValues(s23[i])
	currentMaxStats[5] = s23[i][1].value

	s24[i] = {}
	s24[i][1] = {}
	s24[i][1].address = s19[i][1].address + 0x1c
	s24[i][1].flags = gg.TYPE_FLOAT
	s24[i][1].name = 'ShowPmaxWeight'
	gg.addListItems(s24[i])	

	s25[i] = {}
	s25[i][1] = {}
	s25[i][1].address = s19[i][1].address + 0x20
	s25[i][1].flags = gg.TYPE_FLOAT
	s25[i][1].name = 'ShowPMeleeDamage'
	gg.addListItems(s25[i])	

	s26[i] = {}
	s26[i][1] = {}
	s26[i][1].address = s19[i][1].address + 0x24
	s26[i][1].flags = gg.TYPE_FLOAT
	s26[i][1].name = 'ShowPMovementSP'
	gg.addListItems(s26[i])		

	s27[i] = {}
	s27[i][1] = {}
	s27[i][1].address = s19[i][1].address + 0x28
	s27[i][1].flags = gg.TYPE_FLOAT
	s27[i][1].name = 'ShowPFortitude'
	gg.addListItems(s27[i])	

	s28[i] = {}
	s28[i][1] = {}
	s28[i][1].address = s19[i][1].address + 0x2c
	s28[i][1].flags = gg.TYPE_FLOAT
	s28[i][1].name = 'ShowPCraftingSP'
	gg.addListItems(s28[i])	

	s29[i] = {}
	s29[i][1] = {}
	s29[i][1].address = s19[i][1].address + 0x8
	s29[i][1].flags = gg.TYPE_FLOAT
	s29[i][1].name = 'ShowPTorpor'
	gg.addListItems(s29[i])
	
	s1[i] = {}
	s1[i][1] = {}
	s1[i][1].address = s19[i][1].address + 0x60
	s1[i][1].flags = gg.TYPE_FLOAT
	s1[i][1].name = 'PmaxHP'
	gg.addListItems(s1[i])
	s1[i] = gg.getValues(s1[i])
	deV[1] = (s1[i][1].value * 10.0) + 100.0
	--gg.alert(deV[1])
	s2[i] = {}
	s2[i][1] = {}
	s2[i][1].address = s1[i][1].address + 0x4
	s2[i][1].flags = gg.TYPE_FLOAT
	s2[i][1].name = 'PmaxStamina'
	gg.addListItems(s2[i])	
	s2[i] = gg.getValues(s2[i])
	deV[2] = (s2[i][1].value * 10.0) + 100.0
	s3[i] = {}
	s3[i][1] = {}
	s3[i][1].address = s1[i][1].address +0xC
	s3[i][1].flags = gg.TYPE_FLOAT
	s3[i][1].name = 'PmaxOxygen'
	gg.addListItems(s3[i])
	s3[i] = gg.getValues(s3[i])
	deV[3] = (s3[i][1].value * 20.0) + 100.0

	s4[i] = {}
	s4[i][1] = {}
	s4[i][1].address = s1[i][1].address +0x10
	s4[i][1].flags = gg.TYPE_FLOAT
	s4[i][1].name = 'PmaxFood'
	gg.addListItems(s4[i])	
	s4[i] = gg.getValues(s4[i])
	deV[4] = (s4[i][1].value * 10.0) + 100.0

	s5[i] = {}
	s5[i][1] = {}
	s5[i][1].address = s1[i][1].address +0x14
	s5[i][1].flags = gg.TYPE_FLOAT
	s5[i][1].name = 'PmaxWater'
	gg.addListItems(s5[i])	
	s5[i] = gg.getValues(s5[i])
	deV[5] = (s5[i][1].value * 10.0) + 100.0

	s6[i] = {}
	s6[i][1] = {}
	s6[i][1].address = s1[i][1].address +0x1c
	s6[i][1].flags = gg.TYPE_FLOAT
	s6[i][1].name = 'PmaxWeight'
	gg.addListItems(s6[i])				
	s6[i] = gg.getValues(s6[i])
	deV[6] = (s6[i][1].value * 10.0) + 100.0

	s7[i] = {}
	s7[i][1] = {}
	s7[i][1].address = s1[i][1].address +0x20
	s7[i][1].flags = gg.TYPE_FLOAT
	s7[i][1].name = 'PMeleeDamage'
	gg.addListItems(s7[i])	
	s7[i] = gg.getValues(s7[i])
	deV[7] = (s7[i][1].value * 5.0) + 100.0
	s8[i] = {}
	s8[i][1] = {}
	s8[i][1].address = s1[i][1].address +0x24
	s8[i][1].flags = gg.TYPE_FLOAT
	s8[i][1].name = 'PMovementSP'
	gg.addListItems(s8[i])
	s8[i] = gg.getValues(s8[i])
	deV[8] = (s8[i][1].value * 2.0) + 100.0

	s9[i] = {}
	s9[i][1] = {}
	s9[i][1].address = s1[i][1].address +0x28
	s9[i][1].flags = gg.TYPE_FLOAT
	s9[i][1].name = 'PFortitude'
	gg.addListItems(s9[i])
	s9[i] = gg.getValues(s9[i])
	deV[9] = s9[i][1].value * 2.0

	s10[i] = {}
	s10[i][1] = {}
	s10[i][1].address = s1[i][1].address +0x2c
	s10[i][1].flags = gg.TYPE_FLOAT
	s10[i][1].name = 'PCraftingSP'
	gg.addListItems(s10[i])
	s10[i] = gg.getValues(s10[i])
	deV[10] = (s10[i][1].value * 10.0) + 100.0

	s11[i] = {}
	s11[i][1] = {}
	s11[i][1].address = s1[i][1].address +0x8
	s11[i][1].flags = gg.TYPE_FLOAT
	s11[i][1].name = 'PTorpor'
	gg.addListItems(s11[i])
	s11[i] = gg.getValues(s11[i])
-------
	a[i] = {}
	a[i][1] = {}
	if is64 == true then 
		a[i][1].address = s1[i][1].address  + 0x5e8
	else
		a[i][1].address = s1[i][1].address  + 0x4f4
	end
	a[i][1].flags = gg.TYPE_FLOAT	
	a[i][1].name = 'exp'
	gg.addListItems(a[i])
	a[i] = gg.getValues(a[i])
	currentLevel = checkLevel(a[i][1].value);
	currentExp = a[i][1].value

	s18[i] = {}
	s18[i][1] = {}
	s18[i][1].address = a[i][1].address - 0x8
	s18[i][1].flags = gg.TYPE_DWORD
	s18[i] = gg.getValues(s18[i])
	currentLevelUpgraded = s18[i][1].value
	s12[i] = {}
	s12[i][1] = {}
	if is64 == true then 
		s12[i][1].address = a[i][1].address + 0x130  --124 32 bit
	else
		s12[i][1].address = a[i][1].address + 0x124
	end
	s12[i][1].flags = gg.TYPE_FLOAT
	s12[i][1].name = 'PCurrentHP'
	gg.addListItems(s12[i])
	s13[i] = {}
	s13[i][1] = {}
	s13[i][1].address = s12[i][1].address + 0x4
	s13[i][1].flags = gg.TYPE_FLOAT
	s13[i][1].name = 'PCurrentStamina'
	gg.addListItems(s13[i])
	s14[i] = {}
	s14[i][1] = {}
	s14[i][1].address = s12[i][1].address + 0xc
	s14[i][1].flags = gg.TYPE_FLOAT
	s14[i][1].name = 'PCurrentOxygen'
	gg.addListItems(s14[i])
	s15[i] = {}
	s15[i][1] = {}
	s15[i][1].address = s12[i][1].address + 0x10
	s15[i][1].flags = gg.TYPE_FLOAT
	s15[i][1].name = 'PCurrentFood'
	gg.addListItems(s15[i])
	s16[i] = {}
	s16[i][1] = {}
	s16[i][1].address = s12[i][1].address + 0x14
	s16[i][1].flags = gg.TYPE_FLOAT
	s16[i][1].name = 'PCurrentWater'
	gg.addListItems(s16[i])	
	s17[i] = {}
	s17[i][1] = {}
	s17[i][1].address = s12[i][1].address + 0x8
	s17[i][1].flags = gg.TYPE_FLOAT
	s17[i][1].name = 'PCurrentTorpor'
	gg.addListItems(s17[i])		
	
	if (s11[i][1].value == math.huge or s11[i][1].value == -math.huge) then
		deV[11] = -1
	else
		deV[11] = 200.0
	end	
else
---------------===============================
--if currentLevel==0 then
	gg.toast("Finding data Player for the first. It can take long time. Please wait")
	gg.setRanges(range)
	gg.setVisible(false)
	gg.searchNumber("10000F;1D;0F;40000000F::29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
	--gg.refineAddress("C", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1, 0)
	gg.refineNumber("40000000", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)

	m = gg.getResultsCount()
	if m >= 6 then
	m = 6
	end
	if m==0 then
	gg.alert("Not found result")
	StartCheat()
	else
		x = gg.getResults(m)
		local a = nil
		a = {}
		local b = nil
		b = {}
		local s1 = nil
		s1 = {}
		local s2 = nil
		s2 = {}
		local s3 = nil
		s3 = {}
		local s4 = nil
		s4 = {}
		local s5 = nil
		s5 = {}
		local s6 = nil
		s6 = {}
		local s7 = nil
		s7 = {}
		local s8 = nil
		s8 = {}
		local s9 = nil
		s9 = {}
		local s10 = nil
		s10 = {}
		local s11 = nil
		s11 = {}
		local s12 = nil
		s12 = {}
		local s13 = nil
		s13 = {}
		local s14 = nil
		s14 = {}
		local s15 = nil
		s15 = {}
		local s16 = nil
		s16 = {}
		local s17 = nil
		s17 = {}
		local s18 = nil
		s18 = {}
		local s19 = nil
		s19 = {}
		local s20 = nil
		s20 = {}
		local s21 = nil
		s21 = {}
		local s22 = nil
		s22 = {}
		local s23 = nil
		s23 = {}
		local s24 = nil
		s24 = {}
		local s25 = nil
		s25 = {}
		local s26 = nil
		s26 = {}
		local s27 = nil
		s27 = {}
		local s28 = nil
		s28 = {}
		local s29 = nil
		s29 = {}
	
		--deV = nil
		for i = 1, m do
			a[i] = {}
			a[i][1] = {}
			a[i][1].address = x[i].address - 0xC
			a[i][1].flags = gg.TYPE_FLOAT
			a[i] = gg.getValues(a[i])
			b[i] = {}
			b[i][1] = {}
			b[i][1].address = x[i].address - 0x1C
			b[i][1].flags = gg.TYPE_FLOAT
			b[i] = gg.getValues(b[i])
			if a[i][1].value>0 and b[i][1].value>9999.0 and b[i][1].value < 10001.0 then
				a[i][1].name = 'exp'
				currentLevel = checkLevel(a[i][1].value);
				currentExp = a[i][1].value
				gg.addListItems(a[i])
				s18[i] = {}
				s18[i][1] = {}
				s18[i][1].address = a[i][1].address - 0x8
				s18[i][1].flags = gg.TYPE_DWORD
				s18[i] = gg.getValues(s18[i])
				currentLevelUpgraded = s18[i][1].value
				s12[i] = {}
				s12[i][1] = {}
				if is64 == true then 
					s12[i][1].address = a[i][1].address + 0x130  --124 32 bit
				else
					s12[i][1].address = a[i][1].address + 0x124
				end
				s12[i][1].flags = gg.TYPE_FLOAT
				s12[i][1].name = 'PCurrentHP'
				gg.addListItems(s12[i])
				s13[i] = {}
				s13[i][1] = {}
				s13[i][1].address = s12[i][1].address + 0x4
				s13[i][1].flags = gg.TYPE_FLOAT
				s13[i][1].name = 'PCurrentStamina'
				gg.addListItems(s13[i])
				s14[i] = {}
				s14[i][1] = {}
				s14[i][1].address = s12[i][1].address + 0xc
				s14[i][1].flags = gg.TYPE_FLOAT
				s14[i][1].name = 'PCurrentOxygen'
				gg.addListItems(s14[i])
				s15[i] = {}
				s15[i][1] = {}
				s15[i][1].address = s12[i][1].address + 0x10
				s15[i][1].flags = gg.TYPE_FLOAT
				s15[i][1].name = 'PCurrentFood'
				gg.addListItems(s15[i])
				s16[i] = {}
				s16[i][1] = {}
				s16[i][1].address = s12[i][1].address + 0x14
				s16[i][1].flags = gg.TYPE_FLOAT
				s16[i][1].name = 'PCurrentWater'
				gg.addListItems(s16[i])	
				s17[i] = {}
				s17[i][1] = {}
				s17[i][1].address = s12[i][1].address + 0x8
				s17[i][1].flags = gg.TYPE_FLOAT
				s17[i][1].name = 'PCurrentTorpor'
				gg.addListItems(s17[i])	
				s1[i] = {}
				s1[i][1] = {}
				if is64 == true then 
					s1[i][1].address = a[i][1].address - 0x5e8  -- 4F4 32 bit
				else
					s1[i][1].address = a[i][1].address -0x4f4
				end
				s1[i][1].flags = gg.TYPE_FLOAT
				s1[i][1].name = 'PmaxHP'
				gg.addListItems(s1[i])
				s1[i] = gg.getValues(s1[i])
				deV[1] = (s1[i][1].value * 10.0) + 100.0
				--gg.alert(deV[1])
				s2[i] = {}
				s2[i][1] = {}
				s2[i][1].address = s1[i][1].address + 0x4
				s2[i][1].flags = gg.TYPE_FLOAT
				s2[i][1].name = 'PmaxStamina'
				gg.addListItems(s2[i])	
				s2[i] = gg.getValues(s2[i])
				deV[2] = (s2[i][1].value * 10.0) + 100.0
				s3[i] = {}
				s3[i][1] = {}
				s3[i][1].address = s1[i][1].address +0xC
				s3[i][1].flags = gg.TYPE_FLOAT
				s3[i][1].name = 'PmaxOxygen'
				gg.addListItems(s3[i])
				s3[i] = gg.getValues(s3[i])
				deV[3] = (s3[i][1].value * 20.0) + 100.0
		
				s4[i] = {}
				s4[i][1] = {}
				s4[i][1].address = s1[i][1].address +0x10
				s4[i][1].flags = gg.TYPE_FLOAT
				s4[i][1].name = 'PmaxFood'
				gg.addListItems(s4[i])	
				s4[i] = gg.getValues(s4[i])
				deV[4] = (s4[i][1].value * 10.0) + 100.0
		
				s5[i] = {}
				s5[i][1] = {}
				s5[i][1].address = s1[i][1].address +0x14
				s5[i][1].flags = gg.TYPE_FLOAT
				s5[i][1].name = 'PmaxWater'
				gg.addListItems(s5[i])	
				s5[i] = gg.getValues(s5[i])
				deV[5] = (s5[i][1].value * 10.0) + 100.0

				s6[i] = {}
				s6[i][1] = {}
				s6[i][1].address = s1[i][1].address +0x1c
				s6[i][1].flags = gg.TYPE_FLOAT
				s6[i][1].name = 'PmaxWeight'
				gg.addListItems(s6[i])				
				s6[i] = gg.getValues(s6[i])
				deV[6] = (s6[i][1].value * 10.0) + 100.0

				s7[i] = {}
				s7[i][1] = {}
				s7[i][1].address = s1[i][1].address +0x20
				s7[i][1].flags = gg.TYPE_FLOAT
				s7[i][1].name = 'PMeleeDamage'
				gg.addListItems(s7[i])	
				s7[i] = gg.getValues(s7[i])
				deV[7] = (s7[i][1].value * 5.0) + 100.0
				s8[i] = {}
				s8[i][1] = {}
				s8[i][1].address = s1[i][1].address +0x24
				s8[i][1].flags = gg.TYPE_FLOAT
				s8[i][1].name = 'PMovementSP'
				gg.addListItems(s8[i])
				s8[i] = gg.getValues(s8[i])
				deV[8] = (s8[i][1].value * 2.0) + 100.0

				s9[i] = {}
				s9[i][1] = {}
				s9[i][1].address = s1[i][1].address +0x28
				s9[i][1].flags = gg.TYPE_FLOAT
				s9[i][1].name = 'PFortitude'
				gg.addListItems(s9[i])
				s9[i] = gg.getValues(s9[i])
				deV[9] = s9[i][1].value * 2.0

				s10[i] = {}
				s10[i][1] = {}
				s10[i][1].address = s1[i][1].address +0x2c
				s10[i][1].flags = gg.TYPE_FLOAT
				s10[i][1].name = 'PCraftingSP'
				gg.addListItems(s10[i])
				s10[i] = gg.getValues(s10[i])
				deV[10] = (s10[i][1].value * 10.0) + 100.0

				s11[i] = {}
				s11[i][1] = {}
				s11[i][1].address = s1[i][1].address +0x8
				s11[i][1].flags = gg.TYPE_FLOAT
				s11[i][1].name = 'PTorpor'
				gg.addListItems(s11[i])
				s11[i] = gg.getValues(s11[i])
				
				s19[i] = {}
				s19[i][1] = {}
				s19[i][1].address = s1[i][1].address - 0x60
				s19[i][1].flags = gg.TYPE_FLOAT
				s19[i][1].name = 'ShowPmaxHP'
				gg.addListItems(s19[i])	
				s19[i] = gg.getValues(s19[i])
				currentMaxStats[1] = s19[i][1].value
				
				s20[i] = {}
				s20[i][1] = {}
				s20[i][1].address = s19[i][1].address + 0x4
				s20[i][1].flags = gg.TYPE_FLOAT
				s20[i][1].name = 'ShowPmaxStamina'
				gg.addListItems(s20[i])	
				s20[i] = gg.getValues(s20[i])
				currentMaxStats[2] = s20[i][1].value
				
				s21[i] = {}
				s21[i][1] = {}
				s21[i][1].address = s19[i][1].address + 0xc
				s21[i][1].flags = gg.TYPE_FLOAT
				s21[i][1].name = 'ShowPmaxOxygen'
				gg.addListItems(s21[i])	
				s21[i] = gg.getValues(s21[i])
				currentMaxStats[3] = s21[i][1].value

				s22[i] = {}
				s22[i][1] = {}
				s22[i][1].address = s19[i][1].address + 0x10
				s22[i][1].flags = gg.TYPE_FLOAT
				s22[i][1].name = 'ShowPmaxFood'
				gg.addListItems(s22[i])	
				s22[i] = gg.getValues(s22[i])
				currentMaxStats[4] = s22[i][1].value

				s23[i] = {}
				s23[i][1] = {}
				s23[i][1].address = s19[i][1].address + 0x14
				s23[i][1].flags = gg.TYPE_FLOAT
				s23[i][1].name = 'ShowPmaxWater'
				gg.addListItems(s23[i])	
				s23[i] = gg.getValues(s23[i])
				currentMaxStats[5] = s23[i][1].value

				s24[i] = {}
				s24[i][1] = {}
				s24[i][1].address = s19[i][1].address + 0x1c
				s24[i][1].flags = gg.TYPE_FLOAT
				s24[i][1].name = 'ShowPmaxWeight'
				gg.addListItems(s24[i])	

				s25[i] = {}
				s25[i][1] = {}
				s25[i][1].address = s19[i][1].address + 0x20
				s25[i][1].flags = gg.TYPE_FLOAT
				s25[i][1].name = 'ShowPMeleeDamage'
				gg.addListItems(s25[i])	

				s26[i] = {}
				s26[i][1] = {}
				s26[i][1].address = s19[i][1].address + 0x24
				s26[i][1].flags = gg.TYPE_FLOAT
				s26[i][1].name = 'ShowPMovementSP'
				gg.addListItems(s26[i])		

				s27[i] = {}
				s27[i][1] = {}
				s27[i][1].address = s19[i][1].address + 0x28
				s27[i][1].flags = gg.TYPE_FLOAT
				s27[i][1].name = 'ShowPFortitude'
				gg.addListItems(s27[i])	

				s28[i] = {}
				s28[i][1] = {}
				s28[i][1].address = s19[i][1].address + 0x2c
				s28[i][1].flags = gg.TYPE_FLOAT
				s28[i][1].name = 'ShowPCraftingSP'
				gg.addListItems(s28[i])	

				s29[i] = {}
				s29[i][1] = {}
				s29[i][1].address = s19[i][1].address + 0x8
				s29[i][1].flags = gg.TYPE_FLOAT
				s29[i][1].name = 'ShowPTorpor'
				gg.addListItems(s29[i])					
				
				if (s11[i][1].value == math.huge or s11[i][1].value == -math.huge) then
					deV[11] = -1
				else
					deV[11] = 200.0
				end
			end
		end
	end
-----------------------------------------	---
if (playerChecked==false) then
	g = math.abs(tonumber(currentMaxStats[1])-1)
	h = math.abs(tonumber(currentMaxStats[1])+1)
	gg.clearResults()
	gg.setRanges(range)
	--gg.alert("61D;1F;"..g.."~"..h.."::21")
	gg.searchNumber("61D;1F;"..g.."~"..h.."::21", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
	gg.refineNumber(g.."~"..h, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
	m = gg.getResultsCount()
	if m==0 then
		gg.alert("Not found results")
		StartCheat()
	else
	x = gg.getResults(m)
	a1 = nil
	a1 = {}
	a2 = nil
	a2 = {}
	a3 = nil
	a3 = {}
	a4 = nil
	a4 = {}
	a5 = nil
	a5 = {}
	a6 = nil
	a6 = {}
	a7 = nil
	a7 = {}
	a8 = nil
	a8 = {}
	a9 = nil
	a9 = {}
	a10 = nil
	a10 = {}
	a11 = nil
	a11 = {}
	a12 = nil
	a12 = {}
	a13 = nil
	a13 = {}
	a14 = nil
	a14 = {}
	a15 = nil
	a15 = {}
	a16 = nil
	a16 = {}	
		for i = 1, m do
			a1[i] = {}
			a1[i][1] = {}
			a1[i][1].address = x[i].address - 0x14
			a1[i][1].flags = gg.TYPE_DWORD
			a1[i] = gg.getValues(a1[i])
			a2[i] = {}
			a2[i][1] = {}
			a2[i][1].address = x[i].address - 0x8
			a2[i][1].flags = gg.TYPE_FLOAT
			a2[i] = gg.getValues(a2[i])
			if (a1[i][1].value ~=nil and math.abs(a1[i][1].value -61)<0.01 and a2[i][1].value ~=nil and math.abs(a2[i][1].value -1.0)<0.01) then
				playerChecked = true
				a15[i] = {}
				a15[i][1] = {}
				a15[i][1].address = x[i].address
				a15[i][1].flags = gg.TYPE_FLOAT
				a15[i][1].name = 'PForceMaxHP'
				--b[i][2].value = '5'
				gg.addListItems(a15[i])
				
				a16[i] = {}
				a16[i][1] = {}
				if is64==true then 
				a16[i][1].address = x[i].address -0x9ac
				else
				a16[i][1].address = x[i].address - 0x788
				end
				a16[i][1].flags = gg.TYPE_DWORD
				a16[i][1].name = 'Player_ID'
				gg.addListItems(a16[i])
				a16[i] = gg.getValues(a16[i])
				backupPlayerID = tonumber(a16[i][1].value)
				
				a3[i] = {}
				a3[i][1] = {}
				if is64==true then 
				a3[i][1].address = x[i].address + 0xe74  
				else
				a3[i][1].address = x[i].address + 0xc60
				end
				a3[i][1].flags = gg.TYPE_FLOAT
				a3[i][1].name = 'Pbody_r'
				gg.addListItems(a3[i])	
				a3[i] = gg.getValues(a3[i])
				PlistIDValueDefault[1] = a3[i][1].value
				a4[i] = {}
				a4[i][1] = {}
				a4[i][1].address = a3[i][1].address + 0x4
				a4[i][1].flags = gg.TYPE_FLOAT
				a4[i][1].name = 'Pbody_g'
				gg.addListItems(a4[i])	
				a4[i] = gg.getValues(a4[i])
				PlistIDValueDefault[2] = a4[i][1].value
				a5[i] = {}
				a5[i][1] = {}
				a5[i][1].address = a3[i][1].address + 0x8
				a5[i][1].flags = gg.TYPE_FLOAT
				a5[i][1].name = 'Pbody_b'
				gg.addListItems(a5[i])	
				a5[i] = gg.getValues(a5[i])
				PlistIDValueDefault[3] = a5[i][1].value
				a6[i] = {}
				a6[i][1] = {}
				a6[i][1].address = a3[i][1].address + 0xc
				a6[i][1].flags = gg.TYPE_FLOAT
				a6[i][1].name = 'Pbody_a'
				gg.addListItems(a6[i])	
				a6[i] = gg.getValues(a6[i])
				PlistIDValueDefault[4] = a6[i][1].value
				a7[i] = {}
				a7[i][1] = {}
				a7[i][1].address = a3[i][1].address + 0x10
				a7[i][1].flags = gg.TYPE_FLOAT
				a7[i][1].name = 'Phair_r'
				gg.addListItems(a7[i])	
				a7[i] = gg.getValues(a7[i])
				PlistIDValueDefault[5] = a7[i][1].value			
				a8[i] = {}
				a8[i][1] = {}
				a8[i][1].address = a3[i][1].address + 0x14
				a8[i][1].flags = gg.TYPE_FLOAT
				a8[i][1].name = 'Phair_g'
				gg.addListItems(a8[i])	
				a8[i] = gg.getValues(a8[i])
				PlistIDValueDefault[6] = a8[i][1].value			
				a9[i] = {}
				a9[i][1] = {}
				a9[i][1].address = a3[i][1].address + 0x18
				a9[i][1].flags = gg.TYPE_FLOAT
				a9[i][1].name = 'Phair_b'
				gg.addListItems(a9[i])	
				a9[i] = gg.getValues(a9[i])
				PlistIDValueDefault[7] = a9[i][1].value			
				a10[i] = {}
				a10[i][1] = {}
				a10[i][1].address = a3[i][1].address + 0x1c
				a10[i][1].flags = gg.TYPE_FLOAT
				a10[i][1].name = 'Phair_a'
				gg.addListItems(a10[i])	
				a10[i] = gg.getValues(a10[i])
				PlistIDValueDefault[8] = a10[i][1].value			
				a11[i] = {}
				a11[i][1] = {}
				a11[i][1].address = a3[i][1].address + 0x20
				a11[i][1].flags = gg.TYPE_FLOAT
				a11[i][1].name = 'Peyes_r'
				gg.addListItems(a11[i])	
				a11[i] = gg.getValues(a11[i])
				PlistIDValueDefault[9] = a11[i][1].value
				a12[i] = {}
				a12[i][1] = {}
				a12[i][1].address = a3[i][1].address + 0x24
				a12[i][1].flags = gg.TYPE_FLOAT
				a12[i][1].name = 'Peyes_g'
				gg.addListItems(a12[i])	
				a12[i] = gg.getValues(a12[i])
				PlistIDValueDefault[10] = a12[i][1].value
				a13[i] = {}
				a13[i][1] = {}
				a13[i][1].address = a3[i][1].address + 0x28
				a13[i][1].flags = gg.TYPE_FLOAT
				a13[i][1].name = 'Peyes_b'
				gg.addListItems(a13[i])	
				a13[i] = gg.getValues(a13[i])
				PlistIDValueDefault[11] = a13[i][1].value
				a14[i] = {}
				a14[i][1] = {}
				a14[i][1].address = a3[i][1].address + 0x2c
				a14[i][1].flags = gg.TYPE_FLOAT
				a14[i][1].name = 'Peyes_a'
				gg.addListItems(a14[i])	
				a14[i] = gg.getValues(a14[i])
				PlistIDValueDefault[12] = a14[i][1].value
			end	
		end
	end	
else
	a1 = nil
	a1 = {}
	a2 = nil
	a2 = {}
	a3 = nil
	a3 = {}
	a4 = nil
	a4 = {}
	a5 = nil
	a5 = {}
	a6 = nil
	a6 = {}
	a7 = nil
	a7 = {}
	a8 = nil
	a8 = {}
	a9 = nil
	a9 = {}
	a10 = nil
	a10 = {}
	a11 = nil
	a11 = {}
	a12 = nil
	a12 = {}
	a13 = nil
	a13 = {}
	a14 = nil
	a14 = {}
	a15 = nil
	a15 = {}
	a16 = nil
	a16 = {}	
	local ros = gg.getListItems()
    for i, v in ipairs(ros) do
      if v.name == "Player_ID" then
		a15[i] = {}
		a15[i][1] = {}
		if is64==true then
		a15[i][1].address = v.address + 0x9ac
		else
		a15[i][1].address = v.address + 0x788
		end
		a15[i][1].flags = gg.TYPE_FLOAT
		a15[i][1].name = 'PForceMaxHP'
		gg.addListItems(a15[i])
		
		a3[i] = {}
		a3[i][1] = {}
		if is64==true then 
		a3[i][1].address = a15[i][1].address + 0xe74  
		else
		a3[i][1].address = a15[i][1].address + 0xc60
		end
		a3[i][1].flags = gg.TYPE_FLOAT
		a3[i][1].name = 'Pbody_r'
		gg.addListItems(a3[i])	
		a3[i] = gg.getValues(a3[i])
		PlistIDValueDefault[1] = a3[i][1].value
		a4[i] = {}
		a4[i][1] = {}
		a4[i][1].address = a3[i][1].address + 0x4
		a4[i][1].flags = gg.TYPE_FLOAT
		a4[i][1].name = 'Pbody_g'
		gg.addListItems(a4[i])	
		a4[i] = gg.getValues(a4[i])
		PlistIDValueDefault[2] = a4[i][1].value
		a5[i] = {}
		a5[i][1] = {}
		a5[i][1].address = a3[i][1].address + 0x8
		a5[i][1].flags = gg.TYPE_FLOAT
		a5[i][1].name = 'Pbody_b'
		gg.addListItems(a5[i])	
		a5[i] = gg.getValues(a5[i])
		PlistIDValueDefault[3] = a5[i][1].value
		a6[i] = {}
		a6[i][1] = {}
		a6[i][1].address = a3[i][1].address + 0xc
		a6[i][1].flags = gg.TYPE_FLOAT
		a6[i][1].name = 'Pbody_a'
		gg.addListItems(a6[i])	
		a6[i] = gg.getValues(a6[i])
		PlistIDValueDefault[4] = a6[i][1].value
		a7[i] = {}
		a7[i][1] = {}
		a7[i][1].address = a3[i][1].address + 0x10
		a7[i][1].flags = gg.TYPE_FLOAT
		a7[i][1].name = 'Phair_r'
		gg.addListItems(a7[i])	
		a7[i] = gg.getValues(a7[i])
		PlistIDValueDefault[5] = a7[i][1].value			
		a8[i] = {}
		a8[i][1] = {}
		a8[i][1].address = a3[i][1].address + 0x14
		a8[i][1].flags = gg.TYPE_FLOAT
		a8[i][1].name = 'Phair_g'
		gg.addListItems(a8[i])	
		a8[i] = gg.getValues(a8[i])
		PlistIDValueDefault[6] = a8[i][1].value			
		a9[i] = {}
		a9[i][1] = {}
		a9[i][1].address = a3[i][1].address + 0x18
		a9[i][1].flags = gg.TYPE_FLOAT
		a9[i][1].name = 'Phair_b'
		gg.addListItems(a9[i])	
		a9[i] = gg.getValues(a9[i])
		PlistIDValueDefault[7] = a9[i][1].value			
		a10[i] = {}
		a10[i][1] = {}
		a10[i][1].address = a3[i][1].address + 0x1c
		a10[i][1].flags = gg.TYPE_FLOAT
		a10[i][1].name = 'Phair_a'
		gg.addListItems(a10[i])	
		a10[i] = gg.getValues(a10[i])
		PlistIDValueDefault[8] = a10[i][1].value			
		a11[i] = {}
		a11[i][1] = {}
		a11[i][1].address = a3[i][1].address + 0x20
		a11[i][1].flags = gg.TYPE_FLOAT
		a11[i][1].name = 'Peyes_r'
		gg.addListItems(a11[i])	
		a11[i] = gg.getValues(a11[i])
		PlistIDValueDefault[9] = a11[i][1].value
		a12[i] = {}
		a12[i][1] = {}
		a12[i][1].address = a3[i][1].address + 0x24
		a12[i][1].flags = gg.TYPE_FLOAT
		a12[i][1].name = 'Peyes_g'
		gg.addListItems(a12[i])	
		a12[i] = gg.getValues(a12[i])
		PlistIDValueDefault[10] = a12[i][1].value
		a13[i] = {}
		a13[i][1] = {}
		a13[i][1].address = a3[i][1].address + 0x28
		a13[i][1].flags = gg.TYPE_FLOAT
		a13[i][1].name = 'Peyes_b'
		gg.addListItems(a13[i])	
		a13[i] = gg.getValues(a13[i])
		PlistIDValueDefault[11] = a13[i][1].value
		a14[i] = {}
		a14[i][1] = {}
		a14[i][1].address = a3[i][1].address + 0x2c
		a14[i][1].flags = gg.TYPE_FLOAT
		a14[i][1].name = 'Peyes_a'
		gg.addListItems(a14[i])	
		a14[i] = gg.getValues(a14[i])
		PlistIDValueDefault[12] = a14[i][1].value
      end
    end
end	
		
end
	for i = 1, #deV do
		if (deV[i] == math.huge or deV[i] == -math.huge or deV[i]~= deV[i]) then
		deV[i] = -1
		end
		--gg.toast(deV)
	end
------------------------
menu = gg.choice({
"🏋 CUSTOM STATS",
"📋 ENGRAM POINTS",
"🎨 CUSTOM COLOR",
"💪 FILL STATS",
"👑 PRIMAL PASS (FAKE)\nCan not Save after restart game",
"📤 INCREASE SLOT TAME CREATURES (FAKE)\nCan not Save after restart game",
"🔙 Back"},nil,"~~~~~~~~~~Made By GodOfGods~~~~~~~~~~")

if menu == 1 then CustomPlayer() end
if menu == 2 then EngramPoints() end
if menu == 3 then 
PlayerColor() end

if menu == 4 then 
FillStatsPlayer() end

if menu == 5 then 
PrimalPass() end

if menu == 6 then 
IncreaseSlotTame() end

if menu == 7 then StartCheat() end


if menu == nil then 
noselect()
end


   gg.isVisible(true)
   while true do
  if gg.isVisible() then
    gg.setVisible(false)
    PlayerOption()
  else
    gg.sleep(100) 
    end
    end
end

function EngramPoints()
gg.clearResults()
testAd = false
local tt = {}
local ttt = {}
local t = {"libUE4.so", "Cd"}
if is64 then
	if gversion==2028 then
	tt = {0x417C38,0x108,0x688,0x134}-- 2.0.28
	else
	tt = {0x418CD8, 0x108,0x688,0x134} -- 2.0.29
	end
else
if gversion==2028 then
tt = {0x22C344,0x80C,0x528,0x10C}
else
tt = {0x22C5C8,0x80C,0x528,0x10C}
--tt = {0x20B568,0xCC,0xBB8,0x0,0x10C}
end
end
ttt = S_Pointer(t, tt, true)
 local k ={}
if tonumber(ttt)~=nil then
	k[1] = {}
	k[1].address = tonumber(ttt) - 0x8
	k[1].flags = gg.TYPE_FLOAT
	k[2] = {}
	k[2].address = tonumber(ttt) - 0xC
	k[2].flags = gg.TYPE_DWORD
	k = gg.getValues(k)
	if (math.abs(k[2].value - currentLevelUpgraded)<1 and math.abs(k[1].value-currentExp)<15) then
		testAd = true
		local a = ttt
		ttt={}
		ttt[1] = a
	end
end
if testAd == false then
	local te = gg.getListItems()
	ttt ={}
	j=1
	for i, v in ipairs(te) do
	  if v.name == "PEngrams" then
		k[i] = {}
	  	k[i][1] = {}
		k[i][1].address = te[i].address - 0x8
		k[i][1].flags = gg.TYPE_FLOAT
		k[i][2] = {}
		k[i][2].address = te[i].address - 0xc
		k[i][2].flags = gg.TYPE_DWORD
		k[i] = gg.getValues(k[i])
		if (math.abs(k[i][2].value - currentLevelUpgraded)<1 and math.abs(k[i][1].value-currentExp)<15) then
			testAd = true
			ttt[j]= te[i].address
			j=j+1
		end
	  end
	end
end

if (testAd==false) then
	if (currentLevelUpgraded<=0) then
	gg.toast('You cannot get more engrams if you have never leveled up! You must level >=2 to change engrams points')
	else
--------------------------------------	
		m1 = tonumber(currentExp)
		m2 =math.abs(tonumber(currentExp)+10.0)
		if (currentLevelUpgraded>0) then
			gg.clearResults()
			gg.setRanges(range)
			gg.setVisible(false)
			gg.searchNumber(currentLevelUpgraded.."D;"..m1.."~"..m2.."::5", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
			--gg.refineAddress("C", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1, 0)
			gg.refineNumber(currentLevelUpgraded, gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)

			m = gg.getResultsCount()
			if m==0 then
			gg.alert("Not found result")
			PlayerOption()
			else
				x = gg.getResults(m)
				local a = nil
				a = {}
				local a1 = nil
				a1 = {}
				local a2 = nil
				a2 = {}
				ttt ={}
				j=1
				for i = 1, m do
					a[i] = {}
					a[i][1] = {}
					a[i][1].address = x[i].address - 0x4
					a[i][1].flags = gg.TYPE_FLOAT
					a[i] = gg.getValues(a[i])
					if math.abs(a[i][1].value) < 0.01 then
						a1[i] = {}
						a1[i][1] = {}
						a1[i][1].address = x[i].address + 0xc
						a1[i][1].flags = gg.TYPE_DWORD
						a1[i][1].name = 'PEngrams'
						ttt[j]= a1[i][1].address
						j=j+1
						gg.addListItems(a1[i])
						a1[i] = gg.getValues(a1[i])
						currentEngrams = a1[i][1].value
						testAd=true
					end
				end
			end	
		else
		gg.alert('You cannot get more engrams if you have never leveled up! You must level >=2 to change engrams points')
		end
	end	
end
		---
if (testAd) then
	k[1] = {}
	k[1].address = tonumber(ttt[1])
	k[1].flags = gg.TYPE_DWORD
	k = gg.getValues(k)
	currentEngrams = k[1].value
	n = gg.prompt({
	 'CURRENT ENGRAMS POINTS: ',
	 'FREE LEARN ENGRAMS\nIgnore the requires engrams to learn'
	 },
	 {currentEngrams, true}, 
	 {'number', 'checkbox'})
	  if n == nil then 
	  gg.toast("CANCELLED")
	  gg.sleep(1)
	  PlayerOption()
	  else
			if n[2] == true then
				if is64 == true then
					LibStart=gg.getRangesList('libUE4.so')[1].start
					APEXGG=nil
					APEXGG={}
					APEXGG[1]={}
					APEXGG[2]={}
					if gversion==2028 then
					APEXGG[1].address=LibStart+0x2A3BB0C
					else
					APEXGG[1].address=LibStart+0x2A36634
					end
					APEXGG[1].value='h200080D2'
					APEXGG[1].flags=4
					if gversion==2028 then
					APEXGG[2].address=LibStart+(0x2A3BB0C+0x4)
					else
					APEXGG[2].address=LibStart+(0x2A36634+0x4)
					end
					APEXGG[2].value='hC0035FD6'
					APEXGG[2].flags=4
					gg.setValues(APEXGG)
				else
					LibStart=gg.getRangesList('libUE4.so')[1].start
					APEXGG=nil
					APEXGG={}
					APEXGG[1]={}
					APEXGG[2]={}
					if gversion==2028 then
					APEXGG[1].address=LibStart+0x219204C	
					else
					APEXGG[1].address=LibStart+0x219118C
					end
					APEXGG[1].value='h0100A0E3'
					APEXGG[1].flags=4
					if gversion == 2028 then
					APEXGG[2].address=LibStart+(0x219204C+0x4)
					else
					APEXGG[2].address=LibStart+(0x219118C+0x4)
					end
					APEXGG[2].value='h1EFF2FE1'
					APEXGG[2].flags=4
					gg.setValues(APEXGG)
				--gg.alert("This change is not for 32 bit processor")
				end
			end
			if (currentEngrams ~= n[1]) then
				currentEngrams = tonumber(n[1])
			end
			for i = 1, #ttt do
				k[i] = {}
				k[i][1] = {}
				k[i][1].address = tonumber(ttt[i])
				k[i][1].flags = gg.TYPE_DWORD
				k[i][1].value = tonumber(n[1])
				gg.setValues(k[i])
			end
			gg.alert("Successful change. Need save and restart game to see change.")
	  end
else
gg.alert("Not found. Let's try again")
PlayerOption()
end
end

function FillStatsPlayer()
local ros = gg.getListItems()
    for i, v in ipairs(ros) do
		if v.name == "PCurrentHP" then
			v.flags = gg.TYPE_FLOAT
			v.value = currentMaxStats[1]
		end
	  if v.name == "PCurrentStamina" then
			v.flags = gg.TYPE_FLOAT
			v.value = currentMaxStats[2]
	  end
	  if v.name == "PCurrentOxygen" then
			v.flags = gg.TYPE_FLOAT
			v.value = currentMaxStats[3]
	  end
	  if v.name == "PCurrentFood" then
			v.flags = gg.TYPE_FLOAT
			v.value = currentMaxStats[4]
	  end
	  if v.name == "PCurrentWater" then
			v.flags = gg.TYPE_FLOAT
			v.value = currentMaxStats[5]
	  end
	  if v.name == "PCurrentTorpor" then
			v.flags = gg.TYPE_FLOAT
			v.value = '0'
	  end	  
    end

    gg.setValues(ros)
    gg.addListItems(ros)
	gg.toast("Filled Stats!")
end

function PlayerColor()
n = gg.prompt({
'CURRENT TORSO RED VALUE (R):',
'CURRENT TORSO GREEN VALUE (G):',
'CURRENT TORSO BLUE VALUE (B):',
'CURRENT TORSO ALPHA VALUE (A):',	
'CURRENT HAIR RED VALUE (R):',
'CURRENT HAIR AND HEAD GREEN VALUE (G):',
'CURRENT HAIR AND HEAD BLUE VALUE (B):',
'CURRENT HAIRAND HEAD ALPHA VALUE (A):',
'CURRENT EYES RED VALUE (R):',
'CURRENT EYES PARTS GREEN VALUE (G):',
'CURRENT EYES PARTS BLUE VALUE (B):',
'CURRENT EYES PARTS ALPHA VALUE (A):'}, 
{PlistIDValueDefault[1], PlistIDValueDefault[2], PlistIDValueDefault[3], PlistIDValueDefault[4], PlistIDValueDefault[5], PlistIDValueDefault[6], PlistIDValueDefault[7], PlistIDValueDefault[8], PlistIDValueDefault[9], PlistIDValueDefault[10], PlistIDValueDefault[11], PlistIDValueDefault[12]}, 
{'number','number','number','number','number','number', 'number', 'number', 'number', 'number', 'number', 'number'})
if n == nil then 
gg.sleep(1)
gg.toast("CANCELLED")
PlayerOption()
else
	local foc = gg.getListItems()
	for i, v in ipairs(foc) do
		for j = 1, #PlistID do
			if v.name == PlistID[j] then
				v.value = n[j]
				PlistIDValueDefault[j] = n[j]
			end
		end
	end
	gg.setValues(foc)
	gg.addListItems(foc)
	gg.alert('Changed! EQUIP or UNEQUIP to update change')
end -- from else

while true do
  if gg.isVisible() then
    gg.setVisible(false)
    PlayerColor()
  else
    gg.sleep(100) 
    end
    end
end

function CustomPlayer()
n = gg.prompt({'CURRENT LEVEL: [1;100]',
 'CURRENT MAX HEALTH\n(-1: for infinite, 0: no change, any number >0 for change)',
 'CURRENT MAX STAMINA\n(-1: for infinite, 0: no change, any number >100 for change)',
 'CURRENT MAX OXYGEN\n(-1: for infinite, 0: no change, any number >100 for change)',
 'CURRENT MAX FOOD\n(-1: for infinite, 0: no change, any number >100 for change)',
 'CURRENT MAX WATER\n(-1: for infinite, 0: no change, any number >100 for change)',
 'CURRENT MAX WEIGHT\n(-1: for infinite, 0: no change, any number >100 for change)',
 'CURRENT MELEE DAMAGE\n(-1: for infinite, 0: no change, any number >100 for change)',
 'CURRENT MOVEMENT SPEED\n(0: no change, any number >100 for change)',
 'CURRENT FORTITUDE\n(-1: for infinite, 0: no change, any number >0 for change)',
 'CURRENT CRAFTING SPEED\n(-1: for infinite, 0: no change, any number >100 for change)',
 'CURRENT MAX TORPOR\n(-1 for infinite and can not change for any value)',
 'FILL CURRENT STATS PLAYER TO MAX'
 },
 {currentLevel, deV[1], deV[2], deV[3], deV[4], deV[5], deV[6], deV[7], deV[8], deV[9], deV[10], deV[11], true}, 
 {'number', 'number', 'number', 'number', 'number', 'number', 'number', 'number', 'number', 'number', 'number', 'number', 'checkbox'})
  if n == nil then 
  gg.toast("CANCELLED")
  gg.sleep(1)
  PlayerOption()
  else
	local ros = gg.getListItems()
    for i, v in ipairs(ros) do
      if v.name == "exp" then
        v.flags = gg.TYPE_FLOAT
		  if (currentLevel ~= n[1]) then
			  currentLevel = n[1]
			  toexp = expLevel[tonumber(currentLevel)]
			  v.value = toexp
		  end
      end
	  if (v.name == "PmaxHP" or v.name == "PCurrentHP" or v.name == "ShowPmaxHP") and n[2]~=0 then
		if tonumber(n[2]) > -1.1 and tonumber(n[2]) < -0.9 then
			v.flags = gg.TYPE_DWORD
			v.value = '2139095040'
		else
			if v.name == "PmaxHP" then
				v.flags = gg.TYPE_FLOAT
				v.value = (tonumber(n[2])-100.0)/10.0
			end
			if v.name == "PCurrentHP" or v.name == "ShowPmaxHP" and n[13] == true then
				v.flags = gg.TYPE_FLOAT
				v.value = tonumber(n[2])
				currentMaxStats[1] = tonumber(n[2])
			end
		end
	  end
	  if (v.name == "PmaxStamina" or v.name == "PCurrentStamina" or v.name == "ShowPmaxStamina") and n[3]~=0 then
		if tonumber(n[3]) > -1.1 and tonumber(n[3]) < -0.9 then
			--if v.name == "PmaxStamina" then
				v.flags = gg.TYPE_DWORD
				v.value = '2139095040'
			--end
		else
			if v.name == "PmaxStamina" then
				v.flags = gg.TYPE_FLOAT
				v.value = (tonumber(n[3])-100.0)/10.0
			end
			if v.name == "PCurrentStamina" or v.name == "ShowPmaxStamina" and n[13] == true then
				v.flags = gg.TYPE_FLOAT
				v.value = tonumber(n[3])
				--v.value = tonumber(deV[2])
				currentMaxStats[2] = tonumber(n[3])
			end
		end
	  end
	  if (v.name == "PmaxOxygen" or v.name == "PCurrentOxygen" or v.name == "ShowPmaxOxygen") and n[4]~=0 then
		if tonumber(n[4]) > -1.1 and tonumber(n[4]) < -0.9 then
			v.flags = gg.TYPE_DWORD
			v.value = '2139095040'
		else
			if v.name == "PmaxOxygen" then
				v.flags = gg.TYPE_FLOAT
				v.value = (tonumber(n[4])-100.0)/20.0
			end
			if v.name == "PCurrentOxygen" or v.name == "ShowPmaxOxygen" and n[13] == true then
				v.flags = gg.TYPE_FLOAT
				v.value = tonumber(n[4])
				currentMaxStats[3] = tonumber(n[4])
			end
			
		end
	  end
	  if (v.name == "PmaxFood" or v.name == "PCurrentFood" or v.name == "ShowPmaxFood") and n[5]~=0 then
		if tonumber(n[5]) > -1.1 and tonumber(n[5]) < -0.9 then
			v.flags = gg.TYPE_DWORD
			v.value = '2139095040'
		else
			if v.name == "PmaxFood" then
				v.flags = gg.TYPE_FLOAT
				v.value = (tonumber(n[5])-100.0)/10.0
			end
			if v.name == "PCurrentFood" or v.name == "ShowPmaxFood" and n[13] == true then
				v.flags = gg.TYPE_FLOAT
				v.value = tonumber(n[5])
				currentMaxStats[4] = tonumber(n[5])
			end
		end
	  end
	  if (v.name == "PmaxWater" or v.name == "PCurrentWater" or v.name == "ShowPmaxWater") and n[6]~=0 then
		if tonumber(n[6]) > -1.1 and tonumber(n[6]) < -0.9 then
			v.flags = gg.TYPE_DWORD
			v.value = '2139095040'
		else
			if v.name == "PmaxWater" then
				v.flags = gg.TYPE_FLOAT
				v.value = (tonumber(n[6])-100.0)/10.0
			end
			if v.name == "PCurrentWater" or v.name == "ShowPmaxWater" and n[13] == true then
				v.flags = gg.TYPE_FLOAT
				v.value = tonumber(n[6])
				currentMaxStats[5] = tonumber(n[6])
			end
		end
	  end
	  if v.name == "PmaxWeight" or v.name == "ShowPmaxWeight" and n[7]~=0 then
		if tonumber(n[7]) > -1.1 and tonumber(n[7]) < -0.9 then
			v.flags = gg.TYPE_DWORD
			v.value = '2139095040'
		else
			if v.name == "PmaxWeight" then 
				v.flags = gg.TYPE_FLOAT
				v.value = (tonumber(n[7])-100.0)/10.0
			end
			if v.name == "ShowPmaxWeight" then
				v.flags = gg.TYPE_FLOAT
				v.value = tonumber(n[7])
			end
		end
	  end
	  if v.name == "PMeleeDamage" or v.name == "ShowPMeleeDamage" and n[8]~=0 then
		if tonumber(n[8]) > -1.1 and tonumber(n[8]) < -0.9 then
			v.flags = gg.TYPE_DWORD
			v.value = '2139095040'
		else
			if v.name == "PMeleeDamage" then 
				v.flags = gg.TYPE_FLOAT
				v.value = (tonumber(n[8])-100.0)/5.0
			end
			if v.name == "ShowPMeleeDamage" then 
				v.flags = gg.TYPE_FLOAT
				v.value = (tonumber(n[8])-100.0)*0.01
			end
		end
	  end
	  if v.name == "PMovementSP" or v.name == "ShowPMovementSP" and n[9]~=0 then
		if tonumber(n[9]) > -1.1 and tonumber(n[9]) < -0.9 then
			v.flags = gg.TYPE_DWORD
			--v.value = '2139095040'
			n[9]=0
		else
			if v.name == "PMovementSP" then
				v.flags = gg.TYPE_FLOAT
				v.value = (tonumber(n[9])-100.0)/2.0
			end
			if v.name == "ShowPMovementSP" then
				v.flags = gg.TYPE_FLOAT
				v.value = (tonumber(n[9])-100.0)* 0.01
			end
		end
	  end
	  if v.name == "PFortitude" or v.name == "ShowPFortitude" and n[10]~=0 then
		if tonumber(n[10]) > -1.1 and tonumber(n[10]) < -0.9 then
			v.flags = gg.TYPE_DWORD
			v.value = '2139095040'
		else
			if v.name == "PFortitude" then
				v.flags = gg.TYPE_FLOAT
				v.value = tonumber(n[10])/2.0
			end
			if v.name == "ShowPFortitude" then
				v.flags = gg.TYPE_FLOAT
				v.value = tonumber(n[10])
			end
		end
	  end
	  if v.name == "PCraftingSP" or v.name == "ShowPCraftingSP" and n[11]~=0 then
		if tonumber(n[11]) > -1.1 and tonumber(n[11]) < -0.9 then
			v.flags = gg.TYPE_DWORD
			v.value = '2139095040'
		else
			if v.name == "PCraftingSP" then
				v.flags = gg.TYPE_FLOAT
				v.value = (tonumber(n[11])-100.0)/10.0
			end
			if v.name == "ShowPCraftingSP" then
				v.flags = gg.TYPE_FLOAT
				v.value = (tonumber(n[11])-100.0)*0.01
			end
		end
	  end
	  if (v.name == "PTorpor" or v.name == "PCurrentTorpor" or v.name == "ShowPTorpor") and n[12]~=0 then
		if tonumber(n[12]) > -1.1 and tonumber(n[12]) < -0.9 then
			if v.name == "PTorpor" or v.name == "ShowPTorpor" then
			v.flags = gg.TYPE_DWORD
			v.value = '2139095040'
			end
			if v.name == "PCurrentTorpor" then
			v.flags = gg.TYPE_FLOAT
			v.value = '0'
			end
		else
			if v.name == "PTorpor" or v.name == "ShowPTorpor" then
				v.flags = gg.TYPE_FLOAT
				v.value = '200'
			end
			if v.name == "PCurrentTorpor" and n[13] == true then
				v.flags = gg.TYPE_FLOAT
				v.value = '0'
			end
		end
	  end	  
    end
	for j=1, #deV do
		if (j~=8) then
			deV[j] = n[j+1]
		else
			if (tonumber(n[j])>0) then
			deV[j] = n[j+1]
			end
		end
	end
    gg.alert("Successful change. Maybe need to restart game if nothing change. \nMore These changes may disappear after you die. Using any character upgrade points will permanently save changes even if you die ")
    gg.setValues(ros)
    gg.addListItems(ros)
  end	 

end


function GodConsole()
menu = gg.choice({
"🚀 TELEPORT",
"🔦 "..chStatus[3] .. "BRIGHT NIGHT",
"🎈 "..chStatus[4] .. "FLY",
"🎽 "..chStatus[5] .. "INVULNERABLE",
"🎯 "..chStatus[6] .. "INFINITE AMMO",
"🛸 SPEED",
"🌓 ADVANCE DAY",
"💖 HEAL ALL",
"🔙 Back"},nil,"~~~~~~~~~~Made By GodOfGods~~~~~~~~~~")

if menu == 1 then Teleport() end

if menu == 2 then 
Status(3)
BrightNight() end

if menu == 3 then 
Status(4)
Fly() end

if menu == 4 then 
Status(5)
invAndInf(5) end

if menu == 5 then 
Status(6)
invAndInf(6) end

if menu == 6 then 
SpeedGame() end

if menu == 7 then 
advanceDay() end

if menu == 8 then 
HealAll() end

if menu == 9 then StartCheat() end


if menu == nil then 
noselect()
end


   gg.isVisible(true)
   while true do
  if gg.isVisible() then
    gg.setVisible(false)
    GodConsole()
  else
    gg.sleep(100) 
    end
    end
end


function TestChangeLib()
LibStart=gg.getRangesList('libUE4.so')[1].start
APEXGG=nil
APEXGG={}
APEXGG[1]={}
--APEXGG[2]={}
APEXGG[1].address=LibStart+0x2AB0694
APEXGG[1].value='h07000014'
APEXGG[1].flags=4
--APEXGG[2].address=LibStart+(0x2AC84B4+0x4)
--APEXGG[2].value='hC0035FD6'
--APEXGG[2].flags=4
gg.setValues(APEXGG)
end

function Dino()
if (currentIDCreature>0) then
	title = ArrayDinos[currentIDCreature][1].." | Lv: "..(tonumber(ArrayDinos[currentIDCreature][3])+ tonumber(ArrayDinos[currentIDCreature][4])).." | HP: "..round(ArrayDinos[currentIDCreature][5]).."/"..round(ArrayDinos[currentIDCreature][6])
else
	title = "BACK and Return to change info data another CREATURE that you want to change"
end
menu = gg.choice({"👉 TAMING WILD CREATURE",
"👉 REQUEST CREATURE",
"👉 VIEW AND CUSTOM STATS",
"👉 FILL STATS CREATURE",
"👉 CUSTOM COLOR",
"👉 UNLIMIT LEVEL CREATURE\n      Redesign creature with custom level",
"👉 BREEDING & MUTATIONS",
"👉 OTHER",
"👉 OTHER SPECIAL PROPERTIES",
"👉 "..chStatus[7] .. "UNLIMITED ANIMAL FECES\n      Make CREATURE drop Feces",
"👉 RESIZE CREATURE (FAKE)\n      Change size CREATURE. Can not save after reset game",
"👉 REVIVAL CREATURE\n      Revival creature from dead body",
"🦖 CHANGE CREATURE TARGET",
"🔙 BACK"},nil,title)

if menu == 1 then TameDinos() end

if menu == 2 then 
RequestCreature() 
end

if menu == 3 then 
CustomStatsDino() 
end

if menu == 4 then 
FillStatsDino(0) 
end

if menu == 5 then 
--CustomColorDino() 
SelectionColorSaved()
end

if menu == 6 then 
UnlimitLevelUp(0) end

if menu == 7 then 
BreedAndMutation() end

if menu == 8 then 
CustomDinoOther() end


if menu == 9 then 
SpecialOther() end

if menu == 10 then 
Status(7)
unlimitedFeces() 
end

if menu == 11 then 
ResizeDino() end

if menu == 12 then 
RevivalCreature() end

if menu == 13 then 
DinosOption() end

if menu == 14 then 
DinosOption() end


if menu == nil then 
noselect()
end


   gg.isVisible(true)
   while true do
  if gg.isVisible() then
    gg.setVisible(false)
    Dino()
  else
    gg.sleep(100) 
    end
    end
end

function RevivalCreature()
local foc = gg.getListItems()
	for i, v in ipairs(foc) do
		if v.name == "revivalCR" then
			v.flags = gg.TYPE_DWORD
			v.value = '0'
		end
	end
	gg.setValues(foc)
	gg.addListItems(foc)
	FillStatsDino(1)
	gg.alert("Changed. Save and restart to see creature stand up")
end

function RequestCreature()
local testAd = testData()
if testAd==false then
	local del = {}
	local te = gg.getListItems()
	for i, v in ipairs(te) do
	  if (v.name == "PlayerX" or v.name == "PlayerY" or v.name == "PlayerZ") then
		table.insert(del, te[i].address)
	  end
	end
		gg.removeListItems(del)
	GetArray(0)
end	

menu = gg.choice({
"⭐ TELEPORT CREATURE TO PLAYER",
"⭐ TELEPORT PLAYER TO CREATURE",
"⭐ CUSTOM TELEPORT PLAYER AND CREATURE",
"🔙 BACK"},nil,"Selection method to teleport")

if menu == 1 then 
local PL = nil
PL = {}
local CR = nil
CR = {}
local forceCR = nil
forceCR = {}
	if (currentIDCreature > 0 and #ArrayPlayer>0) then
		PL = {{address = ArrayPlayer[9], flags = gg.TYPE_FLOAT, name = "PlayerX"}}  -- x
		PL[2] = {}
		PL[2].address = ArrayPlayer[10]
		PL[2].flags = gg.TYPE_FLOAT -- y
		PL[2].name = "PlayerY"
		PL[3] = {}
		PL[3].address = ArrayPlayer[11]
		PL[3].flags = gg.TYPE_FLOAT -- z
		PL[3].name = "PlayerZ"
		--gg.addListItems(PL)
		PL = gg.getValues(PL)
		if (is64) then
		forceCR = {{address = ArrayDinos[currentIDCreature][8]-0xAE8, flags = gg.TYPE_FLOAT}}  -- x
		else
		forceCR = {{address = ArrayDinos[currentIDCreature][8]-0x878, flags = gg.TYPE_FLOAT}}  -- x
		end
		forceCR[2] = {}
		forceCR[2].address = forceCR[1].address+0x4
		forceCR[2].flags = gg.TYPE_FLOAT -- y
		forceCR[3] = {}
		forceCR[3].address = forceCR[1].address+0x8
		forceCR[3].flags = gg.TYPE_FLOAT  -- z
		
		CR[1] = {}
		CR[1].address = ArrayDinos[currentIDCreature][9]
		CR[1].flags = gg.TYPE_FLOAT
		CR[1].value = PL[1].value -- x
		CR[2] = {}
		CR[2].address = ArrayDinos[currentIDCreature][10]
		CR[2].flags = gg.TYPE_FLOAT
		CR[2].value = PL[2].value -- y
		CR[3] = {}
		CR[3].address = ArrayDinos[currentIDCreature][11]
		CR[3].flags = gg.TYPE_FLOAT
		CR[3].value = PL[3].value -- z
		
		gg.setValues(CR)
		gg.sleep(400)
		forceCR = gg.getValues(forceCR)
		CR = gg.getValues(CR)
		--gg.alert(forceCR[1].value.." | "..CR[1].value)
		if (math.abs(forceCR[3].value-CR[3].value)<0.1 and math.abs(forceCR[2].value-CR[2].value)<0.1 and math.abs(forceCR[1].value-CR[1].value)<0.1) then
			gg.toast("Changed!")
		else
			CR[1].value = forceCR[1].value -- x
			CR[2].value = forceCR[2].value -- y
			CR[3].value = forceCR[3].value -- z
			gg.setValues(CR)
			gg.alert("This creature can not teleport to Player because it is invisible or not spawn on map. Let's use teleport Player to creature")
			RequestCreature()
		end
	else
		gg.toast("Can not find Player location!")
	end		
end

if menu == 2 then 
local X = nil
X = {}
local Y = nil
Y = {}
local Z = nil
Z = {}
	if (currentIDCreature > 0 and #ArrayDinos[currentIDCreature]>0) then
	if is64 then
		X = {{address = ArrayDinos[currentIDCreature][8] - 0xAE0, flags = gg.TYPE_FLOAT}}
	else
		X = {{address = ArrayDinos[currentIDCreature][8] - 0x870, flags = gg.TYPE_FLOAT}}
	end
		Y = {{address = X[1].address - 0x4, flags = gg.TYPE_FLOAT}}
		Z = {{address = X[1].address - 0x8, flags = gg.TYPE_FLOAT}}
		X = gg.getValues(X)
		Y = gg.getValues(Y)
		Z = gg.getValues(Z)
		--gg.alert(X[1].value.."|"..Y[1].value.."|"..Z[1].value)
		gg.setValues({{address = ArrayPlayer[9], flags = gg.TYPE_FLOAT, value = Z[1].value}})
		gg.setValues({{address = ArrayPlayer[10], flags = gg.TYPE_FLOAT, value = Y[1].value}})
		gg.setValues({{address = ArrayPlayer[11], flags = gg.TYPE_FLOAT, value = X[1].value}})
		--gg.addListItems(ros)
		gg.toast("Changed!")
	else
		gg.toast("Can not find creature location!")
	end		
end

if menu == 3 then
	local CR = nil
	CR = {}
	
	if (is64) then
	forceCR = {{address = ArrayDinos[currentIDCreature][8]-0xAE8, flags = gg.TYPE_FLOAT}}  -- x
	else
	forceCR = {{address = ArrayDinos[currentIDCreature][8]-0x878, flags = gg.TYPE_FLOAT}}  -- x
	end
	forceCR[2] = {}
	forceCR[2].address = forceCR[1].address+0x4
	forceCR[2].flags = gg.TYPE_FLOAT -- y
	forceCR[3] = {}
	forceCR[3].address = forceCR[1].address+0x8
	forceCR[3].flags = gg.TYPE_FLOAT  -- z
	
	local PL = {{address = ArrayPlayer[9], flags = gg.TYPE_FLOAT, name = "PlayerX"}}  -- x
	PL[2] = {}
	PL[2].address = ArrayPlayer[10]
	PL[2].flags = gg.TYPE_FLOAT -- y
	PL[2].name = "PlayerY"
	PL[3] = {}
	PL[3].address = ArrayPlayer[11]
	PL[3].flags = gg.TYPE_FLOAT -- z
	PL[3].name = "PlayerZ"
	--gg.addListItems(PL)
	PL = gg.getValues(PL)
	local crPl = {PL[1].value, PL[2].value, PL[3].value}	
	n = gg.prompt({'CURRENT COORDINATES (X):',
	'CURRENT COORDINATES (Y):',
	'CURRENT COORDINATES (Z):',
	'PLAYER AND CREATURE TELEPORT TO:\n1: Go to custom location by COORDINATES\n2: Go to Player save location in God Console>Teleport [1;2]',
	},
	 {PL[1].value, PL[2].value, PL[3].value, 1}, {'number','number', 'number', 'number'})
	if n == nil then 
		gg.sleep(1)
		gg.toast("CANCELLED")
		RequestCreature()
	else
		if tonumber(n[4])==1 then
			PL[1].value = tonumber(n[1])
			PL[2].value = tonumber(n[2])
			PL[3].value = tonumber(n[3])
			CR[1] = {}
			CR[1].address = ArrayDinos[currentIDCreature][9]
			CR[1].flags = gg.TYPE_FLOAT
			CR[1].value = tonumber(n[1]) -- x
			CR[2] = {}
			CR[2].address = ArrayDinos[currentIDCreature][10]
			CR[2].flags = gg.TYPE_FLOAT
			CR[2].value = tonumber(n[2]) -- y
			CR[3] = {}
			CR[3].address = ArrayDinos[currentIDCreature][11]
			CR[3].flags = gg.TYPE_FLOAT
			CR[3].value = tonumber(n[3]) -- z
			gg.setValues(PL)
			gg.setValues(CR)
		end
		
		if tonumber(n[4])==2 then
			local infoLocations= {}
			local config = gg.getFile()..'.saveLocation.cfg'
			local data = loadfile(config)
			if data ~= nil then
				infoLocations = data()
				data = nil
			end
			
			if (#infoLocations > 0) then
				local mn = {}
				for i=1, #infoLocations do
					mn[i] = infoLocations[i][1]
				end
				local menu = gg.choice(mn, nil, "SELECTION LOCATION GO TO")
				for i=1, #mn do
					if menu == i then
						local alert = gg.alert("What do you want to continue?", "Go To Save", "Delete Save", "Back")
						if alert == 0 then --no select
							gg.toast("You are not select anything")
							RequestCreature()							
						elseif alert == 1 then -- Go To Save
							PL[1].value = infoLocations[i][2]
							PL[2].value = infoLocations[i][3]
							PL[3].value = infoLocations[i][4]
							CR[1] = {}
							CR[1].address = ArrayDinos[currentIDCreature][9]
							CR[1].flags = gg.TYPE_FLOAT
							CR[1].value = infoLocations[i][2] -- x
							CR[2] = {}
							CR[2].address = ArrayDinos[currentIDCreature][10]
							CR[2].flags = gg.TYPE_FLOAT
							CR[2].value = infoLocations[i][3] -- y
							CR[3] = {}
							CR[3].address = ArrayDinos[currentIDCreature][11]
							CR[3].flags = gg.TYPE_FLOAT
							CR[3].value = infoLocations[i][4] -- z
							gg.setValues(CR)	
							gg.setValues(PL)
							--gg.toast("Changed!")								
						elseif alert == 2 then -- Delete Save
							table.remove(infoLocations, i)
							gg.saveVariable(infoLocations, config)
							gg.toast("Save deleted!!!")
						elseif alert == 3 then -- back
							RequestCreature()	
						end
					end					
				end
				if menu == nil then 
					gg.toast("You are not select anything")
					RequestCreature()
				end
			else
				gg.alert("No data saves file. You need >=1 save location before use this option")
				RequestCreature()
			end			
		end
		gg.sleep(400)
		forceCR = gg.getValues(forceCR)
		CR = gg.getValues(CR)
		--gg.alert(forceCR[1].value.." | "..CR[1].value)
		if (math.abs(forceCR[3].value-CR[3].value)<0.1 and math.abs(forceCR[2].value-CR[2].value)<0.1 and math.abs(forceCR[1].value-CR[1].value)<0.1) then
			gg.toast("Changed!")
		else
			CR[1].value = forceCR[1].value -- x
			CR[2].value = forceCR[2].value -- y
			CR[3].value = forceCR[3].value -- z
			PL[1].value = crPl[1]
			PL[2].value = crPl[2]
			PL[3].value = crPl[3]
			gg.setValues(CR)
			gg.setValues(PL)
			gg.alert("This creature can not teleport because it is invisible or not spawn on map. Let's use teleport Player to creature to make creature visible before use this option")
			RequestCreature()
		end
	end
end

if menu == 4 then 
Dino() end


if menu == nil then 
noselect()
end

   gg.isVisible(true)
   while true do
  if gg.isVisible() then
    gg.setVisible(false)
   RequestCreature()
  else
    gg.sleep(100) 
    end
    end
end

function SpecialOther()
menu = gg.choice({
"⭐ SCALE DODO",
"⭐ EQUUS, UNICORN, NOCTIS POWER",
"⭐ MAMMOTH CAPACITY",
"⭐ FISH SIZE",
"⭐ UNLIMITED DURATION TIME LIOPLEURODON",
"🔙 BACK"},nil,"")

if menu == 1 then 
ScaleDodo() end

if menu == 2 then 
EquusUnicornPower() end

if menu == 3 then 
MammothCapacity() end

if menu == 4 then 
FishSize() end

if menu == 5 then 
UnlimitedLIOPLEURODON() end

if menu == 6 then 
Dino() end


if menu == nil then 
noselect()
end

end

TorporDinoAdd = {}
currentIDCreature = 0
function FindDino(vl)
local del = {}
local te = gg.getListItems()
for i, v in ipairs(te) do
  if (v.name == "body_r" or v.name == "body_g" or v.name == "body_b" or v.name == "body_a"
  or v.name == "foot_r" or v.name == "foot_g" or v.name == "foot_b" or v.name == "foot_a"
  or v.name == "chest_r" or v.name == "chest_g" or v.name == "chest_b" or v.name == "chest_a"
  or v.name == "gradient_b" or v.name == "gradient_a"
  or v.name == "CurrentHP" or v.name == "MaxHP"
  or v.name == "ForceMaxHP" or v.name == "ForceID1" or v.name == "ForceID2" or v.name == "rideID" or v.name == "FastTame"
  or v.name == "vHP" or v.name == "vStamina" or v.name == "vOxygen" or v.name == "vFood" or v.name == "vWeight" or v.name == "vMeleeDamage" or v.name == "vMovementSP" or v.name == "vTorpor"
  or v.name == "DmaxStamina" or v.name == "DmaxOxygen" or v.name == "DmaxFood" or v.name == "DmaxWeight" or v.name == "DMeleeDamage" or v.name == "vMovementSP" or v.name == "DTorpor"
  or v.name == "DCurrentStamina" or v.name == "DCurrentOxygen" or v.name == "DCurrentFood" or v.name == "DCurrentTorpor"
  or v.name == "Dexp" or v.name == "DtameLV" or v.name == "DLVUP" or v.name == "scaledodo" or v.name == "forcebreed" or v.name == "imprinting" or v.name == "maturation" 
  or v.name == "ownDino" or v.name == "equusPower" or v.name == "zeroCanMate" or v.name == "Dfeces" or v.name == "mammoth_capacity" or v.name == "fishSize" or v.name == "revivalCR"
  ) then
    table.insert(del, te[i].address)
  end
end
gg.removeListItems(del)
local a = nil
a = {}
local b = nil
b = {}
local c = nil
c = {}
local d = nil
d = {}
local e = nil
e = {}
local f = nil
f = {}
local o = nil
o = {}
local a1 = nil
a1 = {}
local a2 = nil
a2 = {}
local a3 = nil
a3 = {}
local a4 = nil
a4 = {}
local a5 = nil
a5 = {}
local a6 = nil
a6 = {}
local a7 = nil
a7 = {}
local a8 = nil
a8 = {}
local a9 = nil
a9 = {}
local a10 = nil
a10 = {}
local a11 = nil
a11 = {}
local a12 = nil
a12 = {}
local a13 = nil
a13 = {}
local a14 = nil	
a14 = {}
local a15 = nil	
a15 = {}
local a16 = nil	
a16 = {}
local a17 = nil	
a17 = {}
local a18 = nil	
a18 = {}
local a19 = nil	
a19 = {}
local a20 = nil	
a20 = {}
local a21 = nil	
a21 = {}
local a22 = nil	
a22 = {}
local a23 = nil	
a23 = {}
local a24 = nil	
a24 = {}
local a25 = nil	
a25 = {}
local a26 = nil	
a26 = {}
local a27 = nil	
a27 = {}
local a28 = nil	
a28 = {}
if (vl==-1) then
	n = gg.prompt({'TYPE NUMBER MAX HEALTH OF CREATURE FOR CHANGE? (>0)'},
		{0}, 
		{'number'})
	if n == nil then 
		gg.sleep(1)
		gg.toast("CANCELLED")
		DinosOption()
	else
		g = math.abs(n[1]-1)
		h = math.abs(n[1]+1)
		TorporDinoAdd = {}
		gg.toast("Finding data CREATURE to change. Please wait")	
		gg.clearResults()
		gg.setVisible(false)
		gg.setRanges(range)
		gg.searchNumber("61D;1F;"..g.."~"..h.."::21", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
		gg.refineNumber(g.."~"..h, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
		m = gg.getResultsCount()
		if m==0 then
			gg.alert("Not found results. Are you sure you entered the correct maximum health value?")
			StartCheat()
		else
		x = gg.getResults(m)
			for i = 1, m do
				a[i] = {}
				a[i][1] = {}
				a[i][1].address = x[i].address - 0x14
				a[i][1].flags = gg.TYPE_DWORD
				a[i] = gg.getValues(a[i])
				a21[i] = {}
				a21[i][1] = {}
				a21[i][1].address = x[i].address - 0x8
				a21[i][1].flags = gg.TYPE_FLOAT
				a21[i] = gg.getValues(a21[i])
				if (a[i][1].value ~=nil and math.abs(a[i][1].value -61)<0.01 and a21[i][1].value ~=nil and math.abs(a21[i][1].value -1.0)<0.01) then
				
					b[i] = {}
					b[i][1] = {}
					b[i][1].address = x[i].address
					b[i][1].flags = gg.TYPE_FLOAT
					b[i][1].name = 'ForceMaxHP'
					--b[i][2].value = '5'
					gg.addListItems(b[i])
					
					a28[i] = {}
					a28[i][1] = {}
					if is64==true then 
					a28[i][1].address = x[i].address -0xA8 
					else
					a28[i][1].address = x[i].address -0xA4
					end
					a28[i][1].flags = gg.TYPE_DWORD
					a28[i][1].name = 'revivalCR'
					gg.addListItems(a28[i])
					
					a22[i] = {}
					a22[i][1] = {}
					if is64==true then 
					a22[i][1].address = x[i].address -0x9ac  
					else
					a22[i][1].address = x[i].address -0x788
					end
					a22[i][1].flags = gg.TYPE_DWORD
					a22[i][1].name = 'ownDino'
					gg.addListItems(a22[i])
					TorporDinoAdd[4]={}
					TorporDinoAdd[4] = a22[i][1]
					a22[i] = gg.getValues(a22[i])
					--gg.toast(a22[i][1].value)
					e[i] = {}
					e[i][1] = {}
					if is64==true then 
					e[i][1].address = x[i].address + 0xA9c  --940 32 bit
					else
					e[i][1].address = x[i].address + 0x940
					end
					e[i][1].flags = gg.TYPE_DWORD
					e[i][1].name = 'ForceID1'
					--e[i][1].value = '-1'
					gg.addListItems(e[i])	
					d[i] = {}
					d[i][1] = {}
					d[i][1].address = e[i][1].address -0x10
					d[i][1].flags = gg.TYPE_DWORD
					d[i][1].name = 'ForceID2'
					--d[i][1].value = '-1'
					gg.addListItems(d[i])
					a15[i] = {}
					a15[i][1] = {}
					if is64==true then
					a15[i][1].address = x[i].address + 0xD38  -- b64
					else
					a15[i][1].address = x[i].address + 0xb64
					end
					a15[i][1].flags = gg.TYPE_FLOAT
					a15[i][1].name = 'FastTame'
					--d[i][1].value = '-1'
					gg.addListItems(a15[i])
					c[i] = {}
					c[i][1] = {}
					c[i][1].address = e[i][1].address - 0x14
					c[i][1].flags = gg.TYPE_DWORD
					c[i][1].name = 'rideID'
					--c[i][3].value = '-1'
					gg.addListItems(c[i])
					a3[i] = {}
					a3[i][1] = {}
					if is64==true then 
					a3[i][1].address = x[i].address + 0xb94  --A10 32 bit
					else
					a3[i][1].address = x[i].address + 0xa10
					end
					a3[i][1].flags = gg.TYPE_FLOAT
					a3[i][1].name = 'body_r'
					gg.addListItems(a3[i])	
					a3[i] = gg.getValues(a3[i])
					listIDValueDefault[1] = a3[i][1].value
					a4[i] = {}
					a4[i][1] = {}
					a4[i][1].address = a3[i][1].address + 0x4
					a4[i][1].flags = gg.TYPE_FLOAT
					a4[i][1].name = 'body_g'
					gg.addListItems(a4[i])	
					a4[i] = gg.getValues(a4[i])
					listIDValueDefault[2] = a4[i][1].value
					a5[i] = {}
					a5[i][1] = {}
					a5[i][1].address = a3[i][1].address + 0x8
					a5[i][1].flags = gg.TYPE_FLOAT
					a5[i][1].name = 'body_b'
					gg.addListItems(a5[i])	
					a5[i] = gg.getValues(a5[i])
					listIDValueDefault[3] = a5[i][1].value
					a6[i] = {}
					a6[i][1] = {}
					a6[i][1].address = a3[i][1].address + 0xc
					a6[i][1].flags = gg.TYPE_FLOAT
					a6[i][1].name = 'body_a'
					gg.addListItems(a6[i])	
					a6[i] = gg.getValues(a6[i])
					listIDValueDefault[4] = a6[i][1].value
					a7[i] = {}
					a7[i][1] = {}
					a7[i][1].address = a3[i][1].address + 0x10
					a7[i][1].flags = gg.TYPE_FLOAT
					a7[i][1].name = 'foot_r'
					gg.addListItems(a7[i])	
					a7[i] = gg.getValues(a7[i])
					listIDValueDefault[5] = a7[i][1].value			
					a8[i] = {}
					a8[i][1] = {}
					a8[i][1].address = a3[i][1].address + 0x14
					a8[i][1].flags = gg.TYPE_FLOAT
					a8[i][1].name = 'foot_g'
					gg.addListItems(a8[i])	
					a8[i] = gg.getValues(a8[i])
					listIDValueDefault[6] = a8[i][1].value			
					a9[i] = {}
					a9[i][1] = {}
					a9[i][1].address = a3[i][1].address + 0x18
					a9[i][1].flags = gg.TYPE_FLOAT
					a9[i][1].name = 'foot_b'
					gg.addListItems(a9[i])	
					a9[i] = gg.getValues(a9[i])
					listIDValueDefault[7] = a9[i][1].value			
					a10[i] = {}
					a10[i][1] = {}
					a10[i][1].address = a3[i][1].address + 0x1c
					a10[i][1].flags = gg.TYPE_FLOAT
					a10[i][1].name = 'foot_a'
					gg.addListItems(a10[i])	
					a10[i] = gg.getValues(a10[i])
					listIDValueDefault[8] = a10[i][1].value			
					a11[i] = {}
					a11[i][1] = {}
					a11[i][1].address = a3[i][1].address + 0x20
					a11[i][1].flags = gg.TYPE_FLOAT
					a11[i][1].name = 'chest_r'
					gg.addListItems(a11[i])	
					a11[i] = gg.getValues(a11[i])
					listIDValueDefault[9] = a11[i][1].value
					a12[i] = {}
					a12[i][1] = {}
					a12[i][1].address = a3[i][1].address + 0x24
					a12[i][1].flags = gg.TYPE_FLOAT
					a12[i][1].name = 'chest_g'
					gg.addListItems(a12[i])	
					a12[i] = gg.getValues(a12[i])
					listIDValueDefault[10] = a12[i][1].value
					a13[i] = {}
					a13[i][1] = {}
					a13[i][1].address = a3[i][1].address + 0x28
					a13[i][1].flags = gg.TYPE_FLOAT
					a13[i][1].name = 'chest_b'
					gg.addListItems(a13[i])	
					a13[i] = gg.getValues(a13[i])
					listIDValueDefault[11] = a13[i][1].value
					a14[i] = {}
					a14[i][1] = {}
					a14[i][1].address = a3[i][1].address + 0x2c
					a14[i][1].flags = gg.TYPE_FLOAT
					a14[i][1].name = 'chest_a'
					gg.addListItems(a14[i])	
					a14[i] = gg.getValues(a14[i])
					listIDValueDefault[12] = a14[i][1].value
					a19[i] = {}
					a19[i][1] = {}
					a19[i][1].address = a3[i][1].address + 0x30
					a19[i][1].flags = gg.TYPE_FLOAT
					a19[i][1].name = 'gradient_b'
					gg.addListItems(a19[i])	
					a19[i] = gg.getValues(a19[i])
					listIDValueDefault[13] = a19[i][1].value
					a20[i] = {}
					a20[i][1] = {}
					a20[i][1].address = a3[i][1].address + 0x34
					a20[i][1].flags = gg.TYPE_FLOAT
					a20[i][1].name = 'gradient_a'
					gg.addListItems(a20[i])	
					a20[i] = gg.getValues(a20[i])
					listIDValueDefault[14] = a20[i][1].value
					--ScaleDodo
					a16[i] = {}
					a16[i][1] = {}
					if is64==true then
					a16[i][1].address = x[i].address + 0x1680  -- 1370 32 bit
					else
					a16[i][1].address = x[i].address + 0x1370
					end
					a16[i][1].flags = gg.TYPE_DWORD
					a16[i][1].name = 'scaledodo'
					gg.addListItems(a16[i])
					a16[i] = gg.getValues(a16[i])
					currentScaleDodo = a16[i][1].value	
					---EquusPower
					a23[i] = {}
					a23[i][1] = {}
					if is64==true then
					a23[i][1].address = x[i].address + 0x1750  -- 1370 32 bit
					else
					a23[i][1].address = x[i].address + 0x141c
					end
					a23[i][1].flags = gg.TYPE_DWORD
					a23[i][1].name = 'equusPower'
					gg.addListItems(a23[i])
					a23[i] = gg.getValues(a23[i])
					currentEquusPower = math.abs(10000.00 / a23[i][1].value)	
					
					---mammoth capacity
					a26[i] = {}
					a26[i][1] = {}
					if is64==true then
					a26[i][1].address = x[i].address + 0x1740  -- 1370 32 bit
					else
					a26[i][1].address = x[i].address + 0x1410
					end
					a26[i][1].flags = gg.TYPE_DWORD
					a26[i][1].name = 'mammoth_capacity'
					gg.addListItems(a26[i])
					a26[i] = gg.getValues(a26[i])
					currentMammothCapacity = math.abs(a26[i][1].value * 0.05)
					
					---FishSize
					a27[i] = {}
					a27[i][1] = {}
					if is64==true then
					a27[i][1].address = x[i].address + 0x1350  
					else
					a27[i][1].address = x[i].address + 0x10AC -- ??
					end
					a27[i][1].flags = gg.TYPE_FLOAT
					a27[i][1].name = 'fishSize'
					gg.addListItems(a27[i])
					a27[i] = gg.getValues(a27[i])
					currentFishSize = a27[i][1].value

	---------------		
					a24[i] = {}
					a24[i][1] = {}
					if is64==true then
					a24[i][1].address = x[i].address + 0x1294 
					else
					a24[i][1].address = x[i].address + 0x1000
					end
					a24[i][1].flags = gg.TYPE_DWORD
					a24[i][1].name = 'zeroCanMate'
					gg.addListItems(a24[i])
					
					a17[i] = {}
					a17[i][1] = {}
					if is64==true then
					a17[i][1].address = x[i].address + 0xac8  --964 in 32
					else
					a17[i][1].address = x[i].address + 0x964
					end
					a17[i][1].flags = gg.TYPE_FLOAT
					a17[i][1].name = 'forcebreed'
					gg.addListItems(a17[i])	
					a18[i] = {}
					a18[i][1] = {}
					a18[i][1].address = a17[i][1].address + 0x10 
					a18[i][1].flags = gg.TYPE_FLOAT
					a18[i][1].name = 'maturation'
					gg.addListItems(a18[i])
					a18[i] = gg.getValues(a18[i])
					maturation = a18[i][1].value

--==================================
					f[i] = {}
					f[i][1] = {}
					f[i][1].address = x[i].address + 0x420
					f[i][1].flags = gg.TYPE_QWORD
					f[i] = gg.getValues(f[i])
					f[i][1].address = f[i][1].value + 0x1e8
					f[i][1].flags = gg.TYPE_FLOAT
					f[i][1].name = 'MaxHP'
					--gg.alert(f[i][1].address)
					gg.addListItems(f[i])
					getAddres(f[i])
					--gg.alert(f[i][1].address)
					c[i] = {}
					c[i][1] = {}
					if is64==true then
					c[i][1].address = f[i][1].address + 0x778 --678 in 32 bit
					else
					c[i][1].address = f[i][1].address + 0x678 
					end
					c[i][1].flags = gg.TYPE_FLOAT
					c[i][1].name = 'CurrentHP'
					--c[i][3].value = '-1'
					gg.addListItems(c[i])
					
					a24[i] = {}
					a24[i][1] = {}
					if is64==true then
					a24[i][1].address = c[i][1].address -0x5c
					else
					a24[i][1].address = c[i][1].address -0x50
					end
					a24[i][1].flags = gg.TYPE_FLOAT
					a24[i][1].name = 'Dfeces'
					--c[i][3].value = '-1'
					gg.addListItems(a24[i])
					
					d[i] = {}
					d[i][1] = {}
					d[i][1].address = c[i][1].address + 0x8
					d[i][1].flags = gg.TYPE_FLOAT
					d[i][1].name = "DCurrentTorpor"
					TorporDinoAdd[1] = {}
					TorporDinoAdd[1] = d[i][1]
					--if d[i][1].value == 0 then
					gg.addListItems(d[i])
					e[i] = {}
					e[i][1] = {}
					e[i][1].address = c[i][1].address + 0x10
					e[i][1].flags = gg.TYPE_FLOAT
					e[i][1].name = "DCurrentFood"
					--e[i][1].value = '-1'
					gg.addListItems(e[i])
					TorporDinoAdd[3]={}
					TorporDinoAdd[3] = e[i][1]
					
				end		
			end
		end
	end -- from n
else
------------------------name,ownid,Baselevel,Uplevel,CurrentHP,MaxHP,MaxHPAddress,ForceMaxHP,ForceMaxHPAddress,X,Y,Z
	i=1
	x={{address = ArrayDinos[vl][8], flags = gg.TYPE_FLOAT}}
	if (math.abs(gg.getValues({{address = x[i].address -0x8 , flags = gg.TYPE_FLOAT}})[1].value - 1) <0.01 and gg.getValues({{address = x[i].address -0xC , flags = gg.TYPE_FLOAT}})[1].value >= 2200) then
		b[i] = {}
		b[i][1] = {}
		b[i][1].address = x[i].address
		b[i][1].flags = gg.TYPE_FLOAT
		b[i][1].name = 'ForceMaxHP'
		gg.addListItems(b[i])
		
		a28[i] = {}
		a28[i][1] = {}
		if is64==true then 
		a28[i][1].address = x[i].address -0xA8 
		else
		a28[i][1].address = x[i].address -0xA4
		end
		a28[i][1].flags = gg.TYPE_DWORD
		a28[i][1].name = 'revivalCR'
		gg.addListItems(a28[i])
		
		a22[i] = {}
		a22[i][1] = {}
		if is64==true then 
		a22[i][1].address = x[i].address -0x9ac  
		else
		a22[i][1].address = x[i].address -0x788
		end
		a22[i][1].flags = gg.TYPE_DWORD
		a22[i][1].name = 'ownDino'
		gg.addListItems(a22[i])
		TorporDinoAdd[4]={}
		TorporDinoAdd[4] = a22[i][1]
		a22[i] = gg.getValues(a22[i])
		--gg.toast(a22[i][1].value)
		e[i] = {}
		e[i][1] = {}
		if is64==true then 
		e[i][1].address = x[i].address + 0xA9c  --940 32 bit
		else
		e[i][1].address = x[i].address + 0x940
		end
		e[i][1].flags = gg.TYPE_DWORD
		e[i][1].name = 'ForceID1'
		--e[i][1].value = '-1'
		gg.addListItems(e[i])	
		d[i] = {}
		d[i][1] = {}
		d[i][1].address = e[i][1].address -0x10
		d[i][1].flags = gg.TYPE_DWORD
		d[i][1].name = 'ForceID2'
		--d[i][1].value = '-1'
		gg.addListItems(d[i])
		a15[i] = {}
		a15[i][1] = {}
		if is64==true then
		a15[i][1].address = x[i].address + 0xD38  -- b64
		else
		a15[i][1].address = x[i].address + 0xb64
		end
		a15[i][1].flags = gg.TYPE_FLOAT
		a15[i][1].name = 'FastTame'
		--d[i][1].value = '-1'
		gg.addListItems(a15[i])
		c[i] = {}
		c[i][1] = {}
		c[i][1].address = e[i][1].address - 0x14
		c[i][1].flags = gg.TYPE_DWORD
		c[i][1].name = 'rideID'
		--c[i][3].value = '-1'
		gg.addListItems(c[i])
		a3[i] = {}
		a3[i][1] = {}
		if is64==true then 
		a3[i][1].address = x[i].address + 0xb94  --A10 32 bit
		else
		a3[i][1].address = x[i].address + 0xa10
		end
		a3[i][1].flags = gg.TYPE_FLOAT
		a3[i][1].name = 'body_r'
		gg.addListItems(a3[i])	
		a3[i] = gg.getValues(a3[i])
		listIDValueDefault[1] = a3[i][1].value
		a4[i] = {}
		a4[i][1] = {}
		a4[i][1].address = a3[i][1].address + 0x4
		a4[i][1].flags = gg.TYPE_FLOAT
		a4[i][1].name = 'body_g'
		gg.addListItems(a4[i])	
		a4[i] = gg.getValues(a4[i])
		listIDValueDefault[2] = a4[i][1].value
		a5[i] = {}
		a5[i][1] = {}
		a5[i][1].address = a3[i][1].address + 0x8
		a5[i][1].flags = gg.TYPE_FLOAT
		a5[i][1].name = 'body_b'
		gg.addListItems(a5[i])	
		a5[i] = gg.getValues(a5[i])
		listIDValueDefault[3] = a5[i][1].value
		a6[i] = {}
		a6[i][1] = {}
		a6[i][1].address = a3[i][1].address + 0xc
		a6[i][1].flags = gg.TYPE_FLOAT
		a6[i][1].name = 'body_a'
		gg.addListItems(a6[i])	
		a6[i] = gg.getValues(a6[i])
		listIDValueDefault[4] = a6[i][1].value
		a7[i] = {}
		a7[i][1] = {}
		a7[i][1].address = a3[i][1].address + 0x10
		a7[i][1].flags = gg.TYPE_FLOAT
		a7[i][1].name = 'foot_r'
		gg.addListItems(a7[i])	
		a7[i] = gg.getValues(a7[i])
		listIDValueDefault[5] = a7[i][1].value			
		a8[i] = {}
		a8[i][1] = {}
		a8[i][1].address = a3[i][1].address + 0x14
		a8[i][1].flags = gg.TYPE_FLOAT
		a8[i][1].name = 'foot_g'
		gg.addListItems(a8[i])	
		a8[i] = gg.getValues(a8[i])
		listIDValueDefault[6] = a8[i][1].value			
		a9[i] = {}
		a9[i][1] = {}
		a9[i][1].address = a3[i][1].address + 0x18
		a9[i][1].flags = gg.TYPE_FLOAT
		a9[i][1].name = 'foot_b'
		gg.addListItems(a9[i])	
		a9[i] = gg.getValues(a9[i])
		listIDValueDefault[7] = a9[i][1].value			
		a10[i] = {}
		a10[i][1] = {}
		a10[i][1].address = a3[i][1].address + 0x1c
		a10[i][1].flags = gg.TYPE_FLOAT
		a10[i][1].name = 'foot_a'
		gg.addListItems(a10[i])	
		a10[i] = gg.getValues(a10[i])
		listIDValueDefault[8] = a10[i][1].value			
		a11[i] = {}
		a11[i][1] = {}
		a11[i][1].address = a3[i][1].address + 0x20
		a11[i][1].flags = gg.TYPE_FLOAT
		a11[i][1].name = 'chest_r'
		gg.addListItems(a11[i])	
		a11[i] = gg.getValues(a11[i])
		listIDValueDefault[9] = a11[i][1].value
		a12[i] = {}
		a12[i][1] = {}
		a12[i][1].address = a3[i][1].address + 0x24
		a12[i][1].flags = gg.TYPE_FLOAT
		a12[i][1].name = 'chest_g'
		gg.addListItems(a12[i])	
		a12[i] = gg.getValues(a12[i])
		listIDValueDefault[10] = a12[i][1].value
		a13[i] = {}
		a13[i][1] = {}
		a13[i][1].address = a3[i][1].address + 0x28
		a13[i][1].flags = gg.TYPE_FLOAT
		a13[i][1].name = 'chest_b'
		gg.addListItems(a13[i])	
		a13[i] = gg.getValues(a13[i])
		listIDValueDefault[11] = a13[i][1].value
		a14[i] = {}
		a14[i][1] = {}
		a14[i][1].address = a3[i][1].address + 0x2c
		a14[i][1].flags = gg.TYPE_FLOAT
		a14[i][1].name = 'chest_a'
		gg.addListItems(a14[i])	
		a14[i] = gg.getValues(a14[i])
		listIDValueDefault[12] = a14[i][1].value
		a19[i] = {}
		a19[i][1] = {}
		a19[i][1].address = a3[i][1].address + 0x30
		a19[i][1].flags = gg.TYPE_FLOAT
		a19[i][1].name = 'gradient_b'
		gg.addListItems(a19[i])	
		a19[i] = gg.getValues(a19[i])
		listIDValueDefault[13] = a19[i][1].value
		a20[i] = {}
		a20[i][1] = {}
		a20[i][1].address = a3[i][1].address + 0x34
		a20[i][1].flags = gg.TYPE_FLOAT
		a20[i][1].name = 'gradient_a'
		gg.addListItems(a20[i])	
		a20[i] = gg.getValues(a20[i])
		listIDValueDefault[14] = a20[i][1].value
		--ScaleDodo
		a16[i] = {}
		a16[i][1] = {}
		if is64==true then
		a16[i][1].address = x[i].address + 0x1680  -- 1370 32 bit
		else
		a16[i][1].address = x[i].address + 0x1370
		end
		a16[i][1].flags = gg.TYPE_DWORD
		a16[i][1].name = 'scaledodo'
		gg.addListItems(a16[i])
		a16[i] = gg.getValues(a16[i])
		currentScaleDodo = a16[i][1].value	
		---EquusPower
		a23[i] = {}
		a23[i][1] = {}
		if is64==true then
		a23[i][1].address = x[i].address + 0x1750  -- 1370 32 bit
		else
		a23[i][1].address = x[i].address + 0x141c
		end
		a23[i][1].flags = gg.TYPE_DWORD
		a23[i][1].name = 'equusPower'
		gg.addListItems(a23[i])
		a23[i] = gg.getValues(a23[i])
		currentEquusPower = math.abs(10000.00 / a23[i][1].value)	
		
		---mammoth capacity
		a26[i] = {}
		a26[i][1] = {}
		if is64==true then
		a26[i][1].address = x[i].address + 0x1740  -- 1370 32 bit
		else
		a26[i][1].address = x[i].address + 0x1410
		end
		a26[i][1].flags = gg.TYPE_DWORD
		a26[i][1].name = 'mammoth_capacity'
		gg.addListItems(a26[i])
		a26[i] = gg.getValues(a26[i])
		currentMammothCapacity = math.abs(a26[i][1].value * 0.05)
		
		---FishSize
		a27[i] = {}
		a27[i][1] = {}
		if is64==true then
		a27[i][1].address = x[i].address + 0x1350  
		else
		a27[i][1].address = x[i].address + 0x10AC -- ??
		end
		a27[i][1].flags = gg.TYPE_FLOAT
		a27[i][1].name = 'fishSize'
		gg.addListItems(a27[i])
		a27[i] = gg.getValues(a27[i])
		currentFishSize = a27[i][1].value

	---------------		
		a24[i] = {}
		a24[i][1] = {}
		if is64==true then
		a24[i][1].address = x[i].address + 0x1294 
		else
		a24[i][1].address = x[i].address + 0x1000
		end
		a24[i][1].flags = gg.TYPE_DWORD
		a24[i][1].name = 'zeroCanMate'
		gg.addListItems(a24[i])
		
		a17[i] = {}
		a17[i][1] = {}
		if is64==true then
		a17[i][1].address = x[i].address + 0xac8  --964 in 32
		else
		a17[i][1].address = x[i].address + 0x964
		end
		a17[i][1].flags = gg.TYPE_FLOAT
		a17[i][1].name = 'forcebreed'
		gg.addListItems(a17[i])	
		a18[i] = {}
		a18[i][1] = {}
		a18[i][1].address = a17[i][1].address + 0x10 
		a18[i][1].flags = gg.TYPE_FLOAT
		a18[i][1].name = 'maturation'
		gg.addListItems(a18[i])
		a18[i] = gg.getValues(a18[i])
		maturation = a18[i][1].value
	----------------------------------------------------------------------------------
		x={{address = ArrayDinos[vl][7], flags = gg.TYPE_FLOAT}}
		b[i] = nil
		b[i] = {}
		b[i][1] = {}
		b[i][1].address = x[i].address
		b[i][1].flags = gg.TYPE_FLOAT
		b[i][1].name = 'MaxHP'
		gg.addListItems(b[i])
		getAddres(b[i])
		c[i] = {}
		c[i][1] = {}
		if is64==true then
		c[i][1].address = x[i].address + 0x778 --678 in 32 bit
		else
		c[i][1].address = x[i].address + 0x678 
		end
		c[i][1].flags = gg.TYPE_FLOAT
		c[i][1].name = 'CurrentHP'
		--c[i][3].value = '-1'
		gg.addListItems(c[i])
		
		a24[i] = {}
		a24[i][1] = {}
		if is64==true then
		a24[i][1].address = c[i][1].address -0x5c
		else
		a24[i][1].address = c[i][1].address -0x50
		end
		a24[i][1].flags = gg.TYPE_FLOAT
		a24[i][1].name = 'Dfeces'
		--c[i][3].value = '-1'
		gg.addListItems(a24[i])
		
		d[i] = {}
		d[i][1] = {}
		d[i][1].address = c[i][1].address + 0x8
		d[i][1].flags = gg.TYPE_FLOAT
		d[i][1].name = "DCurrentTorpor"
		TorporDinoAdd[1]={}
		TorporDinoAdd[1] = d[i][1]
		--if d[i][1].value == 0 then
		gg.addListItems(d[i])
		e[i] = {}
		e[i][1] = {}
		e[i][1].address = c[i][1].address + 0x10
		e[i][1].flags = gg.TYPE_FLOAT
		e[i][1].name = "DCurrentFood"
		--e[i][1].value = '-1'
		gg.addListItems(e[i])
		TorporDinoAdd[3]={}
		TorporDinoAdd[3] = e[i][1]
		currentIDCreature = vl
	else
		gg.alert("The creature did not exist, was too far away from the player, or was dead. Selection Refine creatures to update new creatures nearby")
		DinosOption()
	end	
------------------
end
	Dino()
	--~~~~~~~~~~~~~
	while true do
  if gg.isVisible() then
    gg.setVisible(false)
    Dino()
  else
    gg.sleep(100) 
    end
    end	
end

function getAddres(add)
local a = nil
a = {}
local b = nil
b = {}
local c = nil
c = {}
local d = nil
d = {}
local e = nil
e = {}
local f = nil
f = {}
local o = nil
o = {}
local a1 = nil
a1 = {}
local a2 = nil
a2 = {}
local a3 = nil
a3 = {}
local a4 = nil
a4 = {}
local a5 = nil
a5 = {}
local a6 = nil
a6 = {}
local a7 = nil
a7 = {}
local a8 = nil
a8 = {}
local a9 = nil
a9 = {}
local a10 = nil
a10 = {}
local a11 = nil
a11 = {}
local a12 = nil
a12 = {}
local a13 = nil
a13 = {}
local a14 = nil	
a14 = {}
local a15 = nil	
a15 = {}
local a16 = nil	
a16 = {}
local a17 = nil	
a17 = {}
local a18 = nil	
a18 = {}
local a19 = nil	
a19 = {}
local a20 = nil	
a20 = {}
local a21 = nil	
a21 = {}
local a22 = nil	
a22 = {}
local a23 = nil	
a23 = {}
local a24 = nil	
a24 = {}
local t=nil
t={}
t = gg.getValues(add)
max1devDino[1] = t[1].value
--
a24[1] = nil
a24[1] = {}
if is64==true then
a24[1].address = add[1].address + 0xAC8  --9c0 in 32 
else
a24[1].address = add[1].address + 0x9c0
end
a24[1].flags = gg.TYPE_FLOAT
a24[1].name = 'imprinting'
gg.addListItems(a24)
a24 = gg.getValues(a24)
imprinting = a24[1].value
a[1] = nil
a[1] = {}
if is64==true then 
a[1].address = add[1].address + 0x648 --554 in 32
else
a[1].address = add[1].address + 0x554
end
a[1].flags = gg.TYPE_FLOAT
a[1].name = 'Dexp'
gg.addListItems(a)
a = gg.getValues(a)
currentExpDino = a[1].value
--stamina
b[1] = nil
b[1] = {}
b[1].address = add[1].address + 0x4
b[1].flags = gg.TYPE_FLOAT
b[1].name = maxKeyDino[2]
gg.addListItems(b)
b = gg.getValues(b)
max1devDino[2] = b[1].value
--oxy
c[1] = {}			
c[1].address =add[1].address + 0xc
c[1].flags = gg.TYPE_FLOAT
c[1].name = maxKeyDino[3]
gg.addListItems(c)
c = gg.getValues(c)
max1devDino[3] = c[1].value
--fod
d[1] = {}
d[1].address = add[1].address + 0x10
d[1].flags = gg.TYPE_FLOAT
d[1].name = maxKeyDino[4]
gg.addListItems(d)
d = gg.getValues(d)
max1devDino[4] = d[1].value
--weight
e[1] = {}
e[1].address = add[1].address + 0x1c
e[1].flags = gg.TYPE_FLOAT
e[1].name = maxKeyDino[5]
gg.addListItems(e)
e = gg.getValues(e)
max1devDino[5] = e[1].value
--melee damage
f[1] = {}
f[1].address = add[1].address + 0x20
f[1].flags = gg.TYPE_FLOAT
f[1].name = maxKeyDino[6]
gg.addListItems(f)
f = gg.getValues(f)
max1devDino[6] = math.abs((f[1].value * 100.0)+100)
--move sp
o[1] = {}
o[1].address = add[1].address + 0x24
o[1].flags = gg.TYPE_FLOAT
o[1].name = maxKeyDino[7]
gg.addListItems(o)
o = gg.getValues(o)
max1devDino[7] = math.abs((o[1].value * 100.0)+100)
--Torpor
a1[1] = {}
a1[1].address = add[1].address + 0x8
a1[1].flags = gg.TYPE_FLOAT
a1[1].name = maxKeyDino[8]
gg.addListItems(a1)
TorporDinoAdd[2] = {}
TorporDinoAdd[2] = a1[1]
a1 = gg.getValues(a1)
max1devDino[8] = a1[1].value
--HP
a2[1] = {}
a2[1].address = add[1].address + 0x30
a2[1].flags = gg.TYPE_FLOAT
a2 = gg.getValues(a2)
max2devDino[1] = a2[1].value
--sta
a3[1] = {}
a3[1].address = a2[1].address + 0x4
a3[1].flags = gg.TYPE_FLOAT
a3 = gg.getValues(a3)
max2devDino[2] = a3[1].value
--oxy
a4[1] = {}
a4[1].address = a2[1].address + 0xc
a4[1].flags = gg.TYPE_FLOAT
a4 = gg.getValues(a4)
max2devDino[3] = a4[1].value
--food
a5[1] = {}
a5[1].address = a2[1].address + 0x10
a5[1].flags = gg.TYPE_FLOAT
a5 = gg.getValues(a5)
max2devDino[4] = a5[1].value
--weight
a6[1] = {}
a6[1].address = a2[1].address + 0x1c
a6[1].flags = gg.TYPE_FLOAT
a6 = gg.getValues(a6)
max2devDino[5] = a6[1].value	
--melee
a7[1] = {}
a7[1].address = a2[1].address + 0x20
a7[1].flags = gg.TYPE_FLOAT
a7 = gg.getValues(a7)
max2devDino[6] = a7[1].value	
--speed
a8[1] = {}
a8[1].address = a2[1].address + 0x24
a8[1].flags = gg.TYPE_FLOAT
a8 = gg.getValues(a8)
max2devDino[7] = a8[1].value	
--torpor
a9[1] = {}
a9[1].address = a2[1].address + 0x8
a9[1].flags = gg.TYPE_FLOAT
a9 = gg.getValues(a9)
max2devDino[8] = a9[1].value
--Cstamina	
a10[1] = {}
if is64==true then 
a10[1].address = add[1].address + 0x77c  -- 67c in 32
else
a10[1].address = add[1].address + 0x67c
end
a10[1].flags = gg.TYPE_FLOAT
a10[1].name = curKeyDino[2]
--gg.addListItems(a10)	
--Coxy	
a11[1] = {}
a11[1].address = a10[1].address + 0x8
a11[1].flags = gg.TYPE_FLOAT
a11[1].name = curKeyDino[3]
gg.addListItems(a11)
--Cfood	
a12[1] = {}
a12[1].address = a10[1].address + 0xc
a12[1].flags = gg.TYPE_FLOAT
a12[1].name = curKeyDino[4]
--gg.addListItems(a12)	
--CTorpor
a13[1] = {}
a13[1].address = a10[1].address + 0x4
a13[1].flags = gg.TYPE_FLOAT
a13[1].name = curKeyDino[8]
--gg.addListItems(a13)	
--hp
a14[1] = nil
a14[1] = {}
a14[1].address = add[1].address + 0x60
a14[1].flags = gg.TYPE_FLOAT
a14[1].name = maxKeyValueDino[1]
gg.addListItems(a14)
a14 = gg.getValues(a14)
valueDino[1] = a14[1].value		

a15[1] = nil
a15[1] = {}
a15[1].address = add[1].address + 0x64
a15[1].flags = gg.TYPE_FLOAT
a15[1].name = maxKeyValueDino[2]
gg.addListItems(a15)
a15 = gg.getValues(a15)
valueDino[2] = a15[1].value	

a16[1] = nil
a16[1] = {}			
a16[1].address = add[1].address + 0x6c
a16[1].flags = gg.TYPE_FLOAT
a16[1].name = maxKeyValueDino[3]
gg.addListItems(a16)
a16 = gg.getValues(a16)
valueDino[3] = a16[1].value	

a17[1] = nil
a17[1] = {}
a17[1].address = add[1].address + 0x70
a17[1].flags = gg.TYPE_FLOAT
a17[1].name = maxKeyValueDino[4]
gg.addListItems(a17)
a17 = gg.getValues(a17)
valueDino[4] = a17[1].value		

a18[1] = nil
a18[1] = {}
a18[1].address = add[1].address + 0x7c
a18[1].flags = gg.TYPE_FLOAT
a18[1].name = maxKeyValueDino[5]
gg.addListItems(a18)
a18 = gg.getValues(a18)
valueDino[5] = a18[1].value	

a19[1] = nil
a19[1] = {}			
a19[1].address = add[1].address + 0x80
a19[1].flags = gg.TYPE_FLOAT
a19[1].name = maxKeyValueDino[6]
gg.addListItems(a19)
a19 = gg.getValues(a19)
valueDino[6] = a19[1].value		

a20[1] = nil
a20[1] = {}
a20[1].address = add[1].address + 0x84
a20[1].flags = gg.TYPE_FLOAT
a20[1].name = maxKeyValueDino[7]
gg.addListItems(a20)
a20= gg.getValues(a20)
valueDino[7] = a20[1].value	

a21[1] = nil
a21[1] = {}
a21[1].address = add[1].address + 0x68
a21[1].flags = gg.TYPE_FLOAT
a21[1].name = maxKeyValueDino[8]
gg.addListItems(a21)
a21 = gg.getValues(a21)
valueDino[8] = a21[1].value	

a22[1] = nil
a22[1] = {}
a22[1].address = a[1].address - 0xc
a22[1].flags = gg.TYPE_DWORD
a22[1].name = 'DtameLV'
gg.addListItems(a22)
a22 = gg.getValues(a22)
currentTameLvD = a22[1].value

a23[1] = nil
a23[1] = {}
a23[1].address = a[1].address - 0x8
a23[1].flags = gg.TYPE_DWORD
a23[1].name = 'DLVUP'
gg.addListItems(a23)
a23 = gg.getValues(a23)
currentLvUpD= a23[1].value
			
			
	if tonumber(currentTameLvD)>1 then
		if (tonumber(currentLvUpD) >0) then	
			for j=1, #baseDino do
				if (j==8) then
					baseDino[j] = max2devDino[j]/(1+rateDino[j]*currentTameLvD)
				else
					baseDino[j] = max2devDino[j]/(1+rateDino[j]*valueDino[j])
				end			
			end
		else
			for j=1, #max2devDino do
				max2devDino[j] = max1devDino[j]
				if (j==8) then
					baseDino[j] = max2devDino[j]/(1+rateDino[j]*currentTameLvD)
				else
					baseDino[j] = max2devDino[j]/(1+rateDino[j]*valueDino[j])
				end	
			end
		end	

	else
		for j=1, #baseDino do
			max2devDino[j] = max1devDino[j]
			baseDino[j] = max2devDino[j]
		end
	end
	
end
rateSizeDino = 1
function ResizeDino()
if testData() then
	local t = {}
	t[1] = {}
	if is64 then 
	t[1].address =  ArrayDinos[currentIDCreature][8] - 0x610
	else
	t[1].address =  ArrayDinos[currentIDCreature][8] - 0x4ac
	end 
	t[1].flags = gg.TYPE_QWORD
	t = gg.getValues(t)
	t[1].address = t[1].value + 0x318
	t[1].flags = gg.TYPE_FLOAT
	t[2] = {}
	t[2].address = t[1].address - 0x4
	t[2].flags = gg.TYPE_FLOAT
	t[3] = {}
	t[3].address = t[1].address - 0x8
	t[3].flags = gg.TYPE_FLOAT
	t = gg.getValues(t)
	rateSizeDino = t[1].value
	
	n = gg.prompt({'CHANGE VALUE MULTIP (>0):'
	},
	 {rateSizeDino}, {'number'})
	if n == nil then 
		gg.sleep(1)
		gg.toast("CANCELLED")
		Dino()
	else
		t[1].value = tonumber(n[1])
		t[2].value = tonumber(n[1])
		t[3].value = tonumber(n[1])
		gg.setValues(t)
		gg.alert("Changed! whist or ride creature to move for update change")
	end	
else
	gg.toast("Not Found. Can not change")
	StartCheat()
return
end	
end

function MaxAmber()
local count=0
gg.clearResults()
gg.setRanges(range)
gg.setVisible(false)
gg.searchNumber("2147483647;0;1F::9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
--gg.refineAddress("C", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber("2147483647", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
m = gg.getResultsCount()
if m >= 6 then
m = 6
end
if m==0 then
gg.alert("Not found result. Try get 1 or more amber to this option work")
StartCheat()
end
x = gg.getResults(m)
a = nil
a = {}
for i = 1, m do
a[i] = {}
a[i][1] = {}
if is64 then
a[i][1].address = x[i].address + 0x58
else
a[i][1].address = x[i].address + 0x4c
end
a[i][1].flags = gg.TYPE_DWORD
a[i][3] = {}
a[i][3].address = x[i].address + 0x8
a[i][3].flags = gg.TYPE_FLOAT
a[i] = gg.getValues(a[i])
	if (a[i][1].value == 4 and math.abs(a[i][3].value-1)<0.01) then
		if (count==0) then
			a[i][2] = {}
			a[i][2].address = x[i].address - 0x4
			a[i][2].flags = gg.TYPE_DWORD
			a[i][2].value = '2147480000'
			--gg.addListItems(a[i])
			gg.setValues(a[i])
			gg.toast("Changed with Max Amber")
			count = count + 1
		else
			a[i][2] = {}
			a[i][2].address = x[i].address - 0x4
			a[i][2].flags = gg.TYPE_DWORD
			a[i][2].value = '0'
			--gg.addListItems(a[i])
			gg.setValues(a[i])
		end
	end
end

end

function FreeGifts()
gg.clearResults()
testAd = false
local tt = {}
local t = {"libUE4.so", "Cd"}
if is64 then
	if gversion == 2028 then 
	tt = {0x471870,0x8,0x160,0x75C}
	else
	tt = {0x472920,0x8,0x160,0x75C}
	end
else
	if gversion==2028 then
	tt = {0x20B2E8, 0xD4, 0x604}
	else
	tt = {0x20B568, 0xD4, 0x604}
	end
end
local ttt = S_Pointer(t, tt, true)
 local k ={}
	if tonumber(ttt)~=nil then
		k[1] = {}
		k[1].address = tonumber(ttt) - 0xC
		k[1].flags = gg.TYPE_DWORD
		k[2] = {}
		k[2].address = tonumber(ttt) - 0x14
		k[2].flags = gg.TYPE_DWORD
		k = gg.getValues(k)
		if (math.abs(k[2].value-12.0)<0.5 and math.abs(k[1].value-6.0)<0.5) then
			testAd = true
			local a = ttt
			ttt={}
			ttt[1] = a
		end
	end
	if testAd == false then
		local te = gg.getListItems()
		ttt ={}
		j=1
		for i, v in ipairs(te) do
		  if v.name == "gift_time" then
			t ={}
			t[1] = {}
			t[1].address = te[i].address - 0xC
			t[1].flags = gg.TYPE_DWORD
			t = gg.getValues(t)
			k ={}
			k[1] = {}
			k[1].address = te[i].address - 0x14
			k[1].flags = gg.TYPE_DWORD
			k = gg.getValues(k)
			if (math.abs(k[1].value-12.0)<0.5 and math.abs(t[1].value-6.0)<0.5) then
				testAd = true
				ttt[j]= te[i].address
				j=j+1
			end
		  end
		end
	end

	if (testAd==false) then

		gg.clearResults()
		gg.setRanges(range)
		gg.setVisible(false)
		gg.searchNumber("2000D;12D;6D;4800F::25", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
		--gg.refineAddress("C", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1, 0)
		gg.refineNumber("4800", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
		m = gg.getResultsCount()
		if m >= 6 then
		m = 6
		end
		if m==0 then
		gg.alert("Not found result")
		chStatus[1] = isOff
		StartCheat()
		end
		x = gg.getResults(m)
		k = nil
		k = {}
		a = nil
		a = {}
		j=1
		for i = 1, m do
			k[i] = {}
			k[i][1] = {}
			k[i][1].address = x[i].address - 0xC
			k[i][1].flags = gg.TYPE_DWORD
			k[i][2] = {}
			k[i][2].address = x[i].address - 0x14
			k[i][2].flags = gg.TYPE_DWORD
			k[i] = gg.getValues(k[i])
			if (math.abs(k[i][2].value-12.0)<0.5 and math.abs(k[i][1].value-6.0)<0.5) then
				a[i] = {}
				a[i][1] = {}
				a[i][1].address = x[i].address
				a[i][1].flags = gg.TYPE_FLOAT
				a[i][1].name = 'gift_time'
				gg.addListItems(a[i])
				testAd = true
				ttt={}
				ttt[j] = x[i].address
				j=j+1
			end		
		end
	end	

	if (testAd==true) then
		local a = nil
		a = {}
		if chStatus[1] == isOn then	 
			for i = 1, #ttt do
				a[i] = {}
				a[i][1] = {}
				a[i][1].address = ttt[i]
				a[i][1].flags = gg.TYPE_FLOAT
				a[i][1].name = 'gift_time'
				a[i][1].value = '-999999999'
				--gg.addListItems(a[i])	
				gg.setValues(a[i])
			end
		else		
			for i = 1, #ttt do
				a[i] = {}
				a[i][1] = {}
				a[i][1].address = ttt[i]
				a[i][1].flags = gg.TYPE_FLOAT
				a[i][1].name = 'gift_time'
				a[i][1].value = '4800'
				--gg.addListItems(a[i])	
				gg.setValues(a[i])
			end
		end	
		gg.toast("Successful change")

	else
	gg.alert("Not found. Let's try again")
	end		
end
id = 0
swap = false
dupe = false
function structuredupe()
hasSearch = false
local tt
local t = {"libUE4.so", "Cd"}
if is64 then
	if gversion == 2028 then
	tt = {0x417C38, 0x100, 0xC50, 0x654}
	else
	tt = {0x418CD8, 0x100, 0xC50, 0x654}
	end
else
	if gversion==2028 then
	tt = {0x20B2E8, 0x3C, 0x7C, 0x24, 0x510}
	else
	tt = {0x20B568, 0x3C, 0x7C, 0x24, 0x510}
	end
end
local ttt = S_Pointer(t, tt, true)

local k ={}
if tonumber(ttt)~=nil then
	k[1] = {}
	if is64 then
	k[1].address = tonumber(ttt) + 0xC
	else
	k[1].address = tonumber(ttt) + 0x8
	end
	k[1].flags = gg.TYPE_DWORD
	k[2] = {}
	k[2].address = k[1].address + 0x10
	k[2].flags = gg.TYPE_FLOAT
	k[3] = {}
	k[3].address = k[1].address + 0x20
	k[3].flags = gg.TYPE_FLOAT
	k = gg.getValues(k)
	if (math.abs(k[3].value-12.0)<0.01 and math.abs(k[2].value-8.0)<0.01) then
		hasSearch = true
		id = k[1].value
		local a = ttt
		ttt={}
		ttt[1] = a
	end	
end
if hasSearch == false then
	local te = gg.getListItems()
	ttt ={}
	j=1
	for i, v in ipairs(te) do
	  if v.name == "Dupe" then
		t ={}
		t[1] = {}
		t[1].address = te[i].address + 0x10
		t[1].flags = gg.TYPE_FLOAT
		t = gg.getValues(t)
		k ={}
		k[1] = {}
		k[1].address = te[i].address + 0x20
		k[1].flags = gg.TYPE_FLOAT
		k[2] = {}
		if is64 then
		k[2].address = te[i].address - 0xc
		else
		k[2].address = te[i].address - 0x8
		end
		k[2].flags = gg.TYPE_DWORD
		k = gg.getValues(k)
		if (math.abs(k[1].value-12.0)<0.01 and math.abs(t[1].value-8.0)<0.01) then
			hasSearch = true
			id = k[2].value
			ttt[j]= k[2].address
			j=j+1
		end	
	  end
	end
end

if hasSearch == false then
	local del = {}
	local te = gg.getListItems()
	for i, v in ipairs(te) do
	  if (v.name == "ID" or v.name == "Dupe") then
		table.insert(del, te[i].address)
	  end
	end
		gg.removeListItems(del)	
	
	gg.clearResults()
	gg.setRanges(range)
	gg.setVisible(false)
	gg.searchNumber("1F;2D;8F;12F::53", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
	--gg.refineAddress("C", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1, 0)
	--gg.refineNumber("2", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
	m = gg.getResultsCount()
	if m >= 4 then
	m = 4
	end
	if m==0 then
		gg.alert("Not found result. Please select place any structure before use this option")
		chStatus[2] = isOff
		StructureOption()
	else
		x = gg.getResults(m)
		a = nil
		a = {}
		b = nil
		b = {}
		--for i = 1, m do
		a[1] = {}
		a[1].address = x[2].address +0x4
		a[1].flags = gg.TYPE_DWORD
		a[1].name = 'ID'	
		ttt[1] = a[1].address
		gg.addListItems(a)
		a = gg.getValues(a)
		id = a[1].value

		b[1] = {}
		b[1].address = x[3].address -0x10
		b[1].flags = gg.TYPE_DWORD
		b[1].name = 'Dupe'
		gg.addListItems(b)
		
		hasSearch = true
	end
end
if 	hasSearch == true then
	local k = {}
	k[1] = {}
	k[1].address = tonumber(ttt[1]) -- id
	k[1].flags = gg.TYPE_DWORD
	k[2] = {}
	if is64 then
	k[2].address = tonumber(ttt[1]) + 0xc  -- dupe
	else
	k[2].address = tonumber(ttt[1]) + 0x8  -- dupe
	end
	k[2].flags = gg.TYPE_DWORD
	k = gg.getValues(k)
	id = k[1].value
	if dupe then
		chStatus[2] = isOn
	else
		chStatus[2] = isOff
	end
	gg.addListItems(k)

		if tonumber(id)<0 then
			id = 127
		end

	n = gg.prompt({'CURRENT STRUCTURE ID', 'ALLOW DUPE STRUCTURE?\n-Turn on and off dupe mode', 'ALLOW SWAP STRUCTURE\n- Change structure id to that you want.\n- Must ON Dupe to active.'}, {id, dupe, swap}, {'number', 'checkbox', 'checkbox'})
	if n == nil then 
	gg.toast("CANCELLED")
	gg.sleep(1)
	StructureOption()
	else
		gg.toast("Successful change. you can place structure now")
		if tonumber(n[1])<0 then
			n[1] = 127
		end
		id = tonumber(n[1])
		local v = {}
		v[1] = {}
		v[1].address = ttt[1] -- id
		v[1].flags = gg.TYPE_DWORD
		v[1].name = "ID"
		if n[3] == true then
			v[1].value = n[1]
			v[1].freeze = true
			swap = true
		else
			v[1].value = n[1]
			v[1].freeze = false
			swap = false
		end
		
		v[2] = {}
		if is64 then
		v[2].address = ttt[1] + 0xc  -- dupe
		else
		v[2].address = ttt[1] + 0x8  -- dupe
		end
		v[2].flags = gg.TYPE_DWORD
		v[1].name = "Dupe"
		if n[2] == true then 
			v[2].value = '5'
			v[2].freeze = true
			chStatus[2] = isOn
			dupe = true
		else
			v[2].value = '0'
			v[2].freeze = false
			chStatus[2] = isOff
			dupe = false
		end	
		
		gg.setValues(v)
		gg.addListItems(v)

		if (n[2] == false and n[3] == false) then
		StructureOption()
		end
	end
else
gg.alert("Not found. Let's try again")
end
	 
	    gg.isVisible(true)
   while true do
  if gg.isVisible() then
    gg.setVisible(false)
    structuredupe()
  else
    gg.sleep(100) 
    end
    end
end

function UpgradeEquipment()
gg.clearResults()
menu = gg.choice({
"🎽 AMMOR AND WEAPON",
"🎠 SADDLE AND STRUCTURES",
"💧 TEK GUN NO HOT (Fake)\nCan not Save after restart game",
"🔙 BACK"},nil,"Made By GogOfGods")

if menu == 1 then 
AmmorAndWeapon() end

if menu == 2 then 
SaddleUpgrade() end

if menu == 3 then 
TekGunNoHot() end

if menu == 4 then 
StartCheat() end

if menu == nil then 
noselect()
end

while true do
  if gg.isVisible() then
    gg.setVisible(false)
        UpgradeEquipment()
  else

	gg.sleep(100) 
  end
end
end

function TekGunNoHot()
	local test = false;
	gg.clearResults()
	gg.setRanges(range)
	gg.setVisible(false)
	gg.searchNumber("1,045,220,557D;1f;4f::9", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
	--gg.refineAddress("C", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1, 0)
	gg.refineNumber("1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
	m = gg.getResultsCount()
	if m==0 then
	gg.alert("Not found result. ")
	UpgradeEquipment()
	else
		x = gg.getResults(m)
		a1 = nil
		a1 = {}
		a2 = nil
		a2 = {}
		for i = 1, m do
			a1[i] = {}
			a1[i][1] = {}
			a1[i][1].address = x[i].address - 0x4
			a1[i][1].flags = gg.TYPE_DWORD
			a1[i][2] = {}
			a1[i][2].address = x[i].address + 0x4
			a1[i][2].flags = gg.TYPE_FLOAT
			a1[i] = gg.getValues(a1[i])
			if (math.abs(a1[i][1].value-1045220557)<1 and math.abs(a1[i][2].value-4.0)<0.01) then	
			--gg.alert(a1[i][1].value.."|"..a1[i][2].value)			
				a2[i] = {}
				a2[i][1] = {}
				a2[i][1].address = x[i].address
				a2[i][1].flags = gg.TYPE_FLOAT
				a2[i][1].value = 0
				gg.setValues(a2[i])
				test = true
			end
		end
		if test then
			gg.toast("Actived!")
		end
	end
end

currentColorIDItem =0
function AmmorAndWeapon()
gg.clearResults()

local del = {}
local te = gg.getListItems()
for i, v in ipairs(te) do
  if (v.name == "item_Color" or v.name == "item_Quantity" or v.name == "item_duration" or v.name == "item_quality" or v.name == "item_weight" or v.name == "item_status" or v.name == "item_blueprint" or v.name=="item_inf_ammo" or v.name=="item_arketype") then
    table.insert(del, te[i].address)
	--gg.toast("I am here")
  end
end
    gg.removeListItems(del)
	
n = gg.prompt({'CURRENT DURATION (>0)',
'CONVERT TO BLUEPRINT OR ARKETYPE AFTER UPGRADE', 
'MAKE PREMIUM ITEM?\n>>If this item convert to blueprint after upgrade it will become ARKetype. It cannot Drop so be sure to check with Blueprint before make ArkeType for if errors)', 
'INFINITE AMMOR\nFor Tek Armor and weapons but not recommended for use with Bows and Slingshot that got problem when used',
'ITEM QUANTITY\nMake item more, not avalable for make blueprint or ARKetype',
'ITEM COLOR\nFill color for item by color code like\n59: RED\n60: GREEN\n61: BLUE\n...'
}, {0, false, false, false, 1, 0}, {'number','checkbox', 'checkbox', 'checkbox', 'number', 'number'})
if n == nil then 
gg.sleep(1)
gg.toast("CANCELLED")
else
	g = math.abs(n[1]-0.5)
	h = math.abs(n[1]+0.5)
	--gg.toast(g)
 	gg.setRanges(range)
	--gg.setVisible(false)
	gg.searchNumber("70F;"..g.."~"..h..";0::25", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
	--gg.refineAddress("C", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1, 0)
	gg.refineNumber(g.."~"..h, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
 
	m = gg.getResultsCount()
	--if m >= 6 then
	--m = 6
	--end
	if m==0 then
	gg.alert("Not found result")
	StartCheat()
	end
	x = gg.getResults(m)
	a = nil
	a = {}
	b = nil
	b = {}
	c = nil
	c = {}
	d = nil
	d = {}
	e = nil
	e = {}
	f = nil
	f = {}
	o = nil
	o = {}
	p = nil
	p = {}
	q = nil
	q = {}
	r = nil
	r = {}
	s = nil
	s = {}
	t = nil
	t = {}
	z = nil
	z = {}
	for i = 1, m do
		q[i] = {}
		q[i][1] = {}
		if is64==true then
		q[i][1].address = x[i].address - 0x14 -- 10 in 32 bit
		else
		q[i][1].address = x[i].address - 0x10
		end
		q[i][1].flags = gg.TYPE_FLOAT
		q[i] = gg.getValues(q[i])
		if math.abs(q[i][1].value-70.0)<0.01 then 
			a[i] = {}
			a[i][1] = {}
			a[i][1].address = x[i].address
			a[i][1].flags = gg.TYPE_DWORD
			a[i][1].name = 'item_duration'
			--a[i][1].value = '2139095040'
			gg.addListItems(a[i])
			c[i] = {}
			c[i][1] = {}
			c[i][1].address = q[i][1].address-0x8
			c[i][1].flags = gg.TYPE_DWORD
			c[i][1].name = 'item_status'
			--c[i][1].value = '-1'
			gg.addListItems(c[i])
			d[i] = {}
			d[i][1] = {}
			d[i][1].address = q[i][1].address-0xc
			d[i][1].flags = gg.TYPE_DWORD
			d[i][1].name = 'item_status'
			--d[i][1].value = '-1'
			gg.addListItems(d[i])
			e[i] = {}
			e[i][1] = {}
			e[i][1].address = q[i][1].address-0x10
			e[i][1].flags = gg.TYPE_DWORD
			e[i][1].name = 'item_status'
			--e[i][1].value = '-1'
			gg.addListItems(e[i])
			f[i] = {}
			f[i][1] = {}
			f[i][1].address = q[i][1].address-0x14
			f[i][1].flags = gg.TYPE_DWORD
			f[i][1].name = 'item_status'
			--f[i][1].value = '-1'
			gg.addListItems(f[i])
			p[i] = {}
			p[i][1] = {}
			p[i][1].address = q[i][1].address-0x4
			p[i][1].flags = gg.TYPE_DWORD
			p[i][1].name = 'item_inf_ammo'
			--if n[3] then
				--p[i][1].value = '2139095040'
			--end
			gg.addListItems(p[i])
			b[i] = {}
			b[i][1] = {}
			if is64 == true then  
			b[i][1].address = x[i].address-0x34c -- (-2cc 32bit
			else
			b[i][1].address = x[i].address-0x2cc
			end
			b[i][1].flags = gg.TYPE_DWORD
			b[i][1].name = 'item_quality'
			--b[i][1].value = '5'
			gg.addListItems(b[i])
			o[i] = {}
			o[i][1] = {}
			if is64 == true then
			o[i][1].address = x[i].address-0x564  -- _-45c 32 bit
			else
			o[i][1].address = x[i].address-0x45c  -- _-45c 32 bit
			end
			o[i][1].flags = gg.TYPE_DWORD
			o[i][1].name = 'item_blueprint'
			--if n[2] then
				--o[i][1].value = '-2134500000'
			--end
			gg.addListItems(o[i])
			r[i] = {}
			r[i][1] = {}
			r[i][1].address = o[i][1].address+0xc
			r[i][1].flags = gg.TYPE_DWORD
			r[i][1].name = 'item_arketype'
			gg.addListItems(r[i])
			
			s[i] = {}
			s[i][1] = {}
			if is64 == true then  
			s[i][1].address = x[i].address-0x1b4
			else
			s[i][1].address = x[i].address-0x1a4
			end
			s[i][1].flags = gg.TYPE_FLOAT
			s[i][1].name = 'item_weight'
			--b[i][1].value = '5'
			gg.addListItems(s[i])
			t[i] = {}
			t[i][1] = {}
			if is64 == true then  
			t[i][1].address = x[i].address+0x74
			else
			t[i][1].address = x[i].address+0x50
			end
			t[i][1].flags = gg.TYPE_DWORD
			t[i][1].name = 'item_Quantity'
			--b[i][1].value = '5'
			gg.addListItems(t[i])

			z[i] = {}
			z[i][1] = {}
			if is64 == true then  
			z[i][1].address = x[i].address+0x5c
			else
			z[i][1].address = x[i].address+0x40
			end
			z[i][1].flags = gg.TYPE_DWORD
			z[i][1].name = 'item_Color'
			--b[i][1].value = '5'
			gg.addListItems(z[i])
			z[i] = gg.getValues(z[i])
			currentColorIDItem = z[i][1].value
		end	
	end
	
	local ros = gg.getListItems()
		for i, v in ipairs(ros) do
			--v.flags = gg.TYPE_DWORD
		  if v.name == "item_duration" then
			v.value = 2139095040
		  elseif
		   v.name == "item_quality" then
			v.value = 5
		  elseif
		   v.name == "item_weight" then
			v.value = "0.01"
		  elseif v.name == "item_status" then
			v.value = -1
		  elseif (v.name == "item_blueprint" and n[2]== true) then
			v.value = '-1999879420'
		  elseif (v.name == "item_arketype" and n[3]== true) then
			v.value = '1'			
		  elseif (v.name == "item_inf_ammo" and n[4]== true) then
			v.value = 2139095040
		  elseif (v.name == "item_Color" and math.abs(currentColorIDItem - tonumber(n[6]))>0.5) then
			v.value = tonumber(n[6])			
		  elseif (v.name == "item_Quantity" and tonumber(n[5])>1) then
			if n[2]== false then
				v.value = tonumber(n[5])	
			else 
				v.value = 1
			end			
		  end
		end
		gg.setValues(ros)
		gg.addListItems(ros)
		gg.alert("Changed! If item got some problem after upgrade. Drop and repickup it for fix")
end		

end

function SaddleUpgrade()
gg.clearResults()

local del = {}
local te = gg.getListItems()
for i, v in ipairs(te) do
  if (v.name == "item_Color" or v.name == "item_Quantity" or v.name == "item_duration" or v.name == "item_quality" or v.name == "item_weight" or v.name == "item_status" or v.name == "item_blueprint" or v.name=="item_inf_ammo" or v.name=="item_arketype") then
    table.insert(del, te[i].address)
	--gg.toast("I am here")
  end
end
    gg.removeListItems(del)

exitsValue = false	
n = gg.prompt({'CURRENT WEIGHT ITEM(>0)',
'CONVERT TO BLUEPRINT OR ARKETYPE AFTER UPGRADE', 
'MAKE PREMIUM ITEM?\n>>If this item convert to blueprint after upgrade it will become ARKetype. It cannot Drop so be sure to check with Blueprint before make ArkeType for if errors)', 
'ITEM QUANTITY\nMake item more >1, not avalable for make blueprint or ARKetype',
'ITEM COLOR\nFill color for item by color code like\n59: RED\n60: GREEN\n61: BLUE\n...'
}, {20, false, false, 1, 0}, {'number','checkbox', 'checkbox', 'number', 'number'})
if n == nil then 
gg.sleep(1)
gg.toast("CANCELLED")
else
	g = math.abs(n[1]-0.1)
	h = math.abs(n[1]+0.1)
	--gg.toast(g)
 	gg.setRanges(range)
	--gg.setVisible(false)
	gg.searchNumber(g.."~"..h.."F;1f;-1f::9", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
	--gg.refineAddress("C", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1, 0)
	gg.refineNumber(g.."~"..h, gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
 
	m = gg.getResultsCount()
	--if m >= 6 then
	--m = 6
	--end
	if m==0 then
	gg.alert("Not found result")
	StartCheat()
	else
	if m >1 then
		x = gg.getResults(m)
		gg.saveVariable(x, gg.EXT_CACHE_DIR.."/Original.value")
		a = nil
		a = {}
		for i = 1, m do
			a[i] = {}
			a[i][1] = {}
			a[i][1].address = x[i].address
			a[i][1].flags = gg.TYPE_FLOAT
			a[i][1].value = math.abs(tonumber(n[1])+i)
			gg.setValues(a[i])
		end
		
		local menu = gg.alert("Current saddle weight changed. Check it and type true value in next step for refine", "Next", "Back", "Hide For Check")
		if menu == 0 then 
			local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
			if check then
				local a = check ()
				local b = gg.getValues(a)
				for a, b in next, b do
					--do what you want
				end
				gg.setValues(a)--revert to original
			end
			UpgradeEquipment()
		elseif menu == 1 then
			o = gg.prompt({'REFINE CURRENT SADDLE WEIGHT:\n>It changed please type true value'},
			 {0}, {'number'})
			if o == nil then 
				gg.sleep(1)
				gg.toast("CANCELLED")
				gg.clearResults()
				local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
				if check then
					local a = check ()
					local b = gg.getValues(a)
					for a, b in next, b do
						--do what you want
					end
					gg.setValues(a)--revert to original
				end
				UpgradeEquipment()
			else
				gg.refineNumber(o[1], gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
				t = gg.getResultsCount()
				if t==0 then
					gg.alert("Not found result. You type wrong value. Let try again")
					gg.clearResults()
					local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
					if check then
						local a = check ()
						local b = gg.getValues(a)
						for a, b in next, b do
							--do what you want
						end
						gg.setValues(a)--revert to original
					end
					UpgradeEquipment()
				else 
					x = gg.getResults(t)
					a1 = nil
					a1 = {}
					a2 = nil
					a2 = {}
					a3 = nil
					a3 = {}
					a4 = nil
					a4 = {}
					a5 = nil
					a5 = {}
					a6 = nil
					a6 = {}
					a7 = nil
					a7 = {}
					a8 = nil
					a8 = {}
					a9 = nil
					a9 = {}				
					for i = 1, t do
						a1[i] = {}
						a1[i][1] = {}
						if is64 == true then
						a1[i][1].address = x[i].address + 0x1A0
						else
						a1[i][1].address = x[i].address + 0x194
						end
						a1[i][1].flags = gg.TYPE_FLOAT
						a1[i] = gg.getValues(a1[i])
						if tonumber(a1[i][1].value-70.0)< 0.01 then 
						exitsValue = true
							a7[i] = {}
							a7[i][1] = {}
							a7[i][1].address = a1[i][1].address - 0x14	
							a7[i][1].flags = gg.TYPE_DWORD
							a7[i][1].name = 'item_status'
							gg.addListItems(a7[i])
							
							a2[i] = {}
							a2[i][1] = {}
							a2[i][1].address = x[i].address		
							a2[i][1].flags = gg.TYPE_FLOAT
							a2[i][1].name = 'item_weight'
							gg.addListItems(a2[i])
							a3[i] = {}
							a3[i][1] = {}
							if is64 == true then 
							a3[i][1].address = a2[i][1].address + 0x1B4
							else
							a3[i][1].address = a2[i][1].address + 0x1A4
							end
							a3[i][1].flags = gg.TYPE_DWORD
							a3[i][1].name = 'item_duration'
							gg.addListItems(a3[i])
							
							a8[i] = {}
							a8[i][1] = {}
							if is64 == true then 
							a8[i][1].address = a3[i][1].address +0x5c
							else
							a8[i][1].address = a3[i][1].address +0x40
							end
							a8[i][1].flags = gg.TYPE_DWORD
							a8[i][1].name = 'item_Color'
							gg.addListItems(a8[i])
							a8[i] = gg.getValues(a8[i])
							currentColorIDItem = a8[i][1].value
							
							a9[i] = {}
							a9[i][1] = {}
							if is64 == true then 
							a9[i][1].address = a3[i][1].address +0x74
							else
							a9[i][1].address = a3[i][1].address +0x50
							end
							a9[i][1].flags = gg.TYPE_DWORD
							a9[i][1].name = 'item_Quantity'
							gg.addListItems(a9[i])
							
							a4[i] = {}
							a4[i][1] = {}
							if is64 == true then 
							a4[i][1].address = a3[i][1].address - 0x34c
							else
							a4[i][1].address = a3[i][1].address - 0x2cc
							end
							a4[i][1].flags = gg.TYPE_DWORD
							a4[i][1].name = 'item_quality'
							gg.addListItems(a4[i])
							
							a5[i] = {}
							a5[i][1] = {}
							if is64 == true then 
							a5[i][1].address = a3[i][1].address - 0x564
							else
							a5[i][1].address = a3[i][1].address - 0x45c
							end
							a5[i][1].flags = gg.TYPE_DWORD
							a5[i][1].name = 'item_blueprint'
							gg.addListItems(a5[i])
							
							a6[i] = {}
							a6[i][1] = {}
							a6[i][1].address = a5[i][1].address+0xc
							a6[i][1].flags = gg.TYPE_DWORD
							a6[i][1].name = 'item_arketype'
							gg.addListItems(a6[i])
						end 
					end
					gg.clearResults()
					local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
					if check then
						local a = check ()
						local b = gg.getValues(a)
						for a, b in next, b do
							--do what you want
						end
						gg.setValues(a)--revert to original
					end
					
				end
			end
		elseif menu == 2 then
		  	local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
			if check then
				local a = check ()
				local b = gg.getValues(a)
				for a, b in next, b do
					--do what you want
				end
				gg.setValues(a)--revert to original
			end
			UpgradeEquipment()
		elseif menu == 3 then
			gg.setVisible(false)
			while(menu == 3)
			do
			  while gg.isVisible(true)
				do--
				  gg.setVisible(false)
				  menu = 1
					o = gg.prompt({'REFINE CURRENT SADDLE WEIGHT:\n>It changed please type true value'},
					 {0}, {'number'})
					if o == nil then 
						gg.sleep(1)
						gg.toast("CANCELLED")
						gg.clearResults()
						local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
						if check then
							local a = check ()
							local b = gg.getValues(a)
							for a, b in next, b do
								--do what you want
							end
							gg.setValues(a)--revert to original
						end
						UpgradeEquipment()
					else
						gg.refineNumber(o[1], gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
						t = gg.getResultsCount()
						if t==0 then
							gg.alert("Not found result. You type wrong value. Let try again")
							gg.clearResults()
							local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
							if check then
								local a = check ()
								local b = gg.getValues(a)
								for a, b in next, b do
									--do what you want
								end
								gg.setValues(a)--revert to original
							end
							UpgradeEquipment()
						else 
							x = gg.getResults(t)
							a1 = nil
							a1 = {}
							a2 = nil
							a2 = {}
							a3 = nil
							a3 = {}
							a4 = nil
							a4 = {}
							a5 = nil
							a5 = {}
							a6 = nil
							a6 = {}
							a7 = nil
							a7 = {}
							a8 = nil
							a8 = {}
							a9 = nil
							a9 = {}				
							for i = 1, t do
								a1[i] = {}
								a1[i][1] = {}
								if is64 == true then
								a1[i][1].address = x[i].address + 0x1A0
								else
								a1[i][1].address = x[i].address + 0x194
								end
								a1[i][1].flags = gg.TYPE_FLOAT
								a1[i] = gg.getValues(a1[i])
								if tonumber(a1[i][1].value-70.0)< 0.01 then 
								exitsValue = true
									a7[i] = {}
									a7[i][1] = {}
									a7[i][1].address = a1[i][1].address - 0x14	
									a7[i][1].flags = gg.TYPE_DWORD
									a7[i][1].name = 'item_status'
									gg.addListItems(a7[i])
									
									a2[i] = {}
									a2[i][1] = {}
									a2[i][1].address = x[i].address		
									a2[i][1].flags = gg.TYPE_FLOAT
									a2[i][1].name = 'item_weight'
									gg.addListItems(a2[i])
									a3[i] = {}
									a3[i][1] = {}
									if is64 == true then 
									a3[i][1].address = a2[i][1].address + 0x1B4
									else
									a3[i][1].address = a2[i][1].address + 0x1A4
									end
									a3[i][1].flags = gg.TYPE_DWORD
									a3[i][1].name = 'item_duration'
									gg.addListItems(a3[i])
									
									a8[i] = {}
									a8[i][1] = {}
									if is64 == true then 
									a8[i][1].address = a3[i][1].address +0x5c
									else
									a8[i][1].address = a3[i][1].address +0x40
									end
									a8[i][1].flags = gg.TYPE_DWORD
									a8[i][1].name = 'item_Color'
									gg.addListItems(a8[i])
									a8[i] = gg.getValues(a8[i])
									currentColorIDItem = a8[i][1].value	
									
									a9[i] = {}
									a9[i][1] = {}
									if is64 == true then 
									a9[i][1].address = a3[i][1].address +0x74
									else
									a9[i][1].address = a3[i][1].address +0x50
									end
									a9[i][1].flags = gg.TYPE_DWORD
									a9[i][1].name = 'item_Quantity'
									gg.addListItems(a9[i])
									
									a4[i] = {}
									a4[i][1] = {}
									if is64 == true then 
									a4[i][1].address = a3[i][1].address - 0x34c
									else
									a4[i][1].address = a3[i][1].address - 0x2cc
									end
									a4[i][1].flags = gg.TYPE_DWORD
									a4[i][1].name = 'item_quality'
									gg.addListItems(a4[i])
									
									a5[i] = {}
									a5[i][1] = {}
									if is64 == true then 
									a5[i][1].address = a3[i][1].address - 0x564
									else
									a5[i][1].address = a3[i][1].address - 0x45c
									end
									a5[i][1].flags = gg.TYPE_DWORD
									a5[i][1].name = 'item_blueprint'
									gg.addListItems(a5[i])
									
									a6[i] = {}
									a6[i][1] = {}
									a6[i][1].address = a5[i][1].address+0xc
									a6[i][1].flags = gg.TYPE_DWORD
									a6[i][1].name = 'item_arketype'
									gg.addListItems(a6[i])
								end 
							end
							gg.clearResults()
							local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
							if check then
								local a = check ()
								local b = gg.getValues(a)
								for a, b in next, b do
									--do what you want
								end
								gg.setValues(a)--revert to original
							end
							
						end
					end
				
				end--
			end
			
		end
		
		
	else
		x = gg.getResults(m)
		a1 = nil
		a1 = {}
		a2 = nil
		a2 = {}
		a3 = nil
		a3 = {}
		a4 = nil
		a4 = {}
		a5 = nil
		a5 = {}
		a6 = nil
		a6 = {}
		a7 = nil
		a7 = {}
		a8 = nil
		a8 = {}
		a9 = nil
		a9 = {}	
		for i = 1, m do
			a1[i] = {}
			a1[i][1] = {}
			if is64 == true then
			a1[i][1].address = x[i].address + 0x1A0
			else
			a1[i][1].address = x[i].address + 0x194
			end
			a1[i][1].flags = gg.TYPE_FLOAT
			a1[i] = gg.getValues(a1[i])
			if tonumber(a1[i][1].value-70.0)< 0.01 then 
			exitsValue = true
				a7[i] = {}
				a7[i][1] = {}
				a7[i][1].address = a1[i].address - 	0x14	
				a7[i][1].flags = gg.TYPE_DWORD
				a7[i][1].name = 'item_status'
				gg.addListItems(a7[i])
				
				a2[i] = {}
				a2[i][1] = {}
				a2[i][1].address = x[i].address		
				a2[i][1].flags = gg.TYPE_FLOAT
				a2[i][1].name = 'item_weight'
				gg.addListItems(a2[i])
				a3[i] = {}
				a3[i][1] = {}
				if is64 == true then 
				a3[i][1].address = a2[i][1].address + 0x1B4
				else
				a3[i][1].address = a2[i][1].address + 0x1A4
				end
				a3[i][1].flags = gg.TYPE_DWORD
				a3[i][1].name = 'item_duration'
				gg.addListItems(a3[i])
				
				a8[i] = {}
				a8[i][1] = {}
				if is64 == true then 
				a8[i][1].address = a3[i][1].address +0x5c
				else
				a8[i][1].address = a3[i][1].address +0x40
				end
				a8[i][1].flags = gg.TYPE_DWORD
				a8[i][1].name = 'item_Color'
				gg.addListItems(a8[i])
				a8[i] = gg.getValues(a8[i])
				currentColorIDItem = a8[i][1].value
				
				a9[i] = {}
				a9[i][1] = {}
				if is64 == true then 
				a9[i][1].address = a3[i][1].address +0x74
				else
				a9[i][1].address = a3[i][1].address +0x50
				end
				a9[i][1].flags = gg.TYPE_DWORD
				a9[i][1].name = 'item_Quantity'
				gg.addListItems(a9[i])
				
				a4[i] = {}
				a4[i][1] = {}
				if is64 == true then 
				a4[i][1].address = a3[i][1].address - 0x34c
				else
				a4[i][1].address = a3[i][1].address - 0x2cc
				end
				a4[i][1].flags = gg.TYPE_DWORD
				a4[i][1].name = 'item_quality'
				gg.addListItems(a4[i])
				
				a5[i] = {}
				a5[i][1] = {}
				if is64 == true then 
				a5[i][1].address = a3[i][1].address - 0x564
				else
				a5[i][1].address = a3[i][1].address - 0x45c
				end
				a5[i][1].flags = gg.TYPE_DWORD
				a5[i][1].name = 'item_blueprint'
				gg.addListItems(a5[i])
				
				a6[i] = {}
				a6[i][1] = {}
				a6[i][1].address = a5[i][1].address+0xc
				a6[i][1].flags = gg.TYPE_DWORD
				a6[i][1].name = 'item_arketype'
				gg.addListItems(a6[i])
			end 
		end
	end
	end 

	if exitsValue then 	
		local ros = gg.getListItems()
		for i, v in ipairs(ros) do
			--v.flags = gg.TYPE_DWORD
			  if v.name == "item_duration" then
				v.value = 2139095040
			  elseif
			   v.name == "item_quality" then
				v.value = 5
			  elseif
			   v.name == "item_weight" then
				v.value = "0.01"
			  elseif v.name == "item_status" then
				v.value = -1
			  elseif (v.name == "item_blueprint" and n[2]== true) then
				v.value = '-2,134,353,594'
			  elseif (v.name == "item_arketype" and n[3]== true) then
				v.value = '1'			
			  elseif (v.name == "item_Color" and math.abs(currentColorIDItem - tonumber(n[5]))>0.5) then
				v.value = tonumber(n[5])			
			  elseif (v.name == "item_Quantity" and tonumber(n[4])>1) then
			  		if n[2]== false then
						v.value = tonumber(n[4])	
					else 
						v.value = 1
					end	
		
			  end
		end
		gg.setValues(ros)
		gg.addListItems(ros)
		gg.alert("Changed! If item got some problem after upgrade. Drop and repickup it for fix")
	else
			gg.clearResults()
		local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
		if check then
			local a = check ()
			local b = gg.getValues(a)
			for a, b in next, b do
				--do what you want
			end
			gg.setValues(a)--revert to original
		end
	end
end		

end


function PrimalPass()
gg.clearResults()
if is64 == true then
	LibStart=gg.getRangesList('libUE4.so')[1].start
	APEXGG=nil
	APEXGG={}
	APEXGG[1]={}
	APEXGG[2]={}
	if gversion==2028 then
	APEXGG[1].address=LibStart+0x2AC84B4
	else
	APEXGG[1].address=LibStart+0x2AC5FDC
	end
	APEXGG[1].value='h200080D2'
	APEXGG[1].flags=4
	if gversion==2028 then
	APEXGG[2].address=LibStart+(0x2AC84B4+0x4)
	else
	APEXGG[2].address=LibStart+(0x2AC5FDC+0x4)
	end
	APEXGG[2].value='hC0035FD6'
	APEXGG[2].flags=4
	gg.setValues(APEXGG)
else
	LibStart=gg.getRangesList('libUE4.so')[1].start
	APEXGG=nil
	APEXGG={}
	APEXGG[1]={}
	APEXGG[2]={}
	if gversion==2028 then
	APEXGG[1].address=LibStart+0x222F9B0
	else
	APEXGG[1].address=LibStart+0x222EAE8
	end
	APEXGG[1].value='h0100A0E3'
	APEXGG[1].flags=4
	if gversion == 2028 then
	APEXGG[2].address=LibStart+(0x222F9B0+0x4)
	else
	APEXGG[2].address=LibStart+(0x222EAE8+0x4)
	end
	APEXGG[2].value='h1EFF2FE1'
	APEXGG[2].flags=4
	gg.setValues(APEXGG)
--gg.alert("This change is not for 32 bit processor")
end
gg.toast("Actived!")
end

function TameDinos()
gg.clearResults()

n = gg.prompt({
'FORCE TAMING?\n(allow tame any creature with put food in hot bar)',
'MAKE CREATURE UNCONSCIOUS AND FOOD = 0\n(support tame wild creature by unconscious)',
'FAST TAMING?\n(allow tame any creature with only one food tame)',
'KILL THIS CREATURE?\n(allow kill creature)',
'FORCE TAMED NO FOOD?\n(Make creature become tamed not need food tame. It can not get bonus level\nNote: For Tame creatures can not tame, lets use FORCE TAMING before use this option'
}, 
{false, true, false, false, false}, 
{'checkbox','checkbox','checkbox','checkbox', 'checkbox'})
if n == nil then 
gg.sleep(1)
gg.toast("CANCELLED")
Dino()
else
	if n[5] == true then
		n[2] = false
	end
	local foc = gg.getListItems()
	for i, v in ipairs(foc) do
		if n[1]==true then
		  if v.name == "ForceID1" then
		  v.flags = gg.TYPE_DWORD
			v.value = '37751448'
		  end
		  if v.name == "ForceID2" then
		  v.flags = gg.TYPE_DWORD
			v.value = '786944'
		  end
		end
		if (n[2] == true) then
			if v.name == "DCurrentTorpor" then
				v.flags = gg.TYPE_FLOAT
				v.value = '9'
			end
			if v.name == "DTorpor" then
				v.flags = gg.TYPE_FLOAT
				v.value = '-1'
			end
			if v.name == "DCurrentFood" then
				v.value = '0'
			end
		end	
		if n[3] == true and v.name == "FastTame" then
			v.value = '0'
		end	
		if n[4]==true and v.name == "CurrentHP" then
			v.flags = gg.TYPE_FLOAT
			v.value = '-10'
		end
	end
	gg.setValues(foc)
	gg.addListItems(foc)
	if n[5] == true then
		if #TorporDinoAdd>=4 then
			if (backupPlayerID<100000) then
				n = gg.prompt({'Player ID (>0)\nType true value to work. Find it in Player Implant'},
				{0}, 
				{'number'})
				  if n == nil then 
				  gg.toast("CANCELLED")
				  TameDinos()
				  gg.sleep(1)
				  else
					  if (tonumber(n[1])<100000) then 
						gg.alert("Wrong ID. Let's try again")
						TameDinos()
					  else
						backupPlayerID = tonumber(n[1])
						gg.sleep(100)
						local t = {}
						t[1] = {}
						t[1].address =  TorporDinoAdd[1].address
						t[1].flags = gg.TYPE_FLOAT
						t[1].value = '9'
						t[2] = {}
						t[2].address =  TorporDinoAdd[2].address
						t[2].flags = gg.TYPE_FLOAT
						t[2].value = '-1'
						t[3] = {}
						t[3].address =  TorporDinoAdd[3].address
						t[3].flags = gg.TYPE_DWORD
						t[3].value = '2139095040'
						gg.setValues(t)
						gg.sleep(200)
						local k = {}
						k[1] = {}
						k[1].address =  TorporDinoAdd[4].address
						k[1].flags = gg.TYPE_DWORD
						k[1].value = tonumber(backupPlayerID)
						gg.setValues(k)
						gg.sleep(200)
					  end
				  end
			else
				gg.sleep(100)
				local t = {}
				t[1] = {}
				t[1].address =  TorporDinoAdd[1].address
				t[1].flags = gg.TYPE_FLOAT
				t[1].value = '9'
				t[2] = {}
				t[2].address =  TorporDinoAdd[2].address
				t[2].flags = gg.TYPE_FLOAT
				t[2].value = '-1'
				t[3] = {}
				t[3].address =  TorporDinoAdd[3].address
				t[3].flags = gg.TYPE_DWORD
				t[3].value = '2139095040'
				gg.setValues(t)
				gg.sleep(200)
				local k = {}
				k[1] = {}
				k[1].address =  TorporDinoAdd[4].address
				k[1].flags = gg.TYPE_DWORD
				k[1].value = tonumber(backupPlayerID)
				gg.setValues(k)
				gg.sleep(200)
		
			end
		end
			FillStatsDino(1)
	end	

	local bonusLv = 0
	if n[5] == true then
		gg.sleep(200)	
		tameLV = math.abs(tonumber(currentLvUpD)+tonumber(currentTameLvD))
		bonusLv = tameLV * 0.5
		bonusLv = round(bonusLv)
		tameLV = tameLV * 1.5
		tameLV = round(tameLV)
		UnlimitLevelUp(tameLV)	
		gg.toast('Tamed! Bonus Level: '.. bonusLv.." | Current Level: "..tameLV)
		local t = {}
		t[1] = {}
		t[1].address =  TorporDinoAdd[1].address
		t[1].flags = gg.TYPE_FLOAT
		t[1].value = '1'
		t[2] = {}
		t[2].address =  TorporDinoAdd[2].address
		t[2].flags = gg.TYPE_FLOAT
		t[2].value = '10000'
		t[3] = {}
		t[3].address =  TorporDinoAdd[3].address
		t[3].flags = gg.TYPE_DWORD
		t[3].value = '2139095040'
		gg.setValues(t)
	else
	gg.toast('Changed! Put food tame for your creature to tame or take implant after kill')
	end
end			

end

function CustomStatsDino()
gg.clearResults()

for i = 1, #max1devDino do
	if (max1devDino[i] == math.huge or max1devDino[i] == -math.huge or max1devDino[i]~=max1devDino[i]) then
	max1devDino[i] = -1
	end
end

n = gg.prompt({'CURRENT LEVEL: (Only show no for change here)',
 'CURRENT MAX HEALTH\n(-1: for infinite, 0: no change, any number >0 for change)',
 'CURRENT MAX STAMINA\n(-1: for infinite, 0: no change, any number >100 for change)',
 'CURRENT MAX OXYGEN\n(-1: for infinite, 0: no change, any number >100 for change)',
 'CURRENT MAX FOOD\n(-1: for infinite, 0: no change, any number >100 for change)',
 'CURRENT MAX WEIGHT\n(-1: for infinite, 0: no change, any number >100 for change)',
 'CURRENT MELEE DAMAGE\n(-1: for infinite, 0: no change any number >100 for change)',
 'CURRENT MOVEMENT SPEED\n(Can not change here but it can changed by change imprinting in breed menu)',
 'CURRENT MAX TORPOR\n(-1 for infinite and it only change by change level)',
 'FILL CURRENT STATS CREATURE TO MAX',
 'CURRENT EXPERIENCE CREATURE'},
 {math.abs(tonumber(currentLvUpD)+tonumber(currentTameLvD)), max1devDino[1], max1devDino[2], max1devDino[3], max1devDino[4], max1devDino[5], max1devDino[6], max1devDino[7], max1devDino[8],true, tonumber(currentExpDino)}, 
 {'number', 'number', 'number', 'number', 'number', 'number', 'number', 'number', 'number', 'checkbox', 'number'})
  if n == nil then 
  gg.toast("CANCELLED")
  gg.sleep(1)
  else

	local ros = gg.getListItems()
    for i, v in ipairs(ros) do
		if v.name == "DCurrentTorpor" then
			v.value = '1'
		end
		if v.name == "DCurrentFood" then
			v.flags = gg.TYPE_DWORD
			v.value = '2139095040'
		end
      if v.name == "Dexp" then
		v.flags = gg.TYPE_FLOAT
			v.value = tonumber(n[11])
      end
	  if (v.name == "vHP" or v.name == "CurrentHP" or v.name == "MaxHP") and math.abs(tonumber(n[2]))>0.01 then
		--gg.alert("i am here 0")
		if tonumber(n[2]) > -1.1 and tonumber(n[2]) < -0.9 then
			v.flags = gg.TYPE_DWORD
			v.value = '2139095040'
		else
			v.flags = gg.TYPE_FLOAT
			if v.name == "vHP" then
				v.value = ((tonumber(n[2])-max1devDino[1]+ max2devDino[1])/baseDino[1] - 1)/rateDino[1]
				--val = (max/ base - 1)/rate
			end
			if (v.name == "CurrentHP" or v.name == "MaxHP") and n[10] == true then
				v.value = tonumber(n[2])
			end
		end
	  end
	  if (v.name == "vStamina" or v.name == "DCurrentStamina" or v.name == "DmaxStamina") and math.abs(tonumber(n[3]))>0.01 then
		--gg.alert("i am here 0")
		if tonumber(n[3]) > -1.1 and tonumber(n[3]) < -0.9 then
			v.flags = gg.TYPE_DWORD
			v.value = '2139095040'
		else
			v.flags = gg.TYPE_FLOAT
			if v.name == "vStamina" then
				v.value = ((tonumber(n[3])-max1devDino[2]+ max2devDino[2])/baseDino[2] - 1)/rateDino[2]
			end
			if (v.name == "DCurrentStamina" or v.name == "DmaxStamina") and n[10] == true then
				v.value = tonumber(n[3])
			end
		end
	  end
	  
	 if (v.name == "vOxygen" or v.name == "DCurrentOxygen" or v.name == "DmaxOxygen") and math.abs(tonumber(n[4]))>0.01 then
		--gg.alert("i am here 0")
		if tonumber(n[4]) > -1.1 and tonumber(n[4]) < -0.9 then
			v.flags = gg.TYPE_DWORD
			v.value = '2139095040'
		else
			v.flags = gg.TYPE_FLOAT
			if v.name == "vOxygen" then
				v.value = ((tonumber(n[4])-max1devDino[3]+ max2devDino[3])/baseDino[3] - 1)/rateDino[3]
			end
			if (v.name == "DCurrentOxygen" or v.name == "DmaxOxygen") and n[10] == true then
				v.value = tonumber(n[4])
			end
		end
	  end
	  
	  if (v.name == "vFood" or v.name == "DCurrentFood" or v.name == "DmaxFood") and math.abs(tonumber(n[5]))>0.01 then
		--gg.alert("i am here 0")
		if tonumber(n[5]) > -1.1 and tonumber(n[5]) < -0.9 then
			v.flags = gg.TYPE_DWORD
			v.value = '2139095040'
		else
			v.flags = gg.TYPE_FLOAT
			if v.name == "vFood" then
				v.value = ((tonumber(n[5])-max1devDino[4]+ max2devDino[4])/baseDino[4] - 1)/rateDino[4]
			end
			if (v.name == "DCurrentFood" or v.name == "DmaxFood") and n[10] == true then
				v.value = tonumber(n[5])
			end
		end
	  end
	  if v.name == "vWeight" or v.name == "DmaxWeight" and math.abs(tonumber(n[6]))>0.01 then
		if tonumber(n[6]) > -1.1 and tonumber(n[6]) < -0.9 then
			v.flags = gg.TYPE_DWORD
			v.value = '2139095040'
		else
			v.flags = gg.TYPE_FLOAT
			v.value = ((tonumber(n[6])-max1devDino[5]+ max2devDino[5])/baseDino[5] - 1)/rateDino[5]
		end
	  end
	  
	  if v.name == "vMeleeDamage" or v.name == "DMeleeDamage" and math.abs(tonumber(n[7]))>0.01 then
		if tonumber(n[7]) > -1.1 and tonumber(n[7]) < -0.9 then
			v.flags = gg.TYPE_DWORD
			v.value = '2139095040'
		else
			v.flags = gg.TYPE_FLOAT
			v.value = ((tonumber(n[7])-max1devDino[6]+ max2devDino[6])/baseDino[6] - 1)/rateDino[6]
			--v.value = (baseDino[j] *(1+rateDino[j]*levelsup[j])-100.0)/100.0
			--v.value = ((((100* (tonumber(n[7])-max1devDino[6]+ max2devDino[6]))+100)/baseDino[6]-1)/rateDino[6])/100
			
		end
	  end
	  if v.name == "vMovementSP" and math.abs(tonumber(n[8]))>0.01 then
		if tonumber(n[8]) > -1.1 and tonumber(n[8]) < -0.9 then
			v.flags = gg.TYPE_DWORD
			--v.value = '2139095040'
		else
			--v.value = (tonumber(n[8])-max1devDino[7]+ max2devDino[7] - baseDino[7])/rateDino[7]
		end
	  end
	  if (v.name == "vTorpor" or v.name == "DCurrentTorpor" or v.name == "DTorpor") and math.abs(tonumber(n[9]))>0.01 then
		if tonumber(n[9]) > -1.1 and tonumber(n[9]) < -0.9 then
			if v.name == "vTorpor" then
			v.flags = gg.TYPE_DWORD
			v.value = '2139095040'
			end
			if v.name == "DCurrentTorpor" then
			v.flags = gg.TYPE_DWORD
			v.value = '0'
			end
			if v.name == "DTorpor" then
			v.flags = gg.TYPE_DWORD
			v.value = '2139095040'
			end
		else
			if v.name == "vTorpor" then
				v.flags = gg.TYPE_FLOAT
				v.value = '0'
			end
			if v.name == "DCurrentTorpor" and n[10] == true then
				v.value = '0'
			end
		end
	  end	  
    end
    gg.alert("Successful change. Maybe need to restart game if nothing change. \nMore These changes may disappear after you die. Using any dino upgrade points will permanently save changes even if dino die ")
    gg.setValues(ros)
    gg.addListItems(ros)
  end	

end

function FillStatsDino(vlu) 
	local ros = gg.getListItems()
    for i, v in ipairs(ros) do
		if v.name == "DCurrentTorpor" then
			v.value = '1'
		elseif v.name == "DTorpor" then
			v.flags = gg.TYPE_FLOAT
			v.value = '10000'
		elseif v.name == "DCurrentFood" then
			v.flags = gg.TYPE_DWORD
			v.value = '2139095040'
			--gg.alert("Food: " .. v.value)
		elseif v.name == "CurrentHP" then
			v.flags = gg.TYPE_DWORD
			v.value = '2139095040'
		elseif v.name == "DCurrentStamina" then
			v.flags = gg.TYPE_DWORD
			v.value = '2139095040'
		elseif v.name == "DCurrentOxygen" then
			v.flags = gg.TYPE_DWORD
			v.value = '2139095040'
		end  
    end
	if vlu == 0 then
    gg.toast("Changed!")
	end
    gg.setValues(ros)
    gg.addListItems(ros)
end

function unlimitedFeces() 
	if chStatus[7] == isOn then 
		local ros = gg.getListItems()
		for i, v in ipairs(ros) do
			if v.name == "DCurrentTorpor" then
				v.value = '1'
			elseif v.name == "DCurrentFood" then
				v.flags = gg.TYPE_DWORD
				v.value = '2139095040'
			elseif v.name == "Dfeces" then
				v.flags = gg.TYPE_FLOAT
				v.value = '0'
				v.freeze = true
			end
		end
		gg.toast("Droped Feces!")
		gg.setValues(ros)
		gg.addListItems(ros)
	else
		local ros = gg.getListItems()
		for i, v in ipairs(ros) do
			if v.name == "DCurrentTorpor" then
				v.value = '1'
			elseif v.name == "DCurrentFood" then
				v.flags = gg.TYPE_DWORD
				v.value = '2139095040'
			elseif v.name == "Dfeces" then
				v.flags = gg.TYPE_FLOAT
				v.freeze = false
			end
		end
		gg.toast("Droped Feces!")
		gg.setValues(ros)
		gg.addListItems(ros)
	end	
end
local infoColorSaved = {}
function SelectionColorSaved()
infoColorSaved = {}
local config = gg.getFile()..'.ColorSaved.cfg'
local data = loadfile(config)
if data ~= nil then
	infoColorSaved = data()
	data = nil
end

if #infoColorSaved<1 then
CustomColorDino()
else
	local menuCL = {}
	local newColor = "🧹  New Color"
	menuCL[#menuCL+1] = newColor
	for i=1, #infoColorSaved do
	menuCL[#menuCL+1] = "🧮  "..infoColorSaved[i][1]
	end
	
	local multiS = gg.choice(menuCL,nil,"Total Color Saved: "..(#menuCL-1)..". Let's select an option to continue")
		if multiS == nil then 
			noselect()
			Dino()
		else
			if multiS == 1 then
			CustomColorDino()
			else
				local alert = gg.alert("What do you want to continue?", "Continue  Change", "Delete Save", "Back")
				if alert == 0 then --no select
					gg.toast("You are not select anything")
					SelectionColorSaved()							
				elseif alert == 1 then -- Continue  Change
			
					local foc = gg.getListItems()
					for i, v in ipairs(foc) do
						if v.name == "DCurrentTorpor" then
							v.value = '1'
						end
						if v.name == "DCurrentFood" then
							v.flags = gg.TYPE_DWORD
							v.value = '2139095040'
						end
						for j = 1, #listID do
							if v.name == listID[j] then
								v.value = infoColorSaved[multiS-1][j+1]
								v.freeze = true
								listIDValueDefault[j] = infoColorSaved[multiS-1][j+1]
							end
						end
					end	
						gg.setValues(foc)
						gg.addListItems(foc)
						gg.alert('Changed! Save and Restart Game or put food by Potent Dust with color to update change')
						--SelectionColorSaved()					
				elseif alert == 2 then -- Delete Save
					table.remove(infoColorSaved, multiS-1)
					gg.saveVariable(infoColorSaved, config)
					gg.toast("Save deleted!!!")
				elseif alert == 3 then -- back
					SelectionColorSaved()
				end
			end
		end
	end

end

function CustomColorDino()
for i = 1, #listIDValueDefault do
	if (i==4 or i==8 or i== 12 and tonumber(listIDValueDefault[i])<0.1) then
		listIDValueDefault[i] = 1.0
	end
end

n = gg.prompt({
'CURRENT TORSO RED VALUE (R):',
'CURRENT TORSO GREEN VALUE (G):',
'CURRENT TORSO BLUE VALUE (B):',
'CURRENT TORSO ALPHA VALUE (A):',	
'CURRENT FEET AND HEAD RED VALUE (R):',
'CURRENT FEET AND HEAD GREEN VALUE (G):',
'CURRENT FEET AND HEAD BLUE VALUE (B):',
'CURRENT FEET AND HEAD ALPHA VALUE (A):',
'CURRENT OTHER PARTS RED VALUE (R):',
'CURRENT OTHER PARTS GREEN VALUE (G):',
'CURRENT OTHER PARTS BLUE VALUE (B):',
'CURRENT OTHER PARTS ALPHA VALUE (A):',
'GRADIENT BEFORE RATE:',
'GRADIENT AFTER RATE:',
'Save this color?:'
}, 
{listIDValueDefault[1], listIDValueDefault[2], listIDValueDefault[3], listIDValueDefault[4], listIDValueDefault[5], listIDValueDefault[6], listIDValueDefault[7], listIDValueDefault[8], listIDValueDefault[9], listIDValueDefault[10], listIDValueDefault[11], listIDValueDefault[12], listIDValueDefault[13], listIDValueDefault[14], false}, 
{'number','number','number','number','number','number', 'number', 'number', 'number', 'number', 'number', 'number', 'number', 'number', 'checkbox'})
if n == nil then 
gg.sleep(1)
gg.toast("CANCELLED")
Dino()
else
	if n[15] == false then
		local foc = gg.getListItems()
		for i, v in ipairs(foc) do
			if v.name == "DCurrentTorpor" then
				v.value = '1'
			end
			if v.name == "DCurrentFood" then
				v.flags = gg.TYPE_DWORD
				v.value = '2139095040'
			end
			for j = 1, #listID do
				if v.name == listID[j] then
					v.value = n[j]
					v.freeze = true
					listIDValueDefault[j] = n[j]
				end
			end
		end
		gg.setValues(foc)
		gg.addListItems(foc)
		gg.alert('Changed! Save and Restart Game or put food by Potent Dust with color to update change')
	else
		k = gg.prompt({'Input name of Color save'},
			 {"Color "..(#infoColorSaved+1)}, {'text'})
			if k == nil then 
				gg.sleep(1)
				gg.toast("CANCELLED")
				CustomColorDino()
			else
				local infocolors = nil
				infocolors = {}
				infocolors[#infocolors+1] = k[1]
				for j = 1, #listID do
					infocolors[#infocolors+1] = n[j]
				end
				infoColorSaved[#infoColorSaved+1] = infocolors
				--gg.saveList("/sdcard/Values.txt")
				--gg.saveVariable(Save_coordinates, '/sdcard/test.lua')
				--os.remove(config)
				gg.saveVariable(infoColorSaved, gg.getFile()..'.ColorSaved.cfg')
				gg.toast("Saved "..k[1])
				--Teleport()
			end
	
		local foc = gg.getListItems()
		for i, v in ipairs(foc) do
			if v.name == "DCurrentTorpor" then
				v.value = '1'
			end
			if v.name == "DCurrentFood" then
				v.flags = gg.TYPE_DWORD
				v.value = '2139095040'
			end
			for j = 1, #listID do
				if v.name == listID[j] then
					v.value = n[j]
					v.freeze = true
					listIDValueDefault[j] = n[j]
				end
			end
		end
		gg.setValues(foc)
		gg.addListItems(foc)
		gg.alert('Changed! Save and Restart Game or put food by Potent Dust with color to update change')
		SelectionColorSaved()
	end	
end -- from else

while true do
  if gg.isVisible() then
    gg.setVisible(false)
    CustomColorDino()
  else
    gg.sleep(100) 
    end
    end
end

function CustomDinoOther()
n = gg.prompt({
'FORCE RIDING\n(No need saddle to ride)',
'EERIE CREATURE\n-Conflict with force riding mod and change gender\n-Only 1 for change', 
'CHANGE GENDER: FeMale?\n(Not Check if Male, Check if Female)',
'INVISIBLE\n(Make any creature invisible like tame in caves)',
'FLY CREATURE\n(Make any creature can Fly. Conflict with change Gender to Male. Can not save, auto restore default after restart game)',
'PICKUP CREATURE\n(Make any creature can Pickup. Conflict with INVISIBLE mod. Can not save, auto restore default after restart game)',
'MAKE WILD CREATURE\n(Make tamed creature become wild creature)'
}, 
{false, true, true, false, false, false, false}, 
{'checkbox','checkbox','checkbox','checkbox','checkbox','checkbox', 'checkbox'})
if n == nil then 
gg.sleep(1)
gg.toast("CANCELLED")
Dino()
else
	if n[1]==true then 
	n[2] = false
	end
	if n[2] == true then
	n[1] = false
	end	
	
	local foc = gg.getListItems()
	for i, v in ipairs(foc) do
		if v.name == "DCurrentTorpor" then
			v.value = '1'
		end
		if v.name == "DCurrentFood" then
			v.flags = gg.TYPE_DWORD
			v.value = '2139095040'
		end
		if (n[1]== true and n[2] == false and v.name == "rideID") then
			if n[3]==false then 
				v.value = '2622208'
			else
				v.value = '6816256'
			end
		end
		if (n[1]== false and v.name == "rideID") then
			if n[2] == true then
				if n[3]==false then
				 v.value = '8913408'
				else 
				 v.value = '13109760'
				end
			else
				if n[3]==false then
				 v.value = '526848'
				else 
				 v.value = '4719104'
				end
			end
			
			if (n[5]==true) then 
				v.value = '13,118,080'
			end
			
		end
		if (v.name == "ForceID2") then
			if (n[4]==true) then
				v.value = '793,088'
			else
				v.value = '786944'
			end
			
			if (n[6] == true) then
				v.value = '1700000'
			end
		end	
		if (v.name == "ownDino" and n[7]==true) then
			v.value = '5'
		end	
		
	end
	gg.setValues(foc)
	gg.addListItems(foc)
	gg.alert('Changed! Some need restart game to see changes')
end			

end

tameLV =0
function UnlimitLevelUp(vlue)
if (tameLV<0.01) then
tameLV = math.abs(tonumber(currentLvUpD)+tonumber(currentTameLvD))
end
listChoiceLevelUp = {true, true, true, true, true, true, false, false}
levelsup = {0,0,0,0,0,0,0,0}
if vlue==0 then
	n = gg.prompt({'WHAT CREATURE LEVEL UP TO?\n(Level up dino and random up points to dino stats)',
	'MAX HEALTH\n(Check if you want to prioritize upgrade points here)',
	'MAX STAMINA\n(Check if you want to prioritize upgrade points here)',
	'MAX OXYGEN\n(Check if you want to prioritize upgrade points here)',
	'MAX FOOD\n(Check if you want to prioritize upgrade points here)',
	'MAX WEIGHT\n(Check if you want to prioritize upgrade points here)',
	'MAX MELEE DAMAGE\n(Check if you want to prioritize upgrade points here)',
	'MAX TORPOR\n(Can not check to prioritize upgrade points here. It depends by automatically scaling with level)'
	}, 
	{tameLV , listChoiceLevelUp[1], listChoiceLevelUp[2], listChoiceLevelUp[3], listChoiceLevelUp[4], listChoiceLevelUp[5], listChoiceLevelUp[6], listChoiceLevelUp[8]}, 
	{'number','checkbox','checkbox','checkbox','checkbox','checkbox','checkbox','checkbox'})
	if n == nil then 
	gg.sleep(1)
	gg.toast("CANCELLED")
	Dino()
	else

		for j=1, (#levelsup-2) do
			listChoiceLevelUp[j] = n[j+1]
		end

		m = math.random(1, #levelsup)
		i=1
		tameLV = tonumber(n[1]) 
		while (i <= tameLV) do
			m = math.random(1, #levelsup)
			if (listChoiceLevelUp[m] == true) then
				levelsup[m]=levelsup[m]+1
				i = i  + 1
			end
		end

		
		local foc = gg.getListItems()
		for i, v in ipairs(foc) do
			if v.name == "DCurrentTorpor" then
				v.value = '1'
			end
			if v.name == "DTorpor" then
				v.value = '100000'
			end
			if v.name == "DCurrentFood" then
				v.flags = gg.TYPE_DWORD
				v.value = '2139095040'
			end
			if v.name == "DLVUP" then
				v.value = '0'
			end
			if v.name == "DtameLV" then
				v.value = tameLV
			end	
		--curKeyDino = {"CurrentHP","DCurrentStamina","DCurrentOxygen","DCurrentFood","DCurrentWeight","DCurrentMeleeDame","DCurrentMoveSPD","DCurrentTorpor"}
			for j=1,#levelsup do
				if listChoiceLevelUp[j] == true then
					if v.name == maxKeyValueDino[j] then
						v.flags = gg.TYPE_FLOAT
						if j==8 then 
							v.value = '0'
						else
							if (j~=7) then					
								v.value = levelsup[j]
							end
						end
					end
					if v.name == maxKeyDino[j] then
						v.flags = gg.TYPE_FLOAT
						--max1devDino[6] = (f[1].value * 100.0) + 100.0
						if j==6 then 
							v.value = (baseDino[j] *(1+rateDino[j]*levelsup[j])-100.0)/100.0
						elseif j==8 then
							v.value = baseDino[j] *(1+rateDino[j]*tameLV)
						else
							if (j~=7) then
								v.value = baseDino[j] *(1+rateDino[j]*levelsup[j])
							end
						end						
					end
					if v.name == curKeyDino[j] then
						v.flags = gg.TYPE_FLOAT
						if j==8 then 
							v.value = '0'
						else	
							v.value = baseDino[j] *(1+rateDino[j]*levelsup[j])
						end
					end
				else
					if v.name == maxKeyValueDino[j] then
						v.value = '0'
					end
					if v.name == maxKeyDino[j] then
						v.flags = gg.TYPE_FLOAT
						if j==8 then
							v.value = baseDino[j] *(1+rateDino[j]*tameLV)
							--gg.alert(baseDino[j] *(1+rateDino[j]*tameLV))
						else
							if (j~=7) then
								v.value = baseDino[j]
							end					
						end	
					end
					if v.name == curKeyDino[j] then
						v.flags = gg.TYPE_FLOAT
						if j==8 then 
							v.value = '0'
						else	
							v.value = baseDino[j]
						end

					end
				end
			end
		end
		gg.setValues(foc)
		gg.addListItems(foc)
		gg.alert('Changed! Some need restart game to see changes')
	end
else
	m = math.random(1, #levelsup)
	i=1
	tameLV = tonumber(vlue) 
	while (i <= tameLV) do
		m = math.random(1, #levelsup)
		if (listChoiceLevelUp[m] == true) then
			levelsup[m]=levelsup[m]+1
			i = i  + 1
		end
	end

	
	local foc = gg.getListItems()
	for i, v in ipairs(foc) do
		if v.name == "DCurrentTorpor" then
			v.value = '1'
		end
		if v.name == "DTorpor" then
			v.value = '100000'
		end
		if v.name == "DCurrentFood" then
			v.flags = gg.TYPE_DWORD
			v.value = '2139095040'
		end
		if v.name == "DLVUP" then
			v.value = '0'
		end
		if v.name == "DtameLV" then
			v.value = tameLV
		end	
	--curKeyDino = {"CurrentHP","DCurrentStamina","DCurrentOxygen","DCurrentFood","DCurrentWeight","DCurrentMeleeDame","DCurrentMoveSPD","DCurrentTorpor"}
		for j=1,#levelsup do
			if listChoiceLevelUp[j] == true then
				if v.name == maxKeyValueDino[j] then
					v.flags = gg.TYPE_FLOAT
					if j==8 then 
						v.value = '0'
					else
						if (j~=7) then					
							v.value = levelsup[j]
						end
					end
				end
				if v.name == maxKeyDino[j] then
					v.flags = gg.TYPE_FLOAT
					--max1devDino[6] = (f[1].value * 100.0) + 100.0
					if j==6 then 
						v.value = (baseDino[j] *(1+rateDino[j]*levelsup[j])-100.0)/100.0
					elseif j==8 then
						v.value = baseDino[j] *(1+rateDino[j]*tameLV)
					else
						if (j~=7) then
							v.value = baseDino[j] *(1+rateDino[j]*levelsup[j])
						end
					end						
				end
				if v.name == curKeyDino[j] then
					v.flags = gg.TYPE_FLOAT
					if j==8 then 
						v.value = '0'
					else	
						v.value = baseDino[j] *(1+rateDino[j]*levelsup[j])
					end
				end
			else
				if v.name == maxKeyValueDino[j] then
					v.value = '0'
				end
				if v.name == maxKeyDino[j] then
					v.flags = gg.TYPE_FLOAT
					if j==8 then
						v.value = baseDino[j] *(1+rateDino[j]*tameLV)
						--gg.alert(baseDino[j] *(1+rateDino[j]*tameLV))
					else
						if (j~=7) then
							v.value = baseDino[j]
						end					
					end	
				end
				if v.name == curKeyDino[j] then
					v.flags = gg.TYPE_FLOAT
					if j==8 then 
						v.value = '0'
					else	
						v.value = baseDino[j]
					end

				end
			end
		end
	end
	gg.setValues(foc)
	gg.addListItems(foc)
	--gg.alert('Changed! Some need restart game to see changes')	
end	
end

function ScaleDodo()

n = gg.prompt({
'CURRENT SCALE DODO (>0)'}, 
{currentScaleDodo*0.001}, 
{'number'})
if n == nil then 
gg.sleep(1)
gg.toast("CANCELLED")
Dino()
else
	local foc = gg.getListItems()
	for i, v in ipairs(foc) do
		if v.name == "DCurrentTorpor" then
			v.value = '1'
		end
		if v.name == "DCurrentFood" then
			v.flags = gg.TYPE_DWORD
			v.value = '2139095040'
		end
		if (v.name == "scaledodo") then
			v.flags = gg.TYPE_DWORD
			v.value = tonumber(n[1])*1000.0
			currentScaleDodo = tonumber(n[1])*1000.0
		end	
	end
	gg.setValues(foc)
	gg.addListItems(foc)
	gg.alert('Changed! Need restart game to see changes')
end			
end

function EquusUnicornPower()

	n = gg.prompt({
	'CURRENT CREATURE POWER (>0)'}, 
	{currentEquusPower}, 
	{'number'})
	if n == nil then 
	gg.sleep(1)
	gg.toast("CANCELLED")
	Dino()
	else
		local foc = gg.getListItems()
		for i, v in ipairs(foc) do
			if v.name == "DCurrentTorpor" then
				v.value = '1'
			end
			if v.name == "DCurrentFood" then
				v.flags = gg.TYPE_DWORD
				v.value = '2139095040'
			end
			if (v.name == "equusPower") then
				v.flags = gg.TYPE_DWORD
				v.value = math.abs(10000.00 / tonumber(n[1]))
				currentEquusPower = math.abs(10000.00 / tonumber(n[1]))
			end	
		end
		gg.setValues(foc)
		gg.addListItems(foc)
		gg.alert('Changed!')
	end			
end

function MammothCapacity()

	n = gg.prompt({
	'CURRENT MAMMOTH CAPACITY (>0)'}, 
	{currentMammothCapacity}, 
	{'number'})
	if n == nil then 
	gg.sleep(1)
	gg.toast("CANCELLED")
	Dino()
	else
		local foc = gg.getListItems()
		for i, v in ipairs(foc) do
			if v.name == "DCurrentTorpor" then
				v.value = '1'
			end
			if v.name == "DCurrentFood" then
				v.flags = gg.TYPE_DWORD
				v.value = '2139095040'
			end
			if (v.name == "mammoth_capacity") then
				v.flags = gg.TYPE_DWORD
				v.value = math.abs(tonumber(n[1]) * 20.0)
				currentMammothCapacity = math.abs(tonumber(n[1]) * 20.0)
			end	
		end
		gg.setValues(foc)
		gg.addListItems(foc)
		gg.alert('Changed!')
	end			
end


function FishSize()

	n = gg.prompt({
	'CURRENT FISH SIZE CHANGE (>0)'}, 
	{currentFishSize}, 
	{'number'})
	if n == nil then 
	gg.sleep(1)
	gg.toast("CANCELLED")
	Dino()
	else
		local foc = gg.getListItems()
		for i, v in ipairs(foc) do
			if v.name == "DCurrentTorpor" then
				v.value = '1'
			end
			if v.name == "DCurrentFood" then
				v.flags = gg.TYPE_DWORD
				v.value = '2139095040'
			end
			if (v.name == "fishSize") then
				v.flags = gg.TYPE_FLOAT
				v.value = math.abs(tonumber(n[1]))
				currentFishSize = math.abs(tonumber(n[1]))
			end	
		end
		gg.setValues(foc)
		gg.addListItems(foc)
		gg.alert('Changed!')
	end			
end

function BreedAndMutation()
n = gg.prompt({
'CURRENT IMPRINTING (>0)\n>Can use for any creature for increase stats but only increase buff when ride for real F1 creature',
'CURRENT MATURATION (>0)\n>Can use for speed grow baby creature',
'FORCE BREEDING\n>Breeding anytime)',
'NO TIME CAN MATE\n>Reset time Can Mate of creature)',
}, 
{imprinting, maturation, false, true}, 
{'number', 'number', 'checkbox', 'checkbox'})
if n == nil then 
gg.sleep(1)
gg.toast("CANCELLED")
Dino()
else
	local foc = gg.getListItems()
	for i, v in ipairs(foc) do
		if v.name == "DCurrentTorpor" then
			v.value = '1'
		end
		if v.name == "DCurrentFood" then
			v.flags = gg.TYPE_DWORD
			v.value = '2139095040'
		end
		if (v.name == "imprinting") then
			v.value = tonumber(n[1])
			imprinting = tonumber(n[1])
		end	
		if (v.name == "maturation") then
			v.value = tonumber(n[2])
			maturation = tonumber(n[2])
			if (maturation>1) then
				maturation = 1
			end
		end	
		if (n[3] == true and v.name == "forcebreed") then
			v.value = '1'
		end
		if (n[4] == true and v.name == "zeroCanMate") then
			v.value = '0'
		end
	end
	gg.setValues(foc)
	gg.addListItems(foc)
	gg.alert('Actived!')
end
end

function IncreaseSlotTame()
gg.clearResults()
maxSlotTamed = 40
local testAd = false
local tt = {}
local t = {"libUE4.so", "Cd"}
if is64 then
	if gversion == 2028 then
	tt = {0x427ED0,0x1C,0x150,0xD60}
	else
	tt = {0x428F60,0x1C,0x150,0xD60}
	end
else
if gversion==2028 then
tt = {0x20B2E8, 0xCC, 0xAA0}
else
tt = {0x20B568, 0xCC, 0xAA0}
end
end
local ttt = S_Pointer(t, tt, true)
local k ={}
if tonumber(ttt)~=nil then
	k[1] = {}
	k[1].address = tonumber(ttt) - 0x4
	k[1].flags = gg.TYPE_DWORD
	k[2] = {}
	k[2].address = tonumber(ttt) + 0x4
	k[2].flags = gg.TYPE_DWORD
	k = gg.getValues(k)
	if (math.abs(k[2].value-6)<1 and math.abs(k[1].value-12)<1) then
		testAd = true
		local a = ttt
		ttt={}
		ttt[1] = a
	end
end
if testAd == false then
	local te = gg.getListItems()
	ttt ={}
	for i, v in ipairs(te) do
	  if v.name == "maxslottame" then
		k[i] = {}
		k[i][1] = {}
		k[i][1].address = te[i].address - 0x4
		k[i][1].flags = gg.TYPE_DWORD
		k[i][2] = {}
		k[i][2].address = te[i].address + 0x4
		k[i][2].flags = gg.TYPE_DWORD
		k[i] = gg.getValues(k[i])
		if (math.abs(k[i][2].value-6)<1 and math.abs(k[i][1].value-12)<1) then
			testAd = true
			ttt[#ttt+1] = te[i].address
		end
	  end
	end
end

if (testAd==false) then
	gg.clearResults()
	gg.setRanges(range)
	gg.setVisible(false)
	gg.searchNumber("12D;6D;65792D::17", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
	gg.refineNumber("12", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
	m = gg.getResultsCount()
	if m==0 then
		gg.alert("Not found result. Try Restart game and try again")
		PlayerOption()
	else
		x = gg.getResults(m)
		a = nil
		a = {}
		b = nil
		b = {}
		ttt ={}
		for i = 1, m do
			a[i] = {}
			a[i][1] = {}
			a[i][1].address = x[i].address+0xc
			a[i][1].flags = gg.TYPE_DWORD
			a[i][2] = {}
			a[i][2].address = x[i].address+0x8
			a[i][2].flags = gg.TYPE_DWORD
			a[i][3] = {}
			a[i][3].address = x[i].address+0x10
			a[i][3].flags = gg.TYPE_DWORD
			a[i] = gg.getValues(a[i])
			if a[i][1].value > 0 and math.abs(a[i][2].value-6)<1 and math.abs(a[i][3].value-65792) < 1 then
				b[i] = {}
				b[i][1] = {}
				b[i][1].address = x[i].address+0x4
				b[i][1].flags = gg.TYPE_DWORD
				b[i][1].name = 'maxslottame'
				gg.addListItems(b[i])
				testAd = true
				ttt[#ttt+1] = b[i][1].address
			end
		end
	end
end
if testAd then
	k[1] = {}
	k[1].address = tonumber(ttt[1])
	k[1].flags = gg.TYPE_DWORD
	k = gg.getValues(k)
	maxSlotTamed = k[1].value
	
	n = gg.prompt({
	'CURRENT MAX SLOT TAME',
	}, 
	{maxSlotTamed}, 
	{'number'})
	if n == nil then 
		gg.sleep(1)
		gg.toast("CANCELLED")
		PlayerOption()
	else
	k = {}
	for i = 1, #ttt do
		k[i] = {}
		k[i][1] = {}
		k[i][1].address = tonumber(ttt[i])
		k[i][1].flags = gg.TYPE_DWORD
		k[i][1].value = tonumber(n[1])
		gg.setValues(k[i])
	end
	gg.toast('Actived!')
end		
end
end

function UnlimitResource()
gg.clearResults()

local del = {}
local te = gg.getListItems()
for i, v in ipairs(te) do
  if (v.name == "re_quantity" or v.name == "re_qualitySpoils" or v.name == "re_blueprint" or v.name=="re_premium" or v.name=="super_kibble") then
    table.insert(del, te[i].address)
	--gg.toast("I am here")
  end
end
    gg.removeListItems(del)
t =0	
n = gg.prompt({'CURRENT QUANTITY OF ITEM RESOURCE (>0)',
'QUANTITY OF ITEM RESOURCE CHANGE TO(>0)',
'MAKE ITEM LIKE CONSUMABLES NOT SPOILS', 
'CONVERT TO BLUEPRINT OR ARKETYPE', 
'MAKE PREMIUM ITEM?\n>>If this item convert to blueprint after upgrade it will become ARKetype. It cannot Drop so be sure to check with Blueprint before make ArkeType for if errors',
'IS KIBBLE?\n>>Check if items are kibble and convert to super kibble'
},
 {0, 0, false, false, false, false}, {'number','number', 'checkbox', 'checkbox', 'checkbox','checkbox'})
if n == nil then 
gg.sleep(1)
gg.toast("CANCELLED")
else
	--gg.toast(g)
 	gg.setRanges(range)
	--gg.setVisible(false)
	gg.searchNumber(n[1]..";0;1~2f;-1D::17", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
	--gg.refineAddress("C", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1, 0)
	gg.refineNumber(n[1], gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
 
	m = gg.getResultsCount()
	if tonumber(n[1])==0 then
	gg.alert("Can not find item with 0 QUANTITY")
	StartCheat()
	end
	if m==0 then
	gg.alert("Not found result")
	StartCheat()
	else
		if m>1 then
			x = gg.getResults(m)
			gg.saveVariable(x, gg.EXT_CACHE_DIR.."/Original.value")
			a = nil
			a = {}
			for i = 1, m do
				a[i] = {}
				a[i][1] = {}
				a[i][1].address = x[i].address
				a[i][1].flags = gg.TYPE_DWORD
				a[i][1].value = math.abs(tonumber(n[1])+i)
				gg.setValues(a[i])
			end
			
			local menu = gg.alert("Current quantity item changed. Check it and type true value in next step for refine", "Next", "Back", "Hide For Check")
			if menu == 0 then 
				local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
				if check then
					local a = check ()
					local b = gg.getValues(a)
					for a, b in next, b do
						--do what you want
					end
					gg.setValues(a)--revert to original
				end
				StartCheat()
			elseif menu == 1 then
				o = gg.prompt({'REFINE CURRENT QUANTITY ITEM:\n>It changed please type true value'},
				 {0}, {'number'})
				if o == nil then 
					gg.sleep(1)
					gg.toast("CANCELLED")
					gg.clearResults()
					local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
					if check then
						local a = check ()
						local b = gg.getValues(a)
						for a, b in next, b do
							--do what you want
						end
						gg.setValues(a)--revert to original
					end
					StartCheat()
				else
					gg.refineNumber(o[1], gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
					t = gg.getResultsCount()
					if t==0 then
						gg.alert("Not found result. You type wrong value. Let try again")
						gg.clearResults()
						local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
						if check then
							local a = check ()
							local b = gg.getValues(a)
							for a, b in next, b do
								--do what you want
							end
							gg.setValues(a)--revert to original
						end
						StartCheat()
					else 
						x = gg.getResults(t)
						a = nil
						a = {}
						b = nil
						b = {}
						c = nil
						c = {}
						d = nil
						d = {}
						e = nil
						e = {}
						f = nil
						f = {}
						q = nil
						q = {}
						r = nil
						r = {}

						for i = 1, t do
							b[i] = {}
							b[i][1] = {}
							if is64==true then
							b[i][1].address = x[i].address -0x5d8  --4ac 32 bit
							else
							b[i][1].address = x[i].address -0x4ac  
							end
							b[i][1].flags = gg.TYPE_DWORD
							b[i] = gg.getValues(b[i])
							q[i] = {}
							q[i][1] = {}
							q[i][1].address = x[i].address + 0x8
							q[i][1].flags = gg.TYPE_FLOAT
							q[i] = gg.getValues(q[i])
							r[i] = {}
							r[i][1] = {}
							r[i][1].address = x[i].address + 0x10
							r[i][1].flags = gg.TYPE_DWORD
							r[i] = gg.getValues(r[i])
							--gg.alert(b[i][1].value)
							if (math.abs(q[i][1].value)<0.001 and r[i][1].value > -1.01 and r[i][1].value < -0.99 and b[i][1].value <-1000000000) then 
								t=t+1
								a[i] = {}
								a[i][1] = {}
								a[i][1].address = x[i].address
								a[i][1].flags = gg.TYPE_DWORD
								a[i][1].name = 're_quantity'
								gg.addListItems(a[i])
								c[i] = {}
								c[i][1] = {}
								if is64 == true then
								c[i][1].address = x[i].address+0x274  --220 32 bit
								else
								c[i][1].address = x[i].address+0x220
								end 
								c[i][1].flags = gg.TYPE_DWORD
								c[i][1].name = 're_qualitySpoils'
								--c[i][1].value = '-1'
								gg.addListItems(c[i])
								d[i] = {}
								d[i][1] = {}
								if is64 == true then
								d[i][1].address = x[i].address -0x5D8 --4ac 32 bit
								else
								d[i][1].address = x[i].address -0x4ac
								end
								d[i][1].flags = gg.TYPE_DWORD
								d[i][1].name = 're_blueprint'
								--d[i][1].value = '-1'
								gg.addListItems(d[i])
								f[i] = {}
								f[i][1] = {}
								f[i][1].address = d[i][1].address + 0x4
								f[i][1].flags = gg.TYPE_DWORD
								f[i][1].name = 'super_kibble'
								gg.addListItems(f[i])
								e[i] = {}
								e[i][1] = {}
								e[i][1].address = d[i][1].address+0xC
								e[i][1].flags = gg.TYPE_DWORD
								e[i][1].name = 're_premium'
								--e[i][1].value = '-1'
								gg.addListItems(e[i])
							end	
						end
						gg.clearResults()
						local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
						if check then
							local a = check ()
							local b = gg.getValues(a)
							for a, b in next, b do
								--do what you want
							end
							gg.setValues(a)--revert to original
						end
						
					end
				end
			elseif menu == 2 then
						local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
				if check then
					local a = check ()
					local b = gg.getValues(a)
					for a, b in next, b do
						--do what you want
					end
					gg.setValues(a)--revert to original
				end
				StartCheat()
			elseif menu == 3 then
				gg.setVisible(false)
				while(menu == 3)
				do
				  while gg.isVisible(true)
					do--
					  gg.setVisible(false)
					  menu = 1
						o = gg.prompt({'REFINE CURRENT QUANTITY ITEM:\n>It changed please type true value'},
						 {0}, {'number'})
						if o == nil then 
							gg.sleep(1)
							gg.toast("CANCELLED")
							gg.clearResults()
							local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
							if check then
								local a = check ()
								local b = gg.getValues(a)
								for a, b in next, b do
									--do what you want
								end
								gg.setValues(a)--revert to original
							end
							StartCheat()
						else
							gg.refineNumber(o[1], gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
							t = gg.getResultsCount()
							if t==0 then
								gg.alert("Not found result. You type wrong value. Let try again")
								gg.clearResults()
								local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
								if check then
									local a = check ()
									local b = gg.getValues(a)
									for a, b in next, b do
										--do what you want
									end
									gg.setValues(a)--revert to original
								end
								StartCheat()
							else 
								x = gg.getResults(t)
								a = nil
								a = {}
								b = nil
								b = {}
								c = nil
								c = {}
								d = nil
								d = {}
								e = nil
								e = {}								
								f = nil
								f = {}
								q = nil
								q = {}
								r = nil
								r = {}

								for i = 1, t do
									b[i] = {}
									b[i][1] = {}
									if is64==true then
									b[i][1].address = x[i].address -0x5d8  --4ac 32 bit
									else
									b[i][1].address = x[i].address -0x4ac  
									end
									b[i][1].flags = gg.TYPE_DWORD
									b[i] = gg.getValues(b[i])
									q[i] = {}
									q[i][1] = {}
									q[i][1].address = x[i].address + 0x8
									q[i][1].flags = gg.TYPE_FLOAT
									q[i] = gg.getValues(q[i])
									r[i] = {}
									r[i][1] = {}
									r[i][1].address = x[i].address + 0x10
									r[i][1].flags = gg.TYPE_DWORD
									r[i] = gg.getValues(r[i])
									--gg.alert(b[i][1].value)
									if (math.abs(q[i][1].value)<0.001 and r[i][1].value > -1.01 and r[i][1].value < -0.99 and b[i][1].value <-1000000000) then 
										t=t+1
										a[i] = {}
										a[i][1] = {}
										a[i][1].address = x[i].address
										a[i][1].flags = gg.TYPE_DWORD
										a[i][1].name = 're_quantity'
										gg.addListItems(a[i])
										c[i] = {}
										c[i][1] = {}
										if is64 == true then
										c[i][1].address = x[i].address+0x274  --220 32 bit
										else
										c[i][1].address = x[i].address+0x220
										end 
										c[i][1].flags = gg.TYPE_DWORD
										c[i][1].name = 're_qualitySpoils'
										--c[i][1].value = '-1'
										gg.addListItems(c[i])
										d[i] = {}
										d[i][1] = {}
										if is64 == true then
										d[i][1].address = x[i].address -0x5D8 --4ac 32 bit
										else
										d[i][1].address = x[i].address -0x4ac
										end
										d[i][1].flags = gg.TYPE_DWORD
										d[i][1].name = 're_blueprint'
										--d[i][1].value = '-1'
										gg.addListItems(d[i])
										f[i] = {}
										f[i][1] = {}
										f[i][1].address = d[i][1].address + 0x4
										f[i][1].flags = gg.TYPE_DWORD
										f[i][1].name = 'super_kibble'
										gg.addListItems(f[i])										
										e[i] = {}
										e[i][1] = {}
										e[i][1].address = d[i][1].address+0xC
										e[i][1].flags = gg.TYPE_DWORD
										e[i][1].name = 're_premium'
										--e[i][1].value = '-1'
										gg.addListItems(e[i])
									end	
								end
								gg.clearResults()
								local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
								if check then
									local a = check ()
									local b = gg.getValues(a)
									for a, b in next, b do
										--do what you want
									end
									gg.setValues(a)--revert to original
								end
								
							end
						end
					
					end--
				end
			end
			
		else
			x = gg.getResults(m)
			a = nil
			a = {}
			b = nil
			b = {}
			c = nil
			c = {}
			d = nil
			d = {}
			e = nil
			e = {}			
			f = nil
			f = {}
			q = nil
			q = {}
			r = nil
			r = {}

			for i = 1, m do
				b[i] = {}
				b[i][1] = {}
				if is64==true then
				b[i][1].address = x[i].address -0x5d8  --4ac 32 bit
				else
				b[i][1].address = x[i].address -0x4ac  
				end
				b[i][1].flags = gg.TYPE_DWORD
				b[i] = gg.getValues(b[i])
				q[i] = {}
				q[i][1] = {}
				q[i][1].address = x[i].address + 0x8
				q[i][1].flags = gg.TYPE_FLOAT
				q[i] = gg.getValues(q[i])
				r[i] = {}
				r[i][1] = {}
				r[i][1].address = x[i].address + 0x10
				r[i][1].flags = gg.TYPE_DWORD
				r[i] = gg.getValues(r[i])
				--gg.alert(b[i][1].value)
				if (math.abs(q[i][1].value)<0.001 and r[i][1].value > -1.01 and r[i][1].value < -0.99 and b[i][1].value <-1000000000) then 
					t=t+1
					a[i] = {}
					a[i][1] = {}
					a[i][1].address = x[i].address
					a[i][1].flags = gg.TYPE_DWORD
					a[i][1].name = 're_quantity'
					gg.addListItems(a[i])
					c[i] = {}
					c[i][1] = {}
					if is64 == true then
					c[i][1].address = x[i].address+0x274  --220 32 bit
					else
					c[i][1].address = x[i].address+0x220
					end 
					c[i][1].flags = gg.TYPE_DWORD
					c[i][1].name = 're_qualitySpoils'
					--c[i][1].value = '-1'
					gg.addListItems(c[i])
					d[i] = {}
					d[i][1] = {}
					if is64 == true then
					d[i][1].address = x[i].address -0x5D8 --4ac 32 bit
					else
					d[i][1].address = x[i].address -0x4ac
					end
					d[i][1].flags = gg.TYPE_DWORD
					d[i][1].name = 're_blueprint'
					--d[i][1].value = '-1'
					gg.addListItems(d[i])
					f[i] = {}
					f[i][1] = {}
					f[i][1].address = d[i][1].address + 0x4
					f[i][1].flags = gg.TYPE_DWORD
					f[i][1].name = 'super_kibble'
					gg.addListItems(f[i])					
					e[i] = {}
					e[i][1] = {}
					e[i][1].address = d[i][1].address+0xC
					e[i][1].flags = gg.TYPE_DWORD
					e[i][1].name = 're_premium'
					--e[i][1].value = '-1'
					gg.addListItems(e[i])
				end	
			end
		
		
		end
	end	
	
	if t>10 and n[4]== true then
	gg.alert("There are too many items with the same result to make blueprint and this change may on the whole include unwanted items. Try to DROP a few so the item is unique to ensure the correct object changes and then try again")
	StartCheat()
	else
		local ros = gg.getListItems()
		for i, v in ipairs(ros) do
		  if v.name == "re_quantity" then
				if tonumber(n[2])>0 then
					v.value = tonumber(n[2])
				else
					v.value = tonumber(n[1])
				end
		  end
		  if (v.name == "re_qualitySpoils" and n[3]== true) then
				v.value = '2139095040'
		  end
		  if v.name == "re_blueprint" then
				if n[4]== true then
					v.value = '-2,142,760,444'
				else
					v.value = '-2,146,954,748'
				end
		  end
		if v.name == "super_kibble" then
			if n[6]== true then
				v.flags = gg.TYPE_DWORD
				v.value = '572524558'
			else
				v.flags = gg.TYPE_DWORD
				v.value = '35653646'
			end
		 end
		  if v.name == "re_premium" then
				if n[5]== true then
					v.value = '129'
				else
					v.value = '128'
				end		
		  end
		end
		gg.setValues(ros)
		gg.addListItems(ros)
		gg.toast("Changed!")
	end	
	
end		
end

Save_coordinates = {}
function Teleport()
gg.clearResults()
local infoLocations = {}
local config = gg.getFile()..'.saveLocation.cfg'
local data = loadfile(config)
if data ~= nil then
	infoLocations = data()
	data = nil
end

--info = gg.prompt({'Login', 'Password', 'Remember'}, info, {'tex﻿t', 'text', 'checkbox'})
--if info == nil then os.exit() end
--if info[3] then
	--gg.saveVariable(info, config)
--else
	--os.remove(config)
--end

-- here work with 'info' content
--print(info)
--gg.alert(Save_coordinates[1])
local coordinates = {0,0,0}
local testAd = testData()

	if testAd==false then
		gg.toast("Data is null. Need update data. Please wait")
		GetArray(0)
		testAd = testData()
	end
	local PL = nil
	PL = {}
if (testAd)then
	PL[1] = {}
	PL[1].address = ArrayPlayer[9]
	PL[1].flags = gg.TYPE_FLOAT
	PL[1].name = "PlayerX"
	PL[2] = {}
	PL[2].address = ArrayPlayer[10]
	PL[2].flags = gg.TYPE_FLOAT
	PL[2].name = "PlayerY"
	PL[3] = {}
	PL[3].address = ArrayPlayer[11]
	PL[3].flags = gg.TYPE_FLOAT
	PL[3].name = "PlayerZ"
	PL = gg.getValues(PL)
coordinates = {PL[1].value,PL[2].value,PL[3].value}
end

if testAd==false then
	t = 0
	gg.toast("Finding current location. Please wait")
	gg.setRanges(range)
	gg.setVisible(false)
	gg.searchNumber("82F;1F::41", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
	gg.refineNumber("82", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)

	m = gg.getResultsCount()
	if m==0 then
	gg.alert("Not found result")
	GodConsole()
	else
		x = gg.getResults(m)
		a = nil
		a = {}
		b = nil
		b = {}
		c = nil
		c = {}
		d = nil
		d = {}
		q = nil
		q = {}

		for i = 1, m do
			b[i] = {}
			b[i][1] = {}
			b[i][1].address = x[i].address -0x4
			b[i][1].flags = gg.TYPE_FLOAT
			b[i] = gg.getValues(b[i])
			q[i] = {}
			q[i][1] = {}
			if is64 == true then
				q[i][1].address = x[i].address + 0x20  -- +28 32 bit
			else
				q[i][1].address = x[i].address + 0x28 
			end
			q[i][1].flags = gg.TYPE_FLOAT
			q[i] = gg.getValues(q[i])
			if (math.abs(q[i][1].value-1.0)<0.01 and math.abs(b[i][1].value-82.0)<0.5) then
			--gg.alert("who?")
				t=t+1
				a[i] = {}
				a[i][1] = {}
				if is64 == true then
					a[i][1].address = x[i].address + 0x14
				else
					a[i][1].address = x[i].address + 0x1c
				end 
				a[i][1].flags = gg.TYPE_FLOAT
				a[i][1].name = 'PlayerX'
				--gg.addListItems(a[i])
				PL[1] = a[i][1]
				a[i] = gg.getValues(a[i])
				coordinates[1] = a[i][1].value
				c[i] = {}
				c[i][1] = {}
				if is64 == true then
				c[i][1].address = x[i].address+0x18
				else
				c[i][1].address = x[i].address+0x20
				end
				c[i][1].flags = gg.TYPE_FLOAT
				c[i][1].name = 'PlayerY'
				PL[2] = c[i][1]
				--gg.addListItems(c[i])
				c[i] = gg.getValues(c[i])
				coordinates[2] = c[i][1].value
				d[i] = {}
				d[i][1] = {}
				if is64 == true then
				d[i][1].address = x[i].address +0x1c
				else
				d[i][1].address = x[i].address +0x24
				end
				d[i][1].flags = gg.TYPE_FLOAT
				d[i][1].name = 'PlayerZ'
				PL[3] = d[i][1]
				--gg.addListItems(d[i])
				d[i] = gg.getValues(d[i])
				coordinates[3] = d[i][1].value
			end	
		end
		if (t==0) then
			gg.alert("Not Found. Try moving a bit and try again")
			StartCheat()
		end
	end
end
n = gg.prompt({'CURRENT COORDINATES (X):',
'CURRENT COORDINATES (Y):',
'CURRENT COORDINATES (Z):', 
'OPTION FOR ACTIVE:\n >>1: if you want to go to Green Obelisk\n >>2: if you want to go to Red Obelisk.\n >>3: if you want to go to Blue Obelisk.\n >>4: if you want to go to Volcano mountain.\n >>5: if you want to go to Griffin mountain.\n >>6: if you want to go to Herbivorous island.\n >>7: if you want to go to Canivore island.\n >>8: if you want to go to Cave in the South.\n >>9: if you want to go to The Middle Chamber.\n >>10: if you want to go to Lava Cave.\n >>11: if you want to go to Northwest Hollow.\n >>12: if you want to go to Swamp Cave.\n >>13: if you want to go to Snow Cave.\n >>14: Save current location.\n >>15: Goto save location.\n >>16: Go to custom location that get from X,Y,Z above. [1;16]'},
 {coordinates[1], coordinates[2], coordinates[3], 16}, {'number','number', 'number', 'number'})
if n == nil then 
	gg.sleep(1)
	gg.toast("CANCELLED")
	GodConsole()
else
		--local ros = gg.getListItems()
		--for i, v in ipairs(ros) do
			if tonumber(n[4])== 1 then    -- green obelisk
				PL[1].value = '178181.203125'
				PL[2].value = '73301.765625'
				PL[3].value = '-10000.76953125'
			elseif tonumber(n[4])== 2 then -- red obelisk
				PL[1].value = '-262,220.8125'
				PL[2].value = '239,680.5'
				PL[3].value = '-11,121.1123046875'
			elseif tonumber(n[4])== 3 then --blue Obelisk
				PL[1].value = '-196200.0625'
				PL[2].value = '-196712.171875'
				PL[3].value = '33986.453125'
			elseif tonumber(n[4])== 4 then   --vocano
				PL[1].value = '-91555.0546875'
				PL[2].value = '-60101.6796875'
				PL[3].value = '38858.109375'							
			elseif tonumber(n[4])== 5 then  -- gf mountain
				PL[1].value = '231220.765625'
				PL[2].value = '-129244.453125'
				PL[3].value = '25200.435546875'
			elseif tonumber(n[4])== 6 then --Herbivorous island
				PL[1].value = '269982.0'
				PL[2].value = '274605.34375'
				PL[3].value = '-11787.1015625'		
			elseif tonumber(n[4])== 7 then --Canivore island
				PL[1].value = '285057.5'
				PL[2].value = '-239391.4375'
				PL[3].value = '-13690.0439453125'	
			elseif tonumber(n[4])== 8 then   --Cave in the South
				PL[1].value = '48369.87890625'
				PL[2].value = '267353.15625'
				PL[3].value = '-24046.916015625'				
			elseif tonumber(n[4])== 9 then   -- The Middle Chamber
				PL[1].value = '-32014.822265625'
				PL[2].value = '-82706.2734375'
				PL[3].value = '-6884.09619140625'	
			elseif tonumber(n[4])== 10 then -- Lava cave
				PL[1].value = '288231.125'
				PL[2].value = '136368.65625'
				PL[3].value = '-24850.380859375'	
			elseif tonumber(n[4])== 11 then --Northwest Hollow
				PL[1].value = '-252708.890625'
				PL[2].value = '-243041.5625'
				PL[3].value = '-11503.103515625'	
			elseif tonumber(n[4])== 12 then --Swamp Cave
				PL[1].value = '-83195.6640625'
				PL[2].value = '97173.53125'
				PL[3].value = '-8827.0205078125'			
			elseif tonumber(n[4])== 13 then -- Snow cave
				PL[1].value = '-188155.59375'
				PL[2].value = '-162340.359375'
				PL[3].value = '-6450.10009765625'			
			elseif tonumber(n[4])== 14 then
				k = gg.prompt({'Input name of save location'},
				 {"Player Location "..(#infoLocations+1)}, {'text'})
				if k == nil then 
					gg.sleep(1)
					gg.toast("CANCELLED")
					Teleport()
				else
					Save_coordinates[1] = coordinates[1]
					Save_coordinates[2] = coordinates[2]
					Save_coordinates[3] = coordinates[3]
					infoLocations[#infoLocations+1] = {k[1], Save_coordinates[1], Save_coordinates[2], Save_coordinates[3]}
					--gg.saveList("/sdcard/Values.txt")
					--gg.saveVariable(Save_coordinates, '/sdcard/test.lua')
					--os.remove(config)
					gg.saveVariable(infoLocations, config)
					gg.toast("Saved "..k[1])
					--Teleport()
				end
			elseif tonumber(n[4])== 15 then
				data = loadfile(config)
				if data ~= nil then
					infoLocations = data()
					data = nil
				end
				
				if (#infoLocations > 0) then
					local mn = {}
					for i=1, #infoLocations do
						mn[i] = infoLocations[i][1]
					end
					local menu = gg.choice(mn, nil, "SELECTION LOCATION GO TO")
					for i=1, #mn do
						if menu == i then
							local alert = gg.alert("What do you want to continue?", "Go To Save", "Delete Save", "Back")
							if alert == 0 then --no select
								gg.toast("You are not select anything")
								Teleport()							
							elseif alert == 1 then -- Go To Save
								PL[1].value = infoLocations[i][2]
								PL[2].value = infoLocations[i][3]
								PL[3].value = infoLocations[i][4]
								gg.setValues(PL)
								gg.toast("Changed!")								
							elseif alert == 2 then -- Delete Save
								table.remove(infoLocations, i)
								gg.saveVariable(infoLocations, config)
								gg.toast("Save deleted!!!")
							elseif alert == 3 then -- back
								Teleport()	
							end
						end					
					end
					if menu == nil then 
						gg.toast("You are not select anything")
						Teleport()
					end
				else
					gg.alert("No data saves file. You need >=1 save location before use this option")
					Teleport()
				end
			elseif tonumber(n[4])== 16 then 
				PL[1].value = tonumber(n[1])
				PL[2].value = tonumber(n[2])
				PL[3].value = tonumber(n[3])
			end
		--end
		--gg.addListItems(ros)
		if (tonumber(n[4])~= 14 and tonumber(n[4])~= 15) then
		gg.setValues(PL)
		gg.toast("Changed!")
		end
	end	

end

function BrightNight()
gg.clearResults()
local testAd = false
local tt
local t = {"libUE4.so", "Cd"}
if is64 then
	if gversion == 2028 then
	tt = {0x425380, 0x1E0, 0xC0, 0x648}
	else
	tt = {0x419D70,0x5E0,0x6F0,0x618,0x648}
	end
else
if gversion==2028 then
	tt = {0x20B2E8, 0x3C, 0x70, 0x468, 0x510}
	else
	tt = {0x20B568, 0x3C, 0x70, 0x468, 0x510}
	end
end
local ttt = S_Pointer(t, tt, true)
local k ={}
if tonumber(ttt)~=nil then
	k[1] = {}
	if is64==true then
	k[1].address = tonumber(ttt) + 0x28
	else
	k[1].address = tonumber(ttt) + 0x18
	end 
	k[1].flags = gg.TYPE_FLOAT
	k[2] = {}
	if is64==true then
	k[2].address = tonumber(ttt) + 0x34
	else
	k[2].address = tonumber(ttt) + 0x24
	end
	k[2].flags = gg.TYPE_FLOAT
	k = gg.getValues(k)
	if (math.abs(k[2].value-1.0)<0.001 and math.abs(k[1].value-43200.0)<0.01) then
	testAd = true
	local a = ttt
	ttt = {}
	ttt[1] = a
	end
end

if testAd == false then
	local te = gg.getListItems()
	ttt = {}
	j =1
	for i, v in ipairs(te) do
	  if v.name == "BrightNight" then
		t ={}
		t[1] = {}
		if is64==true then
		t[1].address = te[i].address + 0x28
		else
		t[1].address = te[i].address + 0x18
		end 
		t[1].flags = gg.TYPE_FLOAT
		t = gg.getValues(t)
		k ={}
		k[1] = {}
		if is64==true then
		k[1].address = te[i].address + 0x34
		else
		k[1].address = te[i].address + 0x24
		end
		k[1].flags = gg.TYPE_FLOAT
		k = gg.getValues(k)
		if (math.abs(k[1].value-1.0)<0.001 and math.abs(t[1].value-43200.0)<0.01) then
		testAd = true
		ttt[j] =  te[i].address
		j=j+1
		end
	  end
	end
end

if (testAd==false) then
	local del = {}
	local te = gg.getListItems()
	for i, v in ipairs(te) do
	  if (v.name == "BrightNight") then
		table.insert(del, te[i].address)
	  end
	end
		gg.removeListItems(del)
		
	gg.setRanges(range)
	gg.setVisible(false)
	gg.searchNumber("43200F;18900f;73440f;1f::13", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
	--gg.refineAddress("C", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1, 0)
	gg.refineNumber("43200", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
	m = gg.getResultsCount()
	if m >= 6 then
	m = 6
	end
	if m==0 then
	gg.alert("Not found result")
	chStatus[3] = isOff
	GodConsole()
	else
		x = gg.getResults(m)
		a = nil
		a = {}
		ttt = {}
		j=1
		for i = 1, m do
			a[i] = {}
			a[i][1] = {}
			if is64==true then
			a[i][1].address = x[i].address - 0x28  -- 18 32 bit
			else
			a[i][1].address = x[i].address - 0x18
			end
			a[i][1].flags = gg.TYPE_DWORD
			a[i][1].name = 'BrightNight'
			ttt[j] = a[i][1].address
			j=j+1
			gg.addListItems(a[i])
		end		
	end	
end


if chStatus[3] == isOn then
	for i = 1, #ttt do
		k[i] = {}
		k[i][1] = {}
		k[i][1].address = tonumber(ttt[i])
		k[i][1].flags = gg.TYPE_DWORD
		k[i][1].value = '256'
		gg.setValues(k[i])
	end
	gg.toast("Actived!")

else
	for i = 1, #ttt do
		k[i] = {}
		k[i][1] = {}
		k[i][1].address = tonumber(ttt[i])
		k[i][1].flags = gg.TYPE_DWORD
		k[i][1].value = '0'
		gg.setValues(k[i])
	end
	gg.toast("Deactived!")
end
end

function Fly()
gg.clearResults()
testAd = false
local tt = {}
local t = {"libUE4.so", "Cd"}
if is64 then
	if gversion == 2028 then
	tt = {0x417C38, 0x100, 0x5E8, 0x640, 0x2B4}
	else
	tt = {0x418CD8, 0x100, 0x5E8, 0x640, 0x2B4}
	end
else
	if gversion==2028 then
	tt = {0x20B2E8, 0xBC, 0x0, 0x4F4, 0x23C}
	else
	tt = {0x246FE4, 0x40, 0x890, 0x4F4, 0x23C}
	end
end
local ttt = S_Pointer(t, tt, true)
 local k ={}
if tonumber(ttt)~=nil then
	k[1] = {}
	k[1].address = tonumber(ttt) - 0xC
	k[1].flags = gg.TYPE_FLOAT
	k[2] = {}
	k[2].address = tonumber(ttt) - 0x10
	k[2].flags = gg.TYPE_FLOAT
	k = gg.getValues(k)
	if (math.abs(k[2].value-4000.0)<0.01 and math.abs(k[1].value-2.0)<0.01) then
		testAd = true
		local a = ttt
		ttt={}
		ttt[1] = a
	end
end
if testAd == false then
	local te = gg.getListItems()
	ttt ={}
	j=1
	for i, v in ipairs(te) do
	  if v.name == "Gravity" then
		t ={}
		t[1] = {}
		t[1].address = te[i].address - 0xC
		t[1].flags = gg.TYPE_FLOAT
		t = gg.getValues(t)
		k ={}
		k[1] = {}
		k[1].address = te[i].address - 0x10
		k[1].flags = gg.TYPE_FLOAT
		k = gg.getValues(k)
		if (math.abs(k[1].value-4000.0)<0.01 and math.abs(t[1].value-2.0)<0.01) then
			testAd = true
			ttt[j]= te[i].address
			j=j+1
		end
	  end
	end
end

if (testAd==false) then
	local del = {}
	local te = gg.getListItems()
	for i, v in ipairs(te) do
	  if (v.name == "Gravity" or v.name == "Inertia") then
		table.insert(del, te[i].address)
	  end
	end
		gg.removeListItems(del)
		
	gg.setRanges(range)
	gg.setVisible(false)
	gg.searchNumber("1F;70F;525F;4000F;2F::29", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
	--gg.refineAddress("C", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1, 0)
	gg.refineNumber("2", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
	m = gg.getResultsCount()
	if m==0 then
	gg.alert("Not found result. ")
	chStatus[4] = isOff
	GodConsole()
	else
		x = gg.getResults(m)
		a1 = nil
		a1 = {}
		a2 = nil
		a2 = {}
		a3 = nil
		a3 = {}
		a4 = nil
		a4 = {}
		ttt = {}
		j=1
		for i = 1, m do
			a1[i] = {}
			a1[i][1] = {}
			a1[i][1].address = x[i].address + 0xC
			a1[i][1].flags = gg.TYPE_DWORD
			a1[i][1].name = 'Gravity'
			ttt[j] = a1[i][1].address
			j=j+1
			gg.addListItems(a1[i])
			a2[i] = {}
			a2[i][1] = {}
			if is64 == true then
			a2[i][1].address = x[i].address + 0x294
			else
			a2[i][1].address = x[i].address + 0x274
			end
			a2[i][1].flags = gg.TYPE_DWORD
			a2[i][1].name = 'Inertia'
			gg.addListItems(a2[i])
		end
	end	
end

if chStatus[4] == isOn then 
	--gg.alert(#ttt)
	for i = 1, #ttt do
		k[i] = {}
		k[i][1] = {}
		k[i][1].address = tonumber(ttt[i])  -- Gravity
		k[i][1].flags = gg.TYPE_DWORD
		k[i][1].value = '5'
		k[i][2] = {}
		if is64 == true then
		k[i][2].address = k[i][1].address + 0x288
		else
		k[i][2].address = k[i][1].address + 0x268
		end
		k[i][2].flags = gg.TYPE_DWORD
		k[i][2].value = '41736'
		gg.setValues(k[i])
	end	
	gg.toast("Fly Actived!")

else
	for i = 1, #ttt do
		k[i] = {}
		k[i][1] = {}
		k[i][1].address = tonumber(ttt[i])  -- Gravity
		k[i][1].flags = gg.TYPE_DWORD
		k[i][1].value = '3'
		k[i][2] = {}
		if is64 == true then
		k[i][2].address = k[i][1].address + 0x288
		else
		k[i][2].address = k[i][1].address + 0x268
		end
		k[i][2].flags = gg.TYPE_DWORD
		k[i][2].value = '41792'
		gg.setValues(k[i])
	end	
	gg.toast("Fly DeActived!")

end
end

function invAndInf(n)
gg.clearResults()
testAd = false
local tt = {}
local t = {"libUE4.so", "Cd"}
if is64 then
	if gversion == 2028 then
	tt = {0x417C38,0x100,0xC14}
	else
	tt = {0x418CD8,0x100,0xC14}
	end
else
	if gversion == 2028 then
	tt = {0x22C6F8,0x90,0x954}
	else
	--tt = {0x22C97C,0x90,0x954}
	tt = {0x20B568, 0x3C, 0x70, 0x478, 0x954}
	
	end
end
local ttt = S_Pointer(t, tt, true)
local k ={}
if tonumber(ttt)~=nil then
	k[1] = {}
	k[1].address = tonumber(ttt) - 0x4
	k[1].flags = gg.TYPE_DWORD
	k[2] = {}
	k[2].address = tonumber(ttt) + 0x4
	k[2].flags = gg.TYPE_DWORD
	k = gg.getValues(k)
	if (math.abs(k[2].value+1)<0.01) then
		testAd = true
		local a = ttt
		ttt={}
		ttt[1] = a
	end
end
if testAd == false then
	local te = gg.getListItems()
	for i, v in ipairs(te) do
	  if v.name == "addInvInf" then
		t ={}
		t[1] = {}
		t[1].address = te[i].address - 0x4
		t[1].flags = gg.TYPE_DWORD
		t = gg.getValues(t)
		k ={}
		k[1] = {}
		k[1].address = te[i].address + 0x4
		k[1].flags = gg.TYPE_DWORD
		k = gg.getValues(k)
		if (math.abs(k[1].value+1)<0.01) then
		testAd = true
			ttt={}
			ttt[1] = te[i].address
		end
	  end
	end
end
if (testAd==false) then
	local del = {}
	local te = gg.getListItems()
	for i, v in ipairs(te) do
	  if (v.name == "addInvInf") then
		table.insert(del, te[i].address)
	  end
	end
		gg.removeListItems(del)
		
	gg.setRanges(range)
	gg.setVisible(false)
	gg.searchNumber("-1D;131072~131584D;-1D;0;-1D;0::21", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
	--gg.refineAddress("C", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1, 0)
	gg.refineNumber("131072~131584", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
	m = gg.getResultsCount()
	if m==0 then
	gg.alert("Not found result. ")
	chStatus[n] = isOff
	GodConsole()
	else
		x = gg.getResults(m)
		a1 = nil
		a1 = {}
		a2 = nil
		a2 = {}
		a3 = nil
		a3 = {}
		ttt={}
		for i = 1, m do
			a1[i] = {}
			a1[i][1] = {}
			a1[i][1].address = x[i].address + 0x4
			a1[i][1].flags = gg.TYPE_DWORD
			a1[i] = gg.getValues(a1[i])
			a2[i] = {}
			a2[i][1] = {}
			a2[i][1].address = x[i].address -0x4
			a2[i][1].flags = gg.TYPE_DWORD
			a2[i] = gg.getValues(a2[i])
			if (math.abs(a1[i][1].value+1)<0.01 and math.abs(a2[i][1].value+1)<0.01) then
				a3[i] = {}
				a3[i][1] = {}
				a3[i][1].address = x[i].address
				a3[i][1].flags = gg.TYPE_DWORD
				a3[i][1].name = 'addInvInf'
				gg.addListItems(a3[i])
				ttt[#ttt+1] = x[i].address
				testAd=true
			end
		end
	end	
end

if testAd then
	cur = 131,072
	if chStatus[5] == isOn then
	cur = cur + 512
	end

	if chStatus[6] == isOn then
	cur = cur + 256
	end
	for i = 1, #ttt do
		k[i] = {}
		k[i][1] = {}
		k[i][1].address = tonumber(ttt[i])
		k[i][1].flags = gg.TYPE_DWORD
		k[i][1].value = cur
		gg.setValues(k[i])
	end
	gg.toast("Changed!!!")
else
gg.alert("Not found. Let's try again")
end

end

currentSpeed =3
function SpeedGame()
gg.clearResults()
testAd = false
local tt = {}
local t = {"libUE4.so", "Cd"}
if is64 then
	if gversion == 2028 then
	tt = {0x444320,0x0,0x20,0x300,0x930}
	else
	--tt = {0x445390,0x0,0x20,0x300,0x930}
	tt = {0x41EF98,0x160,0x20,0x300,0x930}
	end
else
	if gversion == 2028 then
	tt = {0x22BB28,0x94,0x18,0x280,0x734}
	else
	--tt = {0x203B74, 0x60E, 0x734}
	--tt = {0x20715C, 0xBB, 0x734}
	tt = {0x20B568, 0x3C, 0x280, 0x734}
	end
end
local ttt = S_Pointer(t, tt, true)
local k ={}
if tonumber(ttt)~=nil then
	k[1] = {}
	k[1].address = tonumber(ttt) + 0x10
	k[1].flags = gg.TYPE_FLOAT
	k[2] = {}
	k[2].address = tonumber(ttt) + 0x4
	k[2].flags = gg.TYPE_FLOAT
	k = gg.getValues(k)
	if (math.abs(k[2].value-1)<0.01 and math.abs(k[1].value-20.0)<0.01) then
		testAd = true
		local a = ttt
		ttt={}
		ttt[1] = a
	end
end
if testAd == false then
local te = gg.getListItems()
ttt ={}
for i, v in ipairs(te) do
  if v.name == "speedGame" then
    t ={}
	t[1] = {}
	t[1].address = te[i].address + 0x10
	t[1].flags = gg.TYPE_FLOAT
	t = gg.getValues(t)
	k ={}
	k[1] = {}
	k[1].address = te[i].address + 0x4
	k[1].flags = gg.TYPE_FLOAT
	k = gg.getValues(k)
	if (math.abs(k[1].value-1)<0.01 and math.abs(t[1].value-20.0)<0.01) then
	testAd = true
	ttt[#ttt+1]= te[i].address
	end
  end
end
end

if (testAd==false) then
	local del = {}
	local te = gg.getListItems()
	for i, v in ipairs(te) do
	  if (v.name == "speedGame") then
		table.insert(del, te[i].address)
	  end
	end
		gg.removeListItems(del)
		
	gg.setRanges(range)
	gg.setVisible(false)
	gg.searchNumber("0;1f;1f;0.0001f;20f::21", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
	--gg.refineAddress("C", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1, 0)
	gg.refineNumber("20", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
	m = gg.getResultsCount()
	if m==0 then
	gg.alert("Not found result. ")
	GodConsole()
	else
		x = gg.getResults(m)
		a1 = nil
		a1 = {}
		a2 = nil
		a2 = {}
		a3 = nil
		a3 = {}
		a4 = nil
		a4 = {}
		ttt ={}
		for i = 1, m do
			a1[i] = {}
			a1[i][1] = {}
			a1[i][1].address = x[i].address - 0x8
			a1[i][1].flags = gg.TYPE_FLOAT
			a1[i] = gg.getValues(a1[i])
			a2[i] = {}
			a2[i][1] = {}
			a2[i][1].address = x[i].address -0xc
			a2[i][1].flags = gg.TYPE_FLOAT
			a2[i] = gg.getValues(a2[i])
			a3[i] = {}
			a3[i][1] = {}
			a3[i][1].address = x[i].address +0x34
			a3[i][1].flags = gg.TYPE_DWORD
			a3[i] = gg.getValues(a3[i])
			if (math.abs(a1[i][1].value-1)<0.01 and math.abs(a2[i][1].value-1)<0.01) and a3[i][1].value > 0 then
				a4[i] = {}
				a4[i][1] = {}
				a4[i][1].address = x[i].address - 0x10
				a4[i][1].flags = gg.TYPE_FLOAT
				a4[i][1].name = 'speedGame'
				ttt[#ttt+1]= a4[i][1].address
				gg.addListItems(a4[i])
				testAd = true
			end
		end
	end	
end

local speedLv = {0.25, 0.5, 1.0, 2.0, 4.0, 6.0, 7.0, 8.0, 9.0, 10.0}
if testAd then
	n = gg.prompt({'CHOOSE FOR CHANGE SPEED GAME:\n1: 25%\n2: 50%\n3: 100%\n4: 200%\n5: 400%\n6: 600%\n7: 700%\n8: 800%\n9: 900%\n10: 1000% [1;10]'},
	 {currentSpeed}, {'number'})
	if n == nil then 
		gg.sleep(1)
		gg.toast("CANCELLED")
		GodConsole()
	else
		currentSpeed = tonumber(n[1])
		for i = 1, #ttt do
			k[i] = {}
			k[i][1] = {}
			k[i][1].address = tonumber(ttt[i])
			k[i][1].flags = gg.TYPE_FLOAT
			k[i][1].value = speedLv[tonumber(n[1])]
			gg.setValues(k[i])
		end
		gg.toast("Changed!!!")
	end
else
gg.alert("Not found. Let's try again")
end
end

currentHour = 0
function advanceDay()
gg.clearResults()
local testAd = false
local tt
local t = {"libUE4.so", "Cd"}
if is64 then
	if gversion == 2028 then
	tt = {0x418CD0,0xAD8,0x0,0x60,0x644}
	else
	tt = {0x422E60,0x18,0x0,0x78,0x644}
	--tt = {0x430070,0x10,0x0,0x78,0x644}
	--tt = {0x446AC0,0x368,0x0,0x78,0x644}
	--tt = {0x46F100,0x0,0x0,0x78,0x644}
	end
else
	if gversion==2028 then
	tt = {0x20B2E8, 0x3C, 0x70, 0x460, 0x500}
	else
	tt = {0x20B568, 0x3C, 0x70, 0x460, 0x500}
	end
end
local ttt = S_Pointer(t, tt, true)

local k ={}
if tonumber(ttt)~=nil then
	k[1] = {}
	if is64 then
	k[1].address = tonumber(ttt) - 0x44
	else
	k[1].address = tonumber(ttt) - 0x30
	end
	k[1].flags = gg.TYPE_DWORD
	k[2] = {}
	if is64 then
	k[2].address = tonumber(ttt) - 0x50
	else
	k[2].address = tonumber(ttt) - 0x3C
	end
	k[2].flags = gg.TYPE_DWORD
	k = gg.getValues(k)
	if (math.abs(k[2].value-1000.0)<0.01 and math.abs(k[1].value-8.0)<0.01) then
		testAd = true
		k[3] = {}
		k[3].address = ttt
		k[3].flags = gg.TYPE_FLOAT
		k = gg.getValues(k)
		ttt = {}
		ttt[1] = k[3].address
		currentHour = k[3].value * 2.316666666666667
	end
end

if testAd == false then
	local te = gg.getListItems()
	ttt = {}
	j=1
	for i, v in ipairs(te) do
	  if v.name == "hourDay" then
		t ={}
		t[1] = {}
		if is64 == true then
		t[1].address = te[i].address - 0x44
		else
		t[1].address = te[i].address - 0x30
		end
		t[1].flags = gg.TYPE_DWORD
		t = gg.getValues(t)
		k ={}
		k[1] = {}
		if is64 == true then
		k[1].address = te[i].address - 0x50
		else
		k[1].address = te[i].address - 0x3c
		end
		k[1].flags = gg.TYPE_DWORD
		k = gg.getValues(k)
		if (math.abs(k[1].value-1000)<0.01 and math.abs(t[1].value-8)<0.01) then
			testAd = true
			q ={}
			q[1] = {}
			q[1].address = te[i].address
			q[1].flags = gg.TYPE_FLOAT
			q = gg.getValues(q)
			ttt[j] = q[1].address
			j=j+1
			currentHour = q[1].value * 2.316666666666667
		end
	  end
	end
end

if (testAd==false) then
	local del = {}
	local te = gg.getListItems()
	for i, v in ipairs(te) do
	  if (v.name == "hourDay") then
		table.insert(del, te[i].address)
	  end
	end
		gg.removeListItems(del)
		
	gg.setRanges(range)
	gg.setVisible(false)
	gg.searchNumber("1,000D;1D;0D;8D::13", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
	--gg.refineAddress("C", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1, 0)
	gg.refineNumber("8", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
	m = gg.getResultsCount()
	if m==0 then
	gg.alert("Not found result. ")
	GodConsole()
	else
		x = gg.getResults(m)
		a1 = nil
		a1 = {}
		a2 = nil
		a2 = {}
		a3 = nil
		a3 = {}
		a4 = nil
		a4 = {}
		ttt = {}
		j=1
		for i = 1, m do
			a1[i] = {}
			a1[i][1] = {}
			a1[i][1].address = x[i].address - 0x4
			a1[i][1].flags = gg.TYPE_DWORD
			a1[i] = gg.getValues(a1[i])
			a2[i] = {}
			a2[i][1] = {}
			a2[i][1].address = x[i].address -0x8
			a2[i][1].flags = gg.TYPE_DWORD
			a2[i] = gg.getValues(a2[i])
			a3[i] = {}
			a3[i][1] = {}
			a3[i][1].address = x[i].address -0xc
			a3[i][1].flags = gg.TYPE_DWORD
			a3[i] = gg.getValues(a3[i])
			if math.abs(a1[i][1].value-0)<0.001 and math.abs(a2[i][1].value-1)<0.01 and math.abs(a3[i][1].value-1000)<0.01 then
				a4[i] = {}
				a4[i][1] = {}
				if is64==true then
				a4[i][1].address = x[i].address + 0x44
				else
				a4[i][1].address = x[i].address + 0x30
				end
				a4[i][1].flags = gg.TYPE_FLOAT
				a4[i][1].name = 'hourDay'
				ttt[j] = a4[i][1].address
				j=j+1
				gg.addListItems(a4[i])
				a4[i] = gg.getValues(a4[i])
				currentHour = a4[i][1].value * 2.316666666666667
			end
		end
	end
end	

	for i=0, 23 do
		if math.abs(currentHour-i)< 1 then
		currentHour = i
		end
	end

	n = gg.prompt({'CHOOSE HOUR FOR CHANGE: [0;23]'},
	 {tonumber(currentHour)}, {'number'})
	if n == nil then 
		gg.sleep(1)
		gg.toast("CANCELLED")
		GodConsole()
	else	
		currentHour = tonumber(n[1])
		for i=1, #ttt do
			k[i]={}
			k[i][1] = {}
			k[i][1].address = tonumber(ttt[i])
			k[i][1].flags = gg.TYPE_FLOAT
			k[i][1].value = currentHour * 0.4316546762589928
			gg.setValues(k[i])
		end
		
		gg.toast("Changed!!!")
	end
end

function HealAll()
	n = gg.prompt({
	"HEAL PLAYER",
	"HEAL ALL TAMED CREATURES",
	"HEAL ALL STRUCTURES",
	"HEAL ALL WILD CREATURES",
	"REFIND ALL BEFORE HEAL?\n*Update creatures and structures before heal"
	},
	 {true, true, false, false, false}, {'checkbox', 'checkbox', 'checkbox', 'checkbox', 'checkbox'})
	if n == nil then 
		gg.sleep(1)
		gg.toast("CANCELLED")
		GodConsole()
	else	
		if n[5] == true then
			gg.toast("Finding World. Please wait")
			GetArray(0)
		end
		local k = {}
		local v = {}
		local offset = 0
		if is64 then
			offset = 0x778
		else
			offset = 0x678
		end
		if #ArrayDinos>0 then
			for i=1,#ArrayDinos do
				k[i] = {}
				v[i] = {}
				if (ArrayDinos[i][2]>100000 and ArrayDinos[i][1] ~= "PLAYER" and n[2]==true) then
					--Max
					v[i][1] = {}
					v[i][1].address = ArrayDinos[i][7]-- hp
					v[i][1].flags = gg.TYPE_FLOAT
					v[i][2] = {}
					v[i][2].address = v[i][1].address + 0x4  -- stamina
					v[i][2].flags = gg.TYPE_FLOAT
					v[i][3] = {}
					v[i][3].address = v[i][1].address + 0x8  -- Torpor
					v[i][3].flags = gg.TYPE_FLOAT
					v[i][4] = {}
					v[i][4].address = v[i][1].address + 0xc  -- Oxygen
					v[i][4].flags = gg.TYPE_FLOAT
					v[i][5] = {}
					v[i][5].address = v[i][1].address + 0x10  -- Food
					v[i][5].flags = gg.TYPE_FLOAT
					v[i] = gg.getValues(v[i])
				--Current
					k[i][1] = {}
					k[i][1].address = ArrayDinos[i][7] + offset -- hp
					k[i][1].flags = gg.TYPE_FLOAT
					k[i][1].value = v[i][1].value
					k[i][2] = {}
					k[i][2].address = k[i][1].address + 0x4  -- stamina
					k[i][2].flags = gg.TYPE_FLOAT
					k[i][2].value = v[i][2].value
					k[i][3] = {}
					k[i][3].address = k[i][1].address + 0x8  -- Torpor
					k[i][3].flags = gg.TYPE_DWORD
					k[i][3].value = "0"
					k[i][4] = {}
					k[i][4].address = k[i][1].address + 0xc  -- Oxygen
					k[i][4].flags = gg.TYPE_FLOAT
					k[i][4].value = v[i][4].value
					k[i][5] = {}
					k[i][5].address = k[i][1].address + 0x10  -- Food
					k[i][5].flags = gg.TYPE_FLOAT
					k[i][5].value = v[i][5].value
					gg.setValues(k[i])
					
					gg.toast("Healed "..ArrayDinos[i][1], true)
				end
				
				if (ArrayDinos[i][2]<100000 and ArrayDinos[i][1] ~= "PLAYER" and n[4]==true) then
					--Max
					v[i][1] = {}
					v[i][1].address = ArrayDinos[i][7]-- hp
					v[i][1].flags = gg.TYPE_FLOAT
					v[i][2] = {}
					v[i][2].address = v[i][1].address + 0x4  -- stamina
					v[i][2].flags = gg.TYPE_FLOAT
					v[i][3] = {}
					v[i][3].address = v[i][1].address + 0x8  -- Torpor
					v[i][3].flags = gg.TYPE_FLOAT
					v[i][4] = {}
					v[i][4].address = v[i][1].address + 0xc  -- Oxygen
					v[i][4].flags = gg.TYPE_FLOAT
					v[i][5] = {}
					v[i][5].address = v[i][1].address + 0x10  -- Food
					v[i][5].flags = gg.TYPE_FLOAT
					v[i] = gg.getValues(v[i])
				--Current
					k[i][1] = {}
					k[i][1].address = ArrayDinos[i][7] + offset -- hp
					k[i][1].flags = gg.TYPE_FLOAT
					k[i][1].value = v[i][1].value
					k[i][2] = {}
					k[i][2].address = k[i][1].address + 0x4  -- stamina
					k[i][2].flags = gg.TYPE_FLOAT
					k[i][2].value = v[i][2].value
					k[i][3] = {}
					k[i][3].address = k[i][1].address + 0x8  -- Torpor
					k[i][3].flags = gg.TYPE_DWORD
					k[i][3].value = "0"
					k[i][4] = {}
					k[i][4].address = k[i][1].address + 0xc  -- Oxygen
					k[i][4].flags = gg.TYPE_FLOAT
					k[i][4].value = v[i][4].value
					k[i][5] = {}
					k[i][5].address = k[i][1].address + 0x10  -- Food
					k[i][5].flags = gg.TYPE_FLOAT
					k[i][5].value = v[i][5].value
					gg.setValues(k[i])
					gg.toast("Healed "..ArrayDinos[i][1], true)
				end
			end
		end
		
						
		if (#ArrayPlayer>0 and n[1]==true) then
			k={}
			v={}
			--Max
			v[1] = {}
			v[1].address = ArrayPlayer[7]-- hp
			v[1].flags = gg.TYPE_FLOAT
			v[2] = {}
			v[2].address = v[1].address + 0x4  -- stamina
			v[2].flags = gg.TYPE_FLOAT
			v[3] = {}
			v[3].address = v[1].address + 0x8  -- Torpor
			v[3].flags = gg.TYPE_FLOAT
			v[4] = {}
			v[4].address = v[1].address + 0xc  -- Oxygen
			v[4].flags = gg.TYPE_FLOAT
			v[5] = {}
			v[5].address = v[1].address + 0x10  -- Food
			v[5].flags = gg.TYPE_FLOAT
			v[6] = {}
			v[6].address = v[1].address + 0x14  -- water
			v[6].flags = gg.TYPE_FLOAT
			v = gg.getValues(v)
		--Current
			k[1] = {}
			k[1].address = ArrayPlayer[7] + offset -- hp
			k[1].flags = gg.TYPE_FLOAT
			k[1].value = v[1].value
			k[2] = {}
			k[2].address = k[1].address + 0x4  -- stamina
			k[2].flags = gg.TYPE_FLOAT
			k[2].value = v[2].value
			k[3] = {}
			k[3].address = k[1].address + 0x8  -- Torpor
			k[3].flags = gg.TYPE_DWORD
			k[3].value = "0"
			k[4] = {}
			k[4].address = k[1].address + 0xc  -- Oxygen
			k[4].flags = gg.TYPE_FLOAT
			k[4].value = v[4].value
			k[5] = {}
			k[5].address = k[1].address + 0x10  -- Food
			k[5].flags = gg.TYPE_FLOAT
			k[5].value = v[5].value		
			k[6] = {}
			k[6].address = k[1].address + 0x14  -- Water
			k[6].flags = gg.TYPE_FLOAT
			k[6].value = v[6].value		
			gg.setValues(k)
			gg.toast("Healed "..ArrayPlayer[1], true)
		end
		
		if #ArrayStructures>0 and n[3]==true then
			k= {}
			for i=1,#ArrayStructures do
				k[i] = {}
				k[i][1] = {}
				k[i][1].address = ArrayStructures[i][5] -- maxHP
				k[i][1].flags = gg.TYPE_FLOAT
				k[i] = gg.getValues(k[i])
				k[i][2] = {}
				k[i][2].address = ArrayStructures[i][4] -- curHp
				k[i][2].flags = gg.TYPE_FLOAT
				k[i][2].value = k[i][1].value
				gg.setValues(k[i])
				gg.toast("Healed tructure "..i.." HP: "..ArrayStructures[i][3], true)
			end	
		end
		
		gg.toast("Actived!!!")
	end

end

function round(x, n)
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end

function UnlimitElectric()
	local del = {}
	local te = gg.getListItems()
	for i, v in ipairs(te) do
	  if (v.name == "active_function_device" or v.name == "active_stat_device" or v.name == "active_OnOff") then
		table.insert(del, te[i].address)
	  end
	end
		gg.removeListItems(del)

typeDevice = 0
n = gg.prompt({'CURRENT MAX DURATION ELECTRICAL DEVICE:',
'UNLIMITED ELECTRICITY\n>>Allows the use of electrical device without the need for a generator to be turned on or exist.\n>>The generator needs to be turned on for the first generator connection',
'FORCE USE ELECTRICAL DEVICE\n>>No generator is needed to use electrical device to operate.\n>>Some electrical device may not appear to be in working condition, such as a refrigerator or air conditioner light, but it is still functioning properly.\n>>Saving and restarting the game will work normally',
'CHANGE FOR ALL STRUCTURES SAME MAX DURATION?',
'REFIND AND UPDATE STRUCTURES?\nUse if you build and change to new electrical devices and need to update them for change'
},
 {0,true, true, false, false}, {'number','checkbox', 'checkbox', 'checkbox', 'checkbox'})
if n == nil then 
	gg.sleep(1)
	gg.toast("CANCELLED")
	StructureOption()
else
	local arStruct = {}
	local k = {}
	if n[5]==true then
		gg.toast("Finding World. Please wait")
		GetArray(0)
	end
	if #ArrayStructures >0 then
		for i=1, #ArrayStructures do
			if math.abs(ArrayStructures[i][3]-tonumber(n[1]))< 0.01 then
				arStruct[#arStruct+1] = ArrayStructures[i]
			end
		end
		
		if #arStruct>0 then
			if #arStruct >1 and n[4] == false then
				k = {}
				for i=1, #arStruct do
					k[i] = {}
					k[i][1] = {}
					k[i][1].address = arStruct[i][5] -- maxHP
					k[i][1].flags = gg.TYPE_FLOAT
					k[i][1].value = math.abs(tonumber(n[1])+i)
					gg.setValues(k[i])
				end
				
				o = gg.prompt({'CURRENT MAX DURATION:\n>It changed please check again and type true value'},
				 {0}, {'number'})
				if o == nil then 
					gg.sleep(1)
					gg.toast("CANCELLED")
					k = {}
					for i=1, #arStruct do
						k[i] = {}
						k[i][1] = {}
						k[i][1].address = arStruct[i][5] -- maxHP
						k[i][1].flags = gg.TYPE_FLOAT
						k[i][1].value = tonumber(n[1])
						gg.setValues(k[i])
					end
					StructureOption()
				else
					k = {}
					for i=1, #arStruct do
						k[i] = {}
						k[i][1] = {}
						k[i][1].address = arStruct[i][5] -- maxHP
						k[i][1].flags = gg.TYPE_FLOAT
						k[i][2] = {}
						if is64 == true then
						k[i][2].address = arStruct[i][5] + 0x578
						else
						k[i][2].address = arStruct[i][5] + 0x460
						end
						k[i][2].flags = gg.TYPE_DWORD
						k[i] = gg.getValues(k[i])
						if math.abs(k[i][1].value-tonumber(o[1])) <0.1 and tonumber(k[i][2].value)>0 then
							k[i][2].name = 'active_function_device'
							--gg.addListItems(k[i])
							k[i][3] = {}
							if is64 == true then 
							k[i][3].address = k[i][2].address + 0x68
							else
							k[i][3].address = k[i][2].address + 0x48
							end
							k[i][3].flags = gg.TYPE_DWORD
							k[i][3].name = 'active_stat_device'
							--gg.addListItems(k[i])
							k[i] = gg.getValues(k[i])
							typeDevice = k[i][3].value
							k[i][4] = {}
							if is64 == true then 
							k[i][4].address = k[i][2].address + 0x208
							else
							k[i][4].address = k[i][2].address + 0x190
							end
							k[i][4].flags = gg.TYPE_DWORD
							k[i][4].name = 'active_OnOff'
							if n[2] == true or n[3]== true then
								k[i][4].value = '1000000000'
							end
							
							if n[3] == true then						
								k[i][3].value = '4745'
								if typeDevice < 10000 then
									k[i][2].value = '528'
								end
							end	
							--gg.addListItems(k[i])
							--gg.setValues(k[i])
							k[i][1].value = tonumber(n[1])
						else
							k[i][1].value = tonumber(n[1])
						end
						gg.setValues(k[i])
					end
					gg.toast("Changed! Save and Restart game if your electrical devices don't work")
				end
			else
				for i=1, #arStruct do
					k[i] = {}
					k[i][1] = {}
					if is64 == true then
					k[i][1].address = arStruct[i][5] + 0x578
					else
					k[i][1].address = arStruct[i][5] + 0x460
					end
					k[i][1].flags = gg.TYPE_DWORD
					k[i] = gg.getValues(k[i])
					if tonumber(k[i][1].value)>0 then 
						k[i][1].name = 'active_function_device'
						--gg.addListItems(k[i])
						k[i][2] = {}
						if is64 == true then 
						k[i][2].address = k[i][1].address + 0x68
						else
						k[i][2].address = k[i][1].address + 0x48
						end
						k[i][2].flags = gg.TYPE_DWORD
						k[i][2].name = 'active_stat_device'
						--gg.addListItems(k[i])
						k[i] = gg.getValues(k[i])
						typeDevice = k[i][2].value
						k[i][3] = {}
						if is64 == true then 
						k[i][3].address = k[i][1].address + 0x208
						else
						k[i][3].address = k[i][1].address + 0x190
						end
						k[i][3].flags = gg.TYPE_DWORD
						k[i][3].name = 'active_OnOff'
						if n[2] == true or n[3]== true then
							k[i][3].value = '1000000000'
						end
						
						if n[3] == true then						
							k[i][2].value = '4745'
							if typeDevice < 10000 then
								k[i][1].value = '528'
							end
						end	
						--gg.addListItems(k[i])
						gg.setValues(k[i])
						gg.toast("Changed tructure "..i, true)
					end 
				end
				gg.toast("Changed! Save and Restart game if your electrical devices don't work")
			end
		else
			gg.alert("Not found result. ")
		end
	else
		gg.clearResults()
		gg.setRanges(range)
		gg.setVisible(false)
		gg.searchNumber("0;"..n[1]..";1,017,370,378~1,028,443,341D::9", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
		--gg.searchNumber("0;"..n[1]..";1,028,443,341D::9", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)  elevator
		--gg.refineAddress("C", -1, gg.TYPE_DWORD, gg.SIGN_EQUAL, 0, -1, 0)
		gg.refineNumber(n[1], gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
		m = gg.getResultsCount()
		if m==0 then
		gg.alert("Not found result. ")
		StructureOption()
		end
		if m >1 then
			x = gg.getResults(m)
			gg.saveVariable(x, gg.EXT_CACHE_DIR.."/Original.value")
			a = nil
			a = {}
			for i = 1, m do
				a[i] = {}
				a[i][1] = {}
				a[i][1].address = x[i].address
				a[i][1].flags = gg.TYPE_FLOAT
				a[i][1].value = math.abs(tonumber(n[1])+i)
				gg.setValues(a[i])
			end
			o = gg.prompt({'CURRENT MAX DURATION ELECTRICAL DEVICE:\n>It changed please check again and type true value'},
			 {0}, {'number'})
			if o == nil then 
				gg.sleep(1)
				gg.toast("CANCELLED")
				gg.clearResults()
				local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
				if check then
					local a = check ()
					local b = gg.getValues(a)
					for a, b in next, b do
						--do what you want
					end
					gg.setValues(a)--revert to original
				end
				StructureOption()
			else

				gg.refineNumber(o[1], gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
				t = gg.getResultsCount()
				if t==0 then
					gg.alert("Not found result. You type wrong value. Let try again")
					gg.clearResults()
					local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
					if check then
						local a = check ()
						local b = gg.getValues(a)
						for a, b in next, b do
							--do what you want
						end
						gg.setValues(a)--revert to original
					end
					StructureOption()
				else 
					x = gg.getResults(t)
					a1 = nil
					a1 = {}
					a2 = nil
					a2 = {}
					a3 = nil
					a3 = {}
					for i = 1, t do
						a1[i] = {}
						a1[i][1] = {}
						if is64 == true then
						a1[i][1].address = x[i].address + 0x578
						else
						a1[i][1].address = x[i].address + 0x460
						end
						a1[i][1].flags = gg.TYPE_DWORD
						a1[i] = gg.getValues(a1[i])
						if tonumber(a1[i][1].value)>0 then 
							a1[i][1].name = 'active_function_device'
							gg.addListItems(a1[i])
							a2[i] = {}
							a2[i][1] = {}
							if is64 == true then 
							a2[i][1].address = a1[i][1].address + 0x68
							else
							a2[i][1].address = a1[i][1].address + 0x48
							end
							a2[i][1].flags = gg.TYPE_DWORD
							a2[i][1].name = 'active_stat_device'
							gg.addListItems(a2[i])
							a2[i] = gg.getValues(a2[i])
							typeDevice = a2[i][1].value
							a3[i] = {}
							a3[i][1] = {}
							if is64 == true then 
							a3[i][1].address = a1[i][1].address + 0x208
							else
							a3[i][1].address = a1[i][1].address + 0x190
							end
							a3[i][1].flags = gg.TYPE_DWORD
							a3[i][1].name = 'active_OnOff'
							gg.addListItems(a3[i])
						end 
					end
					gg.clearResults()
					local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
					if check then
						local a = check ()
						local b = gg.getValues(a)
						for a, b in next, b do
							--do what you want
						end
						gg.setValues(a)--revert to original
					end
					
				end
			 end
		else
			x = gg.getResults(m)
			a1 = nil
			a1 = {}
			a2 = nil
			a2 = {}
			a3 = nil
			a3 = {}
			for i = 1, m do
				a1[i] = {}
				a1[i][1] = {}
				if is64 == true then
				a1[i][1].address = x[i].address + 0x578
				else
				a1[i][1].address = x[i].address + 0x460
				end
				a1[i][1].flags = gg.TYPE_DWORD
				a1[i] = gg.getValues(a1[i])
				if tonumber(a1[i][1].value)>0 then 
					a1[i][1].name = 'active_function_device'
					gg.addListItems(a1[i])
					a2[i] = {}
					a2[i][1] = {}
					if is64 == true then 
					a2[i][1].address = a1[i][1].address + 0x68
					else
					a2[i][1].address = a1[i][1].address + 0x48
					end
					a2[i][1].flags = gg.TYPE_DWORD
					a2[i][1].name = 'active_stat_device'
					gg.addListItems(a2[i])
					a2[i] = gg.getValues(a2[i])
					typeDevice = a2[i][1].value
					a3[i] = {}
					a3[i][1] = {}
					if is64 == true then 
					a3[i][1].address = a1[i][1].address + 0x208
					else
					a3[i][1].address = a1[i][1].address + 0x190
					end
					a3[i][1].flags = gg.TYPE_DWORD
					a3[i][1].name = 'active_OnOff'
					gg.addListItems(a3[i])
				end 
			end
		end
		
		local ros = gg.getListItems()
		for i, v in ipairs(ros) do
			  if n[2] == true and v.name == "active_OnOff" then
				v.flags = gg.TYPE_DWORD
				v.value = '1000000000'
			  end
			  if n[3] == true then
				if v.name == "active_OnOff" then
					v.flags = gg.TYPE_DWORD
					v.value = '1000000000'
				end
				if v.name == "active_stat_device" then
					v.flags = gg.TYPE_DWORD
					v.value = '4745'
				end
				if typeDevice < 10000 and v.name == "active_function_device" then
					v.flags = gg.TYPE_DWORD
					v.value = '528'
				end
			  end
		end
		gg.setValues(ros)
		gg.addListItems(ros)
		if n[3] == false then 
			if n[2] == true then
				gg.alert("Actived! Please turn on the electrical device from the generator for the first time and do not need to use it after that once the device is turned on")
			else
				gg.alert("You don't allow anything!")
			end 
		else
		gg.alert("FORCE USE ELECTRICAL DEVICE actived! Don't worry if you don't see light on the air conditioner or refrigerator. Saving and restarting the game will work normally")
		end
	end

end
end

function FreeCrafting()
gg.clearResults()
local del = nil
del = {}
local te = gg.getListItems()
for i, v in ipairs(te) do
  if (v.name == "MaterialCraft") then
    table.insert(del, te[i].address)
	--gg.toast("I am here")
  end
end
    gg.removeListItems(del)
	
	materials = {}
	n = gg.prompt({'ENTER THE VALUE OF EACH MATERIAL NEEDED FOR CRAFTING\n (In correct order from top to bottom in blueprint)',
	"FREE CRAFTING FOR ALL BLUEPRINT\n Skipt enter materials need when tick this option"},
	 {"Example: 2500;600;150;1200;50", true}, {'text', 'checkbox'})
	if n == nil then 
		gg.sleep(1)
		gg.toast("CANCELLED")
		StartCheat()
	else
		if n[2]==true then
			if is64 == true then
				LibStart=gg.getRangesList('libUE4.so')[1].start
				APEXGG=nil
				APEXGG={}
				APEXGG[1]={}
				APEXGG[2]={}
				if gversion==2028 then
				APEXGG[1].address=LibStart+0x2AA2A38
				else
				APEXGG[1].address=LibStart+0x2AA0560
				end
				APEXGG[1].value='h20008052'
				APEXGG[1].flags=4
				if gversion==2028 then
				APEXGG[2].address=LibStart+(0x2AA2A38+0x4)
				else
				APEXGG[2].address=LibStart+(0x2AA0560+0x4)
				end
				APEXGG[2].value='hC0035FD6'
				APEXGG[2].flags=4
				gg.setValues(APEXGG)
			else
				LibStart=gg.getRangesList('libUE4.so')[1].start
				APEXGG=nil
				APEXGG={}
				APEXGG[1]={}
				APEXGG[2]={}
				if gversion==2028 then
				APEXGG[1].address=LibStart+0x220571C
				else
				APEXGG[1].address=LibStart+0x2204854
				end
				APEXGG[1].value='h0100A0E3'
				APEXGG[1].flags=4
				if gversion == 2028 then
				APEXGG[2].address=LibStart+(0x220571C+0x4)
				else
				APEXGG[2].address=LibStart+(0x2204854+0x4)
				end
				APEXGG[2].value='h1EFF2FE1'
				APEXGG[2].flags=4
				gg.setValues(APEXGG)
			end
			gg.toast("Actived!")
		else
			i=0
			for s in string.gmatch(n[1], "[^;]+") do
				if (tonumber(s)~=nil) then
					i=i+1
					materials[i] = tonumber(s)
				else
					gg.alert("You have entered an inappropriate value or the wrong structure. Let's try again")
					StartCheat()
				end
			end
			if #materials > 0 then
				le = #materials * 2 + 1
				--gg.alert(n[1].."::"..le)
				gg.clearResults()
				gg.setRanges(range)
				gg.setVisible(false)
				gg.searchNumber(n[1].."::"..le, gg.TYPE_WORD, false, gg.SIGN_EQUAL, 0, -1, 0)
				gg.refineNumber(materials[1], gg.TYPE_WORD, false, gg.SIGN_EQUAL, 0, -1, 0)
				m = gg.getResultsCount()
				if m==0 then
					gg.alert("Not found result. Please enter the correct structure and order materials for search")
					StartCheat()
				else
					if (m > 1) then
						x = gg.getResults(m)
						gg.saveVariable(x, gg.EXT_CACHE_DIR.."/Original.value")
						a = nil
						a = {}
						a1 = nil
						a1 = {}
						for i = 1, m do
							a1[i] = {}
							a1[i][1] = {}
							a1[i][1].address = x[i].address - 0x2
							a1[i][1].flags = gg.TYPE_WORD
							a1[i] = gg.getValues(a1[i])
							if tonumber(a1[i][1].value)< 0.01 then 	
								a[i] = {}
								a[i][1] = {}
								a[i][1].address = x[i].address
								a[i][1].flags = gg.TYPE_WORD
								a[i][1].value = math.abs(tonumber(materials[1])+i)
								gg.setValues(a[i])
							end
						end
						
						local menu = gg.alert("The first material value needed for crafting has changed, please enter the new value in the next step for refine", "Next", "Back", "Hide For Check")
						if menu == 0 then 
							local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
							if check then
								local a = check ()
								local b = gg.getValues(a)
								for a, b in next, b do
									--do what you want
								end
								gg.setValues(a)--revert to original
							end
							StartCheat()
						elseif menu == 1 then
							o = gg.prompt({'ENTER NEW VALUE OF THE FIRST MATERIAL:\n>It changed please type true value'},
							 {0}, {'number'})
							if o == nil then 
								gg.sleep(1)
								gg.toast("CANCELLED")
								gg.clearResults()
								local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
								if check then
									local a = check ()
									local b = gg.getValues(a)
									for a, b in next, b do
										--do what you want
									end
									gg.setValues(a)--revert to original
								end
								StartCheat()
							else
								gg.refineNumber(o[1], gg.TYPE_WORD, false, gg.SIGN_EQUAL, 0, -1, 0)
								t = gg.getResultsCount()
								if t==0 then
									gg.alert("Not found result. You type wrong value. Let try again")
									gg.clearResults()
									local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
									if check then
										local a = check ()
										local b = gg.getValues(a)
										for a, b in next, b do
											--do what you want
										end
										gg.setValues(a)--revert to original
									end
									StartCheat()
								else 
									x = gg.getResults(t)
									a1 = nil
									a1 = {}
									a2 = nil
									a2 = {}		
									for i = 1, t do
										a1[i] = {}
										a1[i][1] = {}
										a1[i][1].address = x[i].address - 0x2
										a1[i][1].flags = gg.TYPE_WORD
										a1[i] = gg.getValues(a1[i])
										if tonumber(a1[i][1].value)< 0.01 then 	
											of = 2
											for j = 1, #materials do
												of = 2 * (j-1)									
												a2[i] = {}
												a2[i][j] = {}
												a2[i][j].address = x[i].address + tonumber(of)
												a2[i][j].flags = gg.TYPE_WORD
												a2[i][j].name = 'MaterialCraft'
												--gg.setValues(a2[i])
												gg.addListItems(a2[i])
											end
										end 
									end
									gg.clearResults()
									local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
									if check then
										local a = check ()
										local b = gg.getValues(a)
										for a, b in next, b do
											--do what you want
										end
										gg.setValues(a)--revert to original
									end
									
								end
							end
						elseif menu == 2 then	
							local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
							if check then
								local a = check ()
								local b = gg.getValues(a)
								for a, b in next, b do
									--do what you want
								end
								gg.setValues(a)--revert to original
							end
							StartCheat()
						elseif menu == 3 then	
							gg.setVisible(false)
							while(menu == 3)
							do
								while gg.isVisible(true)
								do--
								  gg.setVisible(false)
								  menu = 1
									o = gg.prompt({'ENTER NEW VALUE OF THE FIRST MATERIAL:\n>It changed please type true value'},
									 {0}, {'number'})
									if o == nil then 
										gg.sleep(1)
										gg.toast("CANCELLED")
										gg.clearResults()
										local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
										if check then
											local a = check ()
											local b = gg.getValues(a)
											for a, b in next, b do
												--do what you want
											end
											gg.setValues(a)--revert to original
										end
										StartCheat()
									else
										gg.refineNumber(o[1], gg.TYPE_WORD, false, gg.SIGN_EQUAL, 0, -1, 0)
										t = gg.getResultsCount()
										if t==0 then
											gg.alert("Not found result. You type wrong value. Let try again")
											gg.clearResults()
											local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
											if check then
												local a = check ()
												local b = gg.getValues(a)
												for a, b in next, b do
													--do what you want
												end
												gg.setValues(a)--revert to original
											end
											StartCheat()
										else 
											x = gg.getResults(t)
											a1 = nil
											a1 = {}
											a2 = nil
											a2 = {}		
											for i = 1, t do
												a1[i] = {}
												a1[i][1] = {}
												a1[i][1].address = x[i].address - 0x2
												a1[i][1].flags = gg.TYPE_WORD
												a1[i] = gg.getValues(a1[i])
												if tonumber(a1[i][1].value)< 0.01 then 	
													of = 2
													for j = 1, #materials do
														of = 2 * (j-1)									
														a2[i] = {}
														a2[i][j] = {}
														a2[i][j].address = x[i].address + tonumber(of)
														a2[i][j].flags = gg.TYPE_WORD
														a2[i][j].name = 'MaterialCraft'
														--gg.setValues(a2[i])
														gg.addListItems(a2[i])
													end
												end 
											end
											gg.clearResults()
											local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
											if check then
												local a = check ()
												local b = gg.getValues(a)
												for a, b in next, b do
													--do what you want
												end
												gg.setValues(a)--revert to original
											end
											
										end
									end
								end
							end	  
						end
						
					else
						x = gg.getResults(m)
						a1 = nil
						a1 = {}
						a2 = nil
						a2 = {}		
						for i = 1, m do
							a1[i] = {}
							a1[i][1] = {}
							a1[i][1].address = x[i].address - 0x2
							a1[i][1].flags = gg.TYPE_WORD
							a1[i] = gg.getValues(a1[i])
							if tonumber(a1[i][1].value)< 0.01 then 	
								of = 2
								for j = 1, #materials do
									of = 2 * (j-1)									
									a2[i] = {}
									a2[i][j] = {}
									a2[i][j].address = x[i].address + tonumber(of)
									a2[i][j].flags = gg.TYPE_WORD
									a2[i][j].name = 'MaterialCraft'
									--gg.setValues(a2[i])
									gg.addListItems(a2[i])
								end
							end 
						end
					end
				end
			end
			
			local ros = gg.getListItems()
			for i, v in ipairs(ros) do
				  if v.name == "MaterialCraft" then
						v.flags = gg.TYPE_WORD
						v.value = 0
				  end
			end
			gg.setValues(ros)
			gg.addListItems(ros)
			gg.alert("Free Craft Actived! But note where item can be only crafted at. You cannot craft outside of that location")
			end
	
		
	end
end

function UnlimitedLIOPLEURODON()
gg.clearResults()
gg.setRanges(range)
gg.setVisible(false)
gg.searchNumber("1800", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(gg.getResultsCount())
gg.editAll('3.4e38', gg.TYPE_FLOAT)
gg.alert("Changed! You need kill LIOPLEURODON and take Implant and then revival to see change")
end

function EggOptions()
	gg.clearResults()

	local del = {}
	local te = gg.getListItems()
	for i, v in ipairs(te) do
	  if (v.name == "egg_incubation" or v.name == "egg_quantity" or v.name == "egg_type" or v.name == "egg_weight") then
		table.insert(del, te[i].address)
		--gg.toast("I am here")
	  end
	end
		gg.removeListItems(del)

	exitsValue = false	
	n = gg.prompt({'CURRENT WEIGHT EGGS ITEM (>0)\nIf there is more than 1 egg in stack size slot, the egg weight value is the average value of 1 egg',
	'EGGS QUANTITY (>0)\nMake Eggs more >1',
	'MAKE SUPER EGGS',
	'SKIP THE INCUBATION PERIOD'
	}, {0, 1, true, true}, {'number','number', 'checkbox', 'checkbox'})
	if n == nil then 
	gg.sleep(1)
	gg.toast("CANCELLED")
	else
		if tonumber(n[1])>0 then
			gg.toast("Finding item for change. Please wait")
			gg.setRanges(range)
			gg.setVisible(false)
			gg.searchNumber("0.5F;"..n[1].."F;1.0F;-1.0F;1.0F::17", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
			gg.refineNumber(n[1], gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
			m = gg.getResultsCount()
			if m==0 then
			gg.alert("Not found result")
			StartCheat()
			else
				if m>1 then
					x = gg.getResults(m)
					gg.saveVariable(x, gg.EXT_CACHE_DIR.."/Original.value")
					a = nil
					a = {}
					a1 = nil
					a1 = {}
					a2 = nil
					a2 = {}
					a3 = nil
					a3 = {}
					a4 = nil
					a4 = {}
					a5 = nil
					a5 = {}				
					for i = 1, m do
						a1[i] = {}
						a1[i][1] = {}
						a1[i][1].address = x[i].address + 0x4
						a1[i][1].flags = gg.TYPE_FLOAT
						a1[i] = gg.getValues(a1[i])
						a2[i] = {}
						a2[i][1] = {}
						a2[i][1].address = x[i].address - 0x4
						a2[i][1].flags = gg.TYPE_FLOAT
						a2[i] = gg.getValues(a2[i])
						a3[i] = {}
						a3[i][1] = {}
						a3[i][1].address = x[i].address + 0x8
						a3[i][1].flags = gg.TYPE_FLOAT
						a3[i] = gg.getValues(a3[i])	
						a4[i] = {}
						a4[i][1] = {}
						a4[i][1].address = x[i].address + 0xC
						a4[i][1].flags = gg.TYPE_FLOAT
						a4[i] = gg.getValues(a4[i])							
						if math.abs(tonumber(a1[i][1].value)-1)< 0.01 and math.abs(tonumber(a2[i][1].value)-0.5)< 0.01 and math.abs(tonumber(a3[i][1].value)+1)< 0.01 and math.abs(tonumber(a4[i][1].value)-1)< 0.01 then 				
							a[i] = {}
							a[i][1] = {}
							a[i][1].address = x[i].address
							a[i][1].flags = gg.TYPE_FLOAT
							a[i][1].value = math.abs(tonumber(n[1])+i)
							gg.setValues(a[i])
						end
					end
					
					local menu = gg.alert("Current weight eggs changed. Check it and type true value in next step for refine (If there is more than 1 egg in stack size, the egg weight value is the average value of 1 egg)", "Next", "Back", "Hide For Check")
					if menu == 0 then 
						local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
						if check then
							local a = check ()
							local b = gg.getValues(a)
							for a, b in next, b do
								--do what you want
							end
							gg.setValues(a)--revert to original
						end
						StartCheat()
					elseif menu == 1 then
						o = gg.prompt({'REFINE CURRENT WEIGHT EGGS:\n>It changed please type true value'},
						 {0}, {'number'})
						if o == nil then 
							gg.sleep(1)
							gg.toast("CANCELLED")
							gg.clearResults()
							local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
							if check then
								local a = check ()
								local b = gg.getValues(a)
								for a, b in next, b do
									--do what you want
								end
								gg.setValues(a)--revert to original
							end
							StartCheat()
						else
							gg.refineNumber(o[1], gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
							t = gg.getResultsCount()
							if t==0 then
								gg.alert("Not found result. You type wrong value. Let try again")
								gg.clearResults()
								local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
								if check then
									local a = check ()
									local b = gg.getValues(a)
									for a, b in next, b do
										--do what you want
									end
									gg.setValues(a)--revert to original
								end
								StartCheat()
							else 
								x = gg.getResults(t)
								a = nil
								a = {}
								c = nil
								c = {}
								d = nil
								d = {}
								e = nil
								e = {}

								for i = 1, t do
										a[i] = {}
										a[i][1] = {}
										a[i][1].address = x[i].address
										a[i][1].flags = gg.TYPE_FLOAT
										a[i][1].name = 'egg_weight'
										gg.addListItems(a[i])
										c[i] = {}
										c[i][1] = {}
										if is64 == true then
										c[i][1].address = x[i].address+0x1b4  --220 32 bit
										else
										c[i][1].address = x[i].address+0x1A4
										end 
										c[i][1].flags = gg.TYPE_DWORD
										c[i][1].name = 'egg_incubation'
										gg.addListItems(c[i])
										d[i] = {}
										d[i][1] = {}
										if is64 == true then
										d[i][1].address = c[i][1].address + 0x74 
										else
										d[i][1].address = c[i][1].address + 0x50
										end
										d[i][1].flags = gg.TYPE_DWORD
										d[i][1].name = 'egg_quantity'
										gg.addListItems(d[i])
										
										e[i] = {}
										e[i][1] = {}
										if is64 == true then
										e[i][1].address = c[i][1].address - 0x560
										else
										e[i][1].address = c[i][1].address - 0x458
										end
										e[i][1].flags = gg.TYPE_DWORD
										e[i][1].name = 'egg_type'
										gg.addListItems(e[i])
								end
								gg.clearResults()
								local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
								if check then
									local a = check ()
									local b = gg.getValues(a)
									for a, b in next, b do
										--do what you want
									end
									gg.setValues(a)--revert to original
								end
								
							end
						end
					elseif menu == 2 then
								local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
						if check then
							local a = check ()
							local b = gg.getValues(a)
							for a, b in next, b do
								--do what you want
							end
							gg.setValues(a)--revert to original
						end
						StartCheat()
					elseif menu == 3 then
						gg.setVisible(false)
						while(menu == 3)
						do
						  while gg.isVisible(true)
							do--
							  gg.setVisible(false)
							  menu = 1
								o = gg.prompt({'REFINE CURRENT WEIGHT EGGS:\n>It changed please type true value'},
								 {0}, {'number'})
								if o == nil then 
									gg.sleep(1)
									gg.toast("CANCELLED")
									gg.clearResults()
									local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
									if check then
										local a = check ()
										local b = gg.getValues(a)
										for a, b in next, b do
											--do what you want
										end
										gg.setValues(a)--revert to original
									end
									StartCheat()
								else
									gg.refineNumber(o[1], gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
									t = gg.getResultsCount()
									if t==0 then
										gg.alert("Not found result. You type wrong value. Let try again")
										gg.clearResults()
										local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
										if check then
											local a = check ()
											local b = gg.getValues(a)
											for a, b in next, b do
												--do what you want
											end
											gg.setValues(a)--revert to original
										end
										StartCheat()
									else 
										x = gg.getResults(t)
										a = nil
										a = {}
										c = nil
										c = {}
										d = nil
										d = {}
										e = nil
										e = {}

										for i = 1, t do
												a[i] = {}
												a[i][1] = {}
												a[i][1].address = x[i].address
												a[i][1].flags = gg.TYPE_FLOAT
												a[i][1].name = 'egg_weight'
												gg.addListItems(a[i])
												c[i] = {}
												c[i][1] = {}
												if is64 == true then
												c[i][1].address = x[i].address+0x1b4  --220 32 bit
												else
												c[i][1].address = x[i].address+0x1A4
												end 
												c[i][1].flags = gg.TYPE_DWORD
												c[i][1].name = 'egg_incubation'
												gg.addListItems(c[i])
												d[i] = {}
												d[i][1] = {}
												if is64 == true then
												d[i][1].address = c[i][1].address + 0x74 
												else
												d[i][1].address = c[i][1].address + 0x50
												end
												d[i][1].flags = gg.TYPE_DWORD
												d[i][1].name = 'egg_quantity'
												gg.addListItems(d[i])
												
												e[i] = {}
												e[i][1] = {}
												if is64 == true then
												e[i][1].address = c[i][1].address - 0x560
												else
												e[i][1].address = c[i][1].address - 0x458
												end
												e[i][1].flags = gg.TYPE_DWORD
												e[i][1].name = 'egg_type'
												gg.addListItems(e[i])
										end
										gg.clearResults()
										local check = loadfile(gg.EXT_CACHE_DIR.."/Original.value")
										if check then
											local a = check ()
											local b = gg.getValues(a)
											for a, b in next, b do
												--do what you want
											end
											gg.setValues(a)--revert to original
										end
										
									end
								end
							
							end--
						end
					end
					
				else
					x = gg.getResults(m)
					a = nil
					a = {}
					c = nil
					c = {}
					d = nil
					d = {}
					e = nil
					e = {}

					for i = 1, m do
							a[i] = {}
							a[i][1] = {}
							a[i][1].address = x[i].address
							a[i][1].flags = gg.TYPE_FLOAT
							a[i][1].name = 'egg_weight'
							gg.addListItems(a[i])
							c[i] = {}
							c[i][1] = {}
							if is64 == true then
							c[i][1].address = x[i].address+0x1b4  --220 32 bit
							else
							c[i][1].address = x[i].address+0x1A4
							end 
							c[i][1].flags = gg.TYPE_DWORD
							c[i][1].name = 'egg_incubation'
							gg.addListItems(c[i])
							d[i] = {}
							d[i][1] = {}
							if is64 == true then
							d[i][1].address = c[i][1].address + 0x74 
							else
							d[i][1].address = c[i][1].address + 0x50
							end
							d[i][1].flags = gg.TYPE_DWORD
							d[i][1].name = 'egg_quantity'
							gg.addListItems(d[i])
							
							e[i] = {}
							e[i][1] = {}
							if is64 == true then
							e[i][1].address = c[i][1].address - 0x560
							else
							e[i][1].address = c[i][1].address - 0x458
							end
							e[i][1].flags = gg.TYPE_DWORD
							e[i][1].name = 'egg_type'
							gg.addListItems(e[i])
					end
				
				
				end
			end
		else
			gg.sleep(1)
			gg.alert("Can not find with weight Egg = 0")
			StartCheat()
		end		
		local ros = gg.getListItems()
		for i, v in ipairs(ros) do
			  if v.name == "egg_weight" then
				v.flags = gg.TYPE_FLOAT
				v.value = '0.01'
			  end
			  if v.name == "egg_incubation" and n[4]==true then
				v.flags = gg.TYPE_DWORD
				v.value = '10000'
			  end
			  if v.name == "egg_quantity" and tonumber(n[2])>=1 then
				v.flags = gg.TYPE_DWORD
				v.value = tonumber(n[2])
			  end
			  if v.name == "egg_type" then
				if n[3] == true then
					v.flags = gg.TYPE_DWORD
					v.value = '572524558'
				else
					v.flags = gg.TYPE_DWORD
					v.value = '35653646'
				end
			  end
			  
		end
		gg.setValues(ros)
		gg.addListItems(ros)
		gg.toast("Changed!")	
	end
end

--Other
function noselect()
 gg.toast('You are not select anything')
end

function S_Pointer(t_So, t_Offset, _bit)
    local function getRanges()
        local ranges = {}
        local t = gg.getRangesList('^/data/*.so*$')
        for i, v in pairs(t) do
            if v.type:sub(2, 2) == 'w' then table.insert(ranges, v) end
        end
        return ranges
    end
    local function Get_Address(N_So, Offset, ti_bit)
        local ti = gg.getTargetInfo()
        local S_list = getRanges()
        local t = {}
        local _t
        local _S = nil
        if ti_bit then
            _t = 32
        else
            _t = 4
        end
        for i in pairs(S_list) do
            local _N = S_list[i].internalName:gsub('^.*/', '')
            if N_So[1] == _N and N_So[2] == S_list[i].state then
                _S = S_list[i]
                break
            end
        end
        if _S then
            t[#t + 1] = {}
            t[#t].address = _S.start + Offset[1]
            t[#t].flags = _t
            if #Offset ~= 1 then
                for i = 2, #Offset do
                    local S = gg.getValues(t)
                    t = {}
                    for _ in pairs(S) do
                        if not ti.x64 then
                            S[_].value = S[_].value & 0xFFFFFFFF
                        end
                        t[#t + 1] = {}
                        t[#t].address = S[_].value + Offset[i]
                        t[#t].flags = _t
                    end
                end
            end
            _S = t[#t].address
        end
        return _S
    end
    local _A = string.format('0x%X', Get_Address(t_So, t_Offset, _bit))
    return _A
end

function Exit()
--gg.clearResults()
--gg.clearList()
os.exit()
end
--MainMenu()
while(true)
do
  while gg.isVisible(true)
    do
      gg.setVisible(false)
	  MenuSelectVersion()
    end
end
