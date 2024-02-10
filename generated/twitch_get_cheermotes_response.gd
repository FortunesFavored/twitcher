@tool
extends RefCounted

class_name TwitchGetCheermotesResponse

## The list of Cheermotes. The list is in ascending order by the `order` field’s value.
var data: Array[TwitchCheermote];

static func from_json(d: Dictionary) -> TwitchGetCheermotesResponse:
	var result = TwitchGetCheermotesResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchCheermote.from_json(value));
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

