@tool
extends RefCounted

class_name TwitchGuestStarInvite

## Twitch User ID corresponding to the invited guest
var user_id: String;
## Timestamp when this user was invited to the session.
var invited_at: Variant;
## Status representing the invited user’s join state. Can be one of the following:       * `INVITED`: The user has been invited to the session but has not acknowledged it. * `ACCEPTED`: The invited user has acknowledged the invite and joined the waiting room, but may still be setting up their media devices or otherwise preparing to join the call. * `READY`: The invited user has signaled they are ready to join the call from the waiting room.
var status: String;
## Flag signaling that the invited user has chosen to disable their local video device. The user has hidden themselves, but they may choose to reveal their video feed upon joining the session.
var is_video_enabled: bool;
## Flag signaling that the invited user has chosen to disable their local audio device. The user has muted themselves, but they may choose to unmute their audio feed upon joining the session.
var is_audio_enabled: bool;
## Flag signaling that the invited user has a video device available for sharing.
var is_video_available: bool;
## Flag signaling that the invited user has an audio device available for sharing.
var is_audio_available: bool;

static func from_json(d: Dictionary) -> TwitchGuestStarInvite:
	var result = TwitchGuestStarInvite.new();
	if d.has("user_id") && d["user_id"] != null:
		result.user_id = d["user_id"];
	if d.has("invited_at") && d["invited_at"] != null:
		result.invited_at = d["invited_at"];
	if d.has("status") && d["status"] != null:
		result.status = d["status"];
	if d.has("is_video_enabled") && d["is_video_enabled"] != null:
		result.is_video_enabled = d["is_video_enabled"];
	if d.has("is_audio_enabled") && d["is_audio_enabled"] != null:
		result.is_audio_enabled = d["is_audio_enabled"];
	if d.has("is_video_available") && d["is_video_available"] != null:
		result.is_video_available = d["is_video_available"];
	if d.has("is_audio_available") && d["is_audio_available"] != null:
		result.is_audio_available = d["is_audio_available"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["user_id"] = user_id;
	d["invited_at"] = invited_at;
	d["status"] = status;
	d["is_video_enabled"] = is_video_enabled;
	d["is_audio_enabled"] = is_audio_enabled;
	d["is_video_available"] = is_video_available;
	d["is_audio_available"] = is_audio_available;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

