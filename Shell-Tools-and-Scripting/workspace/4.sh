#!/bin/bash
find ./html_root/ -type f -name "*.html" | xargs -d '\n' tar -cvzf html.zip
