@tool
extends RefCounted

class_name TwitchCheckUserSubscriptionResponse

## A list that contains a single object with information about the user’s subscription.
var data: Array[TwitchUserSubscription];

static func from_json(d: Dictionary) -> TwitchCheckUserSubscriptionResponse:
	var result = TwitchCheckUserSubscriptionResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchUserSubscription.from_json(value));
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

