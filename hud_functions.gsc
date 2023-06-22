createShader(shader, align, relative, x, y, width, height, color, alpha, sort)
{
    hud = newClientHudElem(self);
    hud.elemtype = "icon";
    hud.color = color;
    hud.alpha = alpha;
    hud.sort = sort;
    hud.children = [];
	hud setParent(level.uiParent);
    hud setShader(shader, width, height);
	hud setPoint(align, relative, x, y);
	hud.hideWhenInMenu = true;
	hud.archived = false;
    return hud;
}

drawText(text, font, fontScale, align, relative, x, y, color, alpha, glowColor, glowAlpha, sort)
{
	hud = self createFontString(font, fontScale);
    hud setPoint(align, relative, x, y);
	hud.color = color;
	hud.alpha = alpha;
	hud.glowColor = glowColor;
	hud.glowAlpha = glowAlpha;
	hud.sort = sort;
	hud.alpha = alpha;
	hud setSafeText(text);
	if(text == "SInitialization")
		hud.foreground = true;
	hud.hideWhenInMenu = true;
	hud.archived = false;
	return hud;
}

SmartOverflowEngine()
{
	level.uniquestrings = [];
	level.anchors = [];
	level.anchors[0] = createServerFontString("default", 1);
	level.anchors[0] setText("ANCHOR0");
	level.anchors[0].alpha = 0;
	MAX_STRINGS = 215;
	CURRENT_BUFFER = 0;
	ANCHOR_BUFFER = 50;
	level thread SmartOverflowOnEndedFix();
	level thread SmartOverFlowOptimizer();
	for(;;)
	{
		level waittill("textset");
		CURRENT_BUFFER++;
		if( CURRENT_BUFFER >= ANCHOR_BUFFER )
		{
			CURRENT_BUFFER = 0;
			level.anchors[ level.anchors.size ] = createServerFontString("default", 1);
			level.anchors[ level.anchors.size - 1] setText(level.uniquestrings[ level.uniquestrings.size - 1]);
			level.anchors[ level.anchors.size - 1].alpha = 0;
		}
		if( level.uniquestrings.size >= MAX_STRINGS )
		{
			SmartOverflowAnchorClear();
			foreach(player in level.players)
			{
				if( level.page_offset[ player GetName() ] != 0 )
					player thread UpdateMenu(false, true, level.page_offset[ player GetName() ]);
				else
					player thread UpdateMenu(false, true);
			}
			wait .01;
		}
	}
}

SmartOverFlowOptimizer()
{
	level endon("game_ended");
	value = false;
	while( 1 )
	{
		level waittill("EvanescenceClose");
		value = false;
		foreach( player in level.players )
		{
			if( !isDefined(player GetMenu()) )
				continue;
			if((player GetMenu()).currentMenu != -1)
			{
				value = true;
				break;
			}
		}
		if( !value )
		{
			SmartOverflowAnchorClear();
		}
	}
}

SmartOverflowAnchorClear()
{
	for( i = level.anchors.size - 1; i > 0; i--)
	{
		level.anchors[i] ClearAllTextAfterHudElem();
		level.anchors[i] destroy();
		waittillframeend;
	}
	level.anchors[0] ClearAllTextAfterHudElem();
	level.uniquestrings = [];	
}

SmartOverflowOnEndedFix()
{
	level waittill( "game_ended" );
	SmartOverflowAnchorClear();
	foreach(player in level.players)
	{
		if( isDefined( player GetMenu() ) )
		{
			(player GetMenu()).currentmenu = -1;
			player thread UpdateMenu(false, true);
		}
	}
}

setSafeText(text)
{
	if( !isinarray(level.uniquestrings, text ) )
	{
		level.uniquestrings = add_to_array(level.uniquestrings, text, 0 );
		level notify("textset");
	}
	self setText(text);
}








