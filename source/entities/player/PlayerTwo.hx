package entities.player;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.ui.FlxBar;

/**
 * ...
 * @author Amaka
 */

class PlayerTwo extends FlxSprite
{
	private var distShot:Int;
	private var bullet: BulletTwo;
	private var canShot:Bool;
	private var distanceBar:FlxBar;
	private var direccion:Int;

	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		//Init
		velocity.x = 0;
		angularVelocity = 0;
		canShot = true;
		loadGraphic(AssetPaths.Player_Two__png);
		scale.set(0.5, 0.5);
		updateHitbox();
		distShot = 0;
		distanceBar = new FlxBar(x, y, FlxBarFillDirection.LEFT_TO_RIGHT, 100, 20, this, "distShot", 0, Reg.maxDistShot, true);
		FlxG.state.add(distanceBar);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		distanceBar.setPosition(x, y);
		movement();
		shot();
		distanceShot();
		accelerationControl();
		breck();
	}
	
	private function shot():Void 
	{
		if (angle >= 0)
		{
			if (angle > 0 && angle < 88)
				direccion = 1;
			if (angle > 88 && angle < 178)
				direccion = 2;
			if (angle > 178 && angle < 268)
				direccion = 3;
			if (angle > 268 && angle < 0)
				direccion = 4;
		}
		else
		{
			if (angle < 0 && angle > -88)
				direccion = 4;
			if (angle < -88 && angle > -178)
				direccion = 3;
			if (angle < -178 && angle > -268)
				direccion = 2;
			if (angle < -268 && angle > -360)
				direccion = 1;
		}
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
		if (FlxG.keys.pressed.W)
		{
			if (angle == 0)
				velocity.y -= 1;
			/*positivos*/
			if (angle > 0)
			{
				if (angle > 89 && angle < 91)
					velocity.x += 1;
				if (angle > 179 && angle < 181)
					velocity.y += 1;
				if (angle > 269 && angle < 271)
					velocity.x -= 1;
				if (angle > 0 && angle < 89)
				{
					velocity.y -= 1;
					velocity.x += 1;
				}
				if (angle > 91 &&  angle < 179)
				{
					velocity.x += 1;
					velocity.y += 1;
				}
				if (angle > 181 && angle < 269)
				{
					velocity.x -= 1;
					velocity.y += 1;
				}
				if (angle > 271 && angle < 360)
				{
				velocity.x -= 1;
				velocity.y += 1;
			}
			}
			/*negativos*/
			if (angle < 0)
			{
				if (angle < -89 && angle > -91)
					velocity.x -= 1;
				if (angle < -179 && angle > -181)
					velocity.y += 1;
				if (angle < 269 && angle > 271)
					velocity.x += 1;
				if (angle < 0 && angle > -89)
				{
					velocity.y -= 1;
					velocity.x -= 1;
				}
				if (angle < -91 &&  angle > -179)
				{
					velocity.x -= 1;
					velocity.y += 1;
				}
				if (angle < -181 && angle > -269)
				{
					velocity.x += 1;
					velocity.y += 1;
				}
				if (angle < -271 && angle > -360)
				{
				velocity.x += 1;
				velocity.y -= 1;
			}
			}
		}
		if (FlxG.keys.pressed.S)
		{
			if (angle == 0)
				velocity.y += 1;
			/*Positivos*/
			if (angle > 0)
			{
				if (angle > 89 && angle < 91)
					velocity.x -= 1;
				if (angle > 179 && angle < 181)
					velocity.y -= 1;
				if (angle > 269 && angle < 271)
					velocity.x += 1;
				if (angle > 0 && angle < 89)
				{
					velocity.y += 1;
					velocity.x -= 1;
				}
				if (angle > 91 &&  angle < 179)
				{
					velocity.x -= 1;
					velocity.y -= 1;
				}
				if (angle > 181 && angle < 269)
				{
					velocity.x += 1;
					velocity.y -= 1;
				}
				if (angle > 271 && angle < 360)
				{
				velocity.x += 1;
				velocity.y += 1;
			}
			}
			/*negativos*/
			if (angle < 0)
			{
				if (angle < -89 && angle > -91)
					velocity.x += 1;
				if (angle < -179 && angle > -181)
					velocity.y -= 1;
				if (angle < 269 && angle > 271)
					velocity.x += 1;
				if (angle < 0 && angle > -89)
				{
					velocity.y += 1;
					velocity.x += 1;
				}
				if (angle < -91 &&  angle > -179)
				{
					velocity.x += 1;
					velocity.y -= 1;
				}
				if (angle < -181 && angle > -269)
				{
					velocity.x -= 1;
					velocity.y -= 1;
				}
				if (angle < -271 && angle > -360)
				{
					velocity.x -= 1;
					velocity.y += 1;
				}
			}
		}
		if (FlxG.keys.pressed.D)
		{
			angularVelocity += 1;
			updateHitbox();
		}
		if (FlxG.keys.pressed.A)
		{
			angularVelocity -= 1;
			updateHitbox();
		}
		if (breck())
		{
			if (velocity.x > 0)
				velocity.x  -= 1;
			if (velocity.x < 0)
				velocity.x +=  1;
			if (velocity.y > 0)
				velocity.y -= 1;
			if (velocity.y < 0)
				velocity.y += 1;
			if (angularVelocity > 0)
				angularVelocity -= 1;
			if (angularVelocity < 0)
				angularVelocity += 1;
		}
	}
	
	private function breck():Bool //retorna verdadero cuando una tecla no esta presionada
	{
		if (!(FlxG.keys.pressed.W) && !(FlxG.keys.pressed.S) 
		&& !(FlxG.keys.pressed.D) && !(FlxG.keys.pressed.A))
			return true;
		return false;
	}
	
	private function distanceShot():Void 
	{
		if (FlxG.keys.pressed.SPACE)
		{
			if (distShot > Reg.maxDistShot)
				distShot = Reg.maxDistShot;
			else
				distShot++;
		}	
		if (FlxG.keys.justReleased.SPACE)
		{ 
			if (distShot < Reg.minDistShot)
				distShot = Reg.minDistShot;
			if (canShot)
			{
				bullet = new BulletTwo(x + width, y + height / 2, distShot, direccion);
				Reg.bulAliveTwo = true;
				FlxG.state.add(bullet);
				canShot = false;
			}
			distShot = 0;
		} 
		if (Reg.bulAliveTwo)
		{
			if (bullet.getShot() == 0)
			{
				Reg.bulAliveTwo = false;
				bullet.destroy();
				canShot = true;
			}
		}
	}
	
	public function getBullet(): BulletTwo
	{
		return bullet;
	}
	
	public function getCanShot():Bool
	{
		return canShot;
	}
}