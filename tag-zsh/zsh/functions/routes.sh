any_route_files_changed() {
  if [ ! -d "config/routes" ]; then
    return 1
  fi

  for route_file in config/routes/*.rb; do
    if [ $1 -ot $route_file ]; then
      echo "$route_file changed"
      return 0
    fi
  done

  return 1
}

routes() {
  CACHE_FILE=tmp/routes

  any_route_files_changed $CACHE_FILE

  if [ $? -eq 0 ] || [ $CACHE_FILE -ot config/routes.rb ] || [ ! -e $CACHE_FILE ]; then
    echo 'generating new cache...'
    ROUTES="$(bundle exec rake routes)"

    if [[ $? -ne 0 ]]; then
      return 1
    fi

    echo "$ROUTES" > $CACHE_FILE
  fi

  if (($#)); then
    if type ag >/dev/null; then
      ag --color --nonumbers "${(j:|:)@}" $CACHE_FILE | xargs echo -n
    else
      grep "${(j:|:)@}" $CACHE_FILE
    fi
  else
    if type fzf >/dev/null; then
      cat $CACHE_FILE | fzf | xargs echo -n
    else
      cat $CACHE_FILE
    fi
  fi
}
