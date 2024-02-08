@tool
extends RefCounted

class_name TwitchUpdateRedemptionStatusResponse

## The list contains the single redemption that you updated.
var data: Array[TwitchCustomRewardRedemption];

static func from_json(d: Dictionary) -> TwitchUpdateRedemptionStatusResponse:
	var result = TwitchUpdateRedemptionStatusResponse.new();
	result.data = d["data"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["data"] = data;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());
