<%-- BeginRegion TagPrefix and page properties --%>
<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="Grid_Styles_ChangeStyleOnHtmlPreparedEvents_ChangeStyleOnHtmlPreparedEvents" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v7.3" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v7.3" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>


<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title>Change row and data cell styles using events</title>
</head>
<body>
	<form id="form1" runat="server">

	<dxwgv:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="AccessDataSource1" KeyFieldName="OrderID" 
		OnCustomUnboundColumnData="grid_CustomUnboundColumnData" Width="100%" AutoGenerateColumns="False" OnHtmlDataCellPrepared="grid_HtmlDataCellPrepared" OnHtmlRowPrepared="grid_HtmlRowPrepared">
		<Columns>
			<%-- BeginRegion Auto Generated Columns --%>
			<dxwgv:GridViewDataColumn FieldName="CompanyName" VisibleIndex="0">
			</dxwgv:GridViewDataColumn>
			<dxwgv:GridViewDataColumn FieldName="City" VisibleIndex="1">
			</dxwgv:GridViewDataColumn>
			<dxwgv:GridViewDataColumn FieldName="Region" VisibleIndex="2">
			</dxwgv:GridViewDataColumn>
			<dxwgv:GridViewDataColumn FieldName="Country" VisibleIndex="3">
			</dxwgv:GridViewDataColumn>
			<dxwgv:GridViewDataColumn FieldName="Quantity" VisibleIndex="5" Name="Quantity">
			</dxwgv:GridViewDataColumn>
			<%-- EndRegion --%>
			<dxwgv:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="4">
				<PropertiesTextEdit DisplayFormatString="c">
				</PropertiesTextEdit>
			</dxwgv:GridViewDataTextColumn>
			<dxwgv:GridViewDataTextColumn FieldName="Total" VisibleIndex="6" UnboundType="Decimal">
				<FooterCellStyle ForeColor="Brown"> </FooterCellStyle>
				<PropertiesTextEdit DisplayFormatString="c">
				</PropertiesTextEdit>
			</dxwgv:GridViewDataTextColumn>
		</Columns>
		<Settings ShowGroupPanel="True" ShowFooter="True" />
		<TotalSummary>
			<dxwgv:ASPxSummaryItem FieldName="CompanyName" SummaryType="Count"/>
			<dxwgv:ASPxSummaryItem FieldName="Total" SummaryType="Sum" DisplayFormat="c"/>
			<dxwgv:ASPxSummaryItem FieldName="Quantity" SummaryType="Min" />
			<dxwgv:ASPxSummaryItem FieldName="Quantity" SummaryType="Average" />
			<dxwgv:ASPxSummaryItem FieldName="Quantity" SummaryType="Max" />
		</TotalSummary>
	</dxwgv:ASPxGridView>
	<%-- BeginRegion DataSource --%>
	<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
		SelectCommand="SELECT [Customers.CompanyName] AS CompanyName, [City], [Region], [Country], [Salesperson], [OrderID], [OrderDate], [ProductID], [ProductName], [UnitPrice], [Quantity], [Discount], [ExtendedPrice], [Freight] FROM [Invoices]">
	</asp:AccessDataSource>
	<%-- EndRegion --%>
	</form>
</body>
</html>
