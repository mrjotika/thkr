local function fetchUrl(url) -- link lấy key
    local response = gg.makeRequest(url).content
    return response
end

local function check_expired()
local url1 = "https://rentry.org/bexiu/raw"
local server1= fetchUrl(url1)
local url4 = "https://rentry.org/ennote/raw"
local key4 = fetchUrl(url4)

    
    local current_date = tonumber(os.date('%Y%m%d'))
    local url = "https://rentry.org/isexpire6/raw"
    local exp_date = tonumber(fetchUrl(url))

    if exp_date == nil then
        gg.alert("Unable to update expiration date. Please check your network connection.")
    elseif current_date > exp_date then
    x = gg.alert(key4 .. server1, "Copy link")
    if x == 1 then
        gg.copyText(server1)
        
        end
        os.exit()
        
    end
end

check_expired()

local url1 = "https://rentry.org/bexiu/raw" -- link key, thay đổi linkk
local url2 = "https://rentry.org/ibexiu/raw" -- thông báo login success
local url3 = "https://rentry.org/thkr/raw" -- get key 
local server1 = fetchUrl(url1) -- Fix typo ur1 to url1
local server2 = fetchUrl(url2) -- Fix typo ur2 to url2
local server = fetchUrl(url3) -- Fix typo ur3 to url3
--server = "https://thkr.pythonanywhere.com"

c = gg.makeRequest(server.."/mykey").content

ch = gg.prompt(
	{'Enter your key and pres ok to continue'},
	{[1] = c},
	{[1] = 'text'})

if ch == nill then
 gg.alert("Please enter key and press ok")
   os.exit()
end

pass = ch[1]

str = pass
if string.find(str, "/") then
  gg.alert("Invlied Key")
  os.exit()
end

if pass == "" then
      x = gg.alert("Wrong key\n Get key form here \n\n" .. server1, "Copy link")
   if x == 1 then 
      gg.copyText(server1)
   end
   os.exit()
end

a = gg.makeRequest(server.."/login/"..pass.."").content

if a == "true" then
   x=gg.alert(server2, "Copy link") 
   if x == 1 then 
      gg.copyText(server1)
   end
elseif a =="false" then
   x = gg.alert("Wrong key\n Get key form here \n\n" .. server1, "Copy link")
   if x == 1 then 
      gg.copyText(server1)
   end
   os.exit()
else
  gg.alert("No response form server/No internet Connection")
  os.exit()
end

LUA = 'KingdomClash(1.8.2)[x64]-v08'
GLabel = 'Kingdom Clash'
GProcess = 'azurgames.idle.war'
GVersion = '1.8.2'
xbit = 64 
LibResult = 1
xlib = 'libil2cpp.so'
xREV = 1  I={}
xCNE = 1
xSSE = 1
XbitX = 1
printx = '---------------------------------------------------------------'
print(printx)
xTAGx = 'BEXIU[GG]v2'
print(xTAGx)
xMOTOx = 'No hack no fun'
print(xMOTOx)
xLINKx = 'https://is.gd/ibexiu'
print(xLINKx)
print(LUA)
print(GLabel..'  '..GVersion)
--███████████████████████
--███████████████████████
--███████████████████████
gg.require('101.1')
apex=1
gg.setVisible(false)
v=gg.getTargetInfo()
    if v==nil then
        print("×× ERROR ××\n×× INVALID PROCESS SELECTED / OR NO ROOT ACCESS") 
        gg.setVisible(true) os.exit()
        return
    end 
------------------------------------------------------------------------------
gg.setRanges(gg.REGION_ANONYMOUS) 
------------------------------------------------------------------------------
OFF="× " ON="√ "
EW=OFF GPK=OFF X4=OFF 


function menu()
apex=0
gg.toast(xTAGx)  
mc=gg.multiChoice({
	EW.."Easy Win",
	GPK.."Gold per Kill",
	X4.."Gold Reward x8",
	"[ EXIT ]"},
    {[1]=true, [2]=true, [3]=true, [4]=true},xTAGx.."\n"..xLINKx.."\n"..GLabel.." "..GVersion.." "..xBITx)
	
	if mc==nil then cancel() return end
	if mc[1] then easywin() end
	if mc[2] then goldkill() end
	if mc[3] then times4() end 
	
	
xhaX={
    EW.."Easy Win",
	GPK.."Gold per Kill",
	X4.."Gold Reward x8" 
	}
xhaX=table.concat(xhaX, "\n")
xhaX=tostring(xhaX) 

	if mc[4] then exit() return end 

gg.toast("[√] Complete") 
gg.alert(GLabel.." "..GVersion.." "..xBITx.."\n\n"..xhaX,"OK",nil,xTAGx)  

end
--███████████████████████

--  public static class CharacterGroupExtensions
--  public static CharacterGroup Invert(CharacterGroup group) { }
I[1]=0xE4A2B8

--  public class ForcedStatValues : IUnitStats // TypeDefIndex:
--  public int get_Health() { }
I[2]=0x113F264

--  public int get_AoeRadius() { }
I[3]=0x113F27C


function easywin()
    if EW==OFF then
        o=I[1] x=1 arm() o=I[2] x=1 arm() o=I[3] x='h00E284D2' arm() EW=ON
    else
        for i = 1,3 do o=I[i] revert() end EW=OFF 
    end
end 

--███████████████████████

--  public class TroopsConfig : IConfig, IUnit // TypeDefIndex:
--  public int get_KillReward() { }

I[4]=0x27CC00C

function goldkill()
o=I[4] 
    if GPK==OFF then x='h8000A0D2' arm() GPK=ON
    else revert() GPK=OFF
    end
end 


--███████████████████████

--  public class UIToggleCurrency : UIBase // TypeDefIndex:
--  public bool IsTicked() { }
I[5]=0xE28178

--  public class VipX4CoinsService : IServiceLocation // TypeDefIndex:
--  public bool IsHaveX4Coins() { }
I[6]=0xF69B3C

function times4()
x=1
    if X4==OFF then o=I[5] arm() o=I[6] arm() X4=ON
    else o=I[5] revert() o=I[6] revert() X4=OFF
    end
end 

--███████████████████████


--███████████████████████
--███████████████████████
--███████████████████████
    if v.processName~=GProcess then
        print("This Script is For:\n    "..GLabel.."\n    "..GProcess.."\nYou Selected:\n    "..v.label.."\n    "..v.processName)
        gg.setVisible (true) os.exit()
        return
    end 
------------------------------------------------------------------------------
    if v.x64 then bitx=64 xBITx="[x64]" else bitx=32 xBITx="[x32]" end 
        print(xBITx)  
        print(printx)  
------------------------------------------------------------------------------
    if XbitX==1 then 
        if bitx~=xbit then 
            print("This Script is For "..xbit.."bit Process\nYour Process is "..bitx.."bit")
            gg.setVisible(true) os.exit()
            return
        end 
    end 
------------------------------------------------------------------------------
    if GVersion~=v.versionName then
        print("This Script is for Game Version:\n    "..GVersion.."\nYour Game Version is:\n    "..v.versionName) 
        gg.setVisible(true) os.exit() 
        return
    end 

--███████████████████████
    if LibResult==1 then 
    xAPEXx={} xXx=0
    xLibRes=0 
    libx=gg.getRangesList()
        if #(libx)==0 then 
        print("×× LIB ERROR #01 ××\nNo Libs Found\nTry a Different Virtual Environment \nor Try a Better Game Installation Method\nor Download Game From 'apkcombo.com' ")
        gg.setVisible(true) 
        os.exit() 
        end
    libx=gg.getRangesList(xlib)
        if #(libx)==0 then  
        print("×× No "..xlib.." Found")
        xLibRes=2 
        goto APEX_SPLIT 
        end
    xlibn=0 
        for i, v in ipairs(libx) do 
            if libx[i].state=="Xa" then 
            xXx=xXx+1 
            xAPEXx[xXx]=libx[i].start
            xLibRes=1
            end
        end 
        if xLibRes==0 then 
        print("×× LIB ERROR #03 ××\nNo "..xlib.." Found in Xa\nTry a Different Virtual Environment \nor Try a Better Game Installation Method\nor Download Game From 'apkcombo.com' ")
        gg.setVisible(true) 
        os.exit()     
        end    
                  
        ::APEX_SPLIT::     
        if xLibRes==2 then
        splitapk=0
        libx=gg.getRangesList()
            for i, v in ipairs(libx) do 
                if libx[i].state=="Xa" and string.match(libx[i].name,"split_config") then
                splitapk=1
                end
            end 
            if splitapk==1 then 
            xsapk={} xsapkx=0
                for i, v in ipairs(libx) do
                    if libx[i].state=="Xa" then
                    xsapkx=xsapkx+1
                    xsapk[xsapkx]=libx[i]["end"]-libx[i].start
                    end
                end 
                if xsapkx~=0 then                 
                APEXQ=math.max(table.unpack(xsapk))
                    for i, v in ipairs(libx) do              
                        if libx[i].state=="Xa" and libx[i]["end"]-libx[i].start==APEXQ then              
                        xXx=xXx+1             
                       xAPEXx[xXx]=libx[i].start
                        print("√√ Split Apk Lib Found\n√√ "..libx[i].name) 
                        xLibRes=1                       
                        end
                    end
                end 
            end 
         
             if splitapk==0 and xLibRes~=1 then
             print("×× No split_config Lib Found")  
             xc=1 xt={} 
             libx=gg.getRangesList()
                 for i, v in ipairs(libx) do
                     if libx[i].state=="Xa" then 
                     xt[xc]=tonumber(libx[i]["end"]-libx[i].start) 
                     xc=xc+1
                     end
                 end
             APEXQ=math.max(table.unpack(xt))
                 for i, v in ipairs(libx) do              
                     if libx[i].state=="Xa" and libx[i]["end"]-libx[i].start==APEXQ then        
                     xXx=xXx+1       
                     xAPEXx[xXx]=libx[i].start
                     print("√√ math.max Xa Lib Found\n√√ "..libx[i].name) 
                     xLibRes=1   
                     end 
                 end
            end                        

            if xLibRes~=1 then
            print("×× Correct Lib Not Found ××\n×× Direct/Split Config/Xa Max ××")
            gg.setVisible(true) 
            os.exit()
             return
            end 
        end 
    end 
--███████████████████████
function arm()
o=tonumber(o) 
    for XxX=1,#(xAPEXx) do
    xdump=nil xdump={} 
    xdump[1]={} xdump[2]={}
    xdump[1].address=xAPEXx[XxX] + o
    xdump[1].flags=4
        if x==0 then xdump[1].value=xfalse end
        if x==1 then xdump[1].value=xtrue end
        if x~=0 and x~=1 then xdump[1].value=x end 
    xdump[2].address=xAPEXx[XxX]+(o+4)
    xdump[2].flags=4
    xdump[2].value=xEND 
    gg.setValues(xdump) 
    end 
end 
------------------------------------------------------------------------------  
function revert()
    for XxX=1,#(xAPEXx) do 
    REVERT=nil REVERT={} xRx=nil xRx=1 
        for i, v in ipairs(ORIG) do
            if tonumber(xAPEXx[XxX]+o)==ORIG[i].address then
            REVERT[xRx]={}
            REVERT[xRx].address=xAPEXx[XxX]+o
            REVERT[xRx].flags=4
            REVERT[xRx].value=ORIG[i].value
            xRx=xRx+1
            REVERT[xRx]={}
            REVERT[xRx].address=xAPEXx[XxX]+o+4
            REVERT[xRx].flags=4
            REVERT[xRx].value=ORIG[i+1].value
            gg.setValues(REVERT) 
            break
            end
        xRx=xRx+1
        end 
    end 
end 
--███████████████████████
if v.x64 then
xtrue="h200080D2" -- MOV X0, #0x1
xfalse="h000080D2" -- MOV X0, #0x0 
xEND="hC0035FD6" -- RET
else 
xtrue="h0100A0E3" -- MOVW R0, #1 
xfalse="h0000A0E3" -- MOVW R0, #0 
xEND="h1EFF2FE1" -- BX LR 
end 
------------------------------------------------------------------------------  
if xREV==1 then
xRx=1 ORIG={} xREV={} 
    for XxX=1,#(xAPEXx) do   
        for i, v in ipairs(I) do
        ORIG[xRx]={}
        ORIG[xRx].address=xAPEXx[XxX]+tonumber(I[i])
        ORIG[xRx].flags=4 
        xRx=xRx+1 
        ORIG[xRx]={}
        ORIG[xRx].address=xAPEXx[XxX]+tonumber(I[i])+4
        ORIG[xRx].flags=4 
        xRx=xRx+1
        end    
    end 
ORIG=gg.getValues(ORIG) 
end 

--███████████████████████

function cancel()
gg.toast("CANCELLED")
end 
------------------------------------------------------------------------------  
function wait()
gg.toast("Please Wait..") 
end 
------------------------------------------------------------------------------  
function error()
gg.toast("× ERROR ×")
gg.sleep(1000)
end 
------------------------------------------------------------------------------  
function exit()
gg.getListItems()
gg.clearList()
gg.getResults(gg.getResultsCount())
gg.clearResults()
gg.toast("[ EXIT ]")  
    if xhaX~=nil then 
        print(printx) 
        print(xhaX) 
        print(printx)  
    end 
gg.setVisible(true) 
os.exit()
return
end 
--███████████████████████
while true do
    if gg.isVisible() then
        gg.setVisible(false) 
        menu() 
    else
        if apex==1 then
            gg.setVisible(false) 
            menu()
        end 
    end 
end 
