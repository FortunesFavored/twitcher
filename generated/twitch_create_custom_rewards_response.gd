@tool
extends RefCounted

class_name TwitchCreateCustomRewardsResponse

## A list that contains the single custom reward you created.
var data: Array[TwitchCustomReward];

static func from_json(d: Dictionary) -> TwitchCreateCustomRewardsResponse:
	var result = TwitchCreateCustomRewardsResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchCustomReward.from_json(value));
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

