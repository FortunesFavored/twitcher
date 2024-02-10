@tool
extends RefCounted

class_name TwitchGetStreamMarkersResponse

## The list of markers grouped by the user that created the marks.
var data: Array[TwitchStreamMarkers];
## The information used to page through the list of results. The object is empty if there are no more pages left to page through. [Read More](https://dev.twitch.tv/docs/api/guide#pagination)
var pagination: GetStreamMarkersResponsePagination;

static func from_json(d: Dictionary) -> TwitchGetStreamMarkersResponse:
	var result = TwitchGetStreamMarkersResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchStreamMarkers.from_json(value));
	if d.has("pagination") && d["pagination"] != null:
		result.pagination = GetStreamMarkersResponsePagination.from_json(d["pagination"]);
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["data"] = [];
	if data != null:
		for value in data:
			d["data"].append(value.to_dict());
	if pagination != null:
		d["pagination"] = pagination.to_dict();
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

## The information used to page through the list of results. The object is empty if there are no more pages left to page through. [Read More](https://dev.twitch.tv/docs/api/guide#pagination)
class GetStreamMarkersResponsePagination extends RefCounted:
	## The cursor used to get the next page of results. Set the request’s _after_ or _before_ query parameter to this value depending on whether you’re paging forwards or backwards.
	var cursor: String;

	static func from_json(d: Dictionary) -> GetStreamMarkersResponsePagination:
		var result = GetStreamMarkersResponsePagination.new();
		result.cursor = d["cursor"];
		return result;

	func to_json() -> String:
		return JSON.stringify(to_dict());

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["cursor"] = cursor;
		return d;

