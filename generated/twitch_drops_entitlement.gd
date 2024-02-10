@tool
extends RefCounted

class_name TwitchDropsEntitlement

## An ID that identifies the entitlement.
var id: String;
## An ID that identifies the benefit (reward).
var benefit_id: String;
## The UTC date and time (in RFC3339 format) of when the entitlement was granted.
var timestamp: Variant;
## An ID that identifies the user who was granted the entitlement.
var user_id: String;
## An ID that identifies the game the user was playing when the reward was entitled.
var game_id: String;
## The entitlement’s fulfillment status. Possible values are:       * CLAIMED * FULFILLED
var fulfillment_status: String;
## The UTC date and time (in RFC3339 format) of when the entitlement was last updated.
var last_updated: Variant;

static func from_json(d: Dictionary) -> TwitchDropsEntitlement:
	var result = TwitchDropsEntitlement.new();
	if d.has("id") && d["id"] != null:
		result.id = d["id"];
	if d.has("benefit_id") && d["benefit_id"] != null:
		result.benefit_id = d["benefit_id"];
	if d.has("timestamp") && d["timestamp"] != null:
		result.timestamp = d["timestamp"];
	if d.has("user_id") && d["user_id"] != null:
		result.user_id = d["user_id"];
	if d.has("game_id") && d["game_id"] != null:
		result.game_id = d["game_id"];
	if d.has("fulfillment_status") && d["fulfillment_status"] != null:
		result.fulfillment_status = d["fulfillment_status"];
	if d.has("last_updated") && d["last_updated"] != null:
		result.last_updated = d["last_updated"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["id"] = id;
	d["benefit_id"] = benefit_id;
	d["timestamp"] = timestamp;
	d["user_id"] = user_id;
	d["game_id"] = game_id;
	d["fulfillment_status"] = fulfillment_status;
	d["last_updated"] = last_updated;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

