diffbot()
{
	local URL="$1"
	local TOKEN="$2"
	curl -s -G \
		--data-urlencode token="$TOKEN" \
		--data-urlencode url="$URL" \
		http://api.diffbot.com/v2/article |
	sh JSON.sh -b
}

json_path()
{
	local JSON="$1"
	shift

	local -a JSONPATH
	while [ $# -ne 0 ]
	do
		JSONPATH+=('"\?'"$1"'"\?')
		shift
	done

	local IFS=,
	echo "$JSON" | grep -- "^\[${JSONPATH[*]}\]"  | sed 's/^\S\+\s\+//'
}
