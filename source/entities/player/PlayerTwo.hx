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

class PlayerTwo extends Player 
{
	private var distShot:Int;
	private var bullet: BulletTwo;

	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		//Init
		loadGraphic(AssetPaths.pirate_ship_00000__png);
		scale.set(0.5, 0.5);
		updateHitbox();
		distShot = 0;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
	}
	
	override function movement():Void 
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
	
	override function breck():Bool //retorna verdadero cuando una tecla no esta presionada
	{
		if (!(FlxG.keys.pressed.W) && !(FlxG.keys.pressed.S) 
		&& !(FlxG.keys.pressed.D) && !(FlxG.keys.pressed.A))
			return true;
		return false;
	}
	
	override function distanceShot():Void 
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
				bullet = new BulletTwo(x, y, distShot, direccion);
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
}