package entities.player;

import flixel.FlxSprite;
import flixel.FlxSubState;
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
	private var lifeBar:FlxBar;
	private var subst:FlxSubState;
	private var life:Int;

	public function new(?X:Float=0, ?Y:Float=0, _subst:FlxSubState) 
	{
		super(X, Y);
		//Init
		velocity.x = 0;
		angularVelocity = 0;
		canShot = true;
		loadGraphic(AssetPaths.Player_Two__png);
		scale.set(0.5, 0.5);
		width = 80;
		height = 80;
		centerOffsets();
		distShot = 0;
		life = Reg.maxPlayerLife;
		subst = _subst;
		lifeBar = new FlxBar(x, y, FlxBarFillDirection.LEFT_TO_RIGHT, 100, 20, this, "life", 0, Reg.maxPlayerLife, true);
		subst.add(lifeBar);
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		lifeBar.setPosition(x, y - 100);
		movement();
		distanceShot();
		accelerationControl();
		breck();
		checkBoundaries();
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
	
	private function checkBoundaries():Void
	{
		if (x < 0 ){
			x = 0;
			velocity.set(0, 0);
		}
		if (x + width > FlxG.width){
			x = FlxG.width - width -1;
			velocity.set(0, 0);
		}
		if (y <  0){
			y = 0;
			velocity.set(0, 0);
		}
		if (y + height > FlxG.height){
			velocity.set(0, 0);
			y = FlxG.height - height -1;
		}
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
					velocity.y -= 0.5;
					velocity.x += 0.5;
				}
				if (angle > 91 &&  angle < 179)
				{
					velocity.x += 0.5;
					velocity.y += 0.5;
				}
				if (angle > 181 && angle < 269)
				{
					velocity.x -= 0.5;
					velocity.y += 0.5;
				}
				if (angle > 271 && angle < 360)
				{
				velocity.x -= 0.5;
				velocity.y += 0.5;
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
					velocity.y -= 0.5;
					velocity.x -= 0.5;
				}
				if (angle < -91 &&  angle > -179)
				{
					velocity.x -= 0.5;
					velocity.y += 0.5;
				}
				if (angle < -181 && angle > -269)
				{
					velocity.x += 0.5;
					velocity.y += 0.5;
				}
				if (angle < -271 && angle > -360)
				{
				velocity.x += 0.5;
				velocity.y -= 0.5;
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
					velocity.y += 0.5;
					velocity.x -= 0.5;
				}
				if (angle > 91 &&  angle < 179)
				{
					velocity.x -= 0.5;
					velocity.y -= 0.5;
				}
				if (angle > 181 && angle < 269)
				{
					velocity.x += 0.5;
					velocity.y -= 0.5;
				}
				if (angle > 271 && angle < 360)
				{
				velocity.x += 0.5;
				velocity.y += 0.5;
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
					velocity.y += 0.5;
					velocity.x += 0.5;
				}
				if (angle < -91 &&  angle > -179)
				{
					velocity.x += 0.5;
					velocity.y -= 0.5;
				}
				if (angle < -181 && angle > -269)
				{
					velocity.x -= 0.5;
					velocity.y -= 0.5;
				}
				if (angle < -271 && angle > -360)
				{
					velocity.x -= 0.5;
					velocity.y += 0.5;
				}
			}
		}
		if (FlxG.keys.pressed.D)
		{
			angularVelocity += 1;
		}
		if (FlxG.keys.pressed.A)
		{
			angularVelocity -= 1;
		}
		if (breck())
		{
			if (velocity.x > 0)
				velocity.x  -= 2;
			if (velocity.x < 0)
				velocity.x +=  2;
			if (velocity.y > 0)
				velocity.y -= 2;
			if (velocity.y < 0)
				velocity.y += 2;
			if (angularVelocity > 0)
				angularVelocity -= 2;
			if (angularVelocity < 0)
				angularVelocity += 2;
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
				bullet = new BulletTwo(x + (width / 2), y + (height / 2), distShot);
				FlxG.sound.play(AssetPaths.Cannon__ogg);
				Reg.bulAliveTwo = true;
				subst.add(bullet);
				canShot = false;
			}
			distShot = 0;
		} 
		if (Reg.bulAliveTwo)
		{
			if (bullet.getShot() == 0)
			{
				Reg.bulAliveTwo = false;
				bullet.kill();
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
	
	public function setCanShot(s:Bool):Void
	{
		canShot = s;
	}
	
	public function getDamage():Void
	{
		life--;
		if (life <= 0)
		{
			Reg.pOneWin = true;
			Reg.battleEnd = true;
			lifeBar.destroy();
			destroy();
		}
	}
	
	public function getLife():Int
	{
		return life;
	}
	
	public function getLifeBar():FlxBar
	{
		return lifeBar;
	}
}