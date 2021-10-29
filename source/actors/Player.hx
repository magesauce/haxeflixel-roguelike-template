package actors;

import actors.Actor;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Player extends Actor
{
	override public function new(X:Float, Y:Float)
	{
		super(X, Y);

		makeGraphic(16, 16, FlxColor.PURPLE);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
