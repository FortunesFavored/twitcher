@tool
extends RefCounted

class_name TwitchGetAdScheduleResponse

## A list that contains information related to the channel’s ad schedule.
var data: Array[Data];

static func from_json(d: Dictionary) -> TwitchGetAdScheduleResponse:
	var result = TwitchGetAdScheduleResponse.new();
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
	## The number of snoozes available for the broadcaster.
	var snooze_count: int;
	## The UTC timestamp when the broadcaster will gain an additional snooze, in RFC3339 format.
	var snooze_refresh_at: Variant;
	## The UTC timestamp of the broadcaster’s next scheduled ad, in RFC3339 format. Empty if the channel has no ad scheduled or is not live.
	var next_ad_at: Variant;
	## The length in seconds of the scheduled upcoming ad break.
	var duration: int;
	## The UTC timestamp of the broadcaster’s last ad-break, in RFC3339 format. Empty if the channel has not run an ad or is not live.
	var last_ad_at: Variant;
	## The amount of pre-roll free time remaining for the channel in seconds. Returns 0 if they are currently not pre-roll free.
	var preroll_free_time: int;


	static func from_json(d: Dictionary) -> Data:
		var result = Data.new();
		if d.has("snooze_count") && d["snooze_count"] != null:
			result.snooze_count = d["snooze_count"];
		if d.has("snooze_refresh_at") && d["snooze_refresh_at"] != null:
			result.snooze_refresh_at = d["snooze_refresh_at"];
		if d.has("next_ad_at") && d["next_ad_at"] != null:
			result.next_ad_at = d["next_ad_at"];
		if d.has("duration") && d["duration"] != null:
			result.duration = d["duration"];
		if d.has("last_ad_at") && d["last_ad_at"] != null:
			result.last_ad_at = d["last_ad_at"];
		if d.has("preroll_free_time") && d["preroll_free_time"] != null:
			result.preroll_free_time = d["preroll_free_time"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["snooze_count"] = snooze_count;
		d["snooze_refresh_at"] = snooze_refresh_at;
		d["next_ad_at"] = next_ad_at;
		d["duration"] = duration;
		d["last_ad_at"] = last_ad_at;
		d["preroll_free_time"] = preroll_free_time;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

