@tool
extends RefCounted

class_name TwitchGetCharityCampaignResponse

## A list that contains the charity campaign that the broadcaster is currently running. The list is empty if the broadcaster is not running a charity campaign; the campaign information is not available after the campaign ends.
var data: Array[TwitchCharityCampaign];

static func from_json(d: Dictionary) -> TwitchGetCharityCampaignResponse:
	var result = TwitchGetCharityCampaignResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchCharityCampaign.from_json(value));
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

