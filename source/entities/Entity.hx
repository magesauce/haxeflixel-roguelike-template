package entities;

import components.Component;

enum Action
{
	MOVE;
}

class Entity
{
	public var name:String;
	public var components:Array<Component>;
	public var tags:List<String>;

	public var speed:Int = 0;
	public var energy:Int = 0;

	public function new()
	{
		components = new Array<Component>();
		tags = new List<String>();
	}

	public function addComponent(component:Component)
	{
		components.push(component);
	}

	public function addTag(tag:String)
	{
		tags.add(tag);
	}

	public function component(component:String):Dynamic
	{
		return components.filter(function(c) return c.name == component)[0];
	}

	public function tag(tag:String)
	{
		return components.filter(function(t) return t.name == tag)[0];
	}

	public function update(elapsed:Float) {}

	public function takeTurn():Int
	{
		return 0;
	}
}
