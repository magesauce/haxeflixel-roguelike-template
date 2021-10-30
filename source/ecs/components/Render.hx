package ecs.components;

import flixel.FlxSprite;
import flixel.math.FlxPoint;
import openfl.display.Sprite;
import states.PlayState;

class Render implements Component
{
	public var name:String = "Render";

	public var sprite:FlxSprite;
	public var position:FlxPoint;

	public function new(sprite:FlxSprite)
	{
		this.sprite = sprite;

		position = new FlxPoint();

		position.x = (sprite.x - 480) / PlayState.TILE_SIZE;
		position.y = (sprite.y + 4) / PlayState.TILE_SIZE;
	}

	public function place(X:Int, Y:Int)
	{
		position.x = X;
		position.y = Y;

		sprite.x = 480 + (X * PlayState.TILE_SIZE);
		sprite.y = -4 + (Y * PlayState.TILE_SIZE);
	}
}
