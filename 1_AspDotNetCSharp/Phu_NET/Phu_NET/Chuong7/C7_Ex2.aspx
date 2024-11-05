<%@ Page Title="" Language="C#" MasterPageFile="~/Chuong7/C7_PageM.Master" AutoEventWireup="true" CodeBehind="C7_Ex2.aspx.cs" Inherits="Phu_NET.Chuong7.C7_Ex2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .btn {
            background-color: #2461BF;
            color: white;
        }

            .btn:hover {
                background-color: #2661BF;
                color: white;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center>
        <div>
            <h3>Thiêt lập mức lương</h3>

            <table style="margin-bottom: 15px; width: 60%">
                <tr>
                    <th>Bậc lương:  </th>
                    <td>
                        <asp:TextBox ID="txtGrade" type="text" name="bacluong" runat="server"></asp:TextBox>
                        <asp:Label ID="lblGrade" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <th>Mức lương thấp nhất:  </th>
                    <td>
                        <asp:TextBox ID="txtLowest_Sal" type="number" name="luongtn" runat="server"></asp:TextBox>
                        <asp:Label ID="lblLowest_Sal" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <th>Mức lương cao nhất:  </th>
                    <td>
                        <asp:TextBox ID="txtHighest_Sal" type="number" name="luongcn" runat="server"></asp:TextBox>
                        <asp:Label ID="lblHighest_sal" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center;">
                        <asp:Button ID="btnTK" CssClass="btn" runat="server" Text="Tìm kiếm" OnClick="btnTK_Click" BorderStyle="None" />
                    </td>
                    <td style="text-align: center;">
                        <asp:Button ID="btnLamMoi" CssClass="btn" runat="server" Text="Làm mới" CommandName="Reset" OnClick="btnLamMoi_Click" BorderStyle="None" />
                    </td>
                    <td style="text-align: center;">
                        <asp:Button ID="btnGhiSua" CssClass="btn" runat="server" Text="Ghi" CommandName="SaveOrUpdate" OnClick="btnGhiSua_Click" BorderStyle="None" />
                    </td>
                    <td style="text-align: center;">
                        <asp:Button ID="btnExcel" CssClass="btn" runat="server" Text="Excel" CommandName="ExportToExcel" BorderStyle="None" OnClick="btnExcel_Click" />
                    </td>
                </tr>
            </table>
            <asp:DataGrid ID="dgJobGrades" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" BorderColor="Black" OnItemCommand="dgJobGrades_ItemCommand">
                <EditItemStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" HorizontalAlign="Center" ForeColor="White" />
                <AlternatingItemStyle BackColor="White" />

                <Columns>
                    <asp:TemplateColumn HeaderText="STT">
                        <ItemTemplate>
                            <%# Container.ItemIndex + 1 %>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Right" BorderColor="Black" BorderWidth="1px" />
                    </asp:TemplateColumn>

                    <asp:BoundColumn HeaderText="Bậc lương" DataField="grade">
                        <ItemStyle BorderColor="Black" BorderWidth="1px" />
                    </asp:BoundColumn>

                    <asp:BoundColumn HeaderText="Mức lương thấp nhất" DataField="lowest_sal" DataFormatString="{0:N0}">
                        <HeaderStyle Width="200px" />
                        <ItemStyle HorizontalAlign="Right" BorderColor="Black" BorderWidth="1px" />
                    </asp:BoundColumn>

                    <asp:BoundColumn HeaderText="Mức lương cao nhất" DataField="highest_sal" DataFormatString="{0:N0}">
                        <HeaderStyle Width="200px" />
                        <ItemStyle HorizontalAlign="Right" BorderColor="Black" BorderWidth="1px" />
                    </asp:BoundColumn>

                    <asp:BoundColumn HeaderText="Người tạo" DataField="acreateby">
                        <ItemStyle BorderColor="Black" BorderWidth="1px" />
                    </asp:BoundColumn>

                    <asp:BoundColumn HeaderText="Ngày tạo" DataField="acreatedte" DataFormatString="{0:dd/MM/yyyy}">
                        <ItemStyle BorderColor="Black" BorderWidth="1px" />
                    </asp:BoundColumn>

                    <asp:BoundColumn HeaderText="Người sửa" DataField="amodifiedby">
                        <ItemStyle BorderColor="Black" BorderWidth="1px" />
                    </asp:BoundColumn>

                    <asp:BoundColumn HeaderText="Ngày sửa" DataField="amodifieddte" DataFormatString="{0:dd/MM/yyyy}">
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
            <asp:Label ID="llerror" runat="server" ForeColor="Red"></asp:Label>
        </div>

    </center>
</asp:Content>
