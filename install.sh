#!/bin/sh

APP_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PYFILE="$APP_ROOT/src/webpoliscraper.py"
SERVICEFILE="$APP_ROOT/src/PoliScraper.workflow"
FOWNER=$(stat -f '%Su' /usr/local/bin)

if [[ "$FOWNER" == "root" ]]; then
    use_sudo="sudo"
else
    use_sudo=""
fi

$use_sudo cp $PYFILE /usr/local/bin
$use_sudo chmod +x /usr/local/bin/webpoliscraper.py

cp -r $SERVICEFILE ~/Library/Services
