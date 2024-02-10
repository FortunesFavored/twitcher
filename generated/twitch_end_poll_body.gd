@tool
extends RefCounted

class_name TwitchEndPollBody

## The ID of the broadcaster that’s running the poll. This ID must match the user ID in the user access token.
var broadcaster_id: String;
## The ID of the poll to update.
var id: String;
## The status to set the poll to. Possible case-sensitive values are:      * TERMINATED — Ends the poll before the poll is scheduled to end. The poll remains publicly visible. * ARCHIVED — Ends the poll before the poll is scheduled to end, and then archives it so it's no longer publicly visible.
var status: String;

static func from_json(d: Dictionary) -> TwitchEndPollBody:
	var result = TwitchEndPollBody.new();
	if d.has("broadcaster_id") && d["broadcaster_id"] != null:
		result.broadcaster_id = d["broadcaster_id"];
	if d.has("id") && d["id"] != null:
		result.id = d["id"];
	if d.has("status") && d["status"] != null:
		result.status = d["status"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["broadcaster_id"] = broadcaster_id;
	d["id"] = id;
	d["status"] = status;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

