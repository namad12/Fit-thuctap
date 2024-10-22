<%@ Page Title="" Language="C#" MasterPageFile="~/Chuong6/Ex2/Ex2_PageM.Master" AutoEventWireup="true" CodeBehind="Ex2_UserArea.aspx.cs" Inherits="Phu_NET.Chuong6.Ex2.Ex2_UserArea" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .main{
            display:flex;
        }
        .content{
            padding-left:15px;
            width: 80%;
        }
        .menu{
            background-color:burlywood;
            width:10%;
        }
        .lblAdmin{
            margin-top:5px;
            text-align:center;
            background-color:darkorange;
        }
        ul{
            list-style: none;
        }
        a{
            margin:5px;
            text-decoration:none;
        }
        a:hover{
            color:black;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="admin">
        <h3 class="lblAdmin"> User Area</h3>
        <div class="main">
            <div class="menu">
                <ul>
                    <li><a href="Ex2_Home.aspx">Home</a></li>
                    <li><a href="#">Course </a></li>
                    <li><a href="#">Calendar</a></li>
                    <li><a href="#">Resources</a></li>
                </ul>
            </div>
            <div class="content"><p>Welcome to user area</p></div>
        </div>
    </div>
</asp:Content>
