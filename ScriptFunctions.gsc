GodModeToggle( player)
{
	if( isDefined( player ) )
		self = player;
	result = self Toggle( "GodModeToggle" );
	if( result )
	{
		self EnableInvulnerability();
	}
	else
	{
		self DisableInvulnerability();
	}
	return result;
}

AmmoToggle( player )
{
	if( isDefined( player ) )
		self = player;
	result = self Toggle( "AmmoToggle" );
	if( result )
		self thread AmmoLoop();
	return result;
}

AmmoLoop()
{
	while( GetCBool("AmmoToggle") )
	{
		weapon = self getcurrentweapon();
		if(weapon != "none")
		{
			self setWeaponAmmoClip(weapon, weaponClipSize(weapon));
			self giveMaxAmmo(weapon);
		}
		if(self getCurrentOffHand() != "none")
			self giveMaxAmmo(self getCurrentOffHand());
		self waittill_any("weapon_fired", "grenade_fire", "missile_fire");
	}
}

SetSelfSpeed( value )
{
	self setMoveSpeedScale( value );
}

AimbotSwitch( value )
{
	if( value == "OFF" )
	{
		self notify("AimbotSwitch");
		return;
	}
	if( value == "UNFAIR" || value == "FAIR" )
	{
		self thread Aimbot( value );
	}
}

Aimbot( value )
{
	self notify("AimbotSwitch");
	self endon("AimbotSwitch");
	aimat = undefined;
	while( 1 )
	{
		while( self adsButtonPressed() )
		{
			aimAt = undefined;
			foreach(player in level.players)
			{
				if((player == self) || (!isAlive(player)) || (level.teamBased && self.pers["team"] == player.pers["team"]))
					continue;
				if(isDefined(aimAt))
				{
					if(closer(self getTagOrigin("j_head"), player getTagOrigin("j_head"), aimAt getTagOrigin("j_head")))
						aimAt = player;
				}
				else aimAt = player; 
			}
			if(isDefined(aimAt)) 
			{
				self setplayerangles(VectorToAngles((aimAt getTagOrigin("j_head")) - (self getTagOrigin("j_head")))); 
				if( value == "UNFAIR" )
				{
					if(self attackbuttonpressed())
						aimAt thread [[level.callbackPlayerDamage]]( self, self, 100, 0, "MOD_HEAD_SHOT", self getCurrentWeapon(), (0,0,0), (0,0,0), "head", 0, 0 );
				}
			}
			wait .05;
		}
		wait 0.1;
	}
}


LocalSoundPlayer( sound )
{
	self PlayLocalSound(sound);
}


