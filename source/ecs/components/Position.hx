package ecs.components;

class Position implements Component
{
	public var name:String = "Position";

	public var x:Int = 0;
	public var y:Int = 0;

	public function new(X:Int, Y:Int)
	{
		x = X;
		y = Y;
	}

	public function moveLeft()
	{
		x--;
	}

	public function moveRight()
	{
		x++;
	}

	public function moveUp()
	{
		y--;
	}

	public function moveDown()
	{
		y++;
	}
}
