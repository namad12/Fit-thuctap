<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Exam1.aspx.cs" Inherits="Exam1.Exam1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Exam 1</title>
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <div>
                <h3>THIẾT LẬP THAM SỐ PHÍ QLVT</h3>
                <table style="margin-bottom: 15px; width: 756px; text-align: left">
                    <tr>
                        <th>Phí Quản lý vị thế:  </th>
                        <td>
                            <asp:TextBox ID="txtFeeposition" type="text" name="feeposition" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <th>Ngày hiệu lực:  </th>
                        <td>
                            <asp:TextBox ID="txtActivedte" type="date" name="Activedte" runat="server" OnTextChanged="txtActivedte_TextChanged" AutoPostBack="true"></asp:TextBox>
                        </td>
                        <th>Tình trạng:  </th>
                        <td>
                            <asp:DropDownList ID="ddlTinhTrang" runat="server">
                                <asp:ListItem Value="0">Chờ duyệt</asp:ListItem>
                                <asp:ListItem Value="1">Chờ kích hoạt</asp:ListItem>
                                <asp:ListItem Value="2">Hiệu lực</asp:ListItem>
                                <asp:ListItem Value="-2">Hết hiệu lực</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnTK" runat="server" Text="Tìm kiếm" OnClick="btnTK_Click" BackColor="#ED7D31" BorderStyle="None" Height="25px" Width="80px" />
                        </td>
                        <td>
                            <asp:Button ID="btnLamMoi" runat="server" Text="Làm mới" CommandName="Reset" OnClick="btnLamMoi_Click" BackColor="#ED7D31" BorderStyle="None" Height="25px" Width="80px" />
                        </td>
                        <td>
                            <asp:Button ID="btnGhiDuyet" runat="server" Text="Ghi" CommandName="SaveOrUpdate" OnClick="btnGhiDuyet_Click" BackColor="#ED7D31" BorderStyle="None" Height="25px" Width="80px" />
                        </td>
                        <td>
                            <asp:Button ID="btnExcel" runat="server" Text="Excel" CommandName="ExportToExcel" OnClick="btnExcel_Click" BackColor="#ED7D31" BorderStyle="None" Height="25px" Width="80px" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:DataGrid ID="dgParafeevsd" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" BorderColor="Black" OnItemCommand="dgParafeevsd_ItemCommand" DataKeyField="aparafeeid">
                    <EditItemStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#ED7D31" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#ED7D31" Font-Bold="True" HorizontalAlign="Center" ForeColor="White" />
                    <AlternatingItemStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateColumn HeaderText="STT">
                            <ItemTemplate>
                                <%# Container.ItemIndex + 1 %>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" BorderColor="Black" BorderWidth="1px" />
                        </asp:TemplateColumn>

                        <asp:BoundColumn HeaderText="Phí Quản lý vị thế" DataField="afeeposition" DataFormatString="{0:N0}">
                            <ItemStyle BorderColor="Black" BorderWidth="1px" />
                        </asp:BoundColumn>

                        <asp:BoundColumn HeaderText="Ngày hiệu lực" DataField="aactivedte" DataFormatString="{0:dd/MM/yyyy}">
                            <HeaderStyle Width="150px" />
                            <ItemStyle BorderColor="Black" BorderWidth="1px" />
                        </asp:BoundColumn>

                        <asp:BoundColumn HeaderText="Ngày cập nhật" DataField="aapproveddte" DataFormatString="{0:dd/MM/yyyy hh:mm:ss}">
                            <HeaderStyle Width="200px" />
                            <ItemStyle BorderColor="Black" BorderWidth="1px" />
                        </asp:BoundColumn>

                        <asp:BoundColumn HeaderText="Tình trạng" DataField="astatus">
                            <ItemStyle BorderColor="Black" BorderWidth="1px" />
                        </asp:BoundColumn>

                        <asp:BoundColumn HeaderText="Người tạo" DataField="acreateby">
                            <ItemStyle BorderColor="Black" BorderWidth="1px" />
                        </asp:BoundColumn>

                        <asp:BoundColumn DataField="aparafeeid" Visible="False">
                            <ItemStyle BorderColor="Black" BorderWidth="1px" />
                        </asp:BoundColumn>

                        <asp:TemplateColumn HeaderText="Chọn">
                            <ItemTemplate>
                                <asp:Button ID="btnSelect" runat="server" CommandName="Select" Text="Chọn" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" BorderColor="Black" BorderWidth="1px" />
                        </asp:TemplateColumn>
                    </Columns>

                    <ItemStyle BackColor="#EFF3FB" BorderColor="Black" BorderWidth="1px" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" BorderColor="Black" BorderWidth="1px" />
                </asp:DataGrid>
            </div>
        </center>
    </form>
</body>
</html>
