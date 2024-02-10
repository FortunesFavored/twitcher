@tool
extends RefCounted

class_name TwitchCreateStreamMarkerResponse

## A list that contains the single marker that you added.
var data: Array[TwitchStreamMarkerCreated];

static func from_json(d: Dictionary) -> TwitchCreateStreamMarkerResponse:
	var result = TwitchCreateStreamMarkerResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchStreamMarkerCreated.from_json(value));
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["data"] = [];
	if data != null:
		for value in data:
			d["data"].append(value.to_dict());
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

