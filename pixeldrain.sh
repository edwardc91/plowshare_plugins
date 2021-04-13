# Plowshare pixeldrain.com module
# Copyright (c) 2021 Eduardo Miguel Hernandez
#
# This file is to use with Plowshare.
#
# Check official plowshare repository https://github.com/mcrapet/plowshare
# -- Copy from plowshare official modules --
# Plowshare is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Plowshare is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Plowshare.  If not, see <http://www.gnu.org/licenses/>.

MODULE_PIXELDRAIN_REGEXP_URL='https\?://\(www\.\)\?pixeldrain\.com/'

MODULE_PIXELDRAIN_DOWNLOAD_OPTIONS=""
MODULE_PIXELDRAIN_DOWNLOAD_RESUME=yes
MODULE_PIXELDRAIN_DOWNLOAD_FINAL_LINK_NEEDS_COOKIE=no
MODULE_PIXELDRAIN_DOWNLOAD_SUCCESSIVE_INTERVAL=

pixeldrain_download() {
    local -r URL=$2
    local PAGE FILE_URL FILENAME FILE_ID BASE_URL API_BASE_URL

    log_debug "Checking file..."

    BASE_URL=$(basename_url $URL)
    API_BASE_URL="$BASE_URL/api/file/"

    PAGE=$(curl -L "$URL") || return

    # File does not exist on this server
    # File has expired and does not exist anymore on this server
    if match '404, File Not Found' "$PAGE"; then
        return $ERR_LINK_DEAD
    fi

    log_debug "File exists"

    FILENAME=$(parse_attr '=.og:title.' content <<< "$PAGE") || return

    FILE_ID=$(parse . 'https://pixeldrain.com/\w/\([[:alnum:]]\+\)' <<< "$URL") || return

    if [ -z "$FILE_ID" ]; then
        log_error 'Could not parse file ID.'
        return $ERR_FATAL
    fi

    log_debug "File/Folder ID: '$FILE_ID'"

    
    FILE_URL="$API_BASE_URL$FILE_ID"

    echo "$FILE_URL"
    echo "$FILENAME"
    return 0
}