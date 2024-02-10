@tool
extends RefCounted

class_name TwitchGetCreatorGoalsResponse

## The list of goals. The list is empty if the broadcaster hasn’t created goals.
var data: Array[TwitchCreatorGoal];

static func from_json(d: Dictionary) -> TwitchGetCreatorGoalsResponse:
	var result = TwitchGetCreatorGoalsResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchCreatorGoal.from_json(value));
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

