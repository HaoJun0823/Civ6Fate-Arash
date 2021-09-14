-- Arash
-- Author: HaoJun0823
-- DateCreated: 3/21/2019 1:54:14 PM
--------------------------------------------------------------
print("Arash Ability UI Audio Activited!");

local AttackerRan = 1431908133;
local DefenderRan = -1632097141;
local IDRan = 1472654640;
local DamageRan = -958805242;
--local StellaDamageMul = 5


function Randerion_Arash_Ranger_Attack(UnitTable)
	
	local AttackerPlayerID = UnitTable[AttackerRan][IDRan]["player"];
    local DefenderPlayerID = UnitTable[DefenderRan][IDRan]["player"];
	
	local AttackerUnitID = UnitTable[AttackerRan][IDRan]["id"];
	local DefenderUnitID = UnitTable[DefenderRan][IDRan]["id"];

	--print("Attacker:"..AttackerPlayerID);
	--print("Defender:"..DefenderPlayerID);
	local aPlayerConfig = PlayerConfigurations[AttackerPlayerID];
	local dPlayerConfig = PlayerConfigurations[DefenderPlayerID];
	if checkLeader(aPlayerConfig:GetLeaderTypeName()) then
		    local PlayerDefender = Players[DefenderPlayerID];
			local dUnits = PlayerDefender:GetUnits();
			local PlayerAttacker = Players[AttackerPlayerID];
			local aUnits = PlayerAttacker:GetUnits();
			--local DamageAmount = UnitTable[AttackerRan][DamageRan] * StellaDamageMul;
			for ii, aUnit in aUnits:Members() do
				if aUnit:GetID() == AttackerUnitID then
					  --local PromotionName:string = GameInfo.Units[aUnit:GetType()].PromotionClass;
					  local Range:number = GameInfo.Units[aUnit:GetType()].Range;
					  --if checkPromotionName(PromotionName) then
					  if Range > 0 then
						print("Speak:Stella!!!\n");
							for ii, dUnit in dUnits:Members() do
			            	if dUnit:GetID() == DefenderUnitID then
								playStella(AttackerPlayerID,DefenderPlayerID)
				                --local remaining = (100 - dUnit:GetDamage());
									--if (remaining <= DamageAmount) then
							     	--UnitManager.Kill(dUnit, false);
									--else
									--dUnit:ChangeDamage(DamageAmount);											
									--end
								--UnitManager.Kill(aUnit, false);
								return
								end					
							end								
					  end
				end
				
			end


	end
	
end

Events.Combat.Add(Randerion_Arash_Ranger_Attack);

function playStella(AttackerPlayerID,DefenderPlayerID)

	--local aPlayerConfig = PlayerConfigurations[AttackerPlayerID];
	--local dPlayerConfig = PlayerConfigurations[DefenderPlayerID];
	local localPlayerID:number = Game.GetLocalPlayer();
	if AttackerPlayerID == localPlayerID or DefenderPlayerID == localPlayerID then
		UI.PlaySound("Play_Leader_Arash_Stella")
	end

end

function checkPromotionName(str)

	  if str == "PROMOTION_CLASS_RANGED" or str == "PROMOTION_CLASS_NAVAL_RANGED" then
	  return true
	  else
	  return false
	  end

end


function checkLeader(str)

	  if str == "LEADER_FATE_ARCHER_ARASH" then
	  return true
	  else
	  return false
	  end

end