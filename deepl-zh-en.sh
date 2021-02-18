#!/bin/bash

# Dependency: requires curl (https://curl.se/)
# Install via homebrew: `brew install curl`

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title DeepL-ZH-EN
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "Text" }

curl -s --request POST 'https://www2.deepl.com/jsonrpc' \
--header 'Content-Type: application/json' \
--data-raw '{
    "id": 90750013,
    "jsonrpc": "2.0",
    "method": "LMT_handle_jobs",
    "params": {
        "commonJobParams": {},
        "jobs": [
            {
                "kind": "default",
                "preferred_num_beams": 1,
                "quality": "fast",
                "raw_en_context_after": [],
                "raw_en_context_before": [],
                "raw_en_sentence": '"\"$1\""'
            }
        ],
        "lang": {
            "source_lang_user_selected": "ZH",
            "target_lang": "EN",
            "user_preferred_langs": [
                "EN",
                "ZH"
            ]
        },
        "priority": -1,
        "timestamp": 1613644286977
    }
}
' | \
python3 -c 'import json,sys;obj=json.load(sys.stdin);print(obj["result"]["translations"][0]["beams"][0]["postprocessed_sentence"]);'
