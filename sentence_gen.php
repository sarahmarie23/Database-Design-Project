<?php

    echo "CS 328 Homework 4<br>";
    echo "Sarah Jimenez<br>";
    echo "3/22/2022<br><br>";

    echo "<pre><b><h2>===== Problem 2 =====</h2></b></pre>";
    
    echo "Make a random sentence generator.<br>";

    $noun = array("boy", "girl", "cow", "watermelon", "Samsung Note", "tree", 
                  "tractor", "iPhone", "car", "chicken", "pen", "chair", "potato");

    $verb = array("kissed", "fried", "dropped", "wrote with", "called on", 
                  "chopped", "fed", "sat on", "skinned", "exploded", 
                  "drove", "ruined");

    $noun1 = $noun[rand(0, count($noun)-1)];
    $noun2 = $noun[rand(0, count($noun)-1)];
    $verb = $verb[rand(0, count($verb)-1)];

    echo "The "."$noun1"." "."$verb"." the "."$noun2."; 

?>
