@tool
extends RefCounted

class_name TwitchGetConduitsResponse

## List of information about the client’s conduits.
var data: Array;

static func from_json(d: Dictionary) -> TwitchGetConduitsResponse:
	var result = TwitchGetConduitsResponse.new();
	result.data = d["data"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["data"] = data;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());
