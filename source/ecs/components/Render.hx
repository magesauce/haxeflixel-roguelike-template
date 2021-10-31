package ecs.components;

import flixel.FlxSprite;
import flixel.animation.FlxAnimation;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import openfl.display.Sprite;
import states.PlayState;

class Render implements Component
{
	public var name:String = "Render";

	public var sprite:FlxSprite;
	public var position:FlxPoint;

	public function new(X:Int, Y:Int)
	{
		position = new FlxPoint();
		sprite = new FlxSprite(0, 0);

		place(X, Y);
	}

	public function place(X:Int, Y:Int)
	{
		position.x = X;
		position.y = Y;

		sprite.x = 480 + (X * PlayState.TILE_SIZE);
		sprite.y = 60 + (Y * PlayState.TILE_SIZE);
	}

	public function setSprite(entityName:String)
	{
		switch (entityName)
		{
			case "player":
				sprite.makeGraphic(32, 32, FlxColor.PURPLE);
			case "fanatic":
				sprite.makeGraphic(32, 32, FlxColor.BLUE);
			case "ghost":
				sprite.makeGraphic(32, 32, FlxColor.CYAN);
			default:
				sprite.makeGraphic(PlayState.TILE_SIZE, PlayState.TILE_SIZE, FlxColor.GREEN);
		}
	}
}
