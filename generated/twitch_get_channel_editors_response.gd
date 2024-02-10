@tool
extends RefCounted

class_name TwitchGetChannelEditorsResponse

## A list of users that are editors for the specified broadcaster. The list is empty if the broadcaster doesn’t have editors.
var data: Array[TwitchChannelEditor];

static func from_json(d: Dictionary) -> TwitchGetChannelEditorsResponse:
	var result = TwitchGetChannelEditorsResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchChannelEditor.from_json(value));
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

