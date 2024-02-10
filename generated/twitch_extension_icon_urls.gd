@tool
extends RefCounted

class_name TwitchExtensionIconUrls

## No description available
var _100x100: String;
## No description available
var _24x24: String;
## No description available
var _300x200: String;

static func from_json(d: Dictionary) -> TwitchExtensionIconUrls:
	var result = TwitchExtensionIconUrls.new();
	if d.has("100x100") && d["100x100"] != null:
		result._100x100 = d["100x100"];
	if d.has("24x24") && d["24x24"] != null:
		result._24x24 = d["24x24"];
	if d.has("300x200") && d["300x200"] != null:
		result._300x200 = d["300x200"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["100x100"] = _100x100;
	d["24x24"] = _24x24;
	d["300x200"] = _300x200;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

