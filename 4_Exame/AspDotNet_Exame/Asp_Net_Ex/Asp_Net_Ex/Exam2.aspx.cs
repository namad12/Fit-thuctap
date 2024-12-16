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
    public partial class Exam2 : System.Web.UI.Page
    {
        private string strConn = ConfigurationManager.ConnectionStrings["DB_Orcl_ExAsp"].ConnectionString;
        private DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["ExamTable"] = Getfeeposition_dt();
            dgfeeposition.DataSource = FormatDataWithTotals_Detail(Getfeeposition_dt());
            dgfeeposition.DataBind();
        }

        public DataTable Getfeeposition_dt()
        {
            DataTable feepositionTable = new DataTable();
            using (OracleConnection conn = new OracleConnection(strConn))
            {
                OracleCommand cmd = new OracleCommand("p_GetAllfeeposition", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("p_cursor", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                conn.Open();
                using (OracleDataAdapter adapter = new OracleDataAdapter(cmd))
                {
                    adapter.Fill(feepositionTable);
                }
            }
            return feepositionTable;
        }
        private DataTable FormatDataWithTotals(DataTable dt)
        {
            // Tạo DataTable mới để chứa dữ liệu đã format với các dòng tổng
            DataTable formattedTable = dt.Clone();

            string currentMonthYear = string.Empty;
            int monthlyTotalQuantity = 0;
            int monthlyTotalValue = 0;
            int grandTotalQuantity = 0;
            int grandTotalValue = 0;

            foreach (DataRow row in dt.Rows)
            {
                // Định dạng tháng-năm từ cột ngày
                string monthYear = Convert.ToDateTime(row["acreatedte"]).ToString("MM-yyyy");

                if (currentMonthYear != monthYear)
                {
                    // Khi chuyển sang tháng khác, thêm dòng tổng cho tháng trước vào trước các dòng chi tiết
                    if (!string.IsNullOrEmpty(currentMonthYear))
                    {
                        // Thêm dòng tổng cho tháng trước vào đầu
                        formattedTable.Rows.Add(
                            DBNull.Value,
                            DBNull.Value,
                            monthlyTotalQuantity,
                            DBNull.Value,
                            monthlyTotalValue,
                            DBNull.Value,
                            DBNull.Value,
                             $"Tổng tháng {currentMonthYear}"
                        );
                    }

                    // Reset lại giá trị cho tháng mới
                    currentMonthYear = monthYear;
                    monthlyTotalQuantity = 0;
                    monthlyTotalValue = 0;
                }

                // Cộng dồn tổng của tháng hiện tại và tổng toàn bộ
                monthlyTotalQuantity += Convert.ToInt32(row["aquantuty"]);
                monthlyTotalValue += Convert.ToInt32(row["avalue"]);
                grandTotalQuantity += Convert.ToInt32(row["aquantuty"]);
                grandTotalValue += Convert.ToInt32(row["avalue"]);
            }

            // Thêm dòng tổng cho tháng cuối cùng
            if (!string.IsNullOrEmpty(currentMonthYear))
            {
                // Thêm dòng tổng cho tháng cuối cùng vào đầu
                formattedTable.Rows.Add(
                    DBNull.Value,
                    DBNull.Value,
                    monthlyTotalQuantity,
                    DBNull.Value,
                    monthlyTotalValue,
                    DBNull.Value,
                    DBNull.Value,
                     $"Tổng tháng {currentMonthYear}"
                );
            }

            // Thêm dòng tổng cuối cùng cho toàn bộ dữ liệu
            formattedTable.Rows.Add(
                DBNull.Value,
                DBNull.Value,
                grandTotalQuantity,
                DBNull.Value,
                grandTotalValue,
                DBNull.Value,
                DBNull.Value,
                "Tổng"
            );

            return formattedTable;
        }
        private DataTable FormatDataWithTotals_Detail(DataTable dt)
        {
            // Tạo DataTable mới để chứa dữ liệu đã format với các dòng tổng
            DataTable formattedTable = dt.Clone();

            string currentMonthYear = string.Empty;
            int monthlyTotalQuantity = 0;
            int monthlyTotalValue = 0;
            int grandTotalQuantity = 0;
            int grandTotalValue = 0;

            // Danh sách tạm thời để lưu trữ các dòng chi tiết của từng tháng
            List<DataRow> monthlyRows = new List<DataRow>();

            foreach (DataRow row in dt.Rows)
            {
                // Định dạng tháng-năm từ cột ngày
                string monthYear = Convert.ToDateTime(row["acreatedte"]).ToString("MM-yyyy");

                if (currentMonthYear != monthYear)
                {
                    // Khi chuyển sang tháng khác, thêm dòng tổng cho tháng trước vào trước các dòng chi tiết
                    if (!string.IsNullOrEmpty(currentMonthYear))
                    {
                        // Thêm dòng tổng cho tháng trước vào đầu
                        formattedTable.Rows.Add(
                            DBNull.Value,
                            DBNull.Value,
                            monthlyTotalQuantity,
                            DBNull.Value,
                            monthlyTotalValue,
                            DBNull.Value,
                            DBNull.Value,
                             $"Tổng tháng {currentMonthYear}"
                        );

                        // Thêm các dòng chi tiết của tháng vào sau dòng tổng
                        foreach (var monthlyRow in monthlyRows)
                        {
                            formattedTable.ImportRow(monthlyRow);
                        }
                        // Xóa danh sách tạm của tháng trước để chuẩn bị cho tháng mới
                        monthlyRows.Clear();
                    }

                    // Reset lại giá trị cho tháng mới
                    currentMonthYear = monthYear;
                    monthlyTotalQuantity = 0;
                    monthlyTotalValue = 0;
                }

                // Thêm dòng dữ liệu thông thường vào danh sách tạm thời của tháng
                monthlyRows.Add(row);

                // Cộng dồn tổng của tháng hiện tại và tổng toàn bộ
                monthlyTotalQuantity += Convert.ToInt32(row["aquantuty"]);
                monthlyTotalValue += Convert.ToInt32(row["avalue"]);
                grandTotalQuantity += Convert.ToInt32(row["aquantuty"]);
                grandTotalValue += Convert.ToInt32(row["avalue"]);
            }

            // Thêm dòng tổng cho tháng cuối cùng
            if (!string.IsNullOrEmpty(currentMonthYear))
            {
                // Thêm dòng tổng cho tháng cuối cùng vào đầu
                formattedTable.Rows.Add(
                    DBNull.Value,
                    DBNull.Value,
                    monthlyTotalQuantity,
                    DBNull.Value,
                    monthlyTotalValue,
                    DBNull.Value,
                    DBNull.Value,
                     $"Tổng tháng {currentMonthYear}"
                );

                // Thêm các dòng chi tiết của tháng cuối cùng
                foreach (var monthlyRow in monthlyRows)
                {
                    formattedTable.ImportRow(monthlyRow);
                }
            }
            formattedTable.Rows.Add(
                DBNull.Value,
                DBNull.Value,
                grandTotalQuantity,
                DBNull.Value,
                grandTotalValue,
                DBNull.Value,
                DBNull.Value,
                "Tổng"
            );

            return formattedTable;
        }

        private int rowNumber = 1;

        protected void dgfeeposition_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Kiểm tra nếu dòng là "Tổng tháng" hoặc "Tổng"
                if (e.Row.Cells[1].Text.Contains("Tổng tháng") || e.Row.Cells[1].Text == "Tổng")
                {
                    e.Row.Font.Bold = true;
                    e.Row.BackColor = System.Drawing.Color.LightGray;

                    // Đặt lại số thứ tự về 1 khi gặp dòng tổng của tháng
                    rowNumber = 1;
                }
                else
                {
                    // Gán số thứ tự hiện tại vào cột STT
                    e.Row.Cells[0].Text = rowNumber.ToString();
                    rowNumber++;
                }
            }
        }

        protected void dgfeeposition_ItemDataBound(object sender, DataGridItemEventArgs e)
        {
            // Kiểm tra xem dòng hiện tại có phải là dòng dữ liệu hay không
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {

                // Kiểm tra nếu dòng là "Tổng tháng" hoặc "Tổng" trong ô thứ 2 (Cells[1])
                if (e.Item.Cells[1].Text.Contains("Tổng tháng") || e.Item.Cells[1].Text == "Tổng")
                {
                    // Định dạng in đậm và màu nền cho các dòng tổng
                    e.Item.Font.Bold = true;
                    e.Item.BackColor = System.Drawing.Color.LightGray;

                    rowNumber = 1;
                }
                else
                {
                    // Gán số thứ tự hiện tại vào cột STT
                    e.Item.Cells[0].Text = rowNumber.ToString();
                    rowNumber++;
                }
            }

        }

        protected void dgfeeposition_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dgfeeposition.SelectedItem != null)
            {
                DataGridItem selectedItem = dgfeeposition.SelectedItem;

                // Lấy dữ liệu từ dòng đã chọn
                string selectedData = selectedItem.Cells[0].Text;
            }
        }

        private DataTable GetFeeposition()
        {
            DataTable feepositionTable = new DataTable();
            using (OracleConnection conn = new OracleConnection(strConn))
            {
                using (OracleCommand cmd = new OracleCommand("GetFeepositionOfCustomer", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    // Thêm các tham số đầu vào cho stored procedure
                    cmd.Parameters.Add("p_aclientcode", OracleDbType.Varchar2).Value = string.IsNullOrEmpty(txtAclientcode.Text) ? "" : txtAclientcode.Text;
                    cmd.Parameters.Add("p_fromdate", OracleDbType.Date).Value = string.IsNullOrEmpty(txtFromDate.Text) ? DBNull.Value : (object)Convert.ToDateTime(txtFromDate.Text);
                    cmd.Parameters.Add("p_todate", OracleDbType.Date).Value = string.IsNullOrEmpty(txtToDate.Text) ? DBNull.Value : (object)Convert.ToDateTime(txtToDate.Text);

                    // Thêm tham số đầu ra cho con trỏ
                    cmd.Parameters.Add("p_cursor", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                    conn.Open();
                    using (OracleDataAdapter adapter = new OracleDataAdapter(cmd))
                    {
                        adapter.Fill(feepositionTable);
                    }
                }
            }
            return feepositionTable;
        }

        protected void btnTK_Click(object sender, EventArgs e)
        {
            lblError.Text = "";

            if (string.IsNullOrEmpty(txtAclientcode.Text))
            {
                lblError.Text = "Vui lòng nhập số tài khoản";
            }
            else
            {
                DataTable feepositionTable = GetFeeposition();
                if (feepositionTable.Rows.Count > 0)
                {
                    ddlChiTiet.SelectedIndex = 0;
                    Session["ExamTable"] = feepositionTable;
                    if (!string.IsNullOrEmpty(txtAclientcode.Text))
                    {
                        txtKhachHang.Text = feepositionTable.Rows[0][8].ToString();
                    }
                    dgfeeposition.DataSource = FormatDataWithTotals_Detail(feepositionTable);
                    dgfeeposition.DataBind();
                }
                else
                {
                    lblError.Text = "Vui lòng nhập đúng số tài khoản";
                }
            }
        }

        protected void ddlChiTiet_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedValue = ddlChiTiet.SelectedValue;

            if (selectedValue == "0")
            {
                dgfeeposition.DataSource = FormatDataWithTotals_Detail(GetFeeposition());
                dgfeeposition.DataBind();
            }
            else if (selectedValue == "1")
            {
                dgfeeposition.DataSource = FormatDataWithTotals(GetFeeposition());
                dgfeeposition.DataBind();
            }
        }

        protected void btnLamMoi_Click(object sender, EventArgs e)
        {
            txtKhachHang.Text = "";
            txtFromDate.Text = "";
            txtToDate.Text = "";
            txtAclientcode.Text = "";
            lblError.Text = "";
            ddlChiTiet.SelectedIndex = 0;
        }

        public void ExportToExcel(DataTable dt, string fileName)
        {
            using (ExcelPackage excel = new ExcelPackage())
            {
                // Tạo một worksheet mới
                var workSheet = excel.Workbook.Worksheets.Add("Sheet1");

                // Đưa tên cột vào worksheet
                for (int i = 1; i < dt.Columns.Count + 1; i++)
                {
                    workSheet.Cells[1, i].Value = dt.Columns[i - 1].ColumnName;
                }
                // Đưa dữ liệu vào worksheet
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    for (int j = 0; j < dt.Columns.Count; j++)
                    {
                        var cell = workSheet.Cells[i + 2, j + 1];
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
            if (ddlChiTiet.SelectedValue == "0")
            {
                ExportToExcel(FormatDataWithTotals_Detail(GetFeeposition()), "FeepositionData");
            }
            else
            {
                ExportToExcel(FormatDataWithTotals(GetFeeposition()), "FeepositionData");
            }

        }
    }
}