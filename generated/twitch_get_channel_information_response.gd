@tool
extends RefCounted

class_name TwitchGetChannelInformationResponse

## A list that contains information about the specified channels. The list is empty if the specified channels weren’t found.
var data: Array[TwitchChannelInformation];

static func from_json(d: Dictionary) -> TwitchGetChannelInformationResponse:
	var result = TwitchGetChannelInformationResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchChannelInformation.from_json(value));
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

