@tool
extends RefCounted

class_name TwitchCreatePollResponse

## A list that contains the single poll that you created.
var data: Array[TwitchPoll];

static func from_json(d: Dictionary) -> TwitchCreatePollResponse:
	var result = TwitchCreatePollResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchPoll.from_json(value));
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

