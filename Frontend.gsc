///Functions:
///			CreateMain( title )																								--This is the main menu
///			AddOption( "Title", ::Function, arg1, arg2, arg3, arg4, arg5 );													--This is to add a option to the menu
///			AddPlayerOption("Title", ::Function, arg1, arg2, arg3, arg4);													--This is to add a player option to the menu. The player will call the function instead of you!
///			AddSliderInt( "Title", defaultValue, minvalue, maxvalue, Increment, ::Onchanged, arg2, arg3, arg4, arg5);		--This is to add a slider to your menu. OnChanged is passed the new value in parameter 1 (Example: OnChanged( newvalue, other params... ) )
///			AddSliderBool("Title", ::OnChanged, arg1, arg2, arg3, arg4, arg5 );												--This is to add a slider to your menu. OnChanged must return true or false!
///			AddSliderList("Title", strings[], ::OnChanged, arg2, arg3, arg4, arg5 );										--This is to add a slider to your menu. OnChanged is passed the new string as parameter 1
///			SetCVar("Variable");																							--This is to set a variable in your menu
///			GetCVar("Variable");																							--This is to get a variable's value from your menu
///			GetCBool("Variable");																							--This will get a boolean variable from your variable list
///			Toggle("Variable");																								--This will toggle a variable in your menu and return the result
///			AddSubMenu( "Title", AccessLevel );																				--This is to add a submenu
///			EndSubMenu(); 																									--This is to close off the current submenu. You must call this each time you exit a sub menu
///			AddPlayersMenu( title, access )																					--This is a special function to add a players menu to your menu
///			AddPlayerSliderInt( "Title", defaultValue, minvalue, maxvalue, Increment, ::Onchanged, arg2, arg3, arg4, arg5);	--This is to add a slider to your menu. OnChanged is passed the new value in parameter 2 (Example: OnChanged( player, newvalue, other params... ) )
///			AddPlayerSliderBool("Title", ::OnChanged, arg1, arg2, arg3, arg4, arg5 );										--This is to add a slider to your menu. OnChanged must return true or false!
///			AddPlayerSliderList("Title", strings[], ::OnChanged, arg2, arg3, arg4, arg5 );									--This is to add a slider to your menu. OnChanged is passed the new string as parameter 2
///			EndPlayersMenu();																								--This is a special function to end your players menu
///
///			Note: Pages are automatically added for you. No need to worry about scroll.	
///			Note: Do not use any sliders in the main menu. They will not load properly.
///			Warning: Do not reference level.Evanescence.options or level.Evanescence. You will freeze. Use the provided functions instead.
MakeOptions()
{
	CreateMain( "MAIN MENU" );
		AddSubMenu( "PERSONAL MENU", 1 );
			AddSliderBool("GODMODE", ::GodModeToggle);
			AddSliderBool("INFINITE AMMO", ::AmmoToggle);
			AddSliderList("AIMBOT", strtok("OFF,FAIR,UNFAIR",","), ::AimbotSwitch);
			AddSliderInt( "SPEED SCALE", 1, 0, undefined, 1, ::SetSelfSpeed);
			AddSubMenu( "SETTINGS", 1 );
				AddSliderBool("FREEZE IN MENU", ::PersonalizeFreeze);
				AddSubMenu( "TITLE COLOR", 1 );
					AddOption("LOAD SETTINGS", ::LoadPreferenceSliderInfo, "TITLE COLOR");
					AddSliderInt( "RED VALUE", 255, 0, 255, 5, ::PersonalizeMenu, "TITLE COLOR","RED VALUE");
					AddSliderInt( "GREEN VALUE", 255, 0, 255, 5, ::PersonalizeMenu, "TITLE COLOR","GREEN VALUE");
					AddSliderInt( "BLUE VALUE", 255, 0, 255, 5, ::PersonalizeMenu, "TITLE COLOR","BLUE VALUE");
				EndSubMenu();
				AddSubMenu( "BACKGROUND COLOR", 1 );
					AddOption("LOAD SETTINGS", ::LoadPreferenceSliderInfo, "BACKGROUND COLOR");
					AddSliderInt( "RED VALUE", 0, 0, 255, 5, ::PersonalizeMenu, "BACKGROUND COLOR","RED VALUE");
					AddSliderInt( "GREEN VALUE", 0, 0, 255, 5, ::PersonalizeMenu, "BACKGROUND COLOR","GREEN VALUE");
					AddSliderInt( "BLUE VALUE", 0, 0, 255, 5, ::PersonalizeMenu, "BACKGROUND COLOR","BLUE VALUE");
				EndSubMenu();
				AddSubMenu( "TEXT COLOR", 1 );
					AddOption("LOAD SETTINGS", ::LoadPreferenceSliderInfo, "TEXT COLOR");
					AddSliderInt( "RED VALUE", 255, 0, 255, 5, ::PersonalizeMenu, "TEXT COLOR","RED VALUE");
					AddSliderInt( "GREEN VALUE", 255, 0, 255, 5, ::PersonalizeMenu, "TEXT COLOR","GREEN VALUE");
					AddSliderInt( "BLUE VALUE", 255, 0, 255, 5, ::PersonalizeMenu, "TEXT COLOR","BLUE VALUE");
				EndSubMenu();
				AddSubMenu( "HIGHLIGHT COLOR", 1 );
					AddOption("LOAD SETTINGS", ::LoadPreferenceSliderInfo, "HIGHLIGHT COLOR");
					AddSliderInt( "RED VALUE", 255, 0, 255, 5, ::PersonalizeMenu, "HIGHLIGHT COLOR","RED VALUE");
					AddSliderInt( "GREEN VALUE", 128, 0, 255, 5, ::PersonalizeMenu, "HIGHLIGHT COLOR","GREEN VALUE");
					AddSliderInt( "BLUE VALUE", 0, 0, 255, 5, ::PersonalizeMenu, "HIGHLIGHT COLOR","BLUE VALUE");
				EndSubMenu();
				AddControlsMenu( "CONTROLS", 1 );
					AddOption("LOAD SETTINGS", ::LoadPreferenceSliderInfo, "CONTROLS");
					AddSliderList("SCROLL UP", strtok("[{+actionslot 1}],[{+actionslot 2}],[{+actionslot 3}],[{+actionslot 4}],[{+gostand}],[{+melee}],[{+attack}],[{+speed_throw}],[{+smoke}],[{+frag}],[{+usereload}],[{+weapnext_inventory}],[{+stance}]",","), ::PersonalizeMenu, "CONTROLS", 0);
					AddSliderList("SCROLL DOWN", strtok("[{+actionslot 2}],[{+actionslot 3}],[{+actionslot 4}],[{+gostand}],[{+melee}],[{+attack}],[{+speed_throw}],[{+smoke}],[{+frag}],[{+usereload}],[{+weapnext_inventory}],[{+stance}],[{+actionslot 1}]",","), ::PersonalizeMenu, "CONTROLS", 1);
					AddSliderList("SLIDER LEFT", strtok("[{+actionslot 3}],[{+actionslot 4}],[{+gostand}],[{+melee}],[{+attack}],[{+speed_throw}],[{+smoke}],[{+frag}],[{+usereload}],[{+weapnext_inventory}],[{+stance}],[{+actionslot 1}],[{+actionslot 2}]",","), ::PersonalizeMenu, "CONTROLS", 2);
					AddSliderList("SLIDER RIGHT", strtok("[{+actionslot 4}],[{+gostand}],[{+melee}],[{+attack}],[{+speed_throw}],[{+smoke}],[{+frag}],[{+usereload}],[{+weapnext_inventory}],[{+stance}],,[{+actionslot 1}],[{+actionslot 2}],[{+actionslot 3}]",","), ::PersonalizeMenu, "CONTROLS", 3);
					AddSliderList("SELECT", strtok("[{+gostand}],[{+melee}],[{+attack}],[{+speed_throw}],[{+smoke}],[{+frag}],[{+usereload}],[{+weapnext_inventory}],[{+stance}],[{+actionslot 1}],[{+actionslot 2}],[{+actionslot 3}],[{+actionslot 4}]",","), ::PersonalizeMenu, "CONTROLS", 4);
					AddSliderList("BACK", strtok("[{+melee}],[{+attack}],[{+speed_throw}],[{+smoke}],[{+frag}],[{+usereload}],[{+weapnext_inventory}],[{+stance}],[{+actionslot 1}],[{+actionslot 2}],[{+actionslot 3}],[{+actionslot 4}],[{+gostand}]",","), ::PersonalizeMenu, "CONTROLS", 5);
					AddSliderList("PAGE RIGHT", strtok("[{+attack}],[{+speed_throw}],[{+smoke}],[{+frag}],[{+usereload}],[{+weapnext_inventory}],[{+stance}],[{+actionslot 1}],[{+actionslot 2}],[{+actionslot 3}],[{+actionslot 4}],[{+gostand}],[{+melee}]",","), ::PersonalizeMenu, "CONTROLS", 6);
					AddSliderList("PAGE LEFT", strtok("[{+speed_throw}],[{+smoke}],[{+frag}],[{+usereload}],[{+weapnext_inventory}],[{+stance}],[{+actionslot 1}],[{+actionslot 2}],[{+actionslot 3}],[{+actionslot 4}],[{+gostand}],[{+melee}],[{+attack}]",","), ::PersonalizeMenu, "CONTROLS", 7);	
				EndSubMenu();
			EndSubMenu();
			AddSliderBool("TEST 1", ::GodModeToggle);
			AddSliderBool("TEST 2", ::GodModeToggle);
			AddSliderBool("TEST 3", ::GodModeToggle);
			AddSliderBool("TEST 4", ::GodModeToggle);
			AddSliderBool("TEST 5", ::GodModeToggle);
			AddSliderBool("TEST 6", ::GodModeToggle);
			AddSliderBool("TEST 7", ::GodModeToggle);
			AddSliderBool("TEST 8", ::GodModeToggle);
			AddSliderBool("TEST 9", ::GodModeToggle);
			AddSliderBool("TEST 10", ::GodModeToggle);
			AddSliderBool("TEST 11", ::GodModeToggle);
			AddSliderBool("TEST 12", ::GodModeToggle);
			AddSliderBool("TEST 13", ::GodModeToggle);
			AddSliderBool("TEST 14", ::GodModeToggle);
			AddSliderBool("TEST 15", ::GodModeToggle);
			AddSliderBool("TEST 16", ::GodModeToggle);
			AddSliderBool("TEST 17", ::GodModeToggle);
			AddSliderBool("TEST 18", ::GodModeToggle);
			AddSliderBool("TEST 19", ::GodModeToggle);
			AddSliderBool("TEST 20", ::GodModeToggle);
			AddSliderBool("TEST 21", ::GodModeToggle);
			AddSliderBool("TEST 22", ::GodModeToggle);
			AddSliderBool("TEST 23", ::GodModeToggle);
		EndSubMenu();
		AddSubMenu( "SUBMENU 2", 1 );
			AddOption("OPTION 1");
			AddOption("OPTION 2");
			AddOption("OPTION 3");
			AddOption("OPTION 4");
		EndSubMenu();
		AddSubMenu( "SUBMENU 3", 1 );
			AddOption("OPTION 1");
			AddOption("OPTION 2");
			AddOption("OPTION 3");
			AddOption("OPTION 4");
		EndSubMenu();
		AddSubMenu( "SUBMENU 4", 1 );
			AddOption("OPTION 1");
			AddOption("OPTION 2");
			AddOption("OPTION 3");
			AddOption("OPTION 4");
		EndSubMenu();
		AddSubMenu( "SUBMENU 5", 1 );
			AddOption("OPTION 1");
			AddOption("OPTION 2");
			AddOption("OPTION 3");
			AddOption("OPTION 4");
		EndSubMenu();
		AddSubMenu( "SUBMENU 6", 1 );
			AddOption("OPTION 1");
			AddOption("OPTION 2");
			AddOption("OPTION 3");
			AddOption("OPTION 4");
		EndSubMenu();
		AddSubMenu( "SUBMENU 7", 1 );
			AddOption("OPTION 1");
			AddOption("OPTION 2");
			AddOption("OPTION 3");
			AddOption("OPTION 4");
		EndSubMenu();
		AddSubMenu( "SUBMENU 8", 1 );
			AddOption("OPTION 1");
			AddOption("OPTION 2");
			AddOption("OPTION 3");
			AddOption("OPTION 4");
		EndSubMenu();
		AddPlayersMenu("PLAYERS MENU", 3);
			AddPlayerSliderBool("GODMODE", ::GodModeToggle);
			AddPlayerSliderBool("INFINITE AMMO", ::AmmoToggle);
			AddPlayerSliderInt( "SPEED SCALE", 1, 0, undefined, 1, ::SetSelfSpeed);
			AddSubMenu("VERIFICATION", 3);
				AddPlayerOption("UNVERIFY", ::SetAccess, 0);
				AddPlayerOption("VERIFIED", ::SetAccess, 1);
				AddPlayerOption("ELEVATED", ::SetAccess, 2);
				AddPlayerOption("COHOST", ::SetAccess, 3);
			EndSubMenu();
		EndPlayersMenu();
}

WelcomeMessage()
{
	self thread maps/mp/gametypes/_hud_message::hintmessage( "WELCOME TO THE MENU!" );
	self iprintln("Welcome. Press [{+actionslot 1}] to open the menu!");
}

ControlMonitor()
{
	self endon("disconnect");
	self endon("VerificationChange");
	Menu = self GetMenu();
	Buttons = array_copy(Menu.preferences.controlscheme);
	CLOSED = -1;
	MAIN = 0;
	oldmenu = -1;
	self freezecontrols( false );
	while( 1 )
	{
		if( !isAlive( self ) )
		{
			oldmenu = Menu.currentmenu;
			Menu.currentmenu = CLOSED;
			self UpdateMenu();
			while( !isAlive( self ) )
				wait 1;
			if( oldmenu != CLOSED )
			{
				Menu.currentmenu = oldmenu;
				self UpdateMenu( true );
			}
		}
		if( self ActionSlotOneButtonPressed() && Menu.currentmenu == CLOSED)
		{
			Menu.currentmenu = MAIN;
			self UpdateMenu( true );
			while( self IsButtonPressed( Buttons[0] ) )
				wait .05;
		}
		else if( self IsButtonPressed( Buttons[5] ) && Menu.currentmenu == MAIN )
		{
			self PlayLocalSound("uin_main_exit");
			Menu.currentmenu = CLOSED;
			UpdateMenu();
			while( self IsButtonPressed( Buttons[5] ) )
				wait .05;
		}
		else if( self IsButtonPressed( Buttons[5] ) && Menu.currentmenu != CLOSED )
		{
			self PlayLocalSound("uin_main_exit");//TODO
			if( Menu.currentmenu == level.menu_controls_menu )
			{
				ControlsValidate();
				Buttons = array_copy(Menu.preferences.controlscheme); //This updates our controls AFTER we exit the settings menu
			}
			if(Menu.currentmenu == level.si_players_menu )
				Menu.selectedplayer = undefined;
			Menu.currentmenu = level.Evanescence.options[ Menu.currentmenu ].parentmenu;
			UpdateMenu();
			while( self IsButtonPressed( Buttons[5] ) )
				wait .05;
		}
		else if( self IsButtonPressed( Buttons[0] ) )
		{
			if( Menu.text.size > 1 )
			{
				Menu.text[ Menu.cursors[ Menu.CurrentMenu ] ] notify("Deselected");
				self PlayLocalSound("cac_grid_nav");
				if( isSlider( Menu.currentmenu, Menu.cursors[ Menu.currentMenu ] ) )
				{
					Menu.sliders[ level.Evanescence.options[ Menu.currentmenu ].options[ Menu.cursors[ Menu.currentMenu ] ].title ] notify("Deselected");
				}
				if( Menu.CurrentMenu != level.si_players_menu )
				{
					if( Menu.cursors[ Menu.CurrentMenu ] < 1 )
					{
						Menu.cursors[ Menu.CurrentMenu ] = ( level.Evanescence.options[ Menu.CurrentMenu ].options.size - 1 );		
					}
					else
						Menu.cursors[ Menu.CurrentMenu ]--;
				}
				else
				{
					if( Menu.cursors[ Menu.CurrentMenu ] < 1 )
					{
						Menu.cursors[ Menu.CurrentMenu ] = ( level.players.size - 1 );		
					}
					else
						Menu.cursors[ Menu.CurrentMenu ]--;
				}
				Menu.text[ Menu.cursors[ Menu.CurrentMenu ] ] thread SelectedOption( self );
				if( isSlider( Menu.currentmenu, Menu.cursors[ Menu.currentMenu ] ) )
				{
					Menu.sliders[ level.Evanescence.options[ Menu.currentmenu ].options[ Menu.cursors[ Menu.currentMenu ] ].title ] thread SelectedOption( self );
				}
			}
			while( self IsButtonPressed( Buttons[0] ) )
				wait .05;
		}
		else if( self IsButtonPressed( Buttons[1] ) && Menu.currentmenu != CLOSED )
		{
			if( Menu.text.size > 1 )
			{
				self PlayLocalSound("cac_grid_nav");
				if( isSlider( Menu.currentmenu, Menu.cursors[ Menu.currentMenu ] ) )
				{
					Menu.sliders[ level.Evanescence.options[ Menu.currentmenu ].options[ Menu.cursors[ Menu.currentMenu ] ].title ] notify("Deselected");
				}
				Menu.text[ Menu.cursors[ Menu.CurrentMenu ] ] notify("Deselected");
				if( Menu.CurrentMenu != level.si_players_menu )
				{
					if( Menu.cursors[ Menu.CurrentMenu ] >= ( level.Evanescence.options[ Menu.CurrentMenu ].options.size - 1 ) )
					{
						Menu.cursors[ Menu.CurrentMenu ] = 0;		
					}
					else
						Menu.cursors[ Menu.CurrentMenu ]++;
				}
				else
				{
					if( Menu.cursors[ Menu.CurrentMenu ] >= ( level.players.size - 1 ) )
					{
						Menu.cursors[ Menu.CurrentMenu ] = 0;		
					}
					else
						Menu.cursors[ Menu.CurrentMenu ]++;
				}
				Menu.text[ Menu.cursors[ Menu.CurrentMenu ] ] thread SelectedOption( self );
				if( isSlider( Menu.currentmenu, Menu.cursors[ Menu.currentMenu ] ) )
				{
					Menu.sliders[ level.Evanescence.options[ Menu.currentmenu ].options[ Menu.cursors[ Menu.currentMenu ] ].title ] thread SelectedOption( self );
				}
			}
			while( self IsButtonPressed( Buttons[1] ) )
				wait .05;
		}
		else if( self IsButtonPressed( Buttons[4] ) && Menu.currentmenu != CLOSED)
		{
			if( !isSlider( Menu.currentmenu, Menu.cursors[ Menu.currentMenu ] ) )
				self thread PerformOption();
			while( self IsButtonPressed( Buttons[4] ) )
				wait .05;
		}
		else if( self IsButtonPressed( Buttons[2] ) && Menu.currentmenu != CLOSED)
		{
			self thread Slider( -1 );
			while( self IsButtonPressed( Buttons[2] ) )
				wait .05;
		}
		else if( self IsButtonPressed( Buttons[6] ) && Menu.currentmenu != CLOSED)
		{
			NextPage();
			while( self IsButtonPressed( Buttons[6] ) )
				wait .05;
		}
		else if( self IsButtonPressed( Buttons[7] ) && Menu.currentmenu != CLOSED)
		{
			PreviousPage();
			while( self IsButtonPressed( Buttons[7] ) )
				wait .05;
		}
		else if( self IsButtonPressed( Buttons[3] ) && Menu.currentmenu != CLOSED)
		{
			self thread Slider( 1 );
			while( self IsButtonPressed( Buttons[3] ) )
				wait .05;	
		}
		wait .05;
	}
	CloseMenu();
}

AddControlsMenu( title, access )
{
	AddSubMenu( title, access );
	level.menu_controls_menu = level.si_current_menu;
}






