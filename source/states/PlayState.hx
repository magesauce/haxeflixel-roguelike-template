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

	var sys:System;

	var playerTurn:Bool = true;

	override public function create()
	{
		super.create();

		var bg:FlxSprite = new FlxSprite(0, 0);
		bg.loadGraphic(AssetPaths.bg__png);
		add(bg);

		sys = new System();
		add(sys.sprites);

		var components:List<Component> = new List<Component>();
		components.add(new ecs.components.Render(new FlxSprite(480, 60).makeGraphic(TILE_SIZE, TILE_SIZE, FlxColor.PURPLE)));
		components.add(new ecs.components.Harmable(3));
		components.add(new ecs.components.Input());
		sys.create("player", components).addTag("creature");

		var components:List<Component> = new List<Component>();
		components.add(new ecs.components.Render(new FlxSprite(544, 156).makeGraphic(TILE_SIZE, TILE_SIZE, FlxColor.RED)));
		components.add(new ecs.components.Harmable(3));
		sys.create("enemy", components).addTag("creature");
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (playerTurn)
		{
			if (FlxG.keys.justPressed.RIGHT)
			{
				var player:Entity = sys.firstEntityNamed("player");
				player.action = Action.MOVE_RIGHT;
				tick();
			}

			if (FlxG.keys.justPressed.LEFT)
			{
				var player:Entity = sys.firstEntityNamed("player");
				player.action = Action.MOVE_LEFT;
				tick();
			}

			if (FlxG.keys.justPressed.UP)
			{
				var player:Entity = sys.firstEntityNamed("player");
				player.action = Action.MOVE_UP;
				tick();
			}

			if (FlxG.keys.justPressed.DOWN)
			{
				var player:Entity = sys.firstEntityNamed("player");
				player.action = Action.MOVE_DOWN;
				tick();
			}
		}
	}

	private function tick()
	{
		if (sys.entities.length > 0)
		{
			var entity = sys.entities[0];
			entity.energy += 100;
			trace("Increased energy of " + entity.name + " by 100. New energy level: " + entity.energy);

			// If enough energy
			if (entity.energy > 0)
			{
				if (!playerTurn)
				{
					if (entity.name == "player")
					{
						playerTurn = true;
						return;
					}
					else
					{
						// Anyone else
						sys.sortEntities();
						new FlxTimer().start(.025, progressTime, 1);
					}
				}
				else
				{
					entity.energy -= entity.takeTurn();
					playerTurn = false;
					sys.sortEntities();
					new FlxTimer().start(.025, progressTime, 1);
				}
			}
		}
	}

	private function progressTime(t:FlxTimer)
	{
		tick();
	}
}
