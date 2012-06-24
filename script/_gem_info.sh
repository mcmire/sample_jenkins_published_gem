
GEM_NAME="$(bundle exec rake about:name)"
GEM_VERSION="$(bundle exec rake about:version)"
GEM_VERSION_FILE="$(bundle exec rake about:version_file)"
GEM_VERSION_FILENAME="$(basename "$GEM_VERSION_FILE")"
