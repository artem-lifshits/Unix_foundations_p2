app_init() {

    app_help() {	# a nested definition

		echo "I am the demo script!"
		exit 0
    }
}

app_help	# nice try, but...

app_init
app_help	# now OK
