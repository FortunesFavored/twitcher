@tool
extends RefCounted

class_name TwitchStreamMarkers

## The ID of the user that created the marker.
var user_id: String;
## The user’s display name.
var user_name: String;
## The user’s login name.
var user_login: String;
## A list of videos that contain markers. The list contains a single video.
var videos: Array;
## An ID that identifies this video.
var video_id: String;
## The list of markers in this video. The list in ascending order by when the marker was created.
var markers: Array[Markers];

static func from_json(d: Dictionary) -> TwitchStreamMarkers:
	var result = TwitchStreamMarkers.new();
	if d.has("user_id") && d["user_id"] != null:
		result.user_id = d["user_id"];
	if d.has("user_name") && d["user_name"] != null:
		result.user_name = d["user_name"];
	if d.has("user_login") && d["user_login"] != null:
		result.user_login = d["user_login"];
	if d.has("videos") && d["videos"] != null:
		for value in d["videos"]:
			result.videos.append(value);
	if d.has("video_id") && d["video_id"] != null:
		result.video_id = d["video_id"];
	if d.has("markers") && d["markers"] != null:
		for value in d["markers"]:
			result.markers.append(Markers.from_json(value));
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["user_id"] = user_id;
	d["user_name"] = user_name;
	d["user_login"] = user_login;
	d["videos"] = [];
	if videos != null:
		for value in videos:
			d["videos"].append(value);
	d["video_id"] = video_id;
	d["markers"] = [];
	if markers != null:
		for value in markers:
			d["markers"].append(value.to_dict());
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

## 
class Markers extends RefCounted:
	## An ID that identifies this marker.
	var id: String;
	## The UTC date and time (in RFC3339 format) of when the user created the marker.
	var created_at: Variant;
	## The description that the user gave the marker to help them remember why they marked the location. Is an empty string if the user didn’t provide one.
	var description: String;
	## The relative offset (in seconds) of the marker from the beginning of the stream.
	var position_seconds: int;
	## A URL that opens the video in Twitch Highlighter.
	var url: String;


	static func from_json(d: Dictionary) -> Markers:
		var result = Markers.new();
		if d.has("id") && d["id"] != null:
			result.id = d["id"];
		if d.has("created_at") && d["created_at"] != null:
			result.created_at = d["created_at"];
		if d.has("description") && d["description"] != null:
			result.description = d["description"];
		if d.has("position_seconds") && d["position_seconds"] != null:
			result.position_seconds = d["position_seconds"];
		if d.has("url") && d["url"] != null:
			result.url = d["url"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["id"] = id;
		d["created_at"] = created_at;
		d["description"] = description;
		d["position_seconds"] = position_seconds;
		d["url"] = url;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

