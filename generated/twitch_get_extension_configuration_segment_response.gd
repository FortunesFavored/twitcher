@tool
extends RefCounted

class_name TwitchGetExtensionConfigurationSegmentResponse

## The list of requested configuration segments. The list is returned in the same order that you specified the list of segments in the request.
var data: Array[TwitchExtensionConfigurationSegment];

static func from_json(d: Dictionary) -> TwitchGetExtensionConfigurationSegmentResponse:
	var result = TwitchGetExtensionConfigurationSegmentResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(TwitchExtensionConfigurationSegment.from_json(value));
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

