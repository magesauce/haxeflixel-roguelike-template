package ecs.components;

import flixel.math.FlxPoint;

class Position implements Component
{
	public var name:String = "Position";

	public var position:FlxPoint;

	public function new(X:Int, Y:Int)
	{
		position = new FlxPoint();

		position.x = X;
		position.y = Y;
	}

	public function moveLeft()
	{
		position.x--;
	}

	public function moveRight()
	{
		position.x++;
	}

	public function moveUp()
	{
		position.y--;
	}

	public function moveDown()
	{
		position.y++;
	}
}
