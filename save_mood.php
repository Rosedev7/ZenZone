<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "zenzone_db";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user_id = $_POST['user_id'];
    $mood_rating = $_POST['mood_rating'];
    $journal_text = $_POST['journal_text'];
    $entry_date = date("Y-m-d");

    $sql = "INSERT INTO JournalEntries (user_id, entry_date, mood_rating, journal_text) 
            VALUES ('$user_id', '$entry_date', '$mood_rating', '$journal_text')";

    if ($conn->query($sql) === TRUE) {
        echo "Mood entry saved!";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}
$conn->close();
?>
