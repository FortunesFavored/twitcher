@tool
extends RefCounted

class_name TwitchUpdateUserExtensionsBody

## The extensions to update. The `data` field is a dictionary of extension types. The dictionary’s possible keys are: panel, overlay, or component. The key’s value is a dictionary of extensions.      For the extension’s dictionary, the key is a sequential number beginning with 1\. For panel and overlay extensions, the key’s value is an object that contains the following fields: `active` (true/false), `id` (the extension’s ID), and `version` (the extension’s version).      For component extensions, the key’s value includes the above fields plus the `x` and `y` fields, which identify the coordinate where the extension is placed.
var data: UpdateUserExtensionsBodyData;

static func from_json(d: Dictionary) -> TwitchUpdateUserExtensionsBody:
	var result = TwitchUpdateUserExtensionsBody.new();

	result.data = UpdateUserExtensionsBodyData.from_json(d["data"]);

	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};

	d["data"] = data.to_dict();

	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

## The extensions to update. The `data` field is a dictionary of extension types. The dictionary’s possible keys are: panel, overlay, or component. The key’s value is a dictionary of extensions.      For the extension’s dictionary, the key is a sequential number beginning with 1\. For panel and overlay extensions, the key’s value is an object that contains the following fields: `active` (true/false), `id` (the extension’s ID), and `version` (the extension’s version).      For component extensions, the key’s value includes the above fields plus the `x` and `y` fields, which identify the coordinate where the extension is placed.
class UpdateUserExtensionsBodyData extends RefCounted:
	## No description available
	var panel: Dictionary;
	## No description available
	var overlay: Dictionary;
	## No description available
	var component: Dictionary;

	static func from_json(d: Dictionary) -> UpdateUserExtensionsBodyData:
		var result = UpdateUserExtensionsBodyData.new();
		result.panel = d["panel"];
		result.overlay = d["overlay"];
		result.component = d["component"];
		return result;

	func to_json() -> String:
		return JSON.stringify(to_dict());

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["panel"] = panel;
		d["overlay"] = overlay;
		d["component"] = component;
		return d;
