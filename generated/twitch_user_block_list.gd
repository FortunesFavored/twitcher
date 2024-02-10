@tool
extends RefCounted

class_name TwitchUserBlockList

## An ID that identifies the blocked user.
var user_id: String;
## The blocked user’s login name.
var user_login: String;
## The blocked user’s display name.
var display_name: String;

static func from_json(d: Dictionary) -> TwitchUserBlockList:
	var result = TwitchUserBlockList.new();
	if d.has("user_id") && d["user_id"] != null:
		result.user_id = d["user_id"];
	if d.has("user_login") && d["user_login"] != null:
		result.user_login = d["user_login"];
	if d.has("display_name") && d["display_name"] != null:
		result.display_name = d["display_name"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["user_id"] = user_id;
	d["user_login"] = user_login;
	d["display_name"] = display_name;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

