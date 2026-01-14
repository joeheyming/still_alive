#!/usr/bin/env bash
# Still Alive - GLaDOS sings the Portal credits song in your terminal

if ! command -v say >/dev/null; then
	echo "say command not found. Please install it."
	exit 1
fi

if ! command -v pv >/dev/null; then
	echo "pv command not found. Please install it."
	exit 1
fi

GREEN='\033[0;32m\033[40m'
NC='\033[0m'
shopt -s nocasematch
echo -e "${GREEN}"
trap 'echo -e "${NC}"' EXIT

slow_type() {
	echo "$1" | pv -qL 10
}

control_c() {
	pkill -P $$ say 2>/dev/null
	exit $?
}

trap control_c SIGINT

show_file() {
	clear
	cat "$1"
}

clear
slow_type "Forms FORM-29827281-12"
slow_type "Test Assessment Report"
echo ""

while read -r line; do
	if [[ $line != . ]]; then
		(say -v Vicki "$line" &)
		[[ $line == *"Aperture Science"* ]] && show_file ./aperture_logo.txt
		[[ $line == *"black mesa"* ]] && show_file ./black_mesa_logo.txt
		[[ $line == *"cake"* ]] && show_file ./cake.txt
		[[ $line == *"heart"* ]] && show_file ./heart.txt
		slow_type "$line"
	else
		sleep 1
	fi
done <./still_alive.txt

show_file ./aperture_logo.txt
