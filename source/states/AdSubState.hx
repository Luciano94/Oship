package states;

import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import haxe.remoting.Connection;
import openfl.media.Video;
import flixel.FlxG;
import openfl.net.NetConnection;
import openfl.net.NetStream;
import openfl.Lib;

/**
 * ...
 * @author Tomás Mugetti
 */
class AdSubState extends FlxSubState 
{
	private var exitButton:FlxButton;
	private var contador:Int;
	private var contadorText:FlxText;
	private var tiempo:Float;
	private var ad:FlxText;
	private var ad2:FlxText;
	public function new(BGColor:FlxColor=0xFF000000) 
	{
		super(BGColor);
		FlxG.sound.music.pause();
		FlxG.sound.play(AssetPaths.ElevatorMusic__ogg);
		ad = new FlxText(0, 0, 0, "Compra fernet o mato a un conejito", 80);
		ad.screenCenter();
		ad2 = new FlxText(0, 0, 0, ">:^{D", 80);
		ad2.screenCenter();
		ad2.y += ad.height;
		add(ad);
		add(ad2);
		
		contador = 30;
		tiempo = 0;
		
		contadorText = new FlxText(FlxG.camera.width - 30, 30, 0, "", 32);
		contadorText.x -= contadorText.width;
		add(contadorText);
		
		exitButton = new FlxButton(contadorText.x, contadorText.y, "X", salir);
		exitButton.scale.set(2, 2);
		exitButton.x -= exitButton.width / 2;
		exitButton.y += exitButton.height / 2;
		exitButton.updateHitbox();
		exitButton.visible = false;
		add(exitButton);
		
	}
	override public function update(elapsed:Float):Void
	{
		tiempo += elapsed;
		if (tiempo >= 1) 
		{
			tiempo = 0;
			contador -= 3;
		}
		if (contador <=0) 
		{
			salir();
		}
		contadorText.text = Std.string(contador);
		
		if (FlxG.keys.justPressed.ESCAPE) 
		{
			salir();
		}
	}
	private function salir():Void
	{
		FlxG.sound.pause();
		FlxG.sound.music.resume();
		this.close();
	}
	
}