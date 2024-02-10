@tool
extends RefCounted

class_name TwitchEndGuestStarSessionResponse

## Summary of the session details when the session was ended.
var data: Array[TwitchGuestStarSession];

static func from_json(d: Dictionary) -> TwitchEndGuestStarSessionResponse:
	var result = TwitchEndGuestStarSessionResponse.new();
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

