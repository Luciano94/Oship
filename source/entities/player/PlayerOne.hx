package entities.player;

import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxG;

/**
 * ...
 * @author Amaka
 */

class PlayerOne extends Player 
{
	private var speed:Int;

	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		//Init
		makeGraphic(16, 32, FlxColor.RED);
		speed = Reg.speed;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}
	
}