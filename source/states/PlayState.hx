package states;

import ecs.System;
import ecs.components.Component;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;
import flixel.util.FlxSort;
import flixel.util.FlxTimer;
import sys.thread.Deque;

class PlayState extends FlxState
{
	inline static var TILE_SIZE:Int = 16;

	var sys:System;

	override public function create()
	{
		super.create();

		sys = new System();
		add(sys.sprites);

		var components:List<Component> = new List<Component>();
		components.add(new ecs.components.Render(new FlxSprite(0, 0).makeGraphic(TILE_SIZE, TILE_SIZE, FlxColor.PURPLE)));
		components.add(new ecs.components.Position(0, 0));
		components.add(new ecs.components.Harmable(3));
		components.add(new ecs.components.Input());
		sys.create("player", components).addTag("creature");

		var components:List<Component> = new List<Component>();
		components.add(new ecs.components.Render(new FlxSprite(16, 0).makeGraphic(TILE_SIZE, TILE_SIZE, FlxColor.RED)));
		components.add(new ecs.components.Position(1, 0));
		components.add(new ecs.components.Harmable(3));
		sys.create("enemy", components).addTag("creature");

		var components:List<Component> = new List<Component>();
		components.add(new ecs.components.Render(new FlxSprite(48, 32).makeGraphic(TILE_SIZE, TILE_SIZE, FlxColor.RED)));
		components.add(new ecs.components.Position(3, 2));
		components.add(new ecs.components.Harmable(3));
		sys.create("enemy", components).addTag("creature");

		tick();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	private function tick()
	{
		if (sys.entities.length > 0)
		{
			var entity = sys.entities[0];
			entity.energy += 100;
			trace("Increased energy of " + entity.name + " by 100. New energy level: " + entity.energy);

			if (entity.energy > 0)
			{
				// Check for input from player
				if (entity.component("Input") != null) {}

				// Insert entity into list where it belongs
				sys.sortEntities();
			}
		}

		new FlxTimer().start(2.0, progressTime, 1);
	}

	private function progressTime(t:FlxTimer)
	{
		tick();
	}
}
