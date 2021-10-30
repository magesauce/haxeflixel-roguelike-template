package ecs.components;

import flixel.FlxSprite;
import openfl.display.Sprite;

class Render implements Component
{
	public var name:String = "Render";

	public var sprite:FlxSprite;

	public function new(sprite:FlxSprite)
	{
		this.sprite = sprite;
	}
}
