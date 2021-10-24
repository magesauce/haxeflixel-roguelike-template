package states;

import actors.Actor;
import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup;

class PlayState extends FlxState
{
	var actors:FlxTypedGroup<Actor>;

	override public function create()
	{
		super.create();

		actors = new FlxTypedGroup<Actor>();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.LEFT)
		{
			tick();
		}

		if (FlxG.keys.justPressed.RIGHT)
		{
			tick();
		}

		if (FlxG.keys.justPressed.UP)
		{
			tick();
		}

		if (FlxG.keys.justPressed.DOWN)
		{
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
			trace(actor.speed);
		});
	}
}
