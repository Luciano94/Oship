package entities.player;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxG;

/**
 * ...
 * @author Amaka
 */
class Player extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		velocity.x = 0;
		angularVelocity = 0;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		movement();
		shot();
		accelerationControl();
		breck();
		//trace (velocity.x);
		trace (angle);
	}
	
	private function breck():Bool
	{
		return false;
		//implementar en clase derivada
	}
	
	private  function accelerationControl():Void
	{
		/*velocidad*/
		if (velocity.x > 0)
			if(velocity.x > Reg.maxSpeed)
				velocity.x = Reg.maxSpeed;
		if (velocity.x < 0)
			if( velocity.x < -Reg.maxSpeed)
				velocity.x = -Reg.maxSpeed;
		/*velocidad angular*/
		if (angularVelocity > 0)
			if (angularVelocity > Reg.maxAngSpeed)
				angularVelocity = Reg.maxAngSpeed;
		if (angularVelocity < 0)
			if (angularVelocity < -Reg.maxAngSpeed)
				angularVelocity = -Reg.maxAngSpeed;
		
		/*angulo*/
		if (angle > 0 && angle > 360)
			angle = 0;
		if (angle < 0 && angle < -360)
			angle = 0;
		
	}
	
	private function movement():Void
	{
		//Implementar en clase derivada
	}
	
	private function smooth():Void
	{
		//implementar en clase derivada
	}
	
	private function shot():Void
	{
		//implementar en clase derivada
	}
	
}