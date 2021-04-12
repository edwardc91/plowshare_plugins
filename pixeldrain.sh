# Plowshare pixeldrain.com module
# Copyright (c) 2021 Eduardo Miguel Hernandez
#
# This file is to use with Plowshare.
#
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

MODULE_PIXELDRAIN_REGEXP_URL = 'https\?://\(www\.\)\?pixeldrain\.com/'

xxx_download() {
    local -r COOKIE_FILE=$1
    local -r URL=$2
    local PAGE FILE_URL FILE_NAME

    echo "$FILE_URL"
    echo "$FILE_NAME"
    return 0
}