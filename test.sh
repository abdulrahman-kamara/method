#!/bin/bash

# Fonction pour exécuter un cas de test
run_test() {
    local test_name=$1
    local input_file=$2
    local expected_output=$3

    echo "Exécution du cas de test : $test_name"

    # Exécuter l'algorithme avec le fichier d'entrée
    output=$(./filtrer_exercices.sh "$input_file")

    # Comparer la sortie avec la sortie attendue
    if [ "$output" == "$expected_output" ]; then
        echo "Succès"
    else
        echo "Échec"
        echo "Sortie attendue : $expected_output"
        echo "Sortie obtenue : $output"
    fi
    echo ""
}

# Exécuter les cas de test
run_test "Cas de test 1" "test1.csv" "Sortie attendue pour le cas de test 1"
run_test "Cas de test 2" "test2.csv" "Sortie attendue pour le cas de test 2"
# ... Ajouter d'autres cas de test ici

