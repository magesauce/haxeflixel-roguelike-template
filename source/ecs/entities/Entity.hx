package ecs.entities;

import ecs.components.Component;
import flixel.FlxG;

enum Action
{
	NONE;
	WAIT;
	MOVE_RIGHT;
	MOVE_LEFT;
	MOVE_UP;
	MOVE_DOWN;
}

class Entity
{
	public var name:String;
	public var components:Array<Component>;
	public var tags:List<String>;

	public var speed:Int = 0;
	public var energy:Int = 0;

	public var action:Action;

	public function new()
	{
		components = new Array<Component>();
		tags = new List<String>();
		action = Action.NONE;
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
		var cost:Int = 0;
		switch (action)
		{
			case NONE:
				cost = -1;
			case WAIT:
				cost = 0;
			case MOVE_RIGHT:
				component("Render").place(component("Render").position.x + 1, component("Render").position.y);
				if (name == "player")
				{
					FlxG.sound.play(AssetPaths.player_move__wav);
				}
				cost = 100;
			case MOVE_LEFT:
				component("Render").place(component("Render").position.x - 1, component("Render").position.y);
				if (name == "player")
				{
					FlxG.sound.play(AssetPaths.player_move__wav);
				}
				cost = 100;
			case MOVE_UP:
				component("Render").place(component("Render").position.x, component("Render").position.y - 1);
				if (name == "player")
				{
					FlxG.sound.play(AssetPaths.player_move__wav);
				}
				cost = 100;
			case MOVE_DOWN:
				component("Render").place(component("Render").position.x, component("Render").position.y + 1);
				if (name == "player")
				{
					FlxG.sound.play(AssetPaths.player_move__wav);
				}
				cost = 100;
		}

		action = Action.NONE;
		return cost;
	}
}
