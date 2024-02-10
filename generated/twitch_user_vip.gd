@tool
extends RefCounted

class_name TwitchUserVip

## An ID that uniquely identifies the VIP user.
var user_id: String;
## The user’s display name.
var user_name: String;
## The user’s login name.
var user_login: String;

static func from_json(d: Dictionary) -> TwitchUserVip:
	var result = TwitchUserVip.new();
	if d.has("user_id") && d["user_id"] != null:
		result.user_id = d["user_id"];
	if d.has("user_name") && d["user_name"] != null:
		result.user_name = d["user_name"];
	if d.has("user_login") && d["user_login"] != null:
		result.user_login = d["user_login"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["user_id"] = user_id;
	d["user_name"] = user_name;
	d["user_login"] = user_login;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

