@tool
extends RefCounted

class_name TwitchUpdateCustomRewardBody

## The reward’s title. The title may contain a maximum of 45 characters and it must be unique amongst all of the broadcaster’s custom rewards.
var title: String;
## The prompt shown to the viewer when they redeem the reward. Specify a prompt if `is_user_input_required` is **true**. The prompt is limited to a maximum of 200 characters.
var prompt: String;
## The cost of the reward, in channel points. The minimum is 1 point.
var cost: int;
## The background color to use for the reward. Specify the color using Hex format (for example, #00E5CB).
var background_color: String;
## A Boolean value that indicates whether the reward is enabled. Set to **true** to enable the reward. Viewers see only enabled rewards.
var is_enabled: bool;
## A Boolean value that determines whether users must enter information to redeem the reward. Set to **true** if user input is required. See the `prompt` field.
var is_user_input_required: bool;
## A Boolean value that determines whether to limit the maximum number of redemptions allowed per live stream (see the `max_per_stream` field). Set to **true** to limit redemptions.
var is_max_per_stream_enabled: bool;
## The maximum number of redemptions allowed per live stream. Applied only if `is_max_per_stream_enabled` is **true**. The minimum value is 1.
var max_per_stream: int;
## A Boolean value that determines whether to limit the maximum number of redemptions allowed per user per stream (see `max_per_user_per_stream`). The minimum value is 1\. Set to **true** to limit redemptions.
var is_max_per_user_per_stream_enabled: bool;
## The maximum number of redemptions allowed per user per stream. Applied only if `is_max_per_user_per_stream_enabled` is **true**.
var max_per_user_per_stream: int;
## A Boolean value that determines whether to apply a cooldown period between redemptions. Set to **true** to apply a cooldown period. For the duration of the cooldown period, see `global_cooldown_seconds`.
var is_global_cooldown_enabled: bool;
## The cooldown period, in seconds. Applied only if `is_global_cooldown_enabled` is **true**. The minimum value is 1; however, for it to be shown in the Twitch UX, the minimum value is 60.
var global_cooldown_seconds: int;
## A Boolean value that determines whether to pause the reward. Set to **true** to pause the reward. Viewers can’t redeem paused rewards..
var is_paused: bool;
## A Boolean value that determines whether redemptions should be set to FULFILLED status immediately when a reward is redeemed. If **false**, status is set to UNFULFILLED and follows the normal request queue process.
var should_redemptions_skip_request_queue: bool;

static func from_json(d: Dictionary) -> TwitchUpdateCustomRewardBody:
	var result = TwitchUpdateCustomRewardBody.new();
	if d.has("title") && d["title"] != null:
		result.title = d["title"];
	if d.has("prompt") && d["prompt"] != null:
		result.prompt = d["prompt"];
	if d.has("cost") && d["cost"] != null:
		result.cost = d["cost"];
	if d.has("background_color") && d["background_color"] != null:
		result.background_color = d["background_color"];
	if d.has("is_enabled") && d["is_enabled"] != null:
		result.is_enabled = d["is_enabled"];
	if d.has("is_user_input_required") && d["is_user_input_required"] != null:
		result.is_user_input_required = d["is_user_input_required"];
	if d.has("is_max_per_stream_enabled") && d["is_max_per_stream_enabled"] != null:
		result.is_max_per_stream_enabled = d["is_max_per_stream_enabled"];
	if d.has("max_per_stream") && d["max_per_stream"] != null:
		result.max_per_stream = d["max_per_stream"];
	if d.has("is_max_per_user_per_stream_enabled") && d["is_max_per_user_per_stream_enabled"] != null:
		result.is_max_per_user_per_stream_enabled = d["is_max_per_user_per_stream_enabled"];
	if d.has("max_per_user_per_stream") && d["max_per_user_per_stream"] != null:
		result.max_per_user_per_stream = d["max_per_user_per_stream"];
	if d.has("is_global_cooldown_enabled") && d["is_global_cooldown_enabled"] != null:
		result.is_global_cooldown_enabled = d["is_global_cooldown_enabled"];
	if d.has("global_cooldown_seconds") && d["global_cooldown_seconds"] != null:
		result.global_cooldown_seconds = d["global_cooldown_seconds"];
	if d.has("is_paused") && d["is_paused"] != null:
		result.is_paused = d["is_paused"];
	if d.has("should_redemptions_skip_request_queue") && d["should_redemptions_skip_request_queue"] != null:
		result.should_redemptions_skip_request_queue = d["should_redemptions_skip_request_queue"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["title"] = title;
	d["prompt"] = prompt;
	d["cost"] = cost;
	d["background_color"] = background_color;
	d["is_enabled"] = is_enabled;
	d["is_user_input_required"] = is_user_input_required;
	d["is_max_per_stream_enabled"] = is_max_per_stream_enabled;
	d["max_per_stream"] = max_per_stream;
	d["is_max_per_user_per_stream_enabled"] = is_max_per_user_per_stream_enabled;
	d["max_per_user_per_stream"] = max_per_user_per_stream;
	d["is_global_cooldown_enabled"] = is_global_cooldown_enabled;
	d["global_cooldown_seconds"] = global_cooldown_seconds;
	d["is_paused"] = is_paused;
	d["should_redemptions_skip_request_queue"] = should_redemptions_skip_request_queue;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

