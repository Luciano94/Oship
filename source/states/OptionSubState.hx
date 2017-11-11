package states;

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
	private var musicText:FlxText;
	private var sfxText:FlxText;
	private var musicValText:FlxText;
	private var sfxValText:FlxText;
	private var musMas:FlxButton;
	private var musMen:FlxButton;
	private var sfxMen:FlxButton;
	private var sfxMas:FlxButton;
	private var volver:FlxButton;
	public function new(BGColor:FlxColor=0x33000000) 
	{
		super(BGColor);
		
		musicVal = FlxG.sound.music.volume * 10;
		sfxVal = FlxG.sound.volume * 10;
		musicText = new FlxText("Música: ");
		sfxText = new FlxText("Maestro:");
		musicValText = new FlxText(Std.string(musicVal));
		sfxValText = new FlxText(Std.string(sfxVal));
		musMas = new FlxButton("+",masVolMus);
		musMen = new FlxButton("-",menVolMus);
		sfxMas = new FlxButton("+",masVolSfx);
		sfxMen = new FlxButton("-",menVolSfx);
		volver = new FlxButton("Volver", salir);
		
		sfxText.screenCenter();
		sfxText.y -= sfxText.height;
		sfxText.x -= sfxText.width;
		sfxValText.y = sfxText.y;
		sfxValText.x = sfxText.x + sfxText.width + sfxValText.width;
		sfxMas.y = sfxText.y;
		sfxMas.x = sfxValText.x + sfxValText.width;
		sfxMen.y = sfxText.y;
		sfxMen.x = sfxMas.x + sfxMas.width;
		
		musicText.screenCenter();
		musicText.y += musicText.height;
		musicText.x -= musicText.width;
		musicValText.y = musicText.y;
		musicValText.x = musicText.x + musicText.width + musicValText.width;
		musMas.y = musicText.y;
		musMas.x = musicValText.x + musicValText.width;
		musMen.y = musicText.y;
		musMen.x = musMas.x + musMas.width;
		
		volver.screenCenter();
		volver.y = musicText.y + (2 * volver.height);
		
		
		
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
			sfxVal = FlxG.sound.volume * 10;
			sfxValText.text = Std.string(sfxVal);
		}
	}
	private function salir():Void
	{
		this.close();
	}
}