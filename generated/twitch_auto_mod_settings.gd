@tool
extends RefCounted

class_name TwitchAutoModSettings

## The broadcaster’s ID.
var broadcaster_id: String;
## The moderator’s ID.
var moderator_id: String;
## The default AutoMod level for the broadcaster. This field is **null** if the broadcaster has set one or more of the individual settings.
var overall_level: int;
## The Automod level for discrimination against disability.
var disability: int;
## The Automod level for hostility involving aggression.
var aggression: int;
## The AutoMod level for discrimination based on sexuality, sex, or gender.
var sexuality_sex_or_gender: int;
## The Automod level for discrimination against women.
var misogyny: int;
## The Automod level for hostility involving name calling or insults.
var bullying: int;
## The Automod level for profanity.
var swearing: int;
## The Automod level for racial discrimination.
var race_ethnicity_or_religion: int;
## The Automod level for sexual content.
var sex_based_terms: int;

static func from_json(d: Dictionary) -> TwitchAutoModSettings:
	var result = TwitchAutoModSettings.new();
	if d.has("broadcaster_id") && d["broadcaster_id"] != null:
		result.broadcaster_id = d["broadcaster_id"];
	if d.has("moderator_id") && d["moderator_id"] != null:
		result.moderator_id = d["moderator_id"];
	if d.has("overall_level") && d["overall_level"] != null:
		result.overall_level = d["overall_level"];
	if d.has("disability") && d["disability"] != null:
		result.disability = d["disability"];
	if d.has("aggression") && d["aggression"] != null:
		result.aggression = d["aggression"];
	if d.has("sexuality_sex_or_gender") && d["sexuality_sex_or_gender"] != null:
		result.sexuality_sex_or_gender = d["sexuality_sex_or_gender"];
	if d.has("misogyny") && d["misogyny"] != null:
		result.misogyny = d["misogyny"];
	if d.has("bullying") && d["bullying"] != null:
		result.bullying = d["bullying"];
	if d.has("swearing") && d["swearing"] != null:
		result.swearing = d["swearing"];
	if d.has("race_ethnicity_or_religion") && d["race_ethnicity_or_religion"] != null:
		result.race_ethnicity_or_religion = d["race_ethnicity_or_religion"];
	if d.has("sex_based_terms") && d["sex_based_terms"] != null:
		result.sex_based_terms = d["sex_based_terms"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["broadcaster_id"] = broadcaster_id;
	d["moderator_id"] = moderator_id;
	d["overall_level"] = overall_level;
	d["disability"] = disability;
	d["aggression"] = aggression;
	d["sexuality_sex_or_gender"] = sexuality_sex_or_gender;
	d["misogyny"] = misogyny;
	d["bullying"] = bullying;
	d["swearing"] = swearing;
	d["race_ethnicity_or_religion"] = race_ethnicity_or_religion;
	d["sex_based_terms"] = sex_based_terms;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());

