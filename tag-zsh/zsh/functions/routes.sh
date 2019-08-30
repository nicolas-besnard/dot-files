routes() {
  CACHE_FILE=tmp/routes

  # regenerate tmp/routes if it is not already generated or it is older than the routes config file
  if [ $CACHE_FILE -ot config/routes.rb ] || [ ! -e $CACHE_FILE ]; then
    echo 'generating new cache...'
    ROUTES="$(bundle exec rake routes)"

    if [[ $? -ne 0 ]]; then
      return 1
    fi

    echo "$ROUTES" > $CACHE_FILE
  fi

  if (($#)); then
    if type ag >/dev/null; then
      ag --color --nonumbers "${(j:|:)@}" $CACHE_FILE
    else
      grep "${(j:|:)@}" $CACHE_FILE
    fi
  else
    if type fzf >/dev/null; then
      cat $CACHE_FILE | fzf
    else
      cat $CACHE_FILE
    fi
  fi
}
