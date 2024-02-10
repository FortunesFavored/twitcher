@tool
extends RefCounted

class_name TwitchGetUserChatColorResponse

## The list of users and the color code they use for their name.
var data: Array[TwitchUserChatColor];

static func from_json(d: Dictionary) -> TwitchGetUserChatColorResponse:
	var result = TwitchGetUserChatColorResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchUserChatColor.from_json(value));
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

