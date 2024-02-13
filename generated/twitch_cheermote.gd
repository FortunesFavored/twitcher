@tool
extends RefCounted

class_name TwitchCheermote

## The name portion of the Cheermote string that you use in chat to cheer Bits. The full Cheermote string is the concatenation of {prefix} + {number of Bits}. For example, if the prefix is “Cheer” and you want to cheer 100 Bits, the full Cheermote string is Cheer100\. When the Cheermote string is entered in chat, Twitch converts it to the image associated with the Bits tier that was cheered.
var prefix: String;
## A list of tier levels that the Cheermote supports. Each tier identifies the range of Bits that you can cheer at that tier level and an image that graphically identifies the tier level.
var tiers: Array[Tiers];
## The type of Cheermote. Possible values are:      * global\_first\_party — A Twitch-defined Cheermote that is shown in the Bits card. * global\_third\_party — A Twitch-defined Cheermote that is not shown in the Bits card. * channel\_custom — A broadcaster-defined Cheermote. * display\_only — Do not use; for internal use only. * sponsored — A sponsor-defined Cheermote. When used, the sponsor adds additional Bits to the amount that the user cheered. For example, if the user cheered Terminator100, the broadcaster might receive 110 Bits, which includes the sponsor's 10 Bits contribution.
var type: String;
## The order that the Cheermotes are shown in the Bits card. The numbers may not be consecutive. For example, the numbers may jump from 1 to 7 to 13\. The order numbers are unique within a Cheermote type (for example, global\_first\_party) but may not be unique amongst all Cheermotes in the response.
var order: int;
## The date and time, in RFC3339 format, when this Cheermote was last updated.
var last_updated: Variant;
## A Boolean value that indicates whether this Cheermote provides a charitable contribution match during charity campaigns.
var is_charitable: bool;

static func from_json(d: Dictionary) -> TwitchCheermote:
	var result = TwitchCheermote.new();
	if d.has("prefix") && d["prefix"] != null:
		result.prefix = d["prefix"];
	if d.has("tiers") && d["tiers"] != null:
		for value in d["tiers"]:
			result.tiers.append(Tiers.from_json(value));
	if d.has("type") && d["type"] != null:
		result.type = d["type"];
	if d.has("order") && d["order"] != null:
		result.order = d["order"];
	if d.has("last_updated") && d["last_updated"] != null:
		result.last_updated = d["last_updated"];
	if d.has("is_charitable") && d["is_charitable"] != null:
		result.is_charitable = d["is_charitable"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["prefix"] = prefix;
	d["tiers"] = [];
	if tiers != null:
		for value in tiers:
			d["tiers"].append(value.to_dict());
	d["type"] = type;
	d["order"] = order;
	d["last_updated"] = last_updated;
	d["is_charitable"] = is_charitable;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

## 
class Tiers extends RefCounted:
	## The minimum number of Bits that you must cheer at this tier level. The maximum number of Bits that you can cheer at this level is determined by the required minimum Bits of the next tier level minus 1\. For example, if `min_bits` is 1 and `min_bits` for the next tier is 100, the Bits range for this tier level is 1 through 99\. The minimum Bits value of the last tier is the maximum number of Bits you can cheer using this Cheermote. For example, 10000.
	var min_bits: int;
	## The tier level. Possible tiers are:      * 1 * 100 * 500 * 1000 * 5000 * 10000 * 100000
	var id: String;
	## The hex code of the color associated with this tier level (for example, #979797).
	var color: String;
	## No description available
	var images: TwitchCheermoteImages;
	## A Boolean value that determines whether users can cheer at this tier level.
	var can_cheer: bool;
	## A Boolean value that determines whether this tier level is shown in the Bits card. Is **true** if this tier level is shown in the Bits card.
	var show_in_bits_card: bool;


	static func from_json(d: Dictionary) -> Tiers:
		var result = Tiers.new();
		if d.has("min_bits") && d["min_bits"] != null:
			result.min_bits = d["min_bits"];
		if d.has("id") && d["id"] != null:
			result.id = d["id"];
		if d.has("color") && d["color"] != null:
			result.color = d["color"];
		if d.has("images") && d["images"] != null:
			result.images = TwitchCheermoteImages.from_json(d["images"]);
		if d.has("can_cheer") && d["can_cheer"] != null:
			result.can_cheer = d["can_cheer"];
		if d.has("show_in_bits_card") && d["show_in_bits_card"] != null:
			result.show_in_bits_card = d["show_in_bits_card"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["min_bits"] = min_bits;
		d["id"] = id;
		d["color"] = color;
		if images != null:
			d["images"] = images.to_dict();
		d["can_cheer"] = can_cheer;
		d["show_in_bits_card"] = show_in_bits_card;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

