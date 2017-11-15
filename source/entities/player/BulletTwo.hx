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
	private var direccion: Int;
	private var impact: Bool;

	public function new(?X:Float=0, ?Y:Float=0, _distShot:Int, _direccion: Int) 
	{
		super(X, Y);
		loadGraphic(AssetPaths.Bullet__png);
		scale.set(0.2, 0.2);
		updateHitbox();
		distShot = _distShot;
		direccion = _direccion;
		impact = false;
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		velocity.set(0, 0);
		switch (direccion) 
		{
			case 1:
				velocity.x = Reg.bulletSpeed;
			case 2:
				velocity.y = Reg.bulletSpeed;
			case 3:
				velocity.x = -Reg.bulletSpeed;
			case 4:
				velocity.y = -Reg.bulletSpeed;
		}
		checkBoundaries();
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