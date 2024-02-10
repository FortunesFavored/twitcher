@tool
extends RefCounted

class_name TwitchChannelEditor

## An ID that uniquely identifies a user with editor permissions.
var user_id: String;
## The user’s display name.
var user_name: String;
## The date and time, in RFC3339 format, when the user became one of the broadcaster’s editors.
var created_at: Variant;

static func from_json(d: Dictionary) -> TwitchChannelEditor:
	var result = TwitchChannelEditor.new();
	if d.has("user_id") && d["user_id"] != null:
		result.user_id = d["user_id"];
	if d.has("user_name") && d["user_name"] != null:
		result.user_name = d["user_name"];
	if d.has("created_at") && d["created_at"] != null:
		result.created_at = d["created_at"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["user_id"] = user_id;
	d["user_name"] = user_name;
	d["created_at"] = created_at;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

