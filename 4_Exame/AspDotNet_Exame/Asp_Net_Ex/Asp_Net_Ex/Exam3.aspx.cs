using OfficeOpenXml;
using Oracle.DataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Exam1
{
    public partial class Exam3 : System.Web.UI.Page
    {
        private string strConn = ConfigurationManager.ConnectionStrings["DB_Orcl_ExAsp"].ConnectionString;
        private DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            dt = GetData("getdataexam3_Detail");
            dgfeeposition.DataSource = dt;
            dgfeeposition.DataBind();
        }

        public DataTable GetData(string nameP)
        {
            // Lấy dữ liệu từ các TextBox và DropDownList
            string p_grouptype = ddlLoaiKH.SelectedItem.Text.ToLower() == "all" ? "" : ddlLoaiKH.SelectedItem.Text.Trim(); // Loại KH
            string p_acustaccount = txtAclientcode.Text.ToLower() == "all" ? "" : txtAclientcode.Text.Trim();// Số tài khoản

            // Parse ngày từ TextBox
            DateTime? p_fromdate = string.IsNullOrWhiteSpace(txtFromDate.Text) ? (DateTime?)null : DateTime.Parse(txtFromDate.Text);
            DateTime? p_todate = string.IsNullOrWhiteSpace(txtToDate.Text) ? (DateTime?)null : DateTime.Parse(txtToDate.Text);

            string p_acostcenter = ddlChiNhanh.SelectedItem.Text.ToLower() == "all" ? "" : ddlChiNhanh.SelectedItem.Text.Trim(); // Chi nhánh

            DataTable dataTable = new DataTable();
            using (OracleConnection conn = new OracleConnection(strConn))
            {
                OracleCommand cmd = new OracleCommand(nameP, conn);
                cmd.CommandType = CommandType.StoredProcedure;

                // Thêm các tham số
                cmd.Parameters.Add("p_grouptype", OracleDbType.NVarchar2).Value = (object)p_grouptype ?? DBNull.Value;
                cmd.Parameters.Add("p_acustaccount", OracleDbType.Varchar2).Value = (object)p_acustaccount ?? DBNull.Value;
                cmd.Parameters.Add("p_fromdate", OracleDbType.Date).Value = p_fromdate.HasValue ? (object)p_fromdate.Value : DBNull.Value;
                cmd.Parameters.Add("p_todate", OracleDbType.Date).Value = p_todate.HasValue ? (object)p_todate.Value : DBNull.Value;
                cmd.Parameters.Add("p_acostcenter", OracleDbType.Varchar2).Value = (object)p_acostcenter ?? DBNull.Value;

                // Thêm tham số trả về kiểu REF CURSOR
                cmd.Parameters.Add("p_cursor", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                conn.Open();
                using (OracleDataAdapter adapter = new OracleDataAdapter(cmd))
                {
                    adapter.Fill(dataTable);
                }
            }
            return dataTable;
        }

        protected void ddlChiTiet_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedValue = ddlChiTiet.SelectedValue;

            if (selectedValue == "0")
            {
                dgfeeposition.DataSource = GetData("getdataexam3_Detail");
                dgfeeposition.DataBind();
            }
            else if (selectedValue == "1")
            {
                dgfeeposition.DataSource = GetData("getdataexam3");
                dgfeeposition.DataBind();
            }
        }

        protected void dgfeeposition_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            // Kiểm tra xem dòng hiện tại có phải là dòng dữ liệu hay không
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if (e.Item.Cells[0].Text.Length > 1)
                {
                    // Định dạng in đậm và màu nền cho các dòng tổng
                    e.Item.Font.Bold = true;
                    e.Item.BackColor = System.Drawing.Color.LightGray;

                }
            }
        }

        public void ExportToExcel(DataTable dt, string fileName)
        {
            using (ExcelPackage excel = new ExcelPackage())
            {
                // Tạo một worksheet mới
                var workSheet = excel.Workbook.Worksheets.Add("Sheet1");
                // Đưa tên cột vào worksheet
                for (int i = 1; i < dt.Columns.Count; i++)
                {
                    workSheet.Cells[1, i].Value = dt.Columns[i].ColumnName;
                }
                // Đưa dữ liệu vào worksheet
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    for (int j = 1; j < dt.Columns.Count; j++)
                    {
                        var cell = workSheet.Cells[i + 2, j ];
                        var value = dt.Rows[i][j];

                        if (value is DateTime)
                        {
                            // Áp dụng giá trị ngày giờ
                            cell.Value = (DateTime)value;

                            // Định dạng ngày giờ trong Excel
                            cell.Style.Numberformat.Format = "DD-MMM-YYYY";
                        }
                        else if (value is decimal || value is double)
                        {
                            // Áp dụng định dạng cho số
                            cell.Value = value;
                            cell.Style.Numberformat.Format = "#,##0.00";
                        }
                        else
                        {
                            cell.Value = value.ToString();
                        }
                    }
                }
                // Tự động điều chỉnh kích thước cột
                workSheet.Cells[workSheet.Dimension.Address].AutoFitColumns();
                // Thiết lập định dạng cho file xuất
                using (var memoryStream = new MemoryStream())
                {
                    excel.SaveAs(memoryStream);
                    var content = memoryStream.ToArray();
                    var fileNameWithExtension = $"{fileName}.xlsx";

                    // Đặt thông tin file
                    HttpContext.Current.Response.Clear();
                    HttpContext.Current.Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    HttpContext.Current.Response.AddHeader("content-disposition", $"attachment;  filename={fileNameWithExtension}");
                    HttpContext.Current.Response.BinaryWrite(content);
                    HttpContext.Current.Response.End();
                }
            }
        }

        protected void btnExcel_Click(object sender, EventArgs e)
        {
            if (ddlChiTiet.SelectedItem.Text == "có")
            {
                ExportToExcel(GetData("getdataexam3_Detail"), "Exam3");
            }
            else
            {
                ExportToExcel(GetData("getdataexam3"), "Exam3");
            }
        }

        protected void btnTK_Click(object sender, EventArgs e)
        {

            if (ddlChiTiet.SelectedItem.Text == "có")
            {
                dt = GetData("getdataexam3_Detail");
                dgfeeposition.DataSource = dt;
                dgfeeposition.DataBind();
            }
            else
            {
                dt = GetData("getdataexam3");
                dgfeeposition.DataSource = dt;
                dgfeeposition.DataBind();
            }

        }

        protected void btnLamMoi_Click(object sender, EventArgs e)
        {
            txtFromDate.Text = "";
            txtToDate.Text = "";
            ddlChiNhanh.SelectedIndex = 0;
            ddlLoaiKH.SelectedIndex = 0;
            ddlChiTiet.SelectedIndex = 0;
            txtAclientcode.Text = string.Empty;
            dgfeeposition.DataSource = null;
            dgfeeposition.DataBind();
        }
    }
}