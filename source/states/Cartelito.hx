package states;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

/**
 * ...
 * @author Tomás Mugetti
 */
class Cartelito extends FlxSprite 
{
	private var estado:MapState;
	private var texto:FlxText;
	private var exitButton:FlxButton;
	private var irButton:FlxButton;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset, _estado:MapState) 
	{
		super(X, Y, SimpleGraphic);
		this.visible = false;
		estado = _estado;
		
		texto = new FlxText(this.x, this.y, 500, "Tardaras 1 hora(s) en llegar", 50);
		estado.add(texto);
		
		exitButton = new FlxButton(this.x + texto.width, this.y + texto.height, "", cerrar);
		exitButton.loadGraphic(AssetPaths.cancelar__png);
		exitButton.x -= exitButton.width;
		estado.add(exitButton);
		
		irButton = new FlxButton(this.x, this.y + texto.height, "", ir);
		irButton.loadGraphic(AssetPaths.ir__png);
		//irButton.x += irButton.width / 2;
		estado.add(irButton);
	}
	
	private function cerrar():Void
	{
		estado.sePuede = true;
		estado.remove(texto);
		estado.remove(exitButton);
		estado.remove(irButton);
		estado.remove(this);
		destroy();
	}
	
	private function ir():Void
	{
		cerrar();
	}
}