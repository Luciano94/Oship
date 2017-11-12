package states;

import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.FlxG;

/**
 * ...
 * @author Tomás Mugetti
 */
class OptionSubState extends FlxSubState 
{
	private var musicVal:Float;
	private var sfxVal:Float;
	private var musicText:FlxSprite;
	private var sfxText:FlxSprite;
	private var musicValText:FlxText;
	private var sfxValText:FlxText;
	private var musMas:FlxButton;
	private var musMen:FlxButton;
	private var sfxMen:FlxButton;
	private var sfxMas:FlxButton;
	private var volver:FlxButton;
	public function new(BGColor:FlxColor=0xD0000000) 
	{
		super(BGColor);
		musicVal = FlxG.sound.music.volume * 10;
		sfxVal = FlxG.sound.volume * 10;
		musicText = new FlxSprite();
		sfxText =  new FlxSprite();
		musicValText = new FlxText(0,0,0,Std.string(musicVal),64);
		sfxValText = new FlxText(0,0,0,Std.string(sfxVal),64);
		musMas = new FlxButton("",masVolMus);
		musMen = new FlxButton("",menVolMus);
		sfxMas = new FlxButton("",masVolSfx);
		sfxMen = new FlxButton("",menVolSfx);
		volver = new FlxButton("", salir);
		
		sfxText.loadGraphic(AssetPaths.maestro__png);
		sfxText.updateHitbox();
		musicText.loadGraphic(AssetPaths.musica__png);
		musicText.updateHitbox();
		musMas.loadGraphic(AssetPaths.mas__png);
		musMas.updateHitbox();
		musMen.loadGraphic(AssetPaths.menos__png);
		musMen.updateHitbox();
		sfxMas.loadGraphic(AssetPaths.mas__png);
		sfxMas.updateHitbox();
		sfxMen.loadGraphic(AssetPaths.menos__png);
		sfxMen.updateHitbox();
		volver.loadGraphic(AssetPaths.volver__png);
		volver.updateHitbox();
		
		sfxText.screenCenter();
		sfxText.y -= sfxText.height;
		sfxText.x -= sfxText.width/2;
		sfxValText.y = sfxText.y;
		sfxValText.x = sfxText.x + sfxText.width + sfxValText.width;
		sfxMas.y = sfxText.y;
		sfxMas.x = sfxValText.x + sfxValText.width;
		sfxMen.y = sfxText.y;
		sfxMen.x = sfxMas.x + (sfxMas.width*2);
		
		
		musicText.screenCenter();
		musicText.y += musicText.height;
		musicText.x -= musicText.width/2;
		musicValText.y = musicText.y;
		musicValText.x = musicText.x + musicText.width + musicValText.width;
		musMas.y = musicText.y;
		musMas.x = musicValText.x + musicValText.width;
		musMen.y = musicText.y;
		musMen.x = musMas.x + (musMas.width*2);
		
		volver.screenCenter();
		volver.y = musicText.y + (volver.height*2);
		
		add(sfxText);
		add(sfxValText);
		add(sfxMas);
		add(sfxMen);
		
		add(musicText);
		add(musicValText);
		add(musMas);
		add(musMen);
		
		add(volver);
	}
	
	private function masVolMus():Void
	{
		if (musicVal <10) 
		{
			FlxG.sound.music.volume += 0.1;
			
			musicVal = FlxG.sound.music.volume * 10;
			
			musicValText.text = Std.string(musicVal);
		}
	}
	private function menVolMus():Void
	{
		if (musicVal >0) 
		{
			FlxG.sound.music.volume -= 0.1;
			if (FlxG.sound.music.volume<0.1) 
			{
				FlxG.sound.music.volume = 0;
			}
			musicVal = FlxG.sound.music.volume * 10;
			musicValText.text = Std.string(musicVal);
		}
	}
	private function masVolSfx():Void
	{
		if (sfxVal<10) 
		{
			FlxG.sound.volume += 0.1;
			sfxVal = FlxG.sound.volume * 10;
			sfxValText.text = Std.string(sfxVal);
		}
	}
	private function menVolSfx():Void
	{
		if (sfxVal>0) 
		{
			FlxG.sound.volume -= 0.1;
			if (FlxG.sound.volume<0.1) 
			{
				FlxG.sound.volume = 0;
			}
			sfxVal = FlxG.sound.volume * 10;
			sfxValText.text = Std.string(sfxVal);
		}
	}
	private function salir():Void
	{
		this.close();
	}
}