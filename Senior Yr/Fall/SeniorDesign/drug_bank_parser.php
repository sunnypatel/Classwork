<?php

$data = simplexml_load_file("drugbank.xml");
$dataArray = (array) $data;

$drugs = $dataArray['drug'];
//var_dump($dataArray);


$link = mysql_connect('178.18.16.226:3306', 'ashvin', 'ashvin2013');
if (!$link) {
    die('Could not connect: ' . mysql_error());
}

echo 'Connected successfully<br>';

$db_selected = mysql_select_db('ashvin', $link);
if (!$db_selected) {
    die ('Can\'t use ashvin db : ' . mysql_error());
}
echo 'Selected db ashvin <br>';

//var_dump($drugs);
$fields = array();
$count = 0;


echo "SizeOf($Drugs)=".sizeof($drugs);


for($i=0; $i<sizeof($drugs); $i++){
	
		$drug = (array)$drugs[$i];
		//$keys = array_keys($drug);
		
		//$fields += $keys;
		//$fields = array_unique($fields);

		$query = "SELECT drug_id FROM drugs WHERE 'drug_id' = '".$drug['drugbank-id']."'";

			$result = mysql_query($query);
			echo $result."<br>";
			if (empty($result)) {
			 $count += insert_drug($drug['drugbank-id'],00,$drug['name'],$drug['description'],$drug['indication'], $drug['pharmacology']);
			   
			   // return 1;
			} else {
				//return 0;
			}	 
		
		/*
	
		foreach($drug['drug-interactions'] as $drug_interaction){
			$drug_interaction = (array) $drug_interaction;

			
			$query = "INSERT INTO drug_interactions (`drug_id`, `interaction_drug_id`) VALUES ('".$drug['drugbank-id']."', '".$drug_interaction['drug']."')";
			$result = mysql_query($query);
			if (!$result) {
			   $message  = 'Invalid query: ' . mysql_error() . "\n";
			   $message .= 'Whole query: ' . $query;
			   die($message);
			   $count++;
			   // return 1;
			} else {
				//return 0;
			}			
		}*/
		//echo $i." ".$drug['drugbank-id']."<br>";
}


//var_dump($fields);
echo "total drugs=".sizeof($drugs)."<br>";
echo "errors=".$count;


mysql_close($link);



function insert_drug($drug_id="00", $barcode=0, $name="as", $description="asdf", $indication="asdf", $pharm="asdf") {
	
	$query = "INSERT INTO drugs (`drug_id`, `barcode`, `name`, `description`, `indication`, `pharmacology`) VALUES ('".$drug_id."', '".$barcode."', '".$name."', '".$description."', '".$indication."', '".$pharm."');";
	$result = mysql_query($query);
	// Check result
	// This shows the actual query sent to MySQL, and the error. Useful for debugging.
	if (!$result) {
	    $message  = 'Invalid query: ' . mysql_error() . "\n";
	    $message .= 'Whole query: ' . $query;
	    die($message);
	    return 1;
	} else {
		return 0;
	}
}
?>