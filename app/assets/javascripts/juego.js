document.onload = function shrink()
    {
        var textTables = document.getElementById("game_table");
        var tablesLength = textTables.rows[0].cells.length;
        var tdLength = textTables.offsetWidth / tablesLength;
        var textTds = document.getElementsByClassName("games");
        // Loop through all of the dynamic divs on the page
        for(var i=0; i< tablesLength; i++) {
            var textTd = textTds[i];

            // Loop through all of the dynamic spans within the div
            

            // Use the same looping logic as before
            textTd.style.fontSize = 35;

            while(textTd.offsetWidth > tdLength - 10)
            {
                textTd.style.fontSize = parseInt(textTd.style.fontSize, 10) - 1;
            }

        }

    }