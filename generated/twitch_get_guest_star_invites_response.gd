@tool
extends RefCounted

class_name TwitchGetGuestStarInvitesResponse

## A list of invite objects describing the invited user as well as their ready status.
var data: Array[TwitchGuestStarInvite];

static func from_json(d: Dictionary) -> TwitchGetGuestStarInvitesResponse:
	var result = TwitchGetGuestStarInvitesResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchGuestStarInvite.from_json(value));
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

