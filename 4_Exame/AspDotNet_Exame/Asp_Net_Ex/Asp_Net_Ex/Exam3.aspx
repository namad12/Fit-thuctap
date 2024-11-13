<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Exam3.aspx.cs" Inherits="Exam1.Exam3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Exam 3</title>
    <style type="text/css">
        .auto-style1 {
            height: 42px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <div>
                <h3>TRA CỨU PHÍ QLVT TỔNG HỢP</h3>
                <table style="margin-bottom: 15px; width: 750px; text-align: left">
                    <tr>
                        <th class="auto-style1">Số tài khoản:  </th>
                        <td class="auto-style1">
                            <asp:TextBox ID="txtAclientcode" type="text" name="Aclientcode" runat="server"></asp:TextBox>
                        </td>
                        <th class="auto-style1">Chi nhánh:  </th>
                        <td class="auto-style1">
                            <asp:DropDownList ID="ddlChiNhanh" runat="server">
                                <asp:ListItem Value="0">ALL</asp:ListItem>
                                <asp:ListItem Value="1">HN</asp:ListItem>
                                <asp:ListItem Value="2">DN</asp:ListItem>
                                <asp:ListItem Value="3">HCM</asp:ListItem>
                            </asp:DropDownList>
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

                    </tr>
                    <tr>
                        <th>Loại KH:  </th>
                        <td>
                            <asp:DropDownList ID="ddlLoaiKH" runat="server">
                                <asp:ListItem Value="0">ALL</asp:ListItem>
                                <asp:ListItem Value="1">Tự doanh</asp:ListItem>
                                <asp:ListItem Value="2">Trong nước</asp:ListItem>
                                <asp:ListItem Value="3">Nước ngoài</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <th>Chi tiết:  </th>
                        <td>
                            <asp:DropDownList ID="ddlChiTiet" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlChiTiet_SelectedIndexChanged">
                                <asp:ListItem Value="0">có</asp:ListItem>
                                <asp:ListItem Value="1">không</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr style="text-align: center;">
                        <td>
                            <asp:Button ID="btnTK" runat="server" Text="Tìm kiếm" BackColor="#ED7D31" BorderStyle="None" ForeColor="White" OnClick="btnTK_Click" Height="25px" Width="80px" />
                        </td>
                        <td></td>
                        <td>
                            <asp:Button ID="btnLamMoi" runat="server" Text="Làm mới" CommandName="Reset" BackColor="#ED7D31" BorderStyle="None" ForeColor="White" OnClick="btnLamMoi_Click" Height="25px" Width="80px" />
                        </td>
                        <td></td>
                        <td>
                            <asp:Button ID="btnExcel" runat="server" Text="Excel" CommandName="ExportToExcel" OnClick="btnExcel_Click" BackColor="#ED7D31" BorderStyle="None" ForeColor="White" Height="25px" Width="80px" />
                        </td>
                    </tr>

                </table>
                <asp:DataGrid ID="dgfeeposition" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" BorderColor="Black" OnRowDataBound="dgfeeposition_RowDataBound" OnItemDataBound="dgfeeposition_ItemDataBound">
                    <EditItemStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#ED7D31" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#ED7D31" Font-Bold="True" HorizontalAlign="Center" ForeColor="White" />
                    <AlternatingItemStyle BackColor="White" />
                    <SelectedItemStyle CssClass="selectedRow" />
                    <Columns>
                        <asp:BoundColumn DataField="stt" HeaderText="STT">
                            <ItemStyle BorderColor="Black" BorderWidth="1px" />
                        </asp:BoundColumn>

                        <asp:BoundColumn HeaderText="Số tài khoản" DataField="acustaccount">
                            <ItemStyle BorderColor="Black" BorderWidth="1px" />
                        </asp:BoundColumn>

                        <asp:BoundColumn HeaderText="Tên khách hàng" DataField="aname">
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

                    </Columns>

                    <ItemStyle BackColor="#EFF3FB" BorderColor="Black" BorderWidth="1px" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" BorderColor="Black" BorderWidth="1px" />
                </asp:DataGrid>
                <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
            </div>
        </center>
    </form>
</body>
</html>

