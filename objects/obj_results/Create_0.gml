gamescore = global.results_score;
hits = global.results_hits;
misses = global.results_misses;
max_combo = global.results_max_combo;
total_notes = hits + misses;

if (total_notes > 0){
    accuracy = hits / total_notes * 100;
}
else{
    accuracy = 0;
}
if (accuracy = 100){
	rank = "P";
}
else if (accuracy >= 95){
    rank = "S";
}
else if (accuracy >= 90){
    rank = "A";
}
else if (accuracy >= 80){
    rank = "B";
}
else if (accuracy >= 70){
    rank = "C";
}
else if (accuracy >= 60){
    rank = "D";
}
else if (accuracy >= 50){
	rank = "F";
}

if (accuracy = 0){
	rank = "I hope the instrumental sounded nice"
}