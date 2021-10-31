package states;

import ecs.System;
import ecs.components.Component;
import ecs.entities.Entity;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class PlayState extends FlxState
{
	public inline static var TILE_SIZE:Int = 32;
	public inline static var BOARD_SIZE:Int = 30;

	var sys:System;

	override public function create()
	{
		super.create();

		var bg:FlxSprite = new FlxSprite(0, 0);
		bg.loadGraphic(AssetPaths.bg__png);
		add(bg);

		sys = new System();
		add(sys.sprites);

		var components:List<Component> = new List<Component>();
		components.add(new ecs.components.Render(0, 0));
		components.add(new ecs.components.Harmable(3));
		components.add(new ecs.components.Input());
		sys.create("player", components).addTag("creature");

		var components:List<Component> = new List<Component>();
		components.add(new ecs.components.Render(2, 2));
		components.add(new ecs.components.Harmable(3));
		sys.create("fanatic", components).addTag("creature");

		var components:List<Component> = new List<Component>();
		components.add(new ecs.components.Render(5, 10));
		components.add(new ecs.components.Harmable(3));
		sys.create("ghost", components).addTag("creature");
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.RIGHT)
		{
			var player:Entity = sys.firstEntityNamed("player");
			player.action = Action.MOVE_RIGHT;
		}

		if (FlxG.keys.justPressed.LEFT)
		{
			var player:Entity = sys.firstEntityNamed("player");
			player.action = Action.MOVE_LEFT;
		}

		if (FlxG.keys.justPressed.UP)
		{
			var player:Entity = sys.firstEntityNamed("player");
			player.action = Action.MOVE_UP;
		}

		if (FlxG.keys.justPressed.DOWN)
		{
			var player:Entity = sys.firstEntityNamed("player");
			player.action = Action.MOVE_DOWN;
		}

		tick();
	}

	private function tick()
	{
		if (sys.entities.length > 0)
		{
			// Grab the first entity on the stack
			var entity = sys.entities[0];

			// If the player has not chosen an action, then we must wait until they do before proceeding
			if (entity.name == "player" && entity.action == Action.NONE)
				return;

			entity.energy += 100;
			trace("Increased energy of " + entity.name + " by 100. New energy level: " + entity.energy);
			// If enough energy
			if (entity.energy > 0)
			{
				entity.energy -= entity.takeTurn();
				sys.sortEntities();
			}
		}
	}
}
