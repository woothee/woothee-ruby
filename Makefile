all: test

testsets:
	git submodule update --init

checkyaml: testsets
	perl woothee/bin/dataset_checker.pl

lib/woothee/dataset.rb: testsets
	ruby scripts/dataset_yaml2rb.rb
	sync; sync; sync

test: lib/woothee/dataset.rb
	rspec spec
