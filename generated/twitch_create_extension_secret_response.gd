@tool
extends RefCounted

class_name TwitchCreateExtensionSecretResponse

## A list that contains the newly added secrets.
var data: Array[TwitchExtensionSecret];

static func from_json(d: Dictionary) -> TwitchCreateExtensionSecretResponse:
	var result = TwitchCreateExtensionSecretResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchExtensionSecret.from_json(value));
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

