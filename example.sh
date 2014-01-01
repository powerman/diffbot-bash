source Diffbot.sh

TOKEN="$1"
URL=http://blog.diffbot.com/diffbots-new-product-api-teaches-robots-to-shop-online/

REPLY=$(diffbot $URL $TOKEN)
echo Author is: $(json_path "$REPLY" author)
echo Second tag name is: $(json_path "$REPLY" supertags 1 name)
