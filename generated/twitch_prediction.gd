@tool
extends RefCounted

class_name TwitchPrediction

## An ID that identifies this prediction.
var id: String;
## An ID that identifies the broadcaster that created the prediction.
var broadcaster_id: String;
## The broadcaster’s display name.
var broadcaster_name: String;
## The broadcaster’s login name.
var broadcaster_login: String;
## The question that the prediction asks. For example, _Will I finish this entire pizza?_
var title: String;
## The ID of the winning outcome. Is **null** unless `status` is RESOLVED.
var winning_outcome_id: String;
## The list of possible outcomes for the prediction.
var outcomes: Array[TwitchPredictionOutcome];
## The length of time (in seconds) that the prediction will run for.
var prediction_window: int;
## The prediction’s status. Valid values are:      * ACTIVE — The Prediction is running and viewers can make predictions. * CANCELED — The broadcaster canceled the Prediction and refunded the Channel Points to the participants. * LOCKED — The broadcaster locked the Prediction, which means viewers can no longer make predictions. * RESOLVED — The winning outcome was determined and the Channel Points were distributed to the viewers who predicted the correct outcome.
var status: String;
## The UTC date and time of when the Prediction began.
var created_at: Variant;
## The UTC date and time of when the Prediction ended. If `status` is ACTIVE, this is set to **null**.
var ended_at: Variant;
## The UTC date and time of when the Prediction was locked. If `status` is not LOCKED, this is set to **null**.
var locked_at: Variant;

static func from_json(d: Dictionary) -> TwitchPrediction:
	var result = TwitchPrediction.new();
	if d.has("id") && d["id"] != null:
		result.id = d["id"];
	if d.has("broadcaster_id") && d["broadcaster_id"] != null:
		result.broadcaster_id = d["broadcaster_id"];
	if d.has("broadcaster_name") && d["broadcaster_name"] != null:
		result.broadcaster_name = d["broadcaster_name"];
	if d.has("broadcaster_login") && d["broadcaster_login"] != null:
		result.broadcaster_login = d["broadcaster_login"];
	if d.has("title") && d["title"] != null:
		result.title = d["title"];
	if d.has("winning_outcome_id") && d["winning_outcome_id"] != null:
		result.winning_outcome_id = d["winning_outcome_id"];
	if d.has("outcomes") && d["outcomes"] != null:
		for value in d["outcomes"]:
			result.outcomes.append(TwitchPredictionOutcome.from_json(value));
	if d.has("prediction_window") && d["prediction_window"] != null:
		result.prediction_window = d["prediction_window"];
	if d.has("status") && d["status"] != null:
		result.status = d["status"];
	if d.has("created_at") && d["created_at"] != null:
		result.created_at = d["created_at"];
	if d.has("ended_at") && d["ended_at"] != null:
		result.ended_at = d["ended_at"];
	if d.has("locked_at") && d["locked_at"] != null:
		result.locked_at = d["locked_at"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["id"] = id;
	d["broadcaster_id"] = broadcaster_id;
	d["broadcaster_name"] = broadcaster_name;
	d["broadcaster_login"] = broadcaster_login;
	d["title"] = title;
	d["winning_outcome_id"] = winning_outcome_id;
	d["outcomes"] = [];
	if outcomes != null:
		for value in outcomes:
			d["outcomes"].append(value.to_dict());
	d["prediction_window"] = prediction_window;
	d["status"] = status;
	d["created_at"] = created_at;
	d["ended_at"] = ended_at;
	d["locked_at"] = locked_at;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

