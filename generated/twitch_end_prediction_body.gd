@tool
extends RefCounted

class_name TwitchEndPredictionBody

## The ID of the broadcaster that’s running the prediction. This ID must match the user ID in the user access token.
var broadcaster_id: String;
## The ID of the prediction to update.
var id: String;
## The status to set the prediction to. Possible case-sensitive values are:      * RESOLVED — The winning outcome is determined and the Channel Points are distributed to the viewers who predicted the correct outcome. * CANCELED — The broadcaster is canceling the prediction and sending refunds to the participants. * LOCKED — The broadcaster is locking the prediction, which means viewers may no longer make predictions.    The broadcaster can update an active prediction to LOCKED, RESOLVED, or CANCELED; and update a locked prediction to RESOLVED or CANCELED.      The broadcaster has up to 24 hours after the prediction window closes to resolve the prediction. If not, Twitch sets the status to CANCELED and returns the points.
var status: String;
## The ID of the winning outcome. You must set this parameter if you set `status` to RESOLVED.
var winning_outcome_id: String;

static func from_json(d: Dictionary) -> TwitchEndPredictionBody:
	var result = TwitchEndPredictionBody.new();
	if d.has("broadcaster_id") && d["broadcaster_id"] != null:
		result.broadcaster_id = d["broadcaster_id"];
	if d.has("id") && d["id"] != null:
		result.id = d["id"];
	if d.has("status") && d["status"] != null:
		result.status = d["status"];
	if d.has("winning_outcome_id") && d["winning_outcome_id"] != null:
		result.winning_outcome_id = d["winning_outcome_id"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["broadcaster_id"] = broadcaster_id;
	d["id"] = id;
	d["status"] = status;
	d["winning_outcome_id"] = winning_outcome_id;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

