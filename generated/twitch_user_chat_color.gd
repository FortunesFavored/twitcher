@tool
extends RefCounted

class_name TwitchUserChatColor

## An ID that uniquely identifies the user.
var user_id: String;
## The user’s login name.
var user_login: String;
## The user’s display name.
var user_name: String;
## The Hex color code that the user uses in chat for their name. If the user hasn’t specified a color in their settings, the string is empty.
var color: String;

static func from_json(d: Dictionary) -> TwitchUserChatColor:
	var result = TwitchUserChatColor.new();
	if d.has("user_id") && d["user_id"] != null:
		result.user_id = d["user_id"];
	if d.has("user_login") && d["user_login"] != null:
		result.user_login = d["user_login"];
	if d.has("user_name") && d["user_name"] != null:
		result.user_name = d["user_name"];
	if d.has("color") && d["color"] != null:
		result.color = d["color"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["user_id"] = user_id;
	d["user_login"] = user_login;
	d["user_name"] = user_name;
	d["color"] = color;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

