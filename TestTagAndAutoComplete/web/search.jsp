<%-- 
    Document   : search
    Created on : Oct 10, 2022, 11:52:50 AM
    Author     : PhuHV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Simple Tags Input EXAMPLE</title>
        <link href="https://www.cssscript.com/demo/sticky.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.1.3/minty/bootstrap.min.css" />
        <!-- Load the stylesheet -->
        <link rel="stylesheet" href="src/simple-tag-input.css" />
    </head>

    <body>
        <div class="container">
            <form action="search">
                <label for="tagsList">Ingredients you have:</label>
                <!-- Create an empty list to hold the tags -->
                <ul id="tagsList"></ul>
                <!-- Create a text field for the tags input -->
                <input type="text" name="txt" class="form-control" id="tagsInput" spellcheck="false" placeholder="Type an ingredient and Hit ENTER"/>
                <input type="submit" value="search">
            </form>
        </div>
        <!-- Load the main JavaScript -->
        <script src="src/simple-tag-input.js"></script>
        <script>
            // options
            let options = {
                inputEl: "tagsInput",
                listEl: "tagsList",
                // enable the autocomplete
                autocompleteSearchList: [
                    "Abarth",
                    "Alfa Romeo",
                    "Aston Martin",
                    "Audi",
                    "Bentley",
                    "BMW",
                    "Bugatti",
                    "Cadillac",
                    "Chevrolet",
                    "Chrysler",
                    "Citroën",
                    "Dacia",
                    "Daewoo",
                    "Daihatsu",
                    "Dodge",
                    "Donkervoort",
                    "DS",
                    "Ferrari",
                    "Fiat",
                    "Fisker",
                    "Ford",
                    "Honda",
                    "Hummer",
                    "Hyundai",
                    "Infiniti",
                    "Iveco",
                    "Jaguar",
                    "Jeep",
                    "Kia",
                    "KTM",
                    "Lada",
                    "Lamborghini",
                    "Lancia",
                    "Land Rover",
                    "Landwind",
                    "Lexus",
                    "Lotus",
                    "Maserati",
                    "Maybach",
                    "Mazda",
                    "McLaren",
                    "Mercedes-Benz",
                    "MG",
                    "Mini",
                    "Mitsubishi",
                    "Morgan",
                    "Nissan",
                    "Opel",
                    "Peugeot",
                    "Porsche",
                    "Renault",
                    "Rolls-Royce",
                    "Rover",
                    "Saab",
                    "Seat",
                    "Skoda",
                    "Smart",
                    "SsangYong",
                    "Subaru",
                    "Suzuki",
                    "Tesla",
                    "Toyota",
                    "Volkswagen",
                    "Volvo"
                ]
            };

            // initialize the tags input, DONE!
            var tagsInputWithSearch = new simpleTagsInput(options);
        </script>
    </body>

</html>
