@tool
extends RefCounted

class_name TwitchCreatePollBody

## The ID of the broadcaster that’s running the poll. This ID must match the user ID in the user access token.
var broadcaster_id: String;
## The question that viewers will vote on. For example, _What game should I play next?_ The question may contain a maximum of 60 characters.
var title: String;
## A list of choices that viewers may choose from. The list must contain a minimum of 2 choices and up to a maximum of 5 choices.
var choices: Array;
## The length of time (in seconds) that the poll will run for. The minimum is 15 seconds and the maximum is 1800 seconds (30 minutes).
var duration: int;
## A Boolean value that indicates whether viewers may cast additional votes using Channel Points. If **true**, the viewer may cast more than one vote but each additional vote costs the number of Channel Points specified in `channel_points_per_vote`. The default is **false** (viewers may cast only one vote). For information about Channel Points, see [Channel Points Guide](https://help.twitch.tv/s/article/channel-points-guide).
var channel_points_voting_enabled: bool;
## The number of points that the viewer must spend to cast one additional vote. The minimum is 1 and the maximum is 1000000\. Set only if `ChannelPointsVotingEnabled` is **true**.
var channel_points_per_vote: int;

static func from_json(d: Dictionary) -> TwitchCreatePollBody:
	var result = TwitchCreatePollBody.new();
	result.broadcaster_id = d["broadcaster_id"];
	result.title = d["title"];
	result.choices = d["choices"];
	result.duration = d["duration"];
	result.channel_points_voting_enabled = d["channel_points_voting_enabled"];
	result.channel_points_per_vote = d["channel_points_per_vote"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["broadcaster_id"] = broadcaster_id;
	d["title"] = title;
	d["choices"] = choices;
	d["duration"] = duration;
	d["channel_points_voting_enabled"] = channel_points_voting_enabled;
	d["channel_points_per_vote"] = channel_points_per_vote;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());
