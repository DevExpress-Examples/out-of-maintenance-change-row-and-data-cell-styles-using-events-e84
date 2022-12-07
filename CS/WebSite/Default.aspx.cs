using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;

public partial class Grid_Styles_ChangeStyleOnHtmlPreparedEvents_ChangeStyleOnHtmlPreparedEvents : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void grid_CustomUnboundColumnData(object sender,
                DevExpress.Web.ASPxGridViewColumnDataEventArgs e) {
        if(e.Column.FieldName == "Total") {
            decimal price = (decimal)e.GetListSourceFieldValue("UnitPrice");
            int quantity = Convert.ToInt32(e.GetListSourceFieldValue("Quantity"));
            e.Value = price * quantity;
        }
    }
    protected void grid_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e) {
        if(e.DataColumn == null || e.DataColumn.FieldName != "Total") return;
        decimal value = (decimal)e.GetValue("Total");
        if(value > 500)
            e.Cell.Font.Bold = true;

    }
    protected void grid_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e) {
        if(e.RowType != DevExpress.Web.GridViewRowType.Data) return;
        decimal value = (decimal)e.GetValue("Total");
        if(value > 1000)
            e.Row.ForeColor = Color.Red;
    }
}
