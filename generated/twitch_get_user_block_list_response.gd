@tool
extends RefCounted

class_name TwitchGetUserBlockListResponse

## The list of blocked users. The list is in descending order by when the user was blocked.
var data: Array[TwitchUserBlockList];

static func from_json(d: Dictionary) -> TwitchGetUserBlockListResponse:
	var result = TwitchGetUserBlockListResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchUserBlockList.from_json(value));
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

