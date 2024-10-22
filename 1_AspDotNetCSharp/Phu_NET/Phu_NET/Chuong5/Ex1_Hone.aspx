<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ex1_Hone.aspx.cs" Inherits="Phu_NET.Chuong5.Ex1_Hone" %>
<%@ Register Src="~/Chuong5/Ex1_datepicker.ascx" TagPrefix="uc1" TagName="Ex1_datepicker" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hello </title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:label ID="lblXinChao" runat="server"></asp:label>
            <h1>Chọn Ngày</h1>
            <!-- Textbox để hiển thị ngày -->
            <label>Date: </label>
            <uc1:Ex1_datepicker runat="server" id="datepicker" />
        </div>
    </form>
</body>
</html>
