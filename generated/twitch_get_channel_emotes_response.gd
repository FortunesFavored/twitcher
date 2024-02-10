@tool
extends RefCounted

class_name TwitchGetChannelEmotesResponse

## The list of emotes that the specified broadcaster created. If the broadcaster hasn't created custom emotes, the list is empty.
var data: Array[TwitchChannelEmote];
## A templated URL. Use the values from the `id`, `format`, `scale`, and `theme_mode` fields to replace the like-named placeholder strings in the templated URL to create a CDN (content delivery network) URL that you use to fetch the emote. For information about what the template looks like and how to use it to fetch emotes, see [Emote CDN URL format](https://dev.twitch.tv/docs/irc/emotes#cdn-template). You should use this template instead of using the URLs in the `images` object.
var template: String;

static func from_json(d: Dictionary) -> TwitchGetChannelEmotesResponse:
	var result = TwitchGetChannelEmotesResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchChannelEmote.from_json(value));
	if d.has("template") && d["template"] != null:
		result.template = d["template"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["data"] = [];
	if data != null:
		for value in data:
			d["data"].append(value.to_dict());
	d["template"] = template;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

