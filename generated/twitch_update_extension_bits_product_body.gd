@tool
extends RefCounted

class_name TwitchUpdateExtensionBitsProductBody

## The product's SKU. The SKU must be unique within an extension. The product's SKU cannot be changed. The SKU may contain only alphanumeric characters, dashes (-), underscores (\_), and periods (.) and is limited to a maximum of 255 characters. No spaces.
var sku: String;
## An object that contains the product's cost information.
var cost: UpdateExtensionBitsProductBodyCost;
## The product's name as displayed in the extension. The maximum length is 255 characters.
var display_name: String;
## A Boolean value that indicates whether the product is in development. Set to **true** if the product is in development and not available for public use. The default is **false**.
var in_development: bool;
## The date and time, in RFC3339 format, when the product expires. If not set, the product does not expire. To disable the product, set the expiration date to a date in the past.
var expiration: Variant;
## A Boolean value that determines whether Bits product purchase events are broadcast to all instances of the extension on a channel. The events are broadcast via the `onTransactionComplete` helper callback. The default is **false**.
var is_broadcast: bool;

static func from_json(d: Dictionary) -> TwitchUpdateExtensionBitsProductBody:
	var result = TwitchUpdateExtensionBitsProductBody.new();
	if d.has("sku") && d["sku"] != null:
		result.sku = d["sku"];
	if d.has("cost") && d["cost"] != null:
		result.cost = UpdateExtensionBitsProductBodyCost.from_json(d["cost"]);
	if d.has("display_name") && d["display_name"] != null:
		result.display_name = d["display_name"];
	if d.has("in_development") && d["in_development"] != null:
		result.in_development = d["in_development"];
	if d.has("expiration") && d["expiration"] != null:
		result.expiration = d["expiration"];
	if d.has("is_broadcast") && d["is_broadcast"] != null:
		result.is_broadcast = d["is_broadcast"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["sku"] = sku;
	if cost != null:
		d["cost"] = cost.to_dict();
	d["display_name"] = display_name;
	d["in_development"] = in_development;
	d["expiration"] = expiration;
	d["is_broadcast"] = is_broadcast;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

## An object that contains the product's cost information.
class UpdateExtensionBitsProductBodyCost extends RefCounted:
	## The product's price.
	var amount: int;
	## The type of currency. Possible values are:      * bits — The minimum price is 1 and the maximum is 10000.
	var type: String;

	static func from_json(d: Dictionary) -> UpdateExtensionBitsProductBodyCost:
		var result = UpdateExtensionBitsProductBodyCost.new();
		result.amount = d["amount"];
		result.type = d["type"];
		return result;

	func to_json() -> String:
		return JSON.stringify(to_dict());

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["amount"] = amount;
		d["type"] = type;
		return d;

