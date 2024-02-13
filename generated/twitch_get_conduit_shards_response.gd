@tool
extends RefCounted

class_name TwitchGetConduitShardsResponse

## List of information about a conduit's shards.
var data: Array[Data];
## Contains information used to page through a list of results. The object is empty if there are no more pages left to page through.
var pagination: Pagination;

static func from_json(d: Dictionary) -> TwitchGetConduitShardsResponse:
	var result = TwitchGetConduitShardsResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(Data.from_json(value));
	if d.has("pagination") && d["pagination"] != null:
		result.pagination = Pagination.from_json(d["pagination"]);
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["data"] = [];
	if data != null:
		for value in data:
			d["data"].append(value.to_dict());
	if pagination != null:
		d["pagination"] = pagination.to_dict();
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

## The transport details used to send the notifications.
class Transport extends RefCounted:
	## The transport method. Possible values are:      * webhook * websocket
	var method: String;
	## The callback URL where the notifications are sent. Included only if method is set to webhook.
	var callback: String;
	## An ID that identifies the WebSocket that notifications are sent to. Included only if method is set to websocket.
	var session_id: String;
	## The UTC date and time that the WebSocket connection was established. Included only if method is set to websocket.
	var connected_at: Variant;
	## The UTC date and time that the WebSocket connection was lost. Included only if method is set to websocket.
	var disconnected_at: Variant;


	static func from_json(d: Dictionary) -> Transport:
		var result = Transport.new();
		if d.has("method") && d["method"] != null:
			result.method = d["method"];
		if d.has("callback") && d["callback"] != null:
			result.callback = d["callback"];
		if d.has("session_id") && d["session_id"] != null:
			result.session_id = d["session_id"];
		if d.has("connected_at") && d["connected_at"] != null:
			result.connected_at = d["connected_at"];
		if d.has("disconnected_at") && d["disconnected_at"] != null:
			result.disconnected_at = d["disconnected_at"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["method"] = method;
		d["callback"] = callback;
		d["session_id"] = session_id;
		d["connected_at"] = connected_at;
		d["disconnected_at"] = disconnected_at;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

## 
class Data extends RefCounted:
	## Shard ID.
	var id: String;
	## The shard status. The subscriber receives events only for enabled shards. Possible values are:      * enabled — The shard is enabled. * webhook\_callback\_verification\_pending — The shard is pending verification of the specified callback URL. * webhook\_callback\_verification\_failed — The specified callback URL failed verification. * notification\_failures\_exceeded — The notification delivery failure rate was too high. * websocket\_disconnected — The client closed the connection. * websocket\_failed\_ping\_pong — The client failed to respond to a ping message. * websocket\_received\_inbound\_traffic — The client sent a non-pong message. Clients may only send pong messages (and only in response to a ping message). * websocket\_internal\_error — The Twitch WebSocket server experienced an unexpected error. * websocket\_network\_timeout — The Twitch WebSocket server timed out writing the message to the client. * websocket\_network\_error — The Twitch WebSocket server experienced a network error writing the message to the client.
	var status: String;
	## The transport details used to send the notifications.
	var transport: Transport;


	static func from_json(d: Dictionary) -> Data:
		var result = Data.new();
		if d.has("id") && d["id"] != null:
			result.id = d["id"];
		if d.has("status") && d["status"] != null:
			result.status = d["status"];
		if d.has("transport") && d["transport"] != null:
			result.transport = Transport.from_json(d["transport"]);
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["id"] = id;
		d["status"] = status;
		if transport != null:
			d["transport"] = transport.to_dict();
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

## Contains information used to page through a list of results. The object is empty if there are no more pages left to page through.
class Pagination extends RefCounted:
	## The cursor used to get the next page of results. Use the cursor to set the request’s after query parameter.
	var cursor: String;


	static func from_json(d: Dictionary) -> Pagination:
		var result = Pagination.new();
		if d.has("cursor") && d["cursor"] != null:
			result.cursor = d["cursor"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["cursor"] = cursor;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

