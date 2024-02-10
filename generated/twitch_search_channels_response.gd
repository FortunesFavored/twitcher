@tool
extends RefCounted

class_name TwitchSearchChannelsResponse

## The list of channels that match the query. The list is empty if there are no matches.
var data: Array[TwitchChannel];

static func from_json(d: Dictionary) -> TwitchSearchChannelsResponse:
	var result = TwitchSearchChannelsResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchChannel.from_json(value));
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

