<%@ Page Title="" Language="C#" MasterPageFile="~/Chuong6/Ex2/Ex2_PageM.Master" AutoEventWireup="true" CodeBehind="Ex2_Home.aspx.cs" Inherits="Phu_NET.Chuong6.Ex2.Ex2_Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .contain{
            display:flex;
        }
        a{
            width:17%;
            margin: 10px;
        }
        img{
            border: 3px solid red;
            width:100%;
        }
        .home{
            padding:5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="home">
       <h3 >Welcome to out FPT Software Academy community web site</h3>
        <div class="contain">
            <a href="Ex2_UserArea.aspx"><img src="img/UsersArea.png"/></a>
            <a href="Ex2_Admin.aspx"><img src="img/Admin.png"/></a>
        </div>
    </div>
</asp:Content>
