@tool
extends RefCounted

class_name TwitchGetShieldModeStatusResponse

## A list that contains a single object with the broadcaster’s Shield Mode status.
var data: Array[Data];

static func from_json(d: Dictionary) -> TwitchGetShieldModeStatusResponse:
	var result = TwitchGetShieldModeStatusResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(Data.from_json(value));
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

## 
class Data extends RefCounted:
	## A Boolean value that determines whether Shield Mode is active. Is **true** if the broadcaster activated Shield Mode; otherwise, **false**.
	var is_active: bool;
	## An ID that identifies the moderator that last activated Shield Mode. Is an empty string if Shield Mode hasn’t been previously activated.
	var moderator_id: String;
	## The moderator’s login name. Is an empty string if Shield Mode hasn’t been previously activated.
	var moderator_login: String;
	## The moderator’s display name. Is an empty string if Shield Mode hasn’t been previously activated.
	var moderator_name: String;
	## The UTC timestamp (in RFC3339 format) of when Shield Mode was last activated. Is an empty string if Shield Mode hasn’t been previously activated.
	var last_activated_at: Variant;


	static func from_json(d: Dictionary) -> Data:
		var result = Data.new();
		if d.has("is_active") && d["is_active"] != null:
			result.is_active = d["is_active"];
		if d.has("moderator_id") && d["moderator_id"] != null:
			result.moderator_id = d["moderator_id"];
		if d.has("moderator_login") && d["moderator_login"] != null:
			result.moderator_login = d["moderator_login"];
		if d.has("moderator_name") && d["moderator_name"] != null:
			result.moderator_name = d["moderator_name"];
		if d.has("last_activated_at") && d["last_activated_at"] != null:
			result.last_activated_at = d["last_activated_at"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["is_active"] = is_active;
		d["moderator_id"] = moderator_id;
		d["moderator_login"] = moderator_login;
		d["moderator_name"] = moderator_name;
		d["last_activated_at"] = last_activated_at;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

