@tool
extends RefCounted

class_name TwitchUpdateChannelStreamScheduleSegmentResponse

## The broadcaster’s streaming scheduled.
var data: Data;

static func from_json(d: Dictionary) -> TwitchUpdateChannelStreamScheduleSegmentResponse:
	var result = TwitchUpdateChannelStreamScheduleSegmentResponse.new();
	if d.has("data") && d["data"] != null:
		result.data = Data.from_json(d["data"]);
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	if data != null:
		d["data"] = data.to_dict();
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

## The dates when the broadcaster is on vacation and not streaming. Is set to **null** if vacation mode is not enabled.
class Vacation extends RefCounted:
	## The UTC date and time (in RFC3339 format) of when the broadcaster’s vacation starts.
	var start_time: Variant;
	## The UTC date and time (in RFC3339 format) of when the broadcaster’s vacation ends.
	var end_time: Variant;


	static func from_json(d: Dictionary) -> Vacation:
		var result = Vacation.new();
		if d.has("start_time") && d["start_time"] != null:
			result.start_time = d["start_time"];
		if d.has("end_time") && d["end_time"] != null:
			result.end_time = d["end_time"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["start_time"] = start_time;
		d["end_time"] = end_time;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

## The broadcaster’s streaming scheduled.
class Data extends RefCounted:
	## A list that contains the single broadcast segment that you updated.
	var segments: Array[TwitchChannelStreamScheduleSegment];
	## The ID of the broadcaster that owns the broadcast schedule.
	var broadcaster_id: String;
	## The broadcaster’s display name.
	var broadcaster_name: String;
	## The broadcaster’s login name.
	var broadcaster_login: String;
	## The dates when the broadcaster is on vacation and not streaming. Is set to **null** if vacation mode is not enabled.
	var vacation: Vacation;


	static func from_json(d: Dictionary) -> Data:
		var result = Data.new();
		if d.has("segments") && d["segments"] != null:
			for value in d["segments"]:
				result.segments.append(TwitchChannelStreamScheduleSegment.from_json(value));
		if d.has("broadcaster_id") && d["broadcaster_id"] != null:
			result.broadcaster_id = d["broadcaster_id"];
		if d.has("broadcaster_name") && d["broadcaster_name"] != null:
			result.broadcaster_name = d["broadcaster_name"];
		if d.has("broadcaster_login") && d["broadcaster_login"] != null:
			result.broadcaster_login = d["broadcaster_login"];
		if d.has("vacation") && d["vacation"] != null:
			result.vacation = Vacation.from_json(d["vacation"]);
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["segments"] = [];
		if segments != null:
			for value in segments:
				d["segments"].append(value.to_dict());
		d["broadcaster_id"] = broadcaster_id;
		d["broadcaster_name"] = broadcaster_name;
		d["broadcaster_login"] = broadcaster_login;
		if vacation != null:
			d["vacation"] = vacation.to_dict();
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

