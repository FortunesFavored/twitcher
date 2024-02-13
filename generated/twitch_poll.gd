@tool
extends RefCounted

class_name TwitchPoll

## An ID that identifies the poll.
var id: String;
## An ID that identifies the broadcaster that created the poll.
var broadcaster_id: String;
## The broadcaster’s display name.
var broadcaster_name: String;
## The broadcaster’s login name.
var broadcaster_login: String;
## The question that viewers are voting on. For example, _What game should I play next?_ The title may contain a maximum of 60 characters.
var title: String;
## A list of choices that viewers can choose from. The list will contain a minimum of two choices and up to a maximum of five choices.
var choices: Array[Choices];
## Not used; will be set to **false**.
var bits_voting_enabled: bool;
## Not used; will be set to 0.
var bits_per_vote: int;
## A Boolean value that indicates whether viewers may cast additional votes using Channel Points. For information about Channel Points, see [Channel Points Guide](https://help.twitch.tv/s/article/channel-points-guide).
var channel_points_voting_enabled: bool;
## The number of points the viewer must spend to cast one additional vote.
var channel_points_per_vote: int;
## The poll’s status. Valid values are:      * ACTIVE — The poll is running. * COMPLETED — The poll ended on schedule (see the `duration` field). * TERMINATED — The poll was terminated before its scheduled end. * ARCHIVED — The poll has been archived and is no longer visible on the channel. * MODERATED — The poll was deleted. * INVALID — Something went wrong while determining the state.
var status: String;
## The length of time (in seconds) that the poll will run for.
var duration: int;
## The UTC date and time (in RFC3339 format) of when the poll began.
var started_at: Variant;
## The UTC date and time (in RFC3339 format) of when the poll ended. If `status` is ACTIVE, this field is set to **null**.
var ended_at: Variant;

static func from_json(d: Dictionary) -> TwitchPoll:
	var result = TwitchPoll.new();
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
	if d.has("choices") && d["choices"] != null:
		for value in d["choices"]:
			result.choices.append(Choices.from_json(value));
	if d.has("bits_voting_enabled") && d["bits_voting_enabled"] != null:
		result.bits_voting_enabled = d["bits_voting_enabled"];
	if d.has("bits_per_vote") && d["bits_per_vote"] != null:
		result.bits_per_vote = d["bits_per_vote"];
	if d.has("channel_points_voting_enabled") && d["channel_points_voting_enabled"] != null:
		result.channel_points_voting_enabled = d["channel_points_voting_enabled"];
	if d.has("channel_points_per_vote") && d["channel_points_per_vote"] != null:
		result.channel_points_per_vote = d["channel_points_per_vote"];
	if d.has("status") && d["status"] != null:
		result.status = d["status"];
	if d.has("duration") && d["duration"] != null:
		result.duration = d["duration"];
	if d.has("started_at") && d["started_at"] != null:
		result.started_at = d["started_at"];
	if d.has("ended_at") && d["ended_at"] != null:
		result.ended_at = d["ended_at"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["id"] = id;
	d["broadcaster_id"] = broadcaster_id;
	d["broadcaster_name"] = broadcaster_name;
	d["broadcaster_login"] = broadcaster_login;
	d["title"] = title;
	d["choices"] = [];
	if choices != null:
		for value in choices:
			d["choices"].append(value.to_dict());
	d["bits_voting_enabled"] = bits_voting_enabled;
	d["bits_per_vote"] = bits_per_vote;
	d["channel_points_voting_enabled"] = channel_points_voting_enabled;
	d["channel_points_per_vote"] = channel_points_per_vote;
	d["status"] = status;
	d["duration"] = duration;
	d["started_at"] = started_at;
	d["ended_at"] = ended_at;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

## 
class Choices extends RefCounted:
	## An ID that identifies this choice.
	var id: String;
	## The choice’s title. The title may contain a maximum of 25 characters.
	var title: String;
	## The total number of votes cast for this choice.
	var votes: int;
	## The number of votes cast using Channel Points.
	var channel_points_votes: int;
	## Not used; will be set to 0.
	var bits_votes: int;


	static func from_json(d: Dictionary) -> Choices:
		var result = Choices.new();
		if d.has("id") && d["id"] != null:
			result.id = d["id"];
		if d.has("title") && d["title"] != null:
			result.title = d["title"];
		if d.has("votes") && d["votes"] != null:
			result.votes = d["votes"];
		if d.has("channel_points_votes") && d["channel_points_votes"] != null:
			result.channel_points_votes = d["channel_points_votes"];
		if d.has("bits_votes") && d["bits_votes"] != null:
			result.bits_votes = d["bits_votes"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["id"] = id;
		d["title"] = title;
		d["votes"] = votes;
		d["channel_points_votes"] = channel_points_votes;
		d["bits_votes"] = bits_votes;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

