package actors;

import flixel.FlxSprite;

class Actor extends FlxSprite
{
	public var speed:Int = 0;

	override public function new(X:Float, Y:Float)
	{
		super(X, Y);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
