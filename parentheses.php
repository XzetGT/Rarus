<?php
function hasMatchedParenthesis($expression) {
    $len = strlen($expression);
    $stack = [];
    for ($i = 0; $i < $len; $i++) {
        switch ($expression[$i]) {
            case '(': array_push($stack, 0); break;
            case ')':
                if (array_pop($stack) !== 0)
                    return false;
                break;
            default: break;
        }
    }
    return (empty($stack));
}

$expression = '';
$expressionErr = '';
if ($_SERVER["REQUEST_METHOD"] == "POST"){
    $expression = $_POST['expression'];
}
if(hasMatchedParenthesis($expression)){
    echo 'Арифметическое выражени верное!';
} else {
    echo 'Ошибка, исправьте выражение!';
}

?>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Скобки</title>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="post">
        <input type="text" name="expression" placeholder="Введите арифметическое выражение" required>
        <span><?php echo $expressionErr;?></span>
        <button type="submit">Отправить</button>
    </form>
</head>
<body>

</body>
</html>