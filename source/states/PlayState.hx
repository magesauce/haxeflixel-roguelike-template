package states;

import actors.Actor;
import actors.Player;
import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.util.FlxSort;

class PlayState extends FlxState
{
	inline static var TILE_SIZE:Int = 16;

	var actors:FlxTypedGroup<Actor>;

	override public function create()
	{
		super.create();

		actors = new FlxTypedGroup<Actor>();
		add(actors);

		var player:Player = new Player(100, 100);
		registerActor(player, 3);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.LEFT)
		{
			actors.forEachOfType(Player, function(player:Player)
			{
				player.action = Action.Move_Left;
			});
			tick();
		}

		if (FlxG.keys.justPressed.RIGHT)
		{
			actors.forEachOfType(Player, function(player:Player)
			{
				player.action = Action.Move_Right;
			});

			tick();
		}

		if (FlxG.keys.justPressed.UP)
		{
			actors.forEachOfType(Player, function(player:Player)
			{
				player.action = Action.Move_Up;
			});
			tick();
		}

		if (FlxG.keys.justPressed.DOWN)
		{
			actors.forEachOfType(Player, function(player:Player)
			{
				player.action = Action.Move_Down;
			});
			tick();
		}
	}

	private function registerActor(actor:Actor, speed:Int)
	{
		actor.speed = speed;
		actors.add(actor);
	}

	private function releaseActor(actor:Actor)
	{
		actors.remove(actor);
	}

	private function tick()
	{
		// TODO: sort actors

		// check actions
		actors.forEach(function(actor:Actor)
		{
			// Every tick the actor gains energy for their action.
			actor.energy++;
			switch (Type.getClassName(Type.getClass(actor)).split('.')[1])
			{
				case "Player":
					if (actor.action == Action.Move_Left) {}

					switch (actor.action)
					{
						case Action.Wait:
						case Action.Move_Left:
							if (actor.energy > 0)
							{
								actor.x -= TILE_SIZE;
								actor.energy--;
							}
						case Action.Move_Right:
							if (actor.energy > 0)
							{
								actor.x += TILE_SIZE;
								actor.energy--;
							}
						case Action.Move_Up:
							if (actor.energy > 0)
							{
								actor.y -= TILE_SIZE;
								actor.energy--;
							}
						case Action.Move_Down:
							if (actor.energy > 0)
							{
								actor.y += TILE_SIZE;
								actor.energy--;
							}
					}
				default:
			}
		});
	}
}
