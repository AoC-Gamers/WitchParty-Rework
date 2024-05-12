#if defined _skill_detect_report_included
	#endinput
#endif
#define _skill_detect_report_included

// boomer pop
stock void HandlePop(int iAttacker, int iVictim, int sShoveCount, float fTimeAlive)
{
	Call_StartForward(g_hForwardBoomerPop);
	Call_PushCell(iAttacker);
	Call_PushCell(iVictim);
	Call_PushCell(sShoveCount);
	Call_PushFloat(fTimeAlive);
	Call_Finish();

	if (g_cvarReport.BoolValue && g_cvarRepPop.BoolValue)
		return;

	if (IsValidClientInGame(iAttacker) && IsValidClientInGame(iVictim) && !IsFakeClient(iVictim))
		CPrintToChatAll("%t %t", "Tag+", "Pop", iAttacker, iVictim);
	else if (IsValidClientInGame(iAttacker))
		CPrintToChatAll("%t %t", "Tag+", "PopBot", iAttacker);
}

// charger level
stock void HandleLevel(int iAttacker, int iVictim)
{
	Call_StartForward(g_hForwardLevel);
	Call_PushCell(iAttacker);
	Call_PushCell(iVictim);
	Call_Finish();

	if (!g_cvarReport.BoolValue || !g_cvarRepLevel.BoolValue)
		return;

	if (IsValidClientInGame(iAttacker) && IsValidClientInGame(iVictim) && !IsFakeClient(iVictim))
		CPrintToChatAll("%t %t", "Tag+++", "Level", iAttacker, iVictim);
	else if (IsValidClientInGame(iAttacker))
		CPrintToChatAll("%t %t", "Tag+++", "LevelBot", iAttacker);
}

// charger level hurt
stock void HandleLevelHurt(int iAttacker, int iVictim, int iDamage)
{
	Call_StartForward(g_hForwardLevelChip);
	Call_PushCell(iAttacker);
	Call_PushCell(iVictim);
	Call_PushCell(iDamage);
	Call_Finish();

	if (!g_cvarReport.BoolValue || !g_cvarRepchipLevel.BoolValue)
		return;

	if (IsValidClientInGame(iAttacker) && IsValidClientInGame(iVictim) && !IsFakeClient(iVictim))
		CPrintToChatAll("%t %t", "Tag+", "ChipLevel", iAttacker, iVictim, iDamage);
	else if (IsValidClientInGame(iAttacker))
		CPrintToChatAll("%t %t", "Tag+", "ChipLevelBot", iAttacker, iDamage);
}

// deadstops
stock void HandleDeadstop(int iAttacker, int iVictim)
{
	Call_StartForward(g_hForwardHunterDeadstop);
	Call_PushCell(iAttacker);
	Call_PushCell(iVictim);
	Call_Finish();

	if (!g_cvarReport.BoolValue || !g_cvarRepDeadStop.BoolValue)
		return;

	if (IsValidClientInGame(iAttacker) && IsValidClientInGame(iVictim) && !IsFakeClient(iVictim))
		CPrintToChatAll("%t %t", "Tag+", "Deadstop", iAttacker, iVictim);
	else if (IsValidClientInGame(iAttacker))
		CPrintToChatAll("%t %t", "Tag+", "DeadstopBot", iAttacker);
}

stock void HandleShove(int iAttacker, int iVictim, L4D2ZombieClassType zombieClass)
{
	Call_StartForward(g_hForwardSIShove);
	Call_PushCell(iAttacker);
	Call_PushCell(iVictim);
	Call_PushCell(zombieClass);
	Call_Finish();

	if (!g_cvarReport.BoolValue || !g_cvarRepShove.BoolValue)
		return;

	if (IsValidClientInGame(iAttacker) && IsValidClientInGame(iVictim) && !IsFakeClient(iVictim))
		CPrintToChatAll("%t %t", "Tag+", "Shov", iAttacker, iVictim);
	else if (IsValidClientInGame(iAttacker))
		CPrintToChatAll("%t %t", "Tag+", "ShovBot", iAttacker);
}

// real skeet
stock void HandleSkeet(int iAttacker, int iVictim, bool bMelee = false, bool bSniper = false, bool bGL = false)
{
	if (bSniper)
		Call_StartForward(g_hForwardSkeetSniper);
	else if (bGL)
		Call_StartForward(g_hForwardSkeetGL);

	else if (bMelee)
		Call_StartForward(g_hForwardSkeetMelee);
	else
		Call_StartForward(g_hForwardSkeet);

	Call_PushCell(iAttacker);
	Call_PushCell(iVictim);
	Call_Finish();

	if (!g_cvarReport.BoolValue || !g_cvarRepSkeet.BoolValue)
		return;

	if (iAttacker == -2)
	{
		// team skeet sets to -2
		if (IsValidClientInGame(iVictim) && !IsFakeClient(iVictim))
			CPrintToChatAll("%t %t", "Tag+", "TeamSkeet", iVictim);
		else
			CPrintToChatAll("%t %t", "Tag+", "TeamSkeetBot");
	}
	else if (IsValidClientInGame(iAttacker) && IsValidClientInGame(iVictim) && !IsFakeClient(iVictim))
		CPrintToChatAll("%t %t", "Tag++", "Skeet", iAttacker, (bMelee) ? Melee() : ((bSniper) ? Headshot() : ((bGL) ? Grenade() : "")), iVictim);
	else if (IsValidClientInGame(iAttacker))
		CPrintToChatAll("%t %t", "Tag+", "SkeetBot", iAttacker, (bMelee) ? Melee() : ((bSniper) ? Headshot() : ((bGL) ? Grenade() : "")));
}

// Chip Skeet, NOTE: bSniper not set yet, do this
stock void HandleChipSkeet(int iAttacker, int iVictim, int iDamage, bool bOverKill = false, bool bMelee = false, bool bSniper = false)
{
	if (bSniper)
		Call_StartForward(g_hForwardSkeetSniperChip);
	else if (bMelee)
		Call_StartForward(g_hForwardSkeetMeleeChip);
	else
		Call_StartForward(g_hForwardSkeetHurt);
	
	Call_PushCell(iAttacker);
	Call_PushCell(iVictim);
	Call_PushCell(iDamage);
	Call_PushCell(bOverKill);
	Call_Finish();

	if (!g_cvarReport.BoolValue || !g_cvarRepChipSkeet.BoolValue)
		return;

	char sBuffer[64];
	Format(sBuffer, sizeof(sBuffer), "%t", "Unchipped");

	if(g_cvarRepChipSkeet.IntValue == 2)
	{
		if (IsValidClientInGame(iVictim))
			CPrintToChatAll("%t %t", "Tag++", "Skeet", iAttacker, "", iVictim);
		else
			CPrintToChatAll("%t %t", "Tag+", "SkeetBot", iAttacker, "");
	}
	else
	{
		if (IsValidClientInGame(iVictim))
			CPrintToChatAll("%t %t", "Tag+", "ChipSkeet", iVictim, iDamage, (bOverKill) ? sBuffer : "");
		else
			CPrintToChatAll("%t %t", "Tag+", "ChipSkeetBot", iDamage, (bOverKill) ? sBuffer : "");
	}
}

// Crown Witch
void HandleCrown(int iAttacker, int iDamage)
{
	Call_StartForward(g_hForwardCrown);
	Call_PushCell(iAttacker);
	Call_PushCell(iDamage);
	Call_Finish();

	if (!g_cvarReport.BoolValue || !g_cvarRepCrow.BoolValue)
		return;

	if (IsValidClientInGame(iAttacker))
		CPrintToChatAll("%t %t", "Tag++", "CrownWitch", iAttacker, iDamage);
	else
		CPrintToChatAll("%t %t", "Tag++", "CrownWitch2");
}

void HandleChipCrown(int iAttacker, int iDamage, int iChipDamage)
{
	Call_StartForward(g_hForwardCrownChip);
	Call_PushCell(iAttacker);
	Call_PushCell(iDamage);
	Call_PushCell(iChipDamage);
	Call_Finish();

	if (!g_cvarReport.BoolValue || !g_cvarRepChipCrow.BoolValue)
		return;

	if (IsValidClientInGame(iAttacker))
		CPrintToChatAll("%t %t", "Tag++", "ChipCrown", iAttacker, iDamage, iChipDamage);
	else
		CPrintToChatAll("%t %t", "Tag++", "ChipCrown2", iDamage, iChipDamage);
}

// smoker clears
void HandleTongueCut(int iAttacker, int iVictim)
{
	Call_StartForward(g_hForwardTongueCut);
	Call_PushCell(iAttacker);
	Call_PushCell(iVictim);
	Call_Finish();

	if (!g_cvarReport.BoolValue || !g_cvarRepTongueCut.BoolValue)
		return;

	if (IsValidClientInGame(iAttacker) && IsValidClientInGame(iVictim) && !IsFakeClient(iVictim))
		CPrintToChatAll("%t %t", "Tag+++", "CutTongue", iAttacker, iVictim);
	else if (IsValidClientInGame(iAttacker))
		CPrintToChatAll("%t %t", "Tag+++", "CutTongueBot", iAttacker);
}

void HandleSmokerSelfClear(int iAttacker, int iVictim, bool bWithShove = false)
{
	if (IsValidClientInGame(iAttacker))
	{
		PrintDebug("SmokerSelfClear: invalid attacker: %i(%s)", iAttacker, IsValidClientInGame(iAttacker) ? "true" : "false");
		return;
	}

	Call_StartForward(g_hForwardSmokerSelfClear);
	Call_PushCell(iAttacker);
	Call_PushCell(iVictim);
	Call_PushCell(bWithShove);
	Call_Finish();

	if (!g_cvarReport.BoolValue || !g_cvarRepSelfClear.BoolValue)
		return;

	if (bWithShove && !g_cvarRepSelfClearShove.BoolValue)
		return;

	char buffer[64] = "";
	if (bWithShove)
		Format(buffer, sizeof(buffer), "%t", "Shoving");

	if (IsValidClientInGame(iVictim) && !IsFakeClient(iVictim))
		CPrintToChatAll("%t %t", "Tag++", "SelfClearedTongue", iAttacker, iVictim, buffer);
	else
		CPrintToChatAll("%t %t", "Tag++", "SelfClearedTongueBot", iAttacker, buffer);
}

void HandleRockEaten(int iAttacker, int iVictim)
{
	if (!IsValidClientInGame(iAttacker))
	{
		PrintDebug("RockEaten: invalid attacker: %i(%s)", iAttacker, IsValidClientInGame(iAttacker) ? "true" : "false");
		return;
	}

	Call_StartForward(g_hForwardRockEaten);
	Call_PushCell(iAttacker);
	Call_PushCell(iVictim);
	Call_Finish();

	if (!g_cvarReport.BoolValue || !g_cvarRockEaten.BoolValue)
		return;

	if (g_cvarRepRockName.BoolValue && IsValidClientInGame(iVictim) && !IsFakeClient(iVictim))
		CPrintToChatAll("%t %t", "Tag+", "EatenRock", iAttacker, iVictim);
	else
		CPrintToChatAll("%t %t", "Tag+", "EatenRockBot", iAttacker);
}

void HandleRockSkeeted(int iAttacker, int iVictim)
{
	if (!IsValidClientInGame(iAttacker))
	{
		PrintDebug("RockSkeeted: invalid attacker: %i(%s)", iAttacker, IsValidClientInGame(iAttacker) ? "true" : "false");
		return;
	}

	Call_StartForward(g_hForwardRockSkeet);
	Call_PushCell(iAttacker);
	Call_PushCell(iVictim);
	Call_Finish();

	if (!g_cvarReport.BoolValue || !g_cvarRepRockSkeet.BoolValue)
		return;

	if (g_cvarRepRockName.BoolValue && IsValidClientInGame(iVictim) && !IsFakeClient(iVictim))
		CPrintToChatAll("%t %t", "Tag+", "SkeetedRock", iAttacker, iVictim);
	else
		CPrintToChatAll("%t %t", "Tag+", "SkeetedRockBot", iAttacker);
}

// highpounces
stock void HandleHunterDP(int iAttacker, int iVictim, int iActualDamage, float fCalculatedDamage, float fHeight, bool bPlayerIncapped = false)
{
	if (!IsValidClientInGame(iAttacker) || !IsValidClientInGame(iVictim))
	{
		PrintDebug("HunterDP: invalid attacker/victim: %i(%s) / %i(%s)", iAttacker, IsValidClientInGame(iAttacker) ? "true" : "false", iVictim, IsValidClientInGame(iVictim) ? "true" : "false");
		return;
	}

	Call_StartForward(g_hForwardHunterDP);
	Call_PushCell(iAttacker);
	Call_PushCell(iVictim);
	Call_PushCell(iActualDamage);
	Call_PushFloat(fCalculatedDamage);
	Call_PushFloat(fHeight);
	Call_PushCell((fHeight >= g_cvarHunterDPThresh.FloatValue) ? 1 : 0);
	Call_PushCell((bPlayerIncapped) ? 1 : 0);
	Call_Finish();

	if (!g_cvarReport.BoolValue || !g_cvarRepHunterDP.BoolValue)
		return;

	if (fHeight < g_cvarHunterDPThresh.FloatValue || bPlayerIncapped)
		return;

	if (!IsFakeClient(iAttacker))
		CPrintToChatAll("%t %t", "Tag++", "HunterHP", iAttacker, iVictim, RoundFloat(fCalculatedDamage), RoundFloat(fHeight));
	else
		CPrintToChatAll("%t %t", "Tag++", "HunterHPBot", iVictim, RoundFloat(fCalculatedDamage), RoundFloat(fHeight));
}

stock void HandleJockeyDP(int iAttacker, int iVictim, float fHeight)
{
	if (!IsValidClientInGame(iVictim))
	{
		PrintDebug("JockeyDP: invalid attacker: %i(%s)", iVictim, IsValidClientInGame(iVictim) ? "true" : "false");
		return;
	}

	Call_StartForward(g_hForwardJockeyDP);
	Call_PushCell(iVictim);
	Call_PushCell(iAttacker);
	Call_PushFloat(fHeight);
	Call_PushCell((fHeight >= g_cvarJockeyDPThresh.FloatValue) ? 1 : 0);
	Call_Finish();

	if (!g_cvarReport.BoolValue || !g_cvarRepJockeyDP.BoolValue)
		return;

	if (fHeight < g_cvarJockeyDPThresh.FloatValue)
		return;

	if (IsValidClientInGame(iAttacker) && !IsFakeClient(iAttacker))
		CPrintToChatAll("%t %t", "Tag+++", "JockeyHP", iAttacker, iVictim, RoundFloat(fHeight));
	else
		CPrintToChatAll("%t %t", "Tag+++", "JockeyHPBot", iVictim, RoundFloat(fHeight));
}

// deathcharges
stock void HandleDeathCharge(int iAttacker, int iVictim, float fHeight, float fDistance, bool bCarried = true)
{
	if (!IsValidClientInGame(iVictim))
	{
		PrintDebug("DeathCharge: invalid attacker: %i(%s)", iVictim, IsValidClientInGame(iVictim) ? "true" : "false");
		return;
	}

	Call_StartForward(g_hForwardDeathCharge);
	Call_PushCell(iAttacker);
	Call_PushCell(iVictim);
	Call_PushFloat(fHeight);
	Call_PushFloat(fDistance);
	Call_PushCell((bCarried) ? 1 : 0);
	Call_Finish();

	if (!g_cvarReport.BoolValue || !g_cvarRepDeathCharge.BoolValue)
		return;

	if (fHeight < g_cvarDeathChargeHeight.FloatValue)
		return;

	char Buffer[64];
	Format(Buffer, sizeof(Buffer), "%t", "Bowling");

	if (IsValidClientInGame(iAttacker) && !IsFakeClient(iAttacker))
		CPrintToChatAll("%t %t", "Tag++++", "DeathCharged", iAttacker, iVictim, (bCarried) ? "" : Buffer, RoundFloat(fHeight));
	else
		CPrintToChatAll("%t %t", "Tag++++", "DeathChargedBot", iVictim, (bCarried) ? "" : Buffer, RoundFloat(fHeight));
}

// SI clears    (cleartimeA = pummel/pounce/ride/choke, cleartimeB = tongue drag, charger carry)
stock void HandleClear(int iAttacker, int iVictim, int iPinVictim, L4D2ZombieClassType ZombieClass, float fClearTimeA, float fClearTimeB, bool bWithShove = false)
{
	Call_StartForward(g_hForwardClear);
	Call_PushCell(iAttacker);
	Call_PushCell(iVictim);
	Call_PushCell(iPinVictim);
	Call_PushCell(ZombieClass);
	Call_PushFloat(fClearTimeA);
	Call_PushFloat(fClearTimeB);
	Call_PushCell((bWithShove) ? 1 : 0);
	Call_Finish();

	if (!IsValidClientInGame(iAttacker))
	{
		PrintDebug("Clear: invalid attacker: %i(%s)", iAttacker, IsValidClientInGame(iAttacker) ? "true" : "false");
		return;
	}

	// Early return attacker is the same as pin victim
	if (iAttacker == iPinVictim)
	{
		PrintDebug("Clear: attacker is the same as pin victim: %i", iAttacker);
		return;
	}

	if (!g_cvarReport.BoolValue || !g_cvarRepInstanClear.BoolValue)
		return;

	// sanity check:
	if (fClearTimeA < 0 && fClearTimeA != -1.0)
		fClearTimeA = 0.0;

	if (fClearTimeB < 0 && fClearTimeB != -1.0)
		fClearTimeB = 0.0;

	PrintDebug("Clear: %i freed %i from %i: time: %.2f / %.2f -- class: %s (with shove? %i)", iAttacker, iPinVictim, iVictim, fClearTimeA, fClearTimeB, L4D2ZombieClassname[ZombieClass - view_as<L4D2ZombieClassType>(1)], bWithShove);

	// Determine the relevant clear time based on zombie class
	float fClearTime = (ZombieClass == L4D2ZombieClass_Charger || ZombieClass == L4D2ZombieClass_Smoker) ? fClearTimeB : fClearTimeA;

	// Check if the clear time meets the minimum threshold for reporting
	if (fClearTime == -1.0 || fClearTime > g_cvarInstaTime.FloatValue)
	{
		PrintDebug("Clear: clear time %.2f is less than %.2f", fClearTime, g_cvarInstaTime.FloatValue);
		return;
	}

	if (IsValidClientInGame(iVictim) && !IsFakeClient(iVictim))
	{
		if (IsValidClientInGame(iPinVictim))
			CPrintToChatAll("%t %t", "Tag+", "SIClear", iAttacker, iPinVictim, iVictim, L4D2ZombieClassname[ZombieClass - view_as<L4D2ZombieClassType>(1)], fClearTime);
		else
			CPrintToChatAll("%t %t", "Tag+", "SIClearTeammate", iAttacker, iVictim, L4D2ZombieClassname[ZombieClass - view_as<L4D2ZombieClassType>(1)], fClearTime);
	}
	else
	{
		if (IsValidClientInGame(iPinVictim))
			CPrintToChatAll("%t %t", "Tag+", "SIClearBot", iAttacker, iPinVictim, L4D2ZombieClassname[ZombieClass - view_as<L4D2ZombieClassType>(1)], fClearTime);
		else
			CPrintToChatAll("%t %t", "Tag+", "SIClearTeammateBot", iAttacker, L4D2ZombieClassname[ZombieClass - view_as<L4D2ZombieClassType>(1)], fClearTime);
	}
}

// booms
stock void HandleVomitLanded(int iAttacker, int iBoomCount)
{
	Call_StartForward(g_hForwardVomitLanded);
	Call_PushCell(iAttacker);
	Call_PushCell(iBoomCount);
	Call_Finish();

	if (!g_cvarReport.BoolValue || !g_cvarRepVomitLanded.BoolValue)
		return;

	if (g_cvarRepVomitLanded.IntValue >= iBoomCount)
		return;

	CPrintToChatAll("%t %t", "Tag++++", "VomitLanded", iAttacker, iBoomCount);
}

// bhaps
stock void HandleBHopStreak(int iSurvivor, int iStreak, float fMaxVelocity)
{
	Call_StartForward(g_hForwardBHopStreak);
	Call_PushCell(iSurvivor);
	Call_PushCell(iStreak);
	Call_PushFloat(fMaxVelocity);
	Call_Finish();

	if (!g_cvarReport.BoolValue || !g_cvarRepBhopStreak.BoolValue)
		return;

	if (!IsValidClientInGame(iSurvivor) || IsFakeClient(iSurvivor))
		return;

	if (iStreak >= g_cvarBHopMinStreak.IntValue)
		CPrintToChat(iSurvivor, "%t %t", "Tag+", "BunnyHop", iStreak, (iStreak > 1) ? PluralCount() : "", fMaxVelocity);
}

// car alarms
stock void HandleCarAlarmTriggered(int iSurvivor, int Infected, CarAlarmTriggerReason Reason)
{
	Call_StartForward(g_hForwardAlarmTriggered);
	Call_PushCell(iSurvivor);
	Call_PushCell(Infected);
	Call_PushCell(Reason);
	Call_Finish();

	// Early exit if reporting is disabled, or if survivor is invalid or fake
	if (!g_cvarRepCarAlarm.BoolValue || !IsValidClientInGame(iSurvivor) || IsFakeClient(iSurvivor))
	{
		return;
	}

	// Handle each reason separately with minimal nesting
	switch (Reason)
	{
		case CarAlarmTrigger_Hit:
		{
			CPrintToChatAll("%t %t", "Tag+", "CalarmHit", iSurvivor);
		}
		case CarAlarmTrigger_Touched:
		{
			if (IsValidInfected(Infected))
			{
				if (!IsFakeClient(Infected))
					CPrintToChatAll("%t %t", "Tag+", "CalarmTouched", Infected, iSurvivor);
				else
				{
					L4D2ZombieClassType ZombieClass = L4D2_GetPlayerZombieClass(Infected);
					switch (ZombieClass)
					{
						case L4D2ZombieClass_Smoker: CPrintToChatAll("%t %t", "Tag+", "CalarmTouchedSmoker", iSurvivor);
						case L4D2ZombieClass_Jockey: CPrintToChatAll("%t %t", "Tag+", "CalarmTouchedJockey", iSurvivor);
						case L4D2ZombieClass_Charger: CPrintToChatAll("%t %t", "Tag+", "CalarmTouchedCharger", iSurvivor);
						default: CPrintToChatAll("%t %t", "Tag+", "CalarmTouchedInfected", iSurvivor);
					}
				}
			}
			else
				CPrintToChatAll("%t %t", "Tag+", "CalarmTouchedBot", iSurvivor);
		}
		case CarAlarmTrigger_Explosion:
		{
			CPrintToChatAll("%t %t", "Tag+", "CalarmExplosion", iSurvivor);
		}
		case CarAlarmTrigger_Boomer:
		{
			if (IsValidInfected(Infected) && !IsFakeClient(Infected))
				CPrintToChatAll("%t %t", "Tag+", "CalarmBoomer", iSurvivor, Infected);
			else
				CPrintToChatAll("%t %t", "Tag+", "CalarmBoomerBot", iSurvivor);
		}
		default:
		{
			CPrintToChatAll("%t %t", "Tag+", "Calarm", iSurvivor);
		}
	}
}

char[] Melee()
{
	char sBuffer[32];
	Format(sBuffer, sizeof(sBuffer), "%t", "Melee");
	return sBuffer;
}

char[] Headshot()
{
	char sBuffer[32];
	Format(sBuffer, sizeof(sBuffer), "%t", "HeadShot");
	return sBuffer;
}

char[] Grenade()
{
	char sBuffer[32];
	Format(sBuffer, sizeof(sBuffer), "%t", "Grenade");
	return sBuffer;
}

char[] PluralCount()
{
	char sBuffer[32];
	Format(sBuffer, sizeof(sBuffer), "%t", "PluralCount");
	return sBuffer;
}
