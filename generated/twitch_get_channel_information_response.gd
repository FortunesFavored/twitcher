@tool
extends RefCounted

class_name TwitchGetChannelInformationResponse

## A list that contains information about the specified channels. The list is empty if the specified channels weren’t found.
var data: Array[TwitchChannelInformation];

static func from_json(d: Dictionary) -> TwitchGetChannelInformationResponse:
	var result = TwitchGetChannelInformationResponse.new();
	result.data = d["data"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["data"] = data;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

