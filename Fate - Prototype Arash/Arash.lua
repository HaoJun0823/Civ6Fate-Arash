-- Arash
-- Author: HaoJun0823
-- DateCreated: 3/21/2019 1:54:14 PM
--------------------------------------------------------------
print("Arash Ability Activited!");

local AttackerRan = 1431908133;
local DefenderRan = -1632097141;
local IDRan = 1472654640;
local DamageRan = -958805242;
local StellaDamageMul:number = 5;


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
			local DamageAmount:number = UnitTable[DefenderRan][DamageRan] * StellaDamageMul;
			 --print("Stella Damage:"..DamageAmount.."\n")
			for ii, aUnit in aUnits:Members() do
				if aUnit:GetID() == AttackerUnitID then
					  --local PromotionName:string = GameInfo.Units[aUnit:GetType()].PromotionClass;
					  local Range:number = GameInfo.Units[aUnit:GetType()].Range;
					  --if checkPromotionName(PromotionName) then
					  if Range > 0 then
					    print("Stella Damage:"..DamageAmount.."\n")
						print("Stella!!!\n");
							for ii, dUnit in dUnits:Members() do
			            	if dUnit:GetID() == DefenderUnitID then
				                local remaining = (100 - dUnit:GetDamage());
									print("Defender Health:"..remaining.."\n");
									if (remaining - DamageAmount < 0) then
							     	UnitManager.Kill(dUnit, false);
									print("Stella Kill!")
									else
									dUnit:ChangeDamage(DamageAmount);
									print("Stella Give Damage!")											
									end
								UnitManager.Kill(aUnit, false);
								return
								end					
							end								
					  end
				end
				
			end


	end
	
end

Events.Combat.Add(Randerion_Arash_Ranger_Attack);

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


