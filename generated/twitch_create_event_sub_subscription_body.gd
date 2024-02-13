@tool
extends RefCounted

class_name TwitchCreateEventSubSubscriptionBody

## The type of subscription to create. For a list of subscriptions that you can create, see [Subscription Types](https://dev.twitch.tv/docs/eventsub/eventsub-subscription-types#subscription-types). Set this field to the value in the **Name** column of the Subscription Types table.
var type: String;
## The version number that identifies the definition of the subscription type that you want the response to use.
var version: String;
## A JSON object that contains the parameter values that are specific to the specified subscription type. For the object’s required and optional fields, see the subscription type’s documentation.
var condition: Dictionary;
## The transport details that you want Twitch to use when sending you notifications.
var transport: Transport;

static func from_json(d: Dictionary) -> TwitchCreateEventSubSubscriptionBody:
	var result = TwitchCreateEventSubSubscriptionBody.new();
	if d.has("type") && d["type"] != null:
		result.type = d["type"];
	if d.has("version") && d["version"] != null:
		result.version = d["version"];
	if d.has("condition") && d["condition"] != null:
		result.condition = d["condition"];
	if d.has("transport") && d["transport"] != null:
		result.transport = Transport.from_json(d["transport"]);
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["type"] = type;
	d["version"] = version;
	d["condition"] = condition;
	if transport != null:
		d["transport"] = transport.to_dict();
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

## The transport details that you want Twitch to use when sending you notifications.
class Transport extends RefCounted:
	## The transport method. Possible values are:      * webhook * websocket * conduit
	var method: String;
	## The callback URL where the notifications are sent. The URL must use the HTTPS protocol and port 443\. See [Processing an event](https://dev.twitch.tv/docs/eventsub/handling-webhook-events#processing-an-event). Specify this field only if `method` is set to **webhook**.  **NOTE**: Redirects are not followed.
	var callback: String;
	## The secret used to verify the signature. The secret must be an ASCII string that’s a minimum of 10 characters long and a maximum of 100 characters long. For information about how the secret is used, see [Verifying the event message](https://dev.twitch.tv/docs/eventsub/handling-webhook-events#verifying-the-event-message). Specify this field only if `method` is set to **webhook**.
	var secret: String;
	## An ID that identifies the WebSocket to send notifications to. When you connect to EventSub using WebSockets, the server returns the ID in the Welcome message. Specify this field only if `method` is set to **websocket**.
	var session_id: String;
	## An ID that identifies the conduit to send notifications to. When you create a conduit, the server returns the conduit ID. Specify this field only if `method` is set to **conduit**.
	var conduit_id: String;


	static func from_json(d: Dictionary) -> Transport:
		var result = Transport.new();
		if d.has("method") && d["method"] != null:
			result.method = d["method"];
		if d.has("callback") && d["callback"] != null:
			result.callback = d["callback"];
		if d.has("secret") && d["secret"] != null:
			result.secret = d["secret"];
		if d.has("session_id") && d["session_id"] != null:
			result.session_id = d["session_id"];
		if d.has("conduit_id") && d["conduit_id"] != null:
			result.conduit_id = d["conduit_id"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["method"] = method;
		d["callback"] = callback;
		d["secret"] = secret;
		d["session_id"] = session_id;
		d["conduit_id"] = conduit_id;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

