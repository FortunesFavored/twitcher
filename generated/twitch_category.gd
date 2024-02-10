@tool
extends RefCounted

class_name TwitchCategory

## A URL to an image of the game’s box art or streaming category.
var box_art_url: String;
## The name of the game or category.
var name: String;
## An ID that uniquely identifies the game or category.
var id: String;

static func from_json(d: Dictionary) -> TwitchCategory:
	var result = TwitchCategory.new();
	if d.has("box_art_url") && d["box_art_url"] != null:
		result.box_art_url = d["box_art_url"];
	if d.has("name") && d["name"] != null:
		result.name = d["name"];
	if d.has("id") && d["id"] != null:
		result.id = d["id"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["box_art_url"] = box_art_url;
	d["name"] = name;
	d["id"] = id;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

