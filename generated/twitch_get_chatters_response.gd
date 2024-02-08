@tool
extends RefCounted

class_name TwitchGetChattersResponse

## The list of users that are connected to the broadcaster’s chat room. The list is empty if no users are connected to the chat room.
var data: Array[TwitchChatter];
## Contains the information used to page through the list of results. The object is empty if there are no more pages left to page through. [Read More](https://dev.twitch.tv/docs/api/guide#pagination)
var pagination: GetChattersResponsePagination;
## The total number of users that are connected to the broadcaster’s chat room. As you page through the list, the number of users may change as users join and leave the chat room.
var total: int;

static func from_json(d: Dictionary) -> TwitchGetChattersResponse:
	var result = TwitchGetChattersResponse.new();
	result.data = d["data"];

	result.pagination = GetChattersResponsePagination.from_json(d["pagination"]);

	result.total = d["total"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["data"] = data;

	d["pagination"] = pagination.to_dict();

	d["total"] = total;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

## Contains the information used to page through the list of results. The object is empty if there are no more pages left to page through. [Read More](https://dev.twitch.tv/docs/api/guide#pagination)
class GetChattersResponsePagination extends RefCounted:
	## The cursor used to get the next page of results. Use the cursor to set the request’s _after_ query parameter.
	var cursor: String;

	static func from_json(d: Dictionary) -> GetChattersResponsePagination:
		var result = GetChattersResponsePagination.new();
		result.cursor = d["cursor"];
		return result;

	func to_json() -> String:
		return JSON.stringify(to_dict());

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["cursor"] = cursor;
		return d;
