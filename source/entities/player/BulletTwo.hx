package entities.player;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author holis
 */
class BulletTwo extends FlxSprite 
{

	private var distShot: Int;
	private var impact: Bool;

	public function new(?X:Float=0, ?Y:Float=0, _distShot:Int) 
	{
		super(X, Y);
		loadGraphic(AssetPaths.Bullet__png);
		scale.set(0.2, 0.2);
		updateHitbox();
		distShot = _distShot;
		impact = false;
		tracking();
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		checkBoundaries();
	}
	
	private function tracking()
	{
		if (x >= Reg.playerOne.x && x <= Reg.playerOne.x + Reg.playerOne.width)
			velocity.x = 0;
		else
			if (Reg.playerOne.x > x)
				velocity.x = Reg.bulletSpeed;
			else
				velocity.x = -Reg.bulletSpeed;
		if (y >= Reg.playerOne.y && y <= Reg.playerOne.y + Reg.playerOne.height)
			velocity.y = 0;
		else
			if (Reg.playerOne.y > y)
				velocity.y = Reg.bulletSpeed;
			else
				velocity.y = -Reg.bulletSpeed;
	}
	
	private function checkBoundaries():Void
	{
		if (distShot > 0)
			distShot --;
		if (distShot < 5)
			impact = true;
	}
	
	public function getImpact():Bool
	{
		return impact;
	}
	
	public function getShot():Int
	{
		return distShot;
	}
	
}