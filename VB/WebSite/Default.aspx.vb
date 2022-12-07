Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Drawing

Partial Public Class Grid_Styles_ChangeStyleOnHtmlPreparedEvents_ChangeStyleOnHtmlPreparedEvents
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub
	Protected Sub grid_CustomUnboundColumnData(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewColumnDataEventArgs)
		If e.Column.FieldName = "Total" Then
			Dim price As Decimal = CDec(e.GetListSourceFieldValue("UnitPrice"))
			Dim quantity As Integer = Convert.ToInt32(e.GetListSourceFieldValue("Quantity"))
			e.Value = price * quantity
		End If
	End Sub
	Protected Sub grid_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs)
		If e.DataColumn Is Nothing OrElse e.DataColumn.FieldName <> "Total" Then
		Return
		End If
		Dim value As Decimal = CDec(e.GetValue("Total"))
		If value > 500 Then
			e.Cell.Font.Bold = True
		End If

	End Sub
	Protected Sub grid_HtmlRowPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableRowEventArgs)
		If e.RowType <> DevExpress.Web.GridViewRowType.Data Then
		Return
		End If
		Dim value As Decimal = CDec(e.GetValue("Total"))
		If value > 1000 Then
			e.Row.ForeColor = Color.Red
		End If
	End Sub
End Class
