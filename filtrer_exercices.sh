#!/bin/bash

input_file="Enregistrement Ynov.csv"
output_file="Sortie_Enregistrement_Ynov.csv"

max_lives=2
lives=$max_lives
consecutive_practice_days=0

process_line() {
    local formattedDate="$1"
    local level="$2"
    local isLying="$3"
    local isSitting="$4"
    local series="$5"

    # Check if it's a practice day
    if [[ "$isLying" == "True" || "$isSitting" == "True" ]]; then
        ((consecutive_practice_days++))
        ((series++))
        if ((consecutive_practice_days % 5 == 0)); then
            ((lives++))
            ((lives > max_lives)) && lives=$max_lives
        fi
    else
        ((lives--))
        consecutive_practice_days=0
        if ((lives < 0)); then
            series=0
            lives=$max_lives
        fi
    fi

    printf '%s,%s,%s,%s,%d,%d\n' "$formattedDate" "$level" "$isLying" "$isSitting" "$series" "$lives"
}

{
    printf 'formattedDate,Niveau,Allonge,Assis,serie,lives\n'

    tail -n +2 "$input_file" | while IFS=',' read -r formattedDate level isLying isSitting; do
        # Remove leading/trailing quotes from fields
        formattedDate=${formattedDate//\"/}
        level=${level//\"/}
        isLying=${isLying//\"/}
        isSitting=${isSitting//\"/}

        series=0

        process_line "$formattedDate" "$level" "$isLying" "$isSitting" "$series"
    done
} > "$output_file"

echo "Processing completed. Results are stored in $output_file"
