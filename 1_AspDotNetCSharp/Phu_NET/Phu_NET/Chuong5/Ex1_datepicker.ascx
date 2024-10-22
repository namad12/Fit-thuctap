<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Ex1_datepicker.ascx.cs" Inherits="Phu_NET.Chuong5.datepicker" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DatePicker Control</title>
    <!-- Import jQuery UI CSS -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- Import jQuery and jQuery UI -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>

    <input type="text" id="datepicker"  readonly>

    <script>
        $(function() {
             
            $("#datepicker").datepicker({
                dateFormat: "dd/mm/yy",  
            });

            // Khi click vào textbox, bảng DatePicker sẽ hiện ra
            $("#datepicker").focus(function() {
                $(this).datepicker("show");
            });
        });
    </script>

</body>
</html>