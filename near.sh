#!/bin/bash

RPC_URL="https://near.lava.build/lava-referer-e90d7193-8096-4630-9dd4-aade169cd365/"

OUTPUT_DIR="logs"

UA=$(shuf -n 1 ua.txt)

near_data=$(curl -A UA -x http://185.242.92.173:8257 --proxy-user cwmgurpo:3lv7ii9r7e6p -s -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"block","id":"HappyCuanAirdrop","params":{"finality":"final"}}' "$RPC_URL")

if [ $? -eq 0 ]; then
    if [ ! -d "$OUTPUT_DIR" ]; then
        mkdir "$OUTPUT_DIR"
    fi
    
    echo "$near_data" >> "$OUTPUT_DIR/near.txt"
    
    echo "NEAR data fetched and saved to $OUTPUT_DIR/near.txt."
else
    echo "Failed to fetch NEAR data."
fi
