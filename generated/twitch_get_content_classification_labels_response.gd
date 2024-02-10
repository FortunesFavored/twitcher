@tool
extends RefCounted

class_name TwitchGetContentClassificationLabelsResponse

## A list that contains information about the available content classification labels.
var data: Array[TwitchContentClassificationLabel];

static func from_json(d: Dictionary) -> TwitchGetContentClassificationLabelsResponse:
	var result = TwitchGetContentClassificationLabelsResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchContentClassificationLabel.from_json(value));
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

