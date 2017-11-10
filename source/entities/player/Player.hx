package entities.player;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Amaka
 */
class Player extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		movement();
		shot();
	}
	
	private function movement():Void
	{
		//Implementar en clase derivada
	}
	
	private function shot():Void
	{
		//implementar en clase derivada
	}
	
}