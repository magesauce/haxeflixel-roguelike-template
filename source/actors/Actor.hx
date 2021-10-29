package actors;

import flixel.FlxSprite;

enum Action
{
	Wait;
	Move_Left;
	Move_Right;
	Move_Up;
	Move_Down;
}

class Actor extends FlxSprite
{
	public var speed:Int = 0;

	public var action:Action;

	override public function new(X:Float, Y:Float)
	{
		super(X, Y);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
