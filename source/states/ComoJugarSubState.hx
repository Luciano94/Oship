package states;

import entities.animaciones.SpriteMoneda;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.util.FlxColor;
import flixel.FlxG;

/**
 * ...
 * @author Tomás Mugetti
 */
class ComoJugarSubState extends FlxSubState 
{
	private var fondo:FlxSprite;
	private var moneda:SpriteMoneda;
	private var contador:Int;
	public function new(BGColor:FlxColor=FlxColor.TRANSPARENT) 
	{
		super(BGColor);
		fondo = new FlxSprite(0, 0);
		fondo.loadGraphic(AssetPaths.tutorial1__png);
		add(fondo);
		
		moneda = new SpriteMoneda(0,0);
		moneda.scale.set(2, 2);
		moneda.updateHitbox();
		moneda.x = 50;
		moneda.y = 50;
		add(moneda);
		
		contador = 1;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ANY) 
		{
			contador++;
		}
		switch (contador) 
		{
			case 1:
				fondo.loadGraphic(AssetPaths.tutorial1__png);
			case 2:
				fondo.loadGraphic(AssetPaths.tutorial2__png);
			case 3:
				fondo.loadGraphic(AssetPaths.tutorial3__png);
			case 4:
				fondo.loadGraphic(AssetPaths.tutorial4__png);
			case 5:
				fondo.loadGraphic(AssetPaths.tutorial5__png);
			case 6:
				fondo.loadGraphic(AssetPaths.tutorial6__png);
			case 7:
				fondo.loadGraphic(AssetPaths.tutorial7__png);
			case 8:
				fondo.loadGraphic(AssetPaths.tutorial8__png);
			default:
				remove(fondo);
				remove(moneda);
				this.close();
				
		}
	}
	
}