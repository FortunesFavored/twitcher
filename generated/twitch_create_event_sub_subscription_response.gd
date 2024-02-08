@tool
extends RefCounted

class_name TwitchCreateEventSubSubscriptionResponse

## A list that contains the single subscription that you created.
var data: Array[TwitchEventSubSubscription];
## The total number of subscriptions you’ve created.
var total: int;
## The sum of all of your subscription costs. [Learn More](https://dev.twitch.tv/docs/eventsub/manage-subscriptions/#subscription-limits)
var total_cost: int;
## The maximum total cost that you’re allowed to incur for all subscriptions you create.
var max_total_cost: int;

static func from_json(d: Dictionary) -> TwitchCreateEventSubSubscriptionResponse:
	var result = TwitchCreateEventSubSubscriptionResponse.new();
	result.data = d["data"];
	result.total = d["total"];
	result.total_cost = d["total_cost"];
	result.max_total_cost = d["max_total_cost"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["data"] = data;
	d["total"] = total;
	d["total_cost"] = total_cost;
	d["max_total_cost"] = max_total_cost;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());
