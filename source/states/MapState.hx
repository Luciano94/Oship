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
	public function new() 
	{
		super();
		fondo = new FlxSprite();
		fondo.loadGraphic(AssetPaths.islas__png);
		add(fondo);
		
		exitButton = new FlxButton("", salir);
		exitButton.loadGraphic(AssetPaths.salir__png);
		exitButton.updateHitbox();
		exitButton.x = camera.width - exitButton.width - 50;
		exitButton.y = camera.height - exitButton.height - 50;
		add(exitButton);
	}
	
	override public function update(elapsed:Float):Void
	{
		super(elapsed);
		if (!FlxG.overlap(FlxG.mouse,exitButton) && FlxG.mouse.justPressed) 
		{
			
		}
	}			
	
	private function salir():Void
	{
		switchTo(switchTo(new MenuState()));
	}
	
	private function elegirIsla():Void
	{
		
	}
	
}