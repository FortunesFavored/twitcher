@tool
extends RefCounted

class_name TwitchSnoozeNextAdResponse

## A list that contains information about the channel’s snoozes and next upcoming ad after successfully snoozing.
var data: Array[Data];

static func from_json(d: Dictionary) -> TwitchSnoozeNextAdResponse:
	var result = TwitchSnoozeNextAdResponse.new();
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
	## The UTC timestamp of the broadcaster’s next scheduled ad, in RFC3339 format.
	var next_ad_at: Variant;


	static func from_json(d: Dictionary) -> Data:
		var result = Data.new();
		if d.has("snooze_count") && d["snooze_count"] != null:
			result.snooze_count = d["snooze_count"];
		if d.has("snooze_refresh_at") && d["snooze_refresh_at"] != null:
			result.snooze_refresh_at = d["snooze_refresh_at"];
		if d.has("next_ad_at") && d["next_ad_at"] != null:
			result.next_ad_at = d["next_ad_at"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["snooze_count"] = snooze_count;
		d["snooze_refresh_at"] = snooze_refresh_at;
		d["next_ad_at"] = next_ad_at;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

