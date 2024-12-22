do local Rayfield=loadstring(game:HttpGet("https://raw.githubusercontent.com/vvhoy884ugvv/hgcdghcvjh/refs/heads/main/sfvd.txt"))();

local Window=Rayfield:CreateWindow({Name="🐉霖溺至尊脚本🐉",LoadingTitle="By 霖溺",LoadingSubtitle="By 霖溺",ConfigurationSaving={Enabled=true,FolderName=nil,FileName="HydraVIP"},Discord={Enabled=true,Invite="dvdge._",RememberJoins=true},BackgroundColor=Color3.fromRGB(255,255,255),TextColor=Color3.fromRGB(0,0,0)});

Rayfield:Notify({Title="🐉霖溺至尊脚本🐉 声明",Content="谢谢你用我的脚本!",Duration=6.5,Image=448362458,Actions={Ignore={Name="确定",Callback=function() print("霖溺至尊脚本");end}}});
local AimbotTab=Window:CreateTab("🐉霖溺至尊功能🐉",448362458);local AimbotSection=AimbotTab:CreateSection("Aimbot");

AimbotTab:CreateToggle({Name="🐉子追🐉",Callback=function(value) 
_G.silentAim=value;print("Silent Aim: "   .. tostring(value) );
end
});

AimbotTab:CreateToggle({Name="🐉无限弹药🐉",Callback=function(value)
 _G.infiniteAmmo=value;print("Infinite Ammo: "   .. tostring(value) );
 end
 });
 
 AimbotTab:CreateToggle({Name="🐉无后座🐉",Callback=function(value)
  _G.noRecoil=value;print("No Recoil: "   .. tostring(value) );
  end
  });
  
  AimbotTab:CreateToggle({Name="🐉瞬击🐉",Callback=function(value)
   _G.noSpread=value;print("No Spread: "   .. tostring(value) );
   end
   });
   
AimbotTab:CreateToggle({Name="🐉超级射速🐉",Callback=function(value)
 _G.fastFire=value;print("Fast Guns: "   .. tostring(value) );
 end
 });
 
 AimbotTab:CreateToggle({Name="🐉自动枪🐉",Callback=function(value) 
 _G.autoGuns=value;print("Automatic Guns: "   .. tostring(value) );
 end
 });
 
 local weaponSystem=require(game:service("ReplicatedStorage").WeaponsSystem.Libraries.BaseWeapon);local oldFire=weaponSystem.fire;local oldGetConfigValue=weaponSystem.getConfigValue;local oldUseAmmo=weaponSystem.useAmmo;local oldGetAmmo=weaponSystem.getAmmoInWeapon;local function getClosestPlayer() local final=nil;local maxRange=math.huge;for i,player in next,game:GetService("Players"):GetPlayers() do if (player==game.Players.LocalPlayer) then continue;end if  not player.Character then continue;end local humanoid=player.Character:FindFirstChild("Humanoid");local head=player.Character:FindFirstChild("Head");if ( not head or  not humanoid) then continue;end if (humanoid.Health<=0) then continue;end local vector,visible=workspace.CurrentCamera:WorldToViewportPoint(head.Position);if  not visible then continue;end local cursorPosition=game:GetService("UserInputService"):GetMouseLocation();local screenPosition=Vector2.new(vector.X,vector.Y);local difference=math.floor((screenPosition-cursorPosition).magnitude);if (difference<maxRange) then maxRange=difference;final=head;end end return final;end weaponSystem.getAmmoInWeapon=function(self,...) local arguments={...};if _G.infiniteAmmo then return 8999999488;end return oldGetAmmo(self,unpack(arguments));end;weaponSystem.fire=function(self,...) local arguments={...};if _G.silentAim then local t=getClosestPlayer();if t then arguments[2]=(t.Position-arguments[1]).unit;arguments[3]=1;end end return oldFire(self,unpack(arguments));end;weaponSystem.getConfigValue=function(self,...) local arguments={...};if (_G.fastFire and (arguments[1]=="ShotCooldown")) then return 0.01;elseif (_G.autoGuns and (arguments[1]=="FireMode")) then return "Automatic";elseif (_G.noRecoil and ((arguments[1]=="RecoilMin") or (arguments[1]=="RecoilMax"))) then return 0;elseif (_G.noSpread and ((arguments[1]=="MinSpread") or (arguments[1]=="MaxSpread"))) then return 0;end return oldGetConfigValue(self,unpack(arguments));end;weaponSystem.useAmmo=function(self,...) local arguments={...};if _G.infiniteAmmo then if self.ammoInWeaponValue then return 1;end end return oldUseAmmo(self,unpack(arguments));end; end
