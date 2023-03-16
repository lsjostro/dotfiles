# 🎨 Shelman Theme 🎨

## Install from source

`bazel build //:pkg_tar && tar -C $HOME/.config --overwrite -xvf bazel-bin/pkg_tar.tar`

## Development

To run in "dev-mode" for quick iteration, use [ibazel](https://github.com/bazelbuild/bazel-watcher) something like this:

`ibazel -run_command_after_success="tar -C $HOME/.config --overwrite -xvf bazel-bin/pkg_tar.tar" build //:pkg_tar`
