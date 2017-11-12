package entities.player;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.math.FlxVelocity;

/**
 * ...
 * @author Amaka
 */

class PlayerOne extends Player 
{
	
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		//Init
		makeGraphic(16, 32, FlxColor.RED);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}
	
	override function movement():Void 
	{
		if (FlxG.keys.pressed.UP)
		{
			if (angle == 0)
				velocity.y -= 1;
			if (angle > 0 && angle < 90)
			{
				velocity.y -= 1;
				velocity.x += 1;
			}
			if (angle > 91 &&  angle < 180)
			{
				velocity.y += 1;
				velocity.y += 1;
			}
			if (angle > 181 && angle < 270)
			{
				velocity.x -= 1;
				velocity.y += 1;
			}
			if (angle > 271 && angle < 360)
			{
				velocity.x -= 1;
				velocity.y -= 1;
			}
		}
		if (FlxG.keys.pressed.DOWN)
		{
			velocity.x -= 1;
		}
		if (FlxG.keys.pressed.RIGHT)
		{
			angularVelocity -= 1;
		}
		if (FlxG.keys.pressed.LEFT)
		{
			angularVelocity += 1;
		}
		if (breck())
		{
			if (velocity.x > 0)
				velocity.x  -= 1;
			if (velocity.x < 0)
				velocity.x +=  1;
			if (angularVelocity > 0)
				angularVelocity -= 1;
			if (angularVelocity < 0)
				angularVelocity += 1;
		}
	}
	
	override function breck():Bool //retorna verdadero cuando una tecla no esta presionada
	{
		if (!(FlxG.keys.pressed.UP) && !(FlxG.keys.pressed.DOWN) 
		&& !(FlxG.keys.pressed.RIGHT) && !(FlxG.keys.pressed.LEFT))
			return true;
		return false;
	}
}