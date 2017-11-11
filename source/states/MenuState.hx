package source.states;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxG;
import AssetPaths;
import flixel.util.FlxSpriteUtil;

class MenuState extends FlxState
{
	private var title:FlxText;
	private var playButton:FlxButton;
	private var fondo:FlxSprite;
	private var logo:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		fondo = new FlxSprite();
		fondo.loadGraphic(AssetPaths.StartMenu__png);
		fondo.updateFramePixels();
		add(fondo); //Tiene un zoom que corregir. No muestra el asset correctamente.
		
		logo = new FlxSprite();
		logo.loadGraphic(AssetPaths.Logo__png);
		logo.alpha = 0;
		add(logo);
		FlxSpriteUtil.fadeIn(logo, 4, false);
		
		playButton = new FlxButton(0, 0, "Play", clickPlay);
		playButton.screenCenter();
		add(playButton);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	private function clickPlay():Void
	{
		FlxG.switchState(new PlayState());
	}
}