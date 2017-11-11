package source.states;

import flixel.FlxCamera;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxG;
import AssetPaths;
import flixel.util.FlxSpriteUtil;
import states.OptionSubState;

class MenuState extends FlxState
{
	private var title:FlxText;
	private var playButton:FlxButton;
	private var optionButton:FlxButton;
	private var fondo:FlxSprite;
	private var logo:FlxSprite;
	override public function create():Void
	{
		super.create();
		camera = new FlxCamera(0, 0, 1920, 1080);
		camera.bgColor = 0x00000000;
		fondo = new FlxSprite();
		fondo.loadGraphic(AssetPaths.StartMenu__png);
		fondo.updateHitbox();
		add(fondo);
		
		FlxG.sound.load();
		FlxG.sound.playMusic(AssetPaths.menuScreen__ogg,1,true);
		
		logo = new FlxSprite();
		logo.loadGraphic(AssetPaths.Logo__png);
		logo.alpha = 0;
		logo.scale.set(1.5, 1.2);
		logo.updateHitbox();
		add(logo);
		FlxSpriteUtil.fadeIn(logo, 4, false);
		
		playButton = new FlxButton(0, 0, "Play", clickPlay);
		playButton.screenCenter();
		add(playButton);
		
		optionButton = new FlxButton("Opciones",clickOption);
		optionButton.screenCenter();
		optionButton.y += playButton.height;
		add(optionButton);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	private function clickPlay():Void
	{
		FlxG.sound.music.stop();
		FlxG.switchState(new PlayState());
	}
	private function clickOption():Void
	{
		openSubState(new OptionSubState());
	}
}