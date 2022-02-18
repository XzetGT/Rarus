<?php

$host = "localhost";
$dbname = 'library';
$user = 'root';
$password = '';
$db = new PDO("mysql:host=$host;dbname=$dbname", $user, $password);

function insertToTable($db){
    $query = "INSERT IGNORE INTO authors (NAME, surname) VALUES('Имя5', 'Фамилия5'), ('Имя6', 'Фамилия6'), ('Имя7', 'Фамилия7')";
    $addDate = $db->exec($query);
    echo "В таблицу добавлено строки: $addDate";
}
//insertToTable($db);


function getBooksAuthors($db){
    $booksAuthorsList = [];

    $result = $db->query("SELECT DISTINCT b.title, a.name, a.surname FROM books AS b 
                          LEFT JOIN books_authors AS ba ON ba.book_id = b.bookID 
                          LEFT JOIN authors AS a ON a.authorID = ba.author_id 
                          LEFT JOIN books_genre AS bg ON bg.book_id = b.bookID 
                          LEFT JOIN genres AS g ON g.genreID = bg.genre_id 
                          WHERE g.title = 'Фантастика'");

    $i = 0;
    while($row = $result->fetch()){
        $booksAuthorsList[$i]['title'] = $row['title'];
        $booksAuthorsList[$i]['name'] = $row['name'];
        $booksAuthorsList[$i]['surname'] = $row['surname'];
        $i++;
    }
    return $booksAuthorsList;
}
$booksAuthorsList = getBooksAuthors($db);
echo 'Книги жанра Фантастика: <br>';
foreach ($booksAuthorsList as $booksAuthorsItem){
   echo "Название: ". $booksAuthorsItem['title'] ."; Имя Автора: ". $booksAuthorsItem['name'] ."; Фамилия Автора: ". $booksAuthorsItem['surname'] .'<br>';
}


function getHighestValue($db){
    $booksAuthorsList = [];

    $result = $db->query("SELECT a.name, a.surname, COUNT(ba.book_id) AS cnt 
                          FROM authors AS a
                          LEFT JOIN books_authors AS ba ON ba.author_id = a.authorID
                          GROUP BY a.authorID
                          ORDER BY cnt DESC LIMIT 1");


    $result->setFetchMode(PDO::FETCH_ASSOC);
    $highestValue = $result->fetch();

    return $highestValue;
}
$highestValue = getHighestValue($db);

echo "Автор, который написал больше всего книг: ". $highestValue['name'] ."  ". $highestValue['surname'] ." - ". $highestValue['cnt'];