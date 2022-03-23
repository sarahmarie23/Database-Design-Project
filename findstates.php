<?php

    echo "CS 328 Homework 4"."<br>";
    echo "Sarah Jimenez"."<br>";
    echo "3/22/2022"."<br><br>";


    echo "<pre><b><h2>\t===== Problem 1 =====</h2></b></pre>";
    
    $states = "California Georgia Indiana Louisiana Minnesota Texas Virginia";
    $statesArray1 = [];

    echo "1. State that ends in 'nia'<br><br>";

        preg_match("/\w*nia\b/", $states, $matches);
        $statesArray1[0] = $matches[0];
 

    echo "2. Find and add a state that begins with 'G' and ends in 'a'<br><br>";
 
        preg_match("/\bG\w*a\b/", $states, $matches);
        $statesArray1[1] = $matches[0];

    
    echo "3. Display the contents of the array to screen<br><br>";

    echo "<pre>"."\tVersion 1"."</pre>";

        print_r($statesArray1);

    echo "<pre>"."\tVersion 2"."</pre>";


        foreach($statesArray1 as $value) {
            echo $value."<br>";
        }

    echo "<br>";
 

    echo "4. Make a new array with additional values<br><br>";

        $statesArray2 = $statesArray1;

        array_push($statesArray2, "West Virginia", "North Carolina", 
                   "South Carolina", "New York", "New Mexico", "New Jersey");

        foreach($statesArray2 as $value) {
	    echo "$value<br>";
        }

    echo "<br>";

    echo "5. Number of states in \$statesArray2<br><br>";
    
    echo "There are ".count($statesArray2)." states in the array."."<br><br>";


    echo "6. Add states that begin with 'N' or end in 'nia', add to new array<br>";

    $statesArrayNia = [];

    foreach($statesArray2 as $value) {
        if(preg_match("/^N|nia$/", $value)) {
  	    array_push($statesArrayNia, $value);
	}
    }

    echo "<br>";

    echo "7. Display \$statesArrayNia to the screen<br><br>";

    for($i = 0; $i < count($statesArrayNia); $i++) {
        echo "<pre>\t$statesArrayNia[$i]</pre>";
    } 

    echo "<br>";



?>
