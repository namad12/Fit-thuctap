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

namespace Phu_NET.Chuong7
{
    public partial class C7_Ex2 : System.Web.UI.Page
    {
        private string strConn = ConfigurationManager.ConnectionStrings["MyDBConnection"].ConnectionString;
        private DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dgJobGrades.DataSource = getData();
                dgJobGrades.DataBind();
            }
            dt = getData();
        }
        private DataTable getData()
        {
            using (OracleConnection objConnection = new OracleConnection(strConn))
            {
                objConnection.Open();
                OracleCommand objCommand = new OracleCommand();
                objCommand.Connection = objConnection;
                objCommand.CommandText = "select * from Job_Grade;";
                objCommand.CommandType = System.Data.CommandType.Text;
                OracleDataAdapter objAdapter = new OracleDataAdapter(objCommand);
                DataTable objTable = new DataTable();
                objAdapter.Fill(objTable);
                return objTable;

            }
        }

        protected void btnLamMoi_Click(object sender, EventArgs e)
        {
            txtGrade.Text = "";
            txtHighest_Sal.Text = "";
            txtLowest_Sal.Text = "";
            lblGrade.Text = "";
            lblLowest_Sal.Text = "";
            lblHighest_sal.Text = "";

            ClearDataGrid();

            btnGhiSua.Text = "Ghi";
        }

        protected void ClearDataGrid()
        {
            // Tạo một DataTable trống với các cột tương tự
            DataTable emptyTable = new DataTable();
            emptyTable.Columns.Add("grade", typeof(string));
            emptyTable.Columns.Add("lowest_sal", typeof(decimal));
            emptyTable.Columns.Add("highest_sal", typeof(decimal));
            emptyTable.Columns.Add("acreateby", typeof(string));
            emptyTable.Columns.Add("acreatedte", typeof(DateTime));
            emptyTable.Columns.Add("amodifiedby", typeof(string));
            emptyTable.Columns.Add("amodifieddte", typeof(DateTime));

            // Thêm một dòng trống để giữ phần header
            emptyTable.Rows.Add(emptyTable.NewRow());

            // Gán DataTable trống vào DataGrid
            dgJobGrades.DataSource = emptyTable;
            dgJobGrades.DataBind();

            dgJobGrades.Items[0].Visible = false;
        }

        protected void dgJobGrades_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            txtGrade.Text = e.Item.Cells[1].Text.Replace(",", "");
            txtLowest_Sal.Text = e.Item.Cells[2].Text.Replace(",", "");
            txtHighest_Sal.Text = e.Item.Cells[3].Text.Replace(",", "");

            btnGhiSua.Text = "Sửa";
        }

        protected bool ValidateInput()
        {
            bool isValid = true;
            decimal lowestSal=0;
            decimal highestSal=0;
            lblGrade.Text = "";
            lblLowest_Sal.Text = "";
            lblHighest_sal.Text = "";

            if (string.IsNullOrWhiteSpace(txtGrade.Text))
            {
                lblGrade.Text = "Vui lòng nhập bậc lương.";
                isValid = false;
            }

            if (string.IsNullOrWhiteSpace(txtLowest_Sal.Text))
            {
                lblLowest_Sal.Text = "Vui lòng nhập mức lương thấp nhất.";
                isValid = false;
            }
            else if (!decimal.TryParse(txtLowest_Sal.Text, out decimal lowestSalary) || lowestSalary < 0)
            {
                lblLowest_Sal.Text = "Mức lương thấp nhất phải là số dương.";
                isValid = false;
            }
            else
            {
                lowestSal = decimal.Parse(txtLowest_Sal.Text.Trim());
            }

            if (string.IsNullOrWhiteSpace(txtHighest_Sal.Text))
            {
                lblHighest_sal.Text = "Vui lòng nhập mức lương cao nhất.";
                isValid = false;
            }
            else if (!decimal.TryParse(txtHighest_Sal.Text, out decimal highestSalary) || highestSalary < 0)
            {
                lblHighest_sal.Text = "Mức lương cao nhất phải là số dương.";
                isValid = false;
            }
            else
            {
                highestSal = decimal.Parse(txtHighest_Sal.Text.Trim());
            }

            if (highestSal < lowestSal)
            {
                lblHighest_sal.Text = "Mức lương cao nhất phải lớn hơn mức lương thấp nhất.";
            }
            return isValid;

        }

        protected void btnTK_Click(object sender, EventArgs e)
        {
            using (OracleConnection conn = new OracleConnection(strConn))
            {
                OracleCommand cmd = new OracleCommand("getJob_Grade", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("p_grade", OracleDbType.Varchar2).Value = string.IsNullOrEmpty(txtGrade.Text) ? (object)DBNull.Value : txtGrade.Text;
                cmd.Parameters.Add("p_lowest_sal", OracleDbType.Decimal).Value = string.IsNullOrEmpty(txtLowest_Sal.Text) ? (object)DBNull.Value : Convert.ToDecimal(txtLowest_Sal.Text);
                cmd.Parameters.Add("p_highest_sal", OracleDbType.Decimal).Value = string.IsNullOrEmpty(txtHighest_Sal.Text) ? (object)DBNull.Value : Convert.ToDecimal(txtHighest_Sal.Text);

                cmd.Parameters.Add("p_cursor", OracleDbType.RefCursor).Direction = ParameterDirection.Output;

                conn.Open();

                using (OracleDataReader reader = cmd.ExecuteReader())
                {
                    DataTable dataT = new DataTable();
                    dataT.Load(reader);
                    dt = dataT;
                    dgJobGrades.DataSource = dataT;
                    dgJobGrades.DataBind();
                }
            }
        }

        protected void btnGhiSua_Click(object sender, EventArgs e)
        {
            if (!ValidateInput())
            {
                return;
            }
            else if (btnGhiSua.Text == "Sửa"){
                btnSua_Click();
            }
            else
            {
                btnGhi_Click();
            }
            

        }
        private void btnGhi_Click()
        {
            string grade = txtGrade.Text.Trim();
            decimal lowestSal = decimal.Parse(txtLowest_Sal.Text.Trim());
            decimal highestSal = decimal.Parse(txtHighest_Sal.Text.Trim());
            string createdBy = "Phu";  
            DateTime createdDate = DateTime.Now;  
            string modifiedBy = null; 
            DateTime? modifiedDate = null;

            using (OracleConnection conn = new OracleConnection(strConn))
            {
                conn.Open();

                using (OracleCommand cmd = new OracleCommand("insertJob_grade", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("p_grade", OracleDbType.Varchar2).Value = grade;
                    cmd.Parameters.Add("p_lowest_sal", OracleDbType.Decimal).Value = lowestSal;
                    cmd.Parameters.Add("p_highest_sal", OracleDbType.Decimal).Value = highestSal;
                    cmd.Parameters.Add("p_acreateby", OracleDbType.Varchar2).Value = createdBy;
                    cmd.Parameters.Add("p_acreatedte", OracleDbType.Date).Value = createdDate;

                    
                    cmd.Parameters.Add("p_amodifiedby", OracleDbType.Varchar2).Value = modifiedBy ?? (object)DBNull.Value;
                    cmd.Parameters.Add("p_amodifieddte", OracleDbType.Date).Value = modifiedDate ?? (object)DBNull.Value;

                    cmd.ExecuteNonQuery();
                }
            }

            dt = getData();
            dgJobGrades.DataSource = dt;
            dgJobGrades.DataBind();
        }
        private void btnSua_Click()
        {
            string grade = txtGrade.Text.Trim();
            decimal lowestSal = decimal.Parse(txtLowest_Sal.Text.Trim());
            decimal highestSal = decimal.Parse(txtHighest_Sal.Text.Trim());
            string modifiedBy = "Phu";
            if (lowestSal >= highestSal)
            {
                llerror.Text = "Vui long nhập mức lương thấp nhất thấp hơn mức lương cao nhất";
                return;
            }
            using (OracleConnection conn = new OracleConnection(strConn))
            {
                conn.Open();

                using (OracleCommand cmd = new OracleCommand("upJob_Grade", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("p_grade", OracleDbType.Varchar2).Value = grade;
                    cmd.Parameters.Add("p_lowest_sal", OracleDbType.Decimal).Value = lowestSal;
                    cmd.Parameters.Add("p_highest_sal", OracleDbType.Decimal).Value = highestSal;
                    cmd.Parameters.Add("p_amodifiedby", OracleDbType.Varchar2).Value = modifiedBy;

                    cmd.ExecuteNonQuery();
                }
            }
            dt = getData();
            dgJobGrades.DataSource = getData();
            dgJobGrades.DataBind();
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
                        workSheet.Cells[i + 2, j + 1].Value = dt.Rows[i][j];
                    }
                }

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
            ExportToExcel(dt, "Job_Grade");
        }
    }
}