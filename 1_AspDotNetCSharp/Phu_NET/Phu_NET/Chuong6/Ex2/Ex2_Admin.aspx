<%@ Page Title="" Language="C#" MasterPageFile="~/Chuong6/Ex2/Ex2_PageM.Master" AutoEventWireup="true" CodeBehind="Ex2_Admin.aspx.cs" Inherits="Phu_NET.Chuong6.Ex2.Ex2_Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .main{
            display:flex;
        }
        .content{
            width: 80%;
        }
        .menu{
            background-color:burlywood;
            width:20%;
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
        <h3 class="lblAdmin"> Admin Area</h3>
        <div class="main">
            <div class="content"><p>Welcome to administration area</p></div>
            <div class="menu">
                <ul>
                    <li><a href="Ex2_Home.aspx">Home</a></li>
                    <li><a href="#">User Management</a></li>
                    <li><a href="#">Course Management</a></li>
                    <li><a href="#">Homework Management</a></li>
                    <li><a href="#">Calendar Management</a></li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
