package states;

import actors.Actor;
import actors.Player;
import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup;

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
		registerActor(player, 1);
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
		actors.forEach(function(actor:Actor)
		{
			switch (Type.getClassName(Type.getClass(actor)).split('.')[1])
			{
				case "Player":
					if (actor.action == Action.Move_Left) {}

					switch (actor.action)
					{
						case Action.Wait:
						case Action.Move_Left:
							actor.x -= TILE_SIZE;
						case Action.Move_Right:
							actor.x += TILE_SIZE;
						case Action.Move_Up:
							actor.y -= TILE_SIZE;
						case Action.Move_Down:
							actor.y += TILE_SIZE;
					}
				default:
			}
		});
	}
}
