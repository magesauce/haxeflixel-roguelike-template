package ecs;

import ecs.components.Component;
import ecs.entities.Entity;
import flixel.FlxSprite;
import flixel.group.FlxGroup;

class System
{
	public var entities:Array<Entity>;
	public var sprites:FlxTypedGroup<FlxSprite>;

	public function new()
	{
		// Entities is a list of all of the entities in the game
		entities = new Array<Entity>();
		// Sprites is a typed group that holds all sprites
		sprites = new FlxTypedGroup<FlxSprite>();
	}

	public function sortEntities()
	{
		entities.sort((a, b) ->
		{
			Reflect.compare(a.energy, b.energy);
		});
	}

	// Add a new entity to the system
	public function create(name:String, components:List<Component>):Entity
	{
		// Create new empty entity
		var entity:Entity = new Entity();

		// Set entity variables
		entity.name = name;
		for (component in components)
		{
			entity.components.push(component);
		}

		// If the entity has a render component, then add the sprite to the group
		if (entity.component("Render") != null)
		{
			entity.component("Render").setSprite(name);
			sprites.add(entity.component("Render").sprite);
		}

		// Add entities to all entities list
		entities.push(entity);

		return entity;
	}

	// Add a new entity to the system
	public function remove(name:String)
	{
		// Get the first entity that matches the name provided
		var entity:Entity = entities.filter(function(e) return e.name == name)[0];

		// Remove sprite and entity from system
		if (entity.component("Render") != null)
		{
			sprites.remove(entity.component("Render").sprite);
		}
		entities.remove(entity);
	}

	// Get the first entity of the provided name
	public function firstEntityNamed(name:String):Entity
	{
		return entities.filter(function(e) return e.name == name)[0];
	}

	// Get all entities with the provided name
	public function allEntitiesNamed(name:String):Array<Entity>
	{
		return entities.filter(function(e) return e.name == name);
	}

	public function entitiesWith(component:String):Array<Entity>
	{
		return entities.filter(function(e) return e.component(component).name == component);
	}

	public function entitiesTagged(tag:String):Array<Entity>
	{
		return entities.filter(function(e) return e.tag(tag).name == tag);
	}
}
