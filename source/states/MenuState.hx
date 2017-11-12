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
import openfl.system.System;

class MenuState extends FlxState
{
	private var title:FlxText;
	private var playButton:FlxButton;
	private var optionButton:FlxButton;
	private var fondo:FlxSprite;
	private var logo:FlxSprite;
	private var exitButton:FlxButton;
	private var storeButton:FlxButton;
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
		logo.scale.set(1.5, 1.2);
		logo.updateHitbox();
		add(logo);
		
		playButton = new FlxButton("", clickPlay);
		playButton.loadGraphic(AssetPaths.jugar__png);
		playButton.updateHitbox();
		playButton.x = 50;
		playButton.y = logo.y + logo.height + playButton.height;
		add(playButton);
		
		optionButton = new FlxButton("", clickOption);
		optionButton.loadGraphic(AssetPaths.Opciones__png);
		optionButton.updateHitbox();
		optionButton.x = 50;
		optionButton.y = playButton.y + playButton.height;
		add(optionButton);
		
		exitButton = new FlxButton("", salir);
		exitButton.loadGraphic(AssetPaths.salir__png);
		exitButton.updateHitbox();
		exitButton.x = camera.width - exitButton.width - 50;
		exitButton.y = camera.height - exitButton.height - 50;
		add(exitButton);
		
		storeButton = new FlxButton("",clickStore);
		storeButton.loadGraphic(AssetPaths.tienda__png);
		storeButton.updateHitbox();
		storeButton.x = 50;
		storeButton.y = optionButton.y + optionButton.height;
		add(storeButton);
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
	private function salir():Void
	{
		System.exit(0);
	}
	private function clickStore():Void
	{
		
	}
}