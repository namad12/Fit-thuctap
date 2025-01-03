﻿using OfficeOpenXml;
using Oracle.DataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Diagnostics;
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
        private string sGrade = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dgJobGrades.DataSource = getAllData();
                dgJobGrades.DataBind();
                dt = getAllData();
            }
        }
        private DataTable getAllData()
        {
            using (OracleConnection objConnection = new OracleConnection(strConn))
            {
                objConnection.Open();
                OracleCommand objCommand = new OracleCommand();
                objCommand.Connection = objConnection;
                objCommand.CommandText = "select * from Job_Grade ORDER BY lowest_sal";
                objCommand.CommandType = System.Data.CommandType.Text;
                OracleDataAdapter objAdapter = new OracleDataAdapter(objCommand);
                DataTable objTable = new DataTable();
                objAdapter.Fill(objTable);
                return objTable;

            }
        }

        private DataTable getData()
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
                    return dataT;
                }
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

            dgJobGrades.DataSource = null;
            dgJobGrades.SelectedIndex = 0;
            dgJobGrades.DataBind();

            btnGhiSua.Text = "Ghi";
        }

        protected void dgJobGrades_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            txtGrade.Text = e.Item.Cells[1].Text.Trim();
            txtLowest_Sal.Text = e.Item.Cells[2].Text.Replace(",", "");
            txtHighest_Sal.Text = e.Item.Cells[3].Text.Replace(",", "");
            sGrade = e.Item.Cells[1].Text.Trim();
            ViewState["sGrade"] = sGrade;
            btnGhiSua.Text = "Sửa";
        }
        private bool Check_Grade()
        {
            foreach (DataRow dr in dt.Rows)
            {
                if (dr["Grade"].ToString() == txtGrade.Text)
                {
                    return false;
                }
            }
            return true;
        }
        protected bool ValidateInput()
        {
            bool isValid = true;
            decimal lowestSal = 0;
            decimal highestSal = 0;
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
            else if (btnGhiSua.Text == "Sửa")
            {
                btnSua_Click();
            }
            else
            {
                if (!Check_Grade())
                {
                    lblGrade.Text = "Bậc lương đã tồn tại.";

                }
                else
                {
                    btnGhi_Click();
                }

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
            dgJobGrades.DataSource = getAllData();
            dgJobGrades.DataBind();
        }
        private void btnSua_Click()
        {

            sGrade = ViewState["sGrade"]?.ToString() ?? "";
            string new_grade = txtGrade.Text.Trim();
            decimal lowestSal = decimal.Parse(txtLowest_Sal.Text.Trim());
            decimal highestSal = decimal.Parse(txtHighest_Sal.Text.Trim());
            string modifiedBy = "Phu";

            using (OracleConnection conn = new OracleConnection(strConn))
            {
                conn.Open();

                using (OracleCommand cmd = new OracleCommand("upJob_Grade", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("p_grade", OracleDbType.Varchar2).Value = sGrade;
                    cmd.Parameters.Add("p_grade_n", OracleDbType.Varchar2).Value = new_grade;
                    cmd.Parameters.Add("p_lowest_sal", OracleDbType.Decimal).Value = lowestSal;
                    cmd.Parameters.Add("p_highest_sal", OracleDbType.Decimal).Value = highestSal;
                    cmd.Parameters.Add("p_amodifiedby", OracleDbType.Varchar2).Value = modifiedBy;

                    cmd.ExecuteNonQuery();
                }
            }
            dgJobGrades.DataSource = getAllData();
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
                        var cell = workSheet.Cells[i + 2, j + 1];
                        var value = dt.Rows[i][j];
                        if (value is DateTime)
                        {
                            cell.Value = (DateTime)value;
                            cell.Style.Numberformat.Format = "DD-MMM-YYYY";
                        }
                        else if (value is decimal || value is double)
                        {
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
            ExportToExcel(getData(), "Job_Grade");
        }
    }
}