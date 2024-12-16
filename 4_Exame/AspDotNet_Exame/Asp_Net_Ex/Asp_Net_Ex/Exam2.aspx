<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Exam2.aspx.cs" Inherits="Exam1.Exam2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Exam 2</title>
    <style>
        .selectedRow {
            background-color: #D1DDF1;
            font-weight: bold;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center>
                <div>
                    <h3>TRA CỨU PHÍ QLVT CHI TIẾT KH</h3>
                    <table style="margin-bottom: 15px; width: 715px; text-align: left">
                        <tr>
                            <th>Số tài khoản:  </th>
                            <td>
                                <asp:TextBox ID="txtAclientcode" type="text" name="Aclientcode" runat="server"></asp:TextBox>
                            </td>
                            <th>Khách hàng:  </th>
                            <td>
                                <asp:TextBox ID="txtKhachHang" type="text" name="KhachHang" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th>Từ Ngày:  </th>
                            <td>
                                <asp:TextBox ID="txtFromDate" type="date" name="FromDate" runat="server" AutoPostBack="false"></asp:TextBox>
                            </td>
                            <th>Đến Ngày:  </th>
                            <td>
                                <asp:TextBox ID="txtToDate" type="date" name="ToDate" runat="server" AutoPostBack="false"></asp:TextBox>
                            </td>
                            <th>Chi tiết:  </th>
                            <td>
                                <asp:DropDownList ID="ddlChiTiet" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlChiTiet_SelectedIndexChanged">
                                    <asp:ListItem Value="0">có</asp:ListItem>
                                    <asp:ListItem Value="1">không</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr style="align-items:center">
                            <td>
                                <asp:Button ID="btnTK" runat="server" Text="Tìm kiếm" OnClick="btnTK_Click" BackColor="#ED7D31" BorderStyle="None" ForeColor="White" Height="25px" Width="80px" />
                            </td>
                            <td></td>
                            <td>
                                <asp:Button ID="btnLamMoi" runat="server" Text="Làm mới" CommandName="Reset" OnClick="btnLamMoi_Click" BackColor="#ED7D31" BorderStyle="None" ForeColor="White" Height="25px" Width="80px" />
                            </td>
                            <td></td>
                            <td>
                                <asp:Button ID="btnExcel" runat="server" Text="Excel" CommandName="ExportToExcel" OnClick="btnExcel_Click" BackColor="#ED7D31" BorderStyle="None" ForeColor="White" Height="25px" Width="80px"/>
                            </td>
                        </tr>
                    </table>
                    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                    <asp:DataGrid ID="dgfeeposition" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" BorderColor="Black" OnRowDataBound="dgfeeposition_RowDataBound" OnItemDataBound="dgfeeposition_ItemDataBound">
                        <EditItemStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#ED7D31" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#ED7D31" Font-Bold="True" HorizontalAlign="Center" ForeColor="White" />
                        <AlternatingItemStyle BackColor="White" />
                        <SelectedItemStyle CssClass="selectedRow" />
                        <Columns>
                            <asp:TemplateColumn HeaderText="STT">
                                <ItemTemplate>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" BorderColor="Black" BorderWidth="1px" />
                            </asp:TemplateColumn>

                            <asp:BoundColumn HeaderText="Ngày" DataField="acreatedte" DataFormatString="{0:dd/MM/yyyy}">
                                <ItemStyle BorderColor="Black" BorderWidth="1px" />
                            </asp:BoundColumn>

                            <asp:BoundColumn HeaderText="Số dư vị thế" DataField="aquantuty" DataFormatString="{0:N0}">
                                <HeaderStyle Width="140px" />
                                <ItemStyle BorderColor="Black" BorderWidth="1px" />
                            </asp:BoundColumn>

                            <asp:BoundColumn HeaderText="Biểu phí QLVT" DataField="afeeposition" DataFormatString="{0:N0}">
                                <HeaderStyle Width="140px" />
                                <ItemStyle BorderColor="Black" BorderWidth="1px" />
                            </asp:BoundColumn>

                            <asp:BoundColumn DataField="avalue" DataFormatString="{0:N0}" HeaderText="Phí QLVT">
                                <HeaderStyle Width="140px" />
                                <ItemStyle BorderColor="Black" BorderWidth="1px" />
                            </asp:BoundColumn>

                            <asp:BoundColumn HeaderText="Tình trạng" DataField="astatus">
                                <ItemStyle BorderColor="Black" BorderWidth="1px" />
                            </asp:BoundColumn>
                        </Columns>

                        <ItemStyle BackColor="#EFF3FB" BorderColor="Black" BorderWidth="1px" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" BorderColor="Black" BorderWidth="1px" />
                    </asp:DataGrid>
                </div>
            </center>
        </div>
    </form>
</body>
</html>

