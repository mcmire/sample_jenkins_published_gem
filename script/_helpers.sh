
# CHANGE ME
# The String Ruby versions that your gem supports.
# These will get passed straight to rbenv/rvm.
export SUPPORTED_RUBY_VERSIONS=(...)

error() {
  printf "\e[31mERROR:\e[0m $1\n"
}

die_if_master_unpushed() {
  local source_id="$(git rev-parse master)"
  local target_id="$(git rev-parse origin/master)"

  if [[ $source_id != $target_id ]]; then
    error "You need to push master first."
    exit -1
  fi
}

die_if_not_on_master() {
  if [[ "$(git symbolic-ref HEAD 2>/dev/null)" != "refs/heads/master" ]]; then
    error "You are not on the master branch."
    exit -2
  fi
}

die_if_unstaged_changes() {
  if ! git diff --no-ext-diff --ignore-submodules --quiet --exit-code; then
    error "You have unstaged changes. Please commit or stash them."
    exit -3
  fi
}

die_if_staged_changes() {
  if ! git diff-index --cached --quiet --ignore-submodules HEAD --; then
    error "You have staged changes waiting to be committed. Please commit or stash them."
    exit -3
  fi
}

die_if_untracked_changes() {
  if [[ "$(git ls-files --others --exclude-standard)" ]]; then
    error "There are untracked files present. Please commit or stash them."
    exit -3
  fi
}

die_if_unsafe_to_pull() {
  die_if_staged_changes
  die_if_unstaged_changes
}

die_if_dirty() {
  die_if_staged_changes
  die_if_unstaged_changes
  die_if_untracked_changes
}

ruby_manager() {
  local ruby_manager=""
  if [[ "$(which rbenv)" ]]; then
    ruby_manager="rbenv"
  elif [[ "$(which rvm)" ]]; then
    ruby_manager="rvm"
  else
    echo "Could not find a ruby manager?!"
    exit -4
  fi
  echo $ruby_manager
}

switch_to_ruby() {
  case "$(ruby_manager)" in
    rbenv)
      rbenv shell "$1"
      ;;
    rvm)
      rvm use "$1"
      ;;
  esac
}

run_in_rubies() {
  # run_in_rubies VERSIONS... COMMAND
  local args=("$@")
  local command="${args[${#args[@]}-1]}"  # srsly bash, wtf
  unset args[${#args[@]}-1]
  local versions=("${args[@]}")

  case "$(ruby_manager)" in
    rbenv)
      # TODO
      echo "haven't done this yet"
      exit -99
      ;;
    rvm)
      IFS=","
      rvm "${versions[*]}" 'do' bash -c "$command"
      ;;
  esac
}

