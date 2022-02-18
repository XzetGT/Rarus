<?php
$comment = $address = $name = $phone = $email = "";
$nameErr  = $phoneErr = $emailErr = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $comment = $_POST["comment"];
    $address = $_POST["address"];

    if (empty($_POST["name"])) {
        $nameErr = "Введите Ваши ФИО";
    } else {
        $name = $_POST["name"];
    }

    if (empty($_POST["phone"])) {
        $phoneErr = "Введите Ваш Телефон";
    } else {
        $phone = $_POST["phone"];
    }

    $pattern = '/@gmail/';
    if(preg_match($pattern, substr($_POST["email"],3))){
        $emailErr = "Регистрация пользователей с таким почтовым адресом невозможна!";
    } else {
        $email = $_POST["email"];
    }
}

?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Форма</title>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="post">
        <textarea name="comment" placeholder="Ваш комментарий:"></textarea>
        <input type="text" name='name' pattern="[А-Яа-я]*?\s[А-Яа-я]*?\s[А-Яа-я]*" placeholder="Ваши ФИО" required>
        <span><?php echo $nameErr;?></span>
        <input type="text" name="address" placeholder="Ваш адрес">
        <input name="email" type="email" placeholder="Ваш e-mail">
        <span><?php echo $emailErr;?></span>
        <input type="tel" name="phone" placeholder="Ваш телефон" required>
        <span><?php echo $nameErr;?></span>
        <input name="file" type="file">
        <button type="submit">Отправить</button>
    </form>
</head>
<body>

</body>
</html>

<style>
    input, textarea {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-pack: justify;
        -ms-flex-pack: justify;
        justify-content: space-between;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
        margin-top: 10px;

        width: 250px;
    }
    textarea {
        height: 100px;
    }
    button{
        padding: 5px;
        text-align: center;
        margin-top: 10px;
    }
</style>