#!/bin/bash


    # IEEE_publications_extractor is a bash script to simplify the downoading of IEEE journals from sci-hub.
    #
    # Copyright (C) 2016 Doyle Fermi
    #
    # This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
    #
    # This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
    #
    # You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.

echo "Script to extract journals from http://ieeexplore.ieee.org/Xplore/home.jsp"
echo "Enter Title of Journal: "
read TITLE
echo "Enter DOI of IEEE journal to view: "
read DOI
url=$(curl -s "http://sci-hub.cc/$DOI" | awk '/http/{print $4}' | grep pdf | tr -d '"')
curl --progress-bar $url -o "$TITLE.pdf"
