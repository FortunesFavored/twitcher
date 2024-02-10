@tool
extends RefCounted

class_name TwitchGetChannelTeamsResponse

## The list of teams that the broadcaster is a member of. Returns an empty array if the broadcaster is not a member of a team.
var data: Array[TwitchChannelTeam];

static func from_json(d: Dictionary) -> TwitchGetChannelTeamsResponse:
	var result = TwitchGetChannelTeamsResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchChannelTeam.from_json(value));
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

