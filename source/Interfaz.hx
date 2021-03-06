package;

import entities.player.PlayerOne;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxState;
import flixel.system.FlxAssets.FlxGraphicAsset;
import AssetPaths;
import flixel.ui.FlxBar;
import flixel.ui.FlxBar.FlxBarFillDirection;

/**
 * ...
 * @author ...
 */
class Interfaz extends FlxSprite 
{
	private var timon:FlxSprite;
	private var barraVel:FlxBar;
	private var barraShot:FlxBar;
	private var boton:FlxSprite;
	private var player:PlayerOne;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset, barco:PlayerOne, estado:FlxState) 
	{
		super(X, Y, SimpleGraphic);
		this.visible = false;
		player = barco;
		
		timon = new FlxSprite();
		timon.loadGraphic(AssetPaths.timon__png);
		timon.updateHitbox();
		timon.x = 30;
		timon.y = (FlxG.camera.height - timon.height) - 30;
		estado.add(timon);
		
		barraVel = new FlxBar(0, 0, FlxBarFillDirection.BOTTOM_TO_TOP, 50, 300, player, "velTotal", 0, Reg.maxSpeed, true);
		barraVel.x = FlxG.camera.width - 80;
		barraVel.y = FlxG.camera.height - 330;
		estado.add(barraVel);
		
		boton = new FlxSprite();
		boton.loadGraphic(AssetPaths.botonLibre__png);
		boton.updateHitbox();
		boton.x = barraVel.x - 130;
		boton.y = FlxG.camera.height - 130;
		estado.add(boton);
		
		barraShot = new FlxBar(0,0,FlxBarFillDirection.BOTTOM_TO_TOP,50,300,player,"distShot",0,Reg.maxDistShot,true);
		barraShot.x = boton.x - 80;
		barraShot.y = barraVel.y;
		estado.add(barraShot);
		
	}
	
	override public function destroy():Void 
	{
		super.destroy();
		timon.destroy();
		barraShot.destroy();
		barraVel.destroy();
		boton.destroy();
	}
	
	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.pressed.NUMPADONE) 
		{
			boton.loadGraphic(AssetPaths.botonApretado__png);
		} else if (FlxG.keys.justReleased.NUMPADONE) 
		{
			boton.loadGraphic(AssetPaths.botonLibre__png);
		}
		
		timon.angle = player.angle;
		
	}
	
}