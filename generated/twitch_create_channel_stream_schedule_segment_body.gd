@tool
extends RefCounted

class_name TwitchCreateChannelStreamScheduleSegmentBody

## The date and time that the broadcast segment starts. Specify the date and time in RFC3339 format (for example, 2021-07-01T18:00:00Z).
var start_time: Variant;
## The time zone where the broadcast takes place. Specify the time zone using [IANA time zone database](https://www.iana.org/time-zones) format (for example, America/New\_York).
var timezone: String;
## The length of time, in minutes, that the broadcast is scheduled to run. The duration must be in the range 30 through 1380 (23 hours).
var duration: String;
## A Boolean value that determines whether the broadcast recurs weekly. Is **true** if the broadcast recurs weekly. Only partners and affiliates may add non-recurring broadcasts.
var is_recurring: bool;
## The ID of the category that best represents the broadcast’s content. To get the category ID, use the [Search Categories](https://dev.twitch.tv/docs/api/reference#search-categories) endpoint.
var category_id: String;
## The broadcast’s title. The title may contain a maximum of 140 characters.
var title: String;

static func from_json(d: Dictionary) -> TwitchCreateChannelStreamScheduleSegmentBody:
	var result = TwitchCreateChannelStreamScheduleSegmentBody.new();
	if d.has("start_time") && d["start_time"] != null:
		result.start_time = d["start_time"];
	if d.has("timezone") && d["timezone"] != null:
		result.timezone = d["timezone"];
	if d.has("duration") && d["duration"] != null:
		result.duration = d["duration"];
	if d.has("is_recurring") && d["is_recurring"] != null:
		result.is_recurring = d["is_recurring"];
	if d.has("category_id") && d["category_id"] != null:
		result.category_id = d["category_id"];
	if d.has("title") && d["title"] != null:
		result.title = d["title"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["start_time"] = start_time;
	d["timezone"] = timezone;
	d["duration"] = duration;
	d["is_recurring"] = is_recurring;
	d["category_id"] = category_id;
	d["title"] = title;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

