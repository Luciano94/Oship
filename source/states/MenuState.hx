package source.states;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxG;
import AssetPaths;

class MenuState extends FlxState
{
	private var title:FlxText;
	private var playButton:FlxButton;
	private var fondo:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		fondo = new FlxSprite();
		fondo.loadGraphic(AssetPaths.StartMenu__png);
		add(fondo); //Tiene un zoom que corregir. No muestra el asset correctamente.
		this.
		
		title = new FlxText(0, FlxG.height / 4, 0, "Oship", 12, true);
		title.screenCenter(X);
		add(title);
		
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