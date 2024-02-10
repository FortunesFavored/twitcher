@tool
extends RefCounted

class_name TwitchGetChannelChatBadgesResponse

## The list of chat badges. The list is sorted in ascending order by `set_id`, and within a set, the list is sorted in ascending order by `id`.
var data: Array[TwitchChatBadge];

static func from_json(d: Dictionary) -> TwitchGetChannelChatBadgesResponse:
	var result = TwitchGetChannelChatBadgesResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchChatBadge.from_json(value));
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

