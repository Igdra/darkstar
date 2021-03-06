-----------------------------------
-- Area: Castle Oztroja (151)
--  MOB: Mee_Deggi_the_Punisher
-----------------------------------

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
    if (math.random(1,100) <= 5) then -- Hardcoded "this or this item" drop rate until implemented.
        SetDropRate(2238,14986,1000); -- Ochimusha Kote
        SetDropRate(2238,16703,0);
    else
        SetDropRate(2238,14986,0);
        SetDropRate(2238,16703,1000); -- Impact Knuckles
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    -- Set Mee_Deggi_the_Punisher's Window Open Time
    local wait = math.random(3600,10800);
    SetServerVariable("[POP]Mee_Deggi_the_Punisher", os.time(t) + wait); -- 1-3 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Mee_Deggi_the_Punisher");
    SetServerVariable("[PH]Mee_Deggi_the_Punisher", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;

