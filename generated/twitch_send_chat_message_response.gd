@tool
extends RefCounted

class_name TwitchSendChatMessageResponse

## 
var data: Array[Data];

static func from_json(d: Dictionary) -> TwitchSendChatMessageResponse:
	var result = TwitchSendChatMessageResponse.new();
	if d.has("data") && d["data"] != null:
		for value in d["data"]:
			result.data.append(Data.from_json(value));
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

## 
class DropReason extends RefCounted:
	## Code for why the message was dropped.
	var code: String;
	## Message for why the message was dropped.
	var message: String;


	static func from_json(d: Dictionary) -> DropReason:
		var result = DropReason.new();
		if d.has("code") && d["code"] != null:
			result.code = d["code"];
		if d.has("message") && d["message"] != null:
			result.message = d["message"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["code"] = code;
		d["message"] = message;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

## 
class Data extends RefCounted:
	## The message id for the message that was sent.
	var message_id: String;
	## If the message passed all checks and was sent.
	var is_sent: bool;
	## The reason the message was dropped, if any.
	var drop_reason: Array[DropReason];


	static func from_json(d: Dictionary) -> Data:
		var result = Data.new();
		if d.has("message_id") && d["message_id"] != null:
			result.message_id = d["message_id"];
		if d.has("is_sent") && d["is_sent"] != null:
			result.is_sent = d["is_sent"];
		if d.has("drop_reason") && d["drop_reason"] != null:
			for value in d["drop_reason"]:
				result.drop_reason.append(DropReason.from_json(value));
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["message_id"] = message_id;
		d["is_sent"] = is_sent;
		d["drop_reason"] = [];
		if drop_reason != null:
			for value in drop_reason:
				d["drop_reason"].append(value.to_dict());
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

