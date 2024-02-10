@tool
extends RefCounted

class_name TwitchUpdateChatSettingsResponse

## The list of chat settings. The list contains a single object with all the settings.
var data: Array[TwitchChatSettingsUpdated];

static func from_json(d: Dictionary) -> TwitchUpdateChatSettingsResponse:
	var result = TwitchUpdateChatSettingsResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchChatSettingsUpdated.from_json(value));
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

