@tool
extends RefCounted

class_name TwitchUpdateRedemptionStatusResponse

## The list contains the single redemption that you updated.
var data: Array[TwitchCustomRewardRedemption];

static func from_json(d: Dictionary) -> TwitchUpdateRedemptionStatusResponse:
	var result = TwitchUpdateRedemptionStatusResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchCustomRewardRedemption.from_json(value));
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

