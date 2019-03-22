_load_settings() {
  _dir="$1"

  if [ -d "$_dir" ]; then
    # if [ -d "$_dir/pre" ]; then
    #   for config in "$_dir"/pre/**/*(N-.); do
    #     . $config
    #   done
    # fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/pre/*)
          :
          ;;
        "$_dir"/post/*)
          :
          ;;
        *)
          if [ -f $config ]; then
            . $config
          fi
          ;;
      esac
    done

    # if [ -d "$_dir/post" ]; then
    #   for config in "$_dir"/post/**/*(N-.); do
    #     . $config
    #   done
    # fi
  fi
}

_load_if_exists() {
  [[ -f $1 ]] && . $1
}
