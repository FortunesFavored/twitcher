@tool
extends RefCounted

class_name TwitchGetAutoModSettingsResponse

## The list of AutoMod settings. The list contains a single object that contains all the AutoMod settings.
var data: Array[TwitchAutoModSettings];

static func from_json(d: Dictionary) -> TwitchGetAutoModSettingsResponse:
	var result = TwitchGetAutoModSettingsResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchAutoModSettings.from_json(value));
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

