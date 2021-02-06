#! @runtimeShell@

if [ $# -eq 0 ]; then
    echo "@version@ (@codeName@)"
    exit 0
fi

case "$1" in
  -h|--help)
    exec man nixos-version
    exit 1
    ;;
  --hash|--revision)
    if ! [[ @revision@ =~ ^[0-9a-f]+$ ]]; then
      echo "$0: Nixpkgs commit hash is unknown" >&2
      exit 1
    fi
    echo "@revision@"
    ;;
  --configurationRevision)
    if ! [[ @configurationRevision@ =~ ^[0-9a-f]+$ ]]; then
      echo "$0: configuration commit hash is unknown" >&2
      exit 1
    fi
    echo "@configurationRevision@"
    ;;
  --json)
    cat <<EOF
@json@
EOF
    ;;
  *)
    echo "$0: unknown option $1" >&2
    exit 1
    ;;
esac
