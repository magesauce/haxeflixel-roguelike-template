package components;

class Harmable implements Component
{
	public var name:String = "Harmable";

	var health:Int = 0;

	public function new(health:Int)
	{
		this.health = health;
	}
}
