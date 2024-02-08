@tool
extends RefCounted

class_name TwitchEndPredictionResponse

## A list that contains the single prediction that you updated.
var data: Array[TwitchPrediction];

static func from_json(d: Dictionary) -> TwitchEndPredictionResponse:
	var result = TwitchEndPredictionResponse.new();
	result.data = d["data"];
	return result;

func to_dict() -> Dictionary:
	var d: Dictionary = {};
	d["data"] = data;
	return d;

func to_json() -> String:
	return JSON.stringify(to_dict());
