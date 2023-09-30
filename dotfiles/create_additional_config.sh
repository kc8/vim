#!/usr/bin/env bash

directory=$HOME
file_name=".additional_config.sh"
path="$directory/$file_name"

echo "#!/usr/bin/env bash" > $path
chmod +x  $path
