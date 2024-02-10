@tool
extends RefCounted

class_name TwitchCreateGuestStarSessionResponse

## Summary of the session details.
var data: Array[TwitchGuestStarSession];

static func from_json(d: Dictionary) -> TwitchCreateGuestStarSessionResponse:
	var result = TwitchCreateGuestStarSessionResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchGuestStarSession.from_json(value));
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

