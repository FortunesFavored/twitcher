@tool
extends RefCounted

class_name TwitchUpdateDropsEntitlementsResponse

## A list that indicates which entitlements were successfully updated and those that weren’t.
var data: Array[TwitchDropsEntitlementUpdated];

static func from_json(d: Dictionary) -> TwitchUpdateDropsEntitlementsResponse:
	var result = TwitchUpdateDropsEntitlementsResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchDropsEntitlementUpdated.from_json(value));
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

