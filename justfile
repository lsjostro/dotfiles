set shell := ["/usr/bin/env", "bash", "-euo", "pipefail", "-c"]

[private]
default:
	@just --list

boot:
  nh os boot .

build:
  nh os build .

switch:
  nh os switch .

update:
  nh os switch --update --ask .

clean:
  nh clean all

home-build:
  nh home build .

home-switch:
  nh home switch .

home-update:
  nh home switch --update --ask .
