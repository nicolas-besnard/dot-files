routes() {
  # regenerate tmp/routes if it is not already generated or it is older than the routes config file
  if [[ ! -f tmp/routes ]] || [[ tmp/routes -ot config/routes.rb ]]; then
    rake routes >! tmp/routes
  fi

  if (($#)); then
    if type ag >/dev/null; then
      ag --color --nonumbers "${(j:|:)@}" tmp/routes
    else
      grep "${(j:|:)@}" tmp/routes
    fi
  else
    cat tmp/routes
  fi
}
