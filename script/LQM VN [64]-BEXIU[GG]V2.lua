
LUA = 'LiênQuânMobile(1.52.1.5)[64]-v08'
GLabel = 'Liên Quân Mobile'
GProcess = 'com.garena.game.kgvn'
GVersion = '1.52.1.5'
xbit = 64 
LibResult = 1
xlib = 'libil2cpp.so'
xREV = 1  I={}
xCNE = 1
xSSE = 1
XbitX = 1
printx = '---------------------------------------------------------------'
print(printx)
local function fetchUrl(url)
    local response = gg.makeRequest(url).content
    return response
end
local url6 = "https://rentry.org/bexiu/raw"
local key6 = fetchUrl(url6)
xTAGx = 'BEXIU[GG]v2'
print(xTAGx)
xMOTOx = 'No Hack No Fun'
print(xMOTOx)
xLINKx = key6
print(xLINKx)
print(LUA)
print(GLabel..'  '..GVersion)
print(printx)
--███████████████████████
--███████████████████████
--███████████████████████
-- BEXIU[GG]v2
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
RP=OFF ANT=OFF MAP=OFF HP=OFF FPS=OFF QI=OFF MI=OFF

function menu() 
apex=0
gg.toast(xTAGx)  
mc=gg.multiChoice({
	RP.."Xoá rp (bật trc khi trụ nổ)", 
	ANT.."Chặn record (bắt buộc)",
	MAP.."Map On",
	HP.."Info HP, Skill",
	FPS.."60 -120FPS",
	QI.."Ra sảnh nhanh (hạng)",
	MI.."Sell, LSĐ, Ko Cấm chat, iPad...",
	"[ EXIT ]"},
    {},xTAGx.."\n"..xLINKx.."\n"..GLabel.." "..GVersion.." "..xBITx)
	
	if mc==nil then cancel() return end
	if mc[1] then rp() end
	if mc[2] then anti() end
	if mc[3] then map() end
	if mc[4] then hp() end
	if mc[5] then fps() end
	if mc[6] then nhanh() end
	if mc[7] then misc() end
xhaX={
    RP.."Xoá rp (tắt khi ra sảnh)", 
	ANT.."Chặn record (bắt buộc)",
	MAP.."Map On",
	HP.."Info HP, Skill",
	FPS.."60 -120FPS",
	QI.."Ra sảnh nhanh (hạng)",
	MI.."Sell, LSĐ, Ko Cấm chat, iPad..."
	}
xhaX=table.concat(xhaX, "\n")
xhaX=tostring(xhaX) 

	if mc[8] then exit() return end 

gg.toast("[√] Complete") 
gg.alert(GLabel.." "..GVersion.." "..xBITx.."\n\n"..xhaX,"OK",nil,xTAGx)  

end

--███████████████████████
--public class RelaySvrConnectProxy.RelaySvrConnector : BaseConnector /
--public bool SendGameMsg(CSPkg msg, bool useUdp) { } --6683
--public void PushGameMsg(CSPkg msg, bool useUdp, uint confirmMsgId) { } --6686
--public CSPkg RecvPackage() { } 6695
--private bool SendPackage(CSPkg msg, bool bUdp, out bool bPackError) { } 6692
 
--public class IApolloHelper //
--public void AddCacheReport(string eventName, Dictionary<string, string> paramDict, List<string> channelList, bool isReal) { } 2781 0x25455F8
--6 public void FlushCacheReport() { } 2784 0x25456FC

--public class ApolloDataReport : Singleton<ApolloDataReport> //
--7 public void FlushCacheReport() { } 2156 0x305901C

--public class GameReplayModule : Singleton<GameReplayModule>, IGameModule 
--public void SwitchCacheRecord() { } 0x1FCEDC4
--public class LobbyConnector : BaseConnector /
--public CSPkg RecvPackage() { } 0x21191A8

--public class NetworkModule : Singleton<NetworkModule>, INetwork, IDeskExport, ILogicProxy //
--10 public void IGameReplayModule_CacheRecord(CSPkg pkg) { } 0x21249F8
--public class RelaySvrConnectProxy.RelaySvrConnector : BaseConnector // 
-- public void CacheRecord(CSPkg msg) { } 0x2459CC8
--public bool get_isFinish() { } 0x2A16BA8

--public ulong SampleAndSendFrameSyncData(bool isFightOver) { }
--public void SendSyncData(bool isFightOver, ulong hashCode) { }


    I[1]=0x28A8C90 I[2]=0x28A8DA4 
    I[3]=0x28A9BC4 I[4]=0x28AFF7C I[5]=0x297FEA0 I[6]=0x297FFA4 
    I[7]=0x349496C I[8]=0x24263BC I[9]=0x2572074 I[10]=0x257D8C4 
    I[11]=0x28AC300 I[12]=0x2E75498 I[13]=0x000000 I[14]=0x000000 
    I[15]=0x000000 I[16]=0x000000 I[17]=0x000000 I[18]=0x000000 
    I[19]=0x000000 I[20]=0x000000 I[21]=0x000000 
    

function rp()
    if RP==OFF then
        o=I[1] x=0 arm()
        o=I[2] x=0 arm()
        o=I[3] x=0 arm()
        o=I[4] x=0 arm()
        o=I[5] x=0 arm()
        o=I[6] x=0 arm()
        o=I[7] x=0 arm()
        o=I[8] x=0 arm()
        o=I[9] x=0 arm()
        o=I[10] x=0 arm()
        o=I[11] x=0 arm()
        o=I[12] x=1 arm()
        RP=ON
    else
        for i =1,12 do
        o=I[i] revert()
        end
        RP=OFF
    end
end 


--███████████████████████

-- public class CTeamFightStatistic : BattleObjectBase 
--0x1cc85c4 public void StartRecord() { }
--0x1ccad3c public List<STTeamFightRecord> GetCampTeamFightRecordAtTime(COM_PLAYERCAMP camp, int time) { }
--0x1ccb87c public void FillReportData(uint playerId, ref COMDT_SETTLE_ACNT_TLOG_NEW_INFO dataAst) { }

--25 public List<STTeamFightRecord> GetPlayerTeamFightRecordAtTime(uint playerId, int time) { } thêm
--private List<STTeamFightRecord> GetPlayerTeamFightRecord(uint playerId) { }
--public int FillReportData(uint playerId, ref COMDT_TEAM_BATTLE_DETAIL_INFO[] dataAst) { } thêm
--28 private void AnalyticalDataRecord() { } 0x1F9BE34
--public bool IsNeedReportCompetitionData() { } 0x1F9C02C
--public bool IsChatBanLimit() { } 0x25238DC
-- public bool get_Enable() { } 0x318AD08
--bỏ


    I[22]=0x2F95300 I[23]=0x2F9747C I[24]=0x2F97C7C
    I[25]=0x2F9764C I[26]=0x2F977FC I[27]=0x2F9797C I[28]=0x23F342C 
    I[29]=0x23F3624 I[30]=0x295D184  I[31]=0x318AD08 


function anti()
x=0
    for i =22,31 do
    o=I[i] 
    if ANT==OFF then arm() else revert() end 
    end 
    if ANT==OFF then ANT=ON else ANT=OFF end 
end 

--███████████████████████
-- public class LVActorLinker : LActorComponent // public class HorizonMarker : LActorComponent // public class LSpectatorMgr.ActorVisible
-- public void CalcVisible() { }
-- private void RefreshVisible(COM_PLAYERCAMP targetCamp, int recursionCount = 10) { }
-- public void Reset(LActorRoot actor) { }

    I[44]=0x317DE90 I[45]=0x33215A0 I[46]=0x317EFD0
    I[47]=0x318BF2C I[48]=0x000000



function map()
x=0
    for i =44,46 do
        o=I[i]  
        if MAP==OFF then arm() else revert() end 
    end 
    if MAP==OFF then MAP=ON else MAP=OFF end 
end 

--███████████████████████
--public class MiniMapHeroInfo : MonoBehaviour // 
--private void ShowHeroInfo(PoolObjHandle<ActorLinker> actor, bool bShow) { }
--public void ShowHeroHpInfo(bool bShow) { }
--public void ShowSkillStateInfo(bool bShow) { }

--public void EndRecord() { } 0x2B50140
--public static bool get_IsAutoLogin() { }


    I[49]=0x2AAA78C I[50]=0x2E3AC6C I[51]=0x2E3ADA4 I[52]=0x2F95730 
    I[53]=0x2882684 I[54]=0x000000 I[55]=0x000000 I[56]=0x000000 



function hp()
x=1
    for i =49,56 do
    o=I[i] 
    if HP==OFF then arm() else revert() end 
    end 
    if HP==OFF then HP=ON else HP=OFF end 
end 

--███████████████████████

-- public class BattleController // fps
--public static bool get_Supported120FPSMode() { }
-- public static bool get_SupportedBoth60FPS_CameraHeight() { }


I[57]=0x2429688 I[58]=0x2436BE0 I[59]=0x000000 I[60]=0x000000 
I[61]=0x000000 I[62]=0x000000 I[63]=0x000000 I[64]=0x000000 

function fps()
    if FPS==OFF then
        o=I[57] x=1 arm()
        o=I[58] x=1 arm()
        o=I[59] x=1 arm()
        FPS=ON
    else
        for i =57,59 do
        o=I[i] revert()
        end
        FPS=OFF
    end
end 

--███████████████████████
--internal class CLadderSettleCtrl //
--public void ShowLadderSettleForm(COMDT_RANK_SETTLE_INFO rankInfo, bool win) { } 0x27BFB30
--private void DumpSvrData(COMDT_RANK_SETTLE_INFO rank 0x27BEE40

    I[65]=0x2BFE968 I[66]=0x2BFDC78 I[67]=0x000000
    I[68]=0x000000 I[69]=0x000000 I[70]=0x000000 

function nhanh()
x=0
    for i =65,70 do
    o=I[i] 
    if QI==OFF then arm() else revert() end 
    end 
    if QI==OFF then QI=ON else QI=OFF end 
end 

--███████████████████████

--public class CPlayerProfile
-- public bool get_IsHostProfile() { } 0x21B00F4
--fix lag
-- public static bool get_IsUseLowRes() { } 0x1FE46F
-- public static bool IsIPadDevice() { } 0x1FD16A8
--public class CItem : CUseable /
--public override bool get_IsCanSell() { } 0x27BA828
--hiện rank team địch 0x230D95C
--private bool CanPlayerShowLegendRank(Player playerData, IGameActorDataProvider dataProvider, COM_PLAYERCAMP targetCampId, bool isWarmBattle, ref ActorMeta actorMeta, out uint adCode, out uint rankNo, out EnumLegendMedalType medalType) { }
-- hiện avatar 
--public class CMatchingSystem : Singleton<CMatchingSystem>, IBackBtnListener // 
--private int checkTeamLaderGradeMax(int MapType) { } 0x203E4C0 0x230C420
--hiện tên cấm chọn
--public class HeroSelectBanPickWindow : CUIView //
--public void InitTeamHeroList(CUIListScript listScript, COM_PLAYERCAMP camp, bool isLeftList = True, bool isMidPos = False) { } 0x2671D40
--public void SetMaxCount(int maxCount) { } 0x2962AD4

I[71]=0x25E92AC
I[72]=0x243BEB4
I[73]=0x2428CA0  
I[74]=0x2BF9660
I[75]=0x276E9BC
I[76]=0x276D480
I[77]=0x2962AD4

function misc()
    if MI==OFF then
        o=I[71] x=1 arm()
        o=I[72] x=1 arm()
        o=I[73] x=1 arm()
        o=I[74] x=1 arm()
        o=I[75] x=1 arm()
        o=I[76] x=1 arm()
        o=I[77] x=1 arm()
        MI=ON
    else
        for i =71,77 do
        o=I[i] revert()
        end
        MI=OFF
    end
end 
--███████████████████████
--███████████████████████
local userTime = os.time() + 7 * 3600 -- Thêm 7 giờ để chuyển đổi sang múi giờ Bangkok
local day = tonumber(os.date("%w", userTime))
local server = ""

if day == 0 or day == 1 or day == 3 or day == 5 then
    server = "https://ithkr.pythonanywhere.com"
elseif day == 2 or day == 4 or day == 6 then
    server = "http://thkr.pythonanywhere.com"
else
    gg.alert("Invalid day of the week")
    os.exit()
end

local function fetchUrl(url) -- link lấy key
    local response = gg.makeRequest(url).content
    return response
end

local url1 = "https://rentry.org/bexiu/raw" -- link key, thay đổi linkk
local url2 = "https://rentry.org/ibexiu/raw" -- thông báo login success
local server1 = fetchUrl(url1) -- Fix typo ur1 to url1
local server2 = fetchUrl(url2) -- Fix typo ur2 to url2

c = gg.makeRequest(server .. "/mykey").content

ch = gg.prompt(
    {'Enter your key and press OK to continue'},
    {[1] = c},
    {[1] = 'text'})

if ch == nil then
    gg.alert("Please enter key and press OK")
    os.exit()
end

pass = ch[1]

if string.find(pass, "/") then
    gg.alert("Invalid Key")
    os.exit()
end

if pass == "" then
    x = gg.alert("Enter key\nGet key form here \n\n" .. server1, "Copy link")
    if x == 1 then
        gg.copyText(server1)
    end
    os.exit()
end

a = gg.makeRequest(server .. "/login/" .. pass).content

if a == "true" then
    -- Lấy key từ URL 1 và in ra màn hình
    local url3 = "https://rentry.org/isexpire2/raw"
    local key1 = fetchUrl(url3)
    if key1 then
        local year = key1:sub(1, 4)
        local month = key1:sub(5, 6)
        local day = key1:sub(7, 8)
        local formatted_key1 = year .. "/" .. month .. "/" .. day
        gg.alert(server2)
    else
        gg.alert("Unable to fetch data from URL 1.")
    end
elseif a == "false" then
    x = gg.alert("Wrong key\nGet key form here \n\n" .. server1, "Copy link")
    if x == 1 then
        gg.copyText(server1)
    end
    os.exit()
else
    gg.alert("No response from server/No internet connection")
    os.exit()
end

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
            xlibn=xlibn+1
                if libx[i].state=="Xa" then 
                    xAPEXx=gg.getRangesList(xlib)[xlibn].start
                    xLibRes=1
                    break 
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
                           xAPEXx=libx[i].start
                           print("√√ Split Apk Lib Found\n√√ "..libx[i].name) 
                           xLibRes=1                            
                           break
                        end
                    end
                end 
            end 
         
            if xLibRes~=1 then
                print("×× Correct Lib Not Found ××\n×× Direct or Slit Config ××")
                gg.setVisible(true) 
                os.exit()
                return
            end 
        end                  
    end 
--███████████████████████
--███████████████████████
--███████████████████████
--███████████████████████
function arm()
o=tonumber(o) 
xdump=nil xdump={} 
xdump[1]={} xdump[2]={}
xdump[1].address=xAPEXx + o
xdump[1].flags=4
    if x==0 then xdump[1].value=xfalse end
    if x==1 then xdump[1].value=xtrue end
    if x~=0 and x~=1 then xdump[1].value=x end 
xdump[2].address=xAPEXx+(o+4)
xdump[2].flags=4
xdump[2].value=xEND 
gg.setValues(xdump) 
end 
------------------------------------------------------------------------------  
function revert()
REVERT=nil REVERT={} xRx=nil xRx=1 
    for i, v in ipairs(ORIG) do
        if tonumber(xAPEXx+o)==ORIG[i].address then
            REVERT[xRx]={}
            REVERT[xRx].address=xAPEXx+o
            REVERT[xRx].flags=4
            REVERT[xRx].value=ORIG[i].value
            xRx=xRx+1
            REVERT[xRx]={}
            REVERT[xRx].address=xAPEXx+o+4
            REVERT[xRx].flags=4
            REVERT[xRx].value=ORIG[i+1].value
            gg.setValues(REVERT) 
            break
        end
    xRx=xRx+1
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
    for i, v in ipairs(I) do
        ORIG[xRx]={}
        ORIG[xRx].address=xAPEXx+tonumber(I[i])
        ORIG[xRx].flags=4 
        xRx=xRx+1 
        ORIG[xRx]={}
        ORIG[xRx].address=xAPEXx+tonumber(I[i])+4
        ORIG[xRx].flags=4 
        xRx=xRx+1
    end
ORIG=gg.getValues(ORIG) 
end 
--███████████████████████
function class()
gg.clearResults()
gg.setRanges(gg.REGION_OTHER | gg.REGION_C_ALLOC) 
gg.searchNumber(":"..x,1)
    if gg.getResultsCount()==0 then E=0 return end 
apexu=nil apexu=gg.getResults(1)
gg.getResults(gg.getResultsCount())
gg.refineNumber(tonumber(apexu[1].value),1)
apexu=nil apexu=gg.getResults(gg.getResultsCount())
gg.clearResults()
    for i, v in ipairs(apexu) do apexu[i].address=apexu[i].address-1 apexu[i].flags=1
    end
apexu=gg.getValues(apexu) apexa={} apexaa=1 
    for i, v in pairs(apexu) do
        if apexu[i].value==0 then
        apexa[apexaa]={} apexa[apexaa].address=apexu[i].address apexa[apexaa].flags=1 apexaa=apexaa+1
        end
    end   
if #(apexa)==0 then gg.clearResults() E=0 return end 
u=nil
    for i, v in ipairs(apexa) do apexa[i].address=apexa[i].address+#(x)+1 apexa[i].flags=1
    end  
apexa=gg.getValues(apexa) apexs=nil apexs={} apexbb=1
    for i, v in ipairs(apexa) do
        if apexa[i].value==0 then apexs[apexbb]={} apexs[apexbb].address=apexa[i].address apexs[apexbb].flags=1 apexbb=apexbb+1
        end
    end
if #(apexs)==0 then gg.clearResults() E=0 return end 
apexa=nil
    for i, v in ipairs(apexs) do apexs[i].address=apexs[i].address-#(x) apexs[i].flags=1
    end
gg.loadResults(apexs) 
gg.searchPointer(0)
if gg.getResultsCount()==0 then E=0 return end   
apexu=gg.getResults(gg.getResultsCount())
gg.clearResults() 
if gg.getTargetInfo().x64 then apexo1=48 apexo2=56 apexvt=32 else apexo1=24 apexo2=28 apexvt=4 end
ERROR=0 
::TRYAGAIN:: 
apexy=nil apexy={} apexz=nil apexz={} 
    for i, v in ipairs(apexu) do
    apexy[i]={} apexy[i].address=apexu[i].address+apexo1 apexy[i].flags=apexvt
    apexz[i]={} apexz[i].address=apexu[i].address+apexo2 apexz[i].flags=apexvt
    end 
apexy=gg.getValues(apexy) apexz=gg.getValues(apexz) apexp=nil apexp={} apexxx=1
    for i, v in ipairs(apexy) do
        if apexy[i].value==apexz[i].value and #(tostring(apexy[i].value))>=8 then
        apexp[apexxx]=apexy[i].value
        apexxx=apexxx+1
        end
    end
apexxx=nil apexy=nil apexz=nil
    if #(apexp)==0 and ERROR==0 then
        if gg.getTargetInfo().x64 then apexo1=32 apexo2=40 else apexo1=16 apexo2=20 end 
    ERROR=2 
    goto TRYAGAIN
    end    
if #(apexp)==0 and ERROR==2 then E=0 return end
gg.setRanges(gg.REGION_ANONYMOUS) 
gg.clearResults() apexxxx=1
    for i, v in ipairs(apexp) do
    gg.toast("Please Wait...") 
    gg.searchNumber(tonumber(apexp[i]),apexvt)
        if gg.getResultsCount()~=0 then
        apexxx=nil apexxx=gg.getResults(gg.getResultsCount()) gg.clearResults()
            for apexq=1,#(apexxx) do apexxx[apexq].name="BEXIU[GG]v2"
            end
        gg.addListItems(apexxx) apexxxx=apexxxx+1
        end
    gg.clearResults()
    end 
apexu=nil apexp=nil apexxx=nil apexq=nil 
if apexxxx==1 then gg.clearResults() E=0 return end
apexxxx=nil apexload={} apexremove={} apexxx=1
apexu=gg.getListItems()
    for i, v in ipairs(apexu) do
        if apexu[i].name=="BEXIU[GG]v2" then 
        apexload[apexxx]={} apexload[apexxx].address=apexu[i].address+o apexload[apexxx].flags=t
        apexremove[apexxx]={} apexremove[apexxx]=apexu[i] apexxx=apexxx+1
        end
    end 
apexload=gg.getValues(apexload) gg.loadResults(apexload) gg.removeListItems(apexremove) 
end
--███████████████████████
b=1 w=2 d=4 f=16 q=32 e=64
------------------------------------------------------------------------------  
function clear()
gg.getResults(gg.getResultsCount())
gg.clearResults()
end
------------------------------------------------------------------------------  
function get()
gg.getResults(gg.getResultsCount())
end
------------------------------------------------------------------------------  
function search()
gg.getResults(gg.getResultsCount())
gg.clearResults()
gg.searchNumber(x,t) 
end
------------------------------------------------------------------------------  
function refine()
gg.refineNumber(x,t) 
end 
------------------------------------------------------------------------------  
function refinenot()
gg.refineNumber(x,t,false,gg.SIGN_NOT_EQUAL) 
end 
------------------------------------------------------------------------------  
function edit()
gg.getResults(gg.getResultsCount())
gg.editAll(x,t) 
end 
------------------------------------------------------------------------------  
function head() 
gg.toast("Please Wait") 
header=nil 
header=gg.getResults(1)
gg.getResults(gg.getResultsCount())
gg.clearResults()
gg.searchNumber(tostring(header[1].value),t)
end 
-----------------------------------------
function heads()
gg.toast("Please Wait..") 
gg.getResults(gg.getResultsCount())
gg.clearResults()
gg.searchNumber(tostring(header[1].value),t) 
gg.getResults(gg.getResultsCount())
end 
-----------------------------------------
function headg()
gg.getResults(gg.getResultsCount())
header = gg.getResults(1)
end 
-----------------------------------------
function heade()
gg.editAll(tostring(header[1].value),t) 
end 
------------------------------------------------------------------------------  
function check()
checkCnt=nil
checkCnt=gg.getResultsCount()
    if checkCnt==0 then E=0 else E=1 end
end 
------------------------------------------------------------------------------  
function offset()
o=tonumber(o) addoff=nil 
addoff=gg.getResults(gg.getResultsCount())
    for i, v in ipairs(addoff) do
        addoff[i].address=addoff[i].address+o
        addoff[i].flags=t
    end
gg.loadResults(addoff) 
end 
------------------------------------------------------------------------------  
function freeze()
frz=nil 
frz=gg.getResults(gg.getResultsCount())
    for i, v in ipairs(frz) do 
        frz[i].freeze = true
    end
gg.addListItems(frz) 
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