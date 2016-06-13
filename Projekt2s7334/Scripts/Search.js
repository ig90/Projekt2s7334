$(document).ready(function () {
    $('#<%=lblNoRecords.ClientID%>').css('display', 'none');

    $('#<%=btnSubmit.ClientID%>').click(function (e) {
        $('#<%=lblNoRecords.ClientID%>').css('display', 'none'); // Hide No records to display label.
        $("#<%=gdRows.ClientID%> tr:has(td)").hide(); // Hide all the rows.

        var iCounter = 0;
        var sSearchTerm = $('#<%=txtSearch.ClientID%>').val(); //Get the search box value

        if (sSearchTerm.length == 0) //if nothing is entered then show all the rows.
        {
            $("#<%=gdRows.ClientID%> tr:has(td)").show();
            return false;
        }
        //Iterate through all the td.
        $("#<%=gdRows.ClientID%> tr:has(td)").children().each(function () {
            var cellText = $(this).text().toLowerCase();
            if (cellText.indexOf(sSearchTerm.toLowerCase()) >= 0) //Check if data matches
            {
                $(this).parent().show();
                iCounter++;
                return true;
            }
        });
        if (iCounter == 0) {
            $('#<%=lblNoRecords.ClientID%>').css('display', '');
        }
        e.preventDefault();
    })
})