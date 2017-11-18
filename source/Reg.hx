package;
import entities.player.PlayerOne;
import entities.player.PlayerTwo;

/**
 * ...
 * @author ...
 */
class Reg 
{
	//Battle
	static public var pOneWin:Bool = false;
	static public var pTwoWin:Bool = false;
	//Refer
	static public var playerOne:PlayerOne;
	static public var playerTwo:PlayerTwo;
	//Player
	static public var maxSpeed:Int = 50;
	static public var maxAngSpeed:Int = 30;
	static public var maxPlayerLife:Int = 10;
	//Bullet
	static public var minDistShot:Int = 60;
	static public var maxDistShot:Int = 360;
	static public var bulletSpeed:Int = 150;
	static public var bulAliveOne:Bool = false;
	static public var bulAliveTwo:Bool = false;
	
}