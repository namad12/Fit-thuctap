<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ex2.aspx.cs" Inherits="Phu_NET.Chuong5.Ex2" %>
<%@ Register Src="~/Chuong5/Ex1_datepicker.ascx" TagPrefix="uc1" TagName="Ex1_datepicker" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Registration Form</h1>
    </div>

    <div>
        <asp:Label ID="Label1" runat="server" Text="Full Name" Width="120px"></asp:Label>
        <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator 
            ID="rfvFName" 
            runat="server" 
            ControlToValidate="txtFName" 
            ErrorMessage="*" 
            ForeColor="Red">
        </asp:RequiredFieldValidator>
    </div>

    <div>
        <asp:Label ID="Label3" runat="server" Text="User Name:" Width="120px"></asp:Label>
        <asp:TextBox ID="txtUname" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator 
            ID="rfvUname" 
            runat="server" 
            ControlToValidate="txtUname" 
            ErrorMessage="*" 
            ForeColor="Red">
        </asp:RequiredFieldValidator>
    </div>

    <div>
        <asp:Label ID="Label4" runat="server" Text="Password:" Width="120px"></asp:Label>
        <asp:TextBox ID="txtPassWord" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator 
            ID="rfvPassWord" 
            runat="server" 
            ControlToValidate="txtPassWord" 
            ErrorMessage="*" 
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator 
            ID="revPasswordLength" 
            runat="server" 
            ControlToValidate="txtPassWord" 
            ValidationExpression="^.{7,12}$" 
            ErrorMessage="Password must be 7 to 12 characters long." 
            ForeColor="Red">
        </asp:RegularExpressionValidator>
    </div>

    <div>
        <asp:Label ID="Label7" runat="server" Text="Cf Password:" Width="120px"></asp:Label>
        <asp:TextBox ID="txtCfPassWord" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator 
            ID="rfvCfPassWord" 
            runat="server" 
            ControlToValidate="txtCfPassWord" 
            ErrorMessage="*" 
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:CompareValidator 
            ID="cvPassword" 
            runat="server" 
            ControlToValidate="txtCfPassWord" 
            ControlToCompare="txtPassWord" 
            ErrorMessage="Passwords do not match." 
            ForeColor="Red">
         </asp:CompareValidator>
    </div>

    <div>
        <asp:Label ID="Label5" runat="server" Text="Day of Birth:" Width="120px"></asp:Label>
        <uc1:Ex1_datepicker runat="server" ID="txtDate" />
    </div>

    <div>
        <asp:Label ID="Label6" runat="server" Text="Phone:" Width="120px"></asp:Label>
        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator 
            ID="rfvPhone" 
            runat="server" 
            ControlToValidate="txtPhone" 
            ErrorMessage="*" 
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator 
            ID="revPhone" runat="server" 
            ControlToValidate="txtPhone" 
            ValidationExpression="^\d+$" 
            ErrorMessage="Phone must be numeric." 
            ForeColor="Red">
        </asp:RegularExpressionValidator>
    </div>

    <div>
        <asp:Label ID="Label8" runat="server" Text="Email:" Width="120px"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator 
            ID="rfvEmail" 
            runat="server" 
            ControlToValidate="txtEmail" 
            ErrorMessage="*" 
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator 
            ID="revEmail" 
            runat="server" 
            ControlToValidate="txtEmail" 
            ValidationExpression="\w+@\w+\.\w+" 
            ErrorMessage="Invalid email format." 
            ForeColor="Red">
        </asp:RegularExpressionValidator>
    </div>

    <div>
        <asp:Label ID="Label10" runat="server" Text="Address:" Width="120px"></asp:Label>
        <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator 
            ID="rfvAddress" 
            runat="server" 
            ControlToValidate="txtAddress" 
            ErrorMessage="*" 
            ForeColor="Red">
        </asp:RequiredFieldValidator>
    </div>

    <div>
        <asp:Button ID="btnSend" runat="server" Text="Submit" OnClick="btnSend_Click" />
        <asp:Label ID="lblSend" runat="server"></asp:Label>
    </div>
    </form>
 
</body>
</html>
