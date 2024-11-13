using OfficeOpenXml;
using Oracle.DataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Exam1
{
    public partial class Exam1 : System.Web.UI.Page
    {
        private string strConn = ConfigurationManager.ConnectionStrings["DB_Orcl_ExAsp"].ConnectionString;
        private DataTable ExamTable;
        protected void Page_Load(object sender, EventArgs e)
        {
            //txtActivedte.Text = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");
            ddlTinhTrang.Enabled = false;
            if (!IsPostBack)
            {
                BindData();
            }
            ExamTable = GetAllParafeeVSDs();
        }
        private void BindData()
        {
            DataTable dt = GetAllParafeeVSDs();
            ddlTinhTrang.Enabled = true;
            if (dt != null && dt.Rows.Count > 0)
            {
                ExamTable = dt;
                dgParafeevsd.DataSource = dt;
                dgParafeevsd.DataBind();
            }
        }

        public DataTable GetAllParafeeVSDs()
        {
            DataTable parafeeTable = new DataTable();

            using (OracleConnection conn = new OracleConnection(strConn))
            {
                OracleCommand cmd = new OracleCommand("sp_GetAllParafeevsd", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("p_cursor", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                conn.Open();
                using (OracleDataAdapter adapter = new OracleDataAdapter(cmd))
                {
                    adapter.Fill(parafeeTable);
                }
            }

            return parafeeTable;
        }

        protected void dgParafeevsd_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            ddlTinhTrang.Enabled = true;

            int a = e.Item.ItemIndex;
            if (a > -1)
            {
                ViewState["Aparafeeid"] = dgParafeevsd.DataKeys[a].ToString();
                txtFeeposition.Text = e.Item.Cells[1].Text.Trim();

                string statusValue = e.Item.Cells[4].Text.Trim();
                switch (statusValue)
                {
                    case "Chờ duyệt":
                        ddlTinhTrang.SelectedValue = "0";
                        break;
                    case "Chờ kích hoạt":
                        ddlTinhTrang.SelectedValue = "1";
                        break;
                    case "Hiệu lực":
                        ddlTinhTrang.SelectedValue = "2";
                        break;
                    case " Hết Hiệu lực":
                        ddlTinhTrang.SelectedValue = "-2";
                        break;
                    default:
                        ddlTinhTrang.ClearSelection();
                        break;
                }

                DateTime selectedDate;
                if (DateTime.TryParse(e.Item.Cells[2].Text, out selectedDate))
                {
                    txtActivedte.Text = selectedDate.ToString("yyyy-MM-dd");
                }

                if (e.Item.Cells[4].Text == "Chờ duyệt")
                {
                    btnGhiDuyet.Text = "Duyệt";
                }
                else
                {
                    ddlTinhTrang.Enabled = false;
                    btnGhiDuyet.Enabled = false;
                };

            }
        }

        protected void btnLamMoi_Click(object sender, EventArgs e)
        {
            txtActivedte.Attributes.Remove("min");
            txtFeeposition.Text = "";
            //txtActivedte.Text = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");
            txtActivedte.Text = "";
            ddlTinhTrang.SelectedValue = "0";
            btnGhiDuyet.Text = "Ghi";
            lblError.Text = "";
            btnGhiDuyet.Enabled = true;
            dgParafeevsd.SelectedIndex = -1;
            BindData();
        }
        private DataTable SelectParafeeVSD(object feeposition, int? status, object activedte)
        {
            DataTable parafeeTable = new DataTable();

            try
            {
                using (OracleConnection conn = new OracleConnection(strConn))
                {
                    OracleCommand cmd = new OracleCommand("sp_SelectParafeevsd", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    // Thêm tham số, sử dụng DBNull.Value cho các giá trị NULL
                    cmd.Parameters.Add("p_afeeposition", OracleDbType.Int32).Value = feeposition;
                    cmd.Parameters.Add("p_astatus", OracleDbType.Int32).Value = status;
                    cmd.Parameters.Add("p_aactivedte", OracleDbType.Date).Value = activedte;

                    cmd.Parameters.Add("p_cursor", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                    conn.Open();
                    using (OracleDataAdapter adapter = new OracleDataAdapter(cmd))
                    {
                        adapter.Fill(parafeeTable);
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "Lỗi truy vấn dữ liệu: " + ex.Message;
            }

            return parafeeTable;
        }
        protected void btnTK_Click(object sender, EventArgs e)
        {
            string feepositionStr = Regex.Replace(txtFeeposition.Text, "[^a-zA-Z0-9]", "");


            object feeposition = string.IsNullOrEmpty(feepositionStr) ? DBNull.Value : (object)int.Parse(feepositionStr);

            string activedteStr = txtActivedte.Text;
            object activedte = string.IsNullOrEmpty(activedteStr) ? DBNull.Value : (object)DateTime.Parse(activedteStr);

            int status = int.Parse(ddlTinhTrang.SelectedValue);

            //lblError.Text = feepositionStr + " - " + feeposition + " : " + activedte + " : "+status;
            DataTable resultTable = SelectParafeeVSD(feeposition, status, activedte);
            if (resultTable != null && resultTable.Rows.Count > 0)
            {
                ExamTable = resultTable;
                dgParafeevsd.DataSource = ExamTable;
                dgParafeevsd.DataBind();
            }
            ddlTinhTrang.Enabled = true;
        }
        protected void txtActivedte_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnGhiDuyet_Click(object sender, EventArgs e)
        {
            if (btnGhiDuyet.Text == "Ghi")
            {
                btnGhi_Click();
            }
            else
            {
                btnDuyet_Click();
            };

        }
        private void btnDuyet_Click()
        {
            using (OracleConnection conn = new OracleConnection(strConn))
            {
                // Lấy giá trị từ ViewState và chuyển thành chuỗi
                string aparafeeidString = ViewState["Aparafeeid"]?.ToString() ?? "";

                OracleCommand cmd = new OracleCommand("BrowseParafee", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                // Thêm tham số p_aparafeeid kiểu VARCHAR2 vào command
                cmd.Parameters.Add("p_aparafeeid", OracleDbType.Varchar2).Value = aparafeeidString;

                // Thêm tham số output p_error để nhận thông báo lỗi từ procedure
                OracleParameter errorParam = new OracleParameter("p_error", OracleDbType.NVarchar2, 4000);
                errorParam.Direction = ParameterDirection.Output;
                cmd.Parameters.Add(errorParam);
                conn.Open();
                cmd.ExecuteNonQuery();

            }
            BindData();
        }

        private void btnGhi_Click()
        {
            lblError.Text = "";
            bool check = true;
            string feepositionStr = Regex.Replace(txtFeeposition.Text, "[^a-zA-Z0-9]", "");
            object feeposition =  DBNull.Value;
            if (string.IsNullOrEmpty(feepositionStr))
            {
                check = false;
                lblError.Text = "Vui long nhập Phí Quản lý vị thế";
            }
            else
            {
                feeposition = (object)int.Parse(feepositionStr);
            }


            DateTime activedDate;
            if (DateTime.TryParse(txtActivedte.Text, out activedDate))
            {
                if (activedDate < DateTime.Now.AddDays(1))
                {
                    check = false;
                    txtActivedte.Text = "";
                    txtActivedte.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
                    lblError.Text = lblError.Text + " Ngày hiệu lực phải lớn hơn ngày hiện tại cộng 1";
                }
            }
            else
            {
                lblError.Text = lblError.Text + " Vui long chọn ngày hiệu lực";
                check = false;
            }

            int statu = int.Parse(ddlTinhTrang.SelectedValue);
            if (statu != 0)
            {
                ddlTinhTrang.Enabled = true;
                check = false;
                lblError.Text = lblError.Text + " Tình trạng phải là chờ duyệt ";
            }


            if (check)
            {
                InsertParafeeVSD(feeposition, statu, activedDate);
            }
        }
        private void InsertParafeeVSD(object feeposition, int? status, DateTime activedte)
        {
            using (OracleConnection conn = new OracleConnection(strConn))
            {
                OracleCommand cmd = new OracleCommand("sp_InsertParafeeVSD", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                // Thêm tham số cho procedure, sử dụng DBNull.Value cho các giá trị NULL
                cmd.Parameters.Add("p_aparafeeid", OracleDbType.TimeStamp).Value = DateTime.Now;
                cmd.Parameters.Add("p_afeeposition", OracleDbType.Int32).Value = feeposition;
                cmd.Parameters.Add("p_astatus", OracleDbType.Int32).Value = status.HasValue ? (object)status.Value : DBNull.Value;
                cmd.Parameters.Add("p_acreateby", OracleDbType.Varchar2).Value = "User"; // Thay giá trị nếu cần
                cmd.Parameters.Add("p_acreatedte", OracleDbType.Date).Value = DateTime.Now; // Thay giá trị nếu cần
                cmd.Parameters.Add("p_aapprovedby", OracleDbType.Varchar2).Value = DBNull.Value; // Thay giá trị nếu cần
                cmd.Parameters.Add("p_aapproveddte", OracleDbType.Date).Value = DBNull.Value; // Thay giá trị nếu cần
                cmd.Parameters.Add("p_aactivedte", OracleDbType.Date).Value = activedte;

                conn.Open();
                cmd.ExecuteNonQuery(); 
            }
            BindData();
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            // Điều này cần thiết để tránh lỗi "Control 'DataGrid' of type 'DataGrid' must be placed inside a form tag with runat=server."
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
                    workSheet.Cells[1, i].Style.Font.Bold = true; // Đặt tên cột đậm
                    workSheet.Cells[1, i].Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center; // Căn giữa tên cột
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

                // Thiết lập kích thước cột tự động dựa vào nội dung
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
            ExportToExcel(ExamTable, "parafeevsd");

        }
    }
}