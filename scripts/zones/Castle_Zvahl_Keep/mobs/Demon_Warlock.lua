-----------------------------------
-- Area: Castle Zvahl Keep (162)
--  MOB: Demon_Warlock
-----------------------------------

require("scripts/zones/Castle_Zvahl_Keep/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    local mobID = mob:getID();
    if (Viscount_Morax_PH[mobID] ~= nil) then

        local ToD = GetServerVariable("[POP]Viscount_Morax");
        if (ToD <= os.time() and GetMobAction(Viscount_Morax) == 0) then
            if (math.random(1,10) == 5) then
                UpdateNMSpawnPoint(Viscount_Morax);
                GetMobByID(Viscount_Morax):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Viscount_Morax", mobID);
                DisallowRespawn(mobID, true);
            end
        end
    end

end;

