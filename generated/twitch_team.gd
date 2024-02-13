@tool
extends RefCounted

class_name TwitchTeam

## The list of team members.
var users: Array[Users];
## A URL to the team’s background image.
var background_image_url: String;
## A URL to the team’s banner.
var banner: String;
## The UTC date and time (in RFC3339 format) of when the team was created.
var created_at: Variant;
## The UTC date and time (in RFC3339 format) of the last time the team was updated.
var updated_at: Variant;
## The team’s description. The description may contain formatting such as Markdown, HTML, newline (\\n) characters, etc.
var info: String;
## A URL to a thumbnail image of the team’s logo.
var thumbnail_url: String;
## The team’s name.
var team_name: String;
## The team’s display name.
var team_display_name: String;
## An ID that identifies the team.
var id: String;

static func from_json(d: Dictionary) -> TwitchTeam:
	var result = TwitchTeam.new();
	if d.has("users") && d["users"] != null:
		for value in d["users"]:
			result.users.append(Users.from_json(value));
	if d.has("background_image_url") && d["background_image_url"] != null:
		result.background_image_url = d["background_image_url"];
	if d.has("banner") && d["banner"] != null:
		result.banner = d["banner"];
	if d.has("created_at") && d["created_at"] != null:
		result.created_at = d["created_at"];
	if d.has("updated_at") && d["updated_at"] != null:
		result.updated_at = d["updated_at"];
	if d.has("info") && d["info"] != null:
		result.info = d["info"];
	if d.has("thumbnail_url") && d["thumbnail_url"] != null:
		result.thumbnail_url = d["thumbnail_url"];
	if d.has("team_name") && d["team_name"] != null:
		result.team_name = d["team_name"];
	if d.has("team_display_name") && d["team_display_name"] != null:
		result.team_display_name = d["team_display_name"];
	if d.has("id") && d["id"] != null:
		result.id = d["id"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["users"] = [];
	if users != null:
		for value in users:
			d["users"].append(value.to_dict());
	d["background_image_url"] = background_image_url;
	d["banner"] = banner;
	d["created_at"] = created_at;
	d["updated_at"] = updated_at;
	d["info"] = info;
	d["thumbnail_url"] = thumbnail_url;
	d["team_name"] = team_name;
	d["team_display_name"] = team_display_name;
	d["id"] = id;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

## 
class Users extends RefCounted:
	## An ID that identifies the team member.
	var user_id: String;
	## The team member’s login name.
	var user_login: String;
	## The team member’s display name.
	var user_name: String;


	static func from_json(d: Dictionary) -> Users:
		var result = Users.new();
		if d.has("user_id") && d["user_id"] != null:
			result.user_id = d["user_id"];
		if d.has("user_login") && d["user_login"] != null:
			result.user_login = d["user_login"];
		if d.has("user_name") && d["user_name"] != null:
			result.user_name = d["user_name"];
		return result;

	func to_dict() -> Dictionary:
		var d: Dictionary = {};
		d["user_id"] = user_id;
		d["user_login"] = user_login;
		d["user_name"] = user_name;
		return d;


	func to_json() -> String:
		return JSON.stringify(to_dict());

