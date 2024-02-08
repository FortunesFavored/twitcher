@tool
extends RefCounted

class_name TwitchUpdateUserResponse

## A list contains the single user that you updated.
var data: Array[TwitchUser];

static func from_json(d: Dictionary) -> TwitchUpdateUserResponse:
	var result = TwitchUpdateUserResponse.new();
	result.data = d["data"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["data"] = data;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());
