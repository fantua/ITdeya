<!DOCTYPE html>
<html lang="uk">
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        {{ get_title() }}

        <!-- Bootstrap -->
        {{ stylesheet_link('css/bootstrap.min.css') }}

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        {{ javascript_include('https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js') }}
        {{ javascript_include('https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js') }}
        <![endif]-->

    </head>
    <body>

        {{ content() }}

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        {{ javascript_include('https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js') }}
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        {{ javascript_include('js/bootstrap.min.js') }}

    </body>
</html>