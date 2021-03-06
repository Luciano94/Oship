package source.states;

import flixel.FlxCamera;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxG;
import AssetPaths;
import flixel.util.FlxSpriteUtil;
import states.AdSubState;
import states.BattleState;
import states.ComoJugarSubState;
import states.MapState;
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
	private var comoButton:FlxButton;
	override public function create():Void
	{
		super.create();
		
		camera = new FlxCamera(0, 0, 1920, 1080);
		camera.bgColor = 0x00000000;
		
		fondo = new FlxSprite();
		fondo.loadGraphic(AssetPaths.StartMenu__png);
		fondo.updateHitbox();
		add(fondo);
		
		FlxG.sound.playMusic(AssetPaths.menuScreen__ogg,1,true);
		
		logo = new FlxSprite();
		logo.loadGraphic(AssetPaths.Logo__png);
		logo.scale.set(1.5, 1.2);
		logo.updateHitbox();
		logo.x = 50;
		logo.y = 50;
		add(logo);
		
		playButton = new FlxButton("", clickPlay);
		playButton.loadGraphic(AssetPaths.jugar__png);
		playButton.updateHitbox();
		playButton.x = 50;
		playButton.y = logo.y + logo.height + playButton.height;
		add(playButton);
		
		comoButton = new FlxButton("", clickComo);
		comoButton.loadGraphic(AssetPaths.comoJugar__png);
		comoButton.updateHitbox();
		comoButton.x = 50;
		comoButton.y = playButton.y + playButton.height;
		add(comoButton);
		
		optionButton = new FlxButton("", clickOption);
		optionButton.loadGraphic(AssetPaths.Opciones__png);
		optionButton.updateHitbox();
		optionButton.x = 50;
		optionButton.y = comoButton.y + comoButton.height;
		add(optionButton);
		
		exitButton = new FlxButton("", salir);
		exitButton.loadGraphic(AssetPaths.salir__png);
		exitButton.updateHitbox();
		exitButton.x = camera.width - exitButton.width - 50;
		exitButton.y = camera.height - exitButton.height - 50;
		add(exitButton);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	private function clickPlay():Void
	{
		FlxG.switchState(new MapState());
	}
	private function clickOption():Void
	{
		openSubState(new OptionSubState());
	}
	private function salir():Void
	{
		System.exit(0);
	}
	private function clickComo():Void
	{
		openSubState(new ComoJugarSubState());
	}
}