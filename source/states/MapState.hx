package states;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.ui.FlxButton;
import source.states.MenuState;
import flixel.FlxG;

/**
 * ...
 * @author tu mami
 */
class MapState extends FlxState 
{
	private var fondo:FlxSprite;
	private var exitButton:FlxButton;
	public var sePuede:Bool;
	public function new() 
	{
		super();
		sePuede = true;
		
		fondo = new FlxSprite();
		fondo.loadGraphic(AssetPaths.islas__png);
		add(fondo);
		
		//FlxG.sound.playMusic();
		
		exitButton = new FlxButton("", salir);
		exitButton.loadGraphic(AssetPaths.salir__png);
		exitButton.updateHitbox();
		exitButton.x = camera.width - exitButton.width - 50;
		exitButton.y = camera.height - exitButton.height - 50;
		add(exitButton);
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (!FlxG.mouse.overlaps(exitButton) && FlxG.mouse.justPressed) 
		{
			cartelito();
		}
	}			
	
	private function salir():Void
	{
		FlxG.switchState(new MenuState());
	}
	
	private function cartelito():Void
	{
		if (sePuede) 
		{
			sePuede = false;
			var equis:Float;
			var i:Float;
			equis = FlxG.mouse.x;
			i = FlxG.mouse.y;
			var cartelito:Cartelito;
			cartelito = new Cartelito(equis, i,null, this);
			add(cartelito);
		}
		
	}	
}