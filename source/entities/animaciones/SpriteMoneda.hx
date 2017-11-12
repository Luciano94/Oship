package entities.animaciones;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import AssetPaths;

/**
 * ...
 * @author Tomás Mugetti
 */
class SpriteMoneda extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.monedaBrillo__png,true,128,128);
		animation.add("brillo", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23], 12, true, false, false);
		animation.play("brillo");
	}
	
}