set dotenv-load

template := justfile_directory()
test_output := "tests/tmp"

@_default:
	just --list
	echo "\n...with the following variables:"
	just --evaluate

@root:
	echo "{{ justfile_directory() }}"

generate template=template dest=test_output:
	copier copy -f --trust -r HEAD "{{template}}" "{{dest}}" \
		-d testing=true \
		-d project_name="Testing" \
		-d project_description="Testing this great template" \
		-d author_fullname="John Doe" \
		-d author_username="joesgithub" \
		-d author_email="joe@example.com"

clean:
	rm -rf {{test_output}}
