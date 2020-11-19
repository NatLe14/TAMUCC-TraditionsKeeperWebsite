<%@ Page Language="C#" UnobtrusiveValidationMode="none" AutoEventWireup="true" CodeBehind="EditPrizes.aspx.cs" Inherits="TraditionKeeper.EditPrizes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Prizes</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
			<!-- Body section that includes the main Prize database table -->
        	<asp:Button ID="btnEditPrizesExit" runat="server" OnClick="btnEditPrizesExit_Click" Text="Exit" />
			<br />
			<br />
			<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="PRIZ_ID" DataSourceID="SqlDataSource1" GridLines="Vertical" ShowFooter="True">
				<AlternatingRowStyle BackColor="#DCDCDC" />
				<Columns>
					<asp:CommandField ShowEditButton="True" />
					<asp:TemplateField HeaderText="PRIZ_ID" InsertVisible="False" SortExpression="PRIZ_ID">
						<EditItemTemplate>
							<asp:Label ID="Label1" runat="server" Text='<%# Eval("PRIZ_ID") %>'></asp:Label>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label1" runat="server" Text='<%# Bind("PRIZ_ID") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:LinkButton ValidationGroup="INSERT" ID="lbtnInsert" runat="server" OnClick="lbtnInsert_Click" ForeColor="Black">Insert</asp:LinkButton>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="PRIZ_Name" SortExpression="PRIZ_Name">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PRIZ_Name") %>'></asp:TextBox>
							<asp:RequiredFieldValidator ID="rfvEditPrizeName" runat="server" ErrorMessage="Prize Name is required" ControlToValidate="TextBox1" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label2" runat="server" Text='<%# Bind("PRIZ_Name") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtInsertPrizeName" runat="server"></asp:TextBox>
							<asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertPrizeName" runat="server" ErrorMessage="Prize Name is required" ControlToValidate="txtInsertPrizeName" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="PRIZ_Description" SortExpression="PRIZ_Description">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PRIZ_Description") %>'></asp:TextBox>
							<asp:RequiredFieldValidator ID="rfvEditPrizeDescription" runat="server" ErrorMessage="Prize Description is required" ControlToValidate="TextBox2" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label3" runat="server" Text='<%# Bind("PRIZ_Description") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtInsertPrizeDescription" runat="server"></asp:TextBox>
							<asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertPrizeDescription" runat="server" ErrorMessage="Prize Description is required" ControlToValidate="txtInsertPrizeDescription" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</FooterTemplate>
					</asp:TemplateField>
				</Columns>
				<FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
				<HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
				<PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
				<RowStyle BackColor="#EEEEEE" ForeColor="Black" />
				<SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
				<SortedAscendingCellStyle BackColor="#F1F1F1" />
				<SortedAscendingHeaderStyle BackColor="#0000A9" />
				<SortedDescendingCellStyle BackColor="#CAC9C9" />
				<SortedDescendingHeaderStyle BackColor="#000065" />
			</asp:GridView>
			<br />
			<!-- Declaration of the SQL Datasource that includes Update, Insert, and Delete functionality -->
			<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:TraditionKeeperConnectionString %>" 
				DeleteCommand="DELETE FROM [Prize] WHERE [PRIZ_ID] = @original_PRIZ_ID AND [PRIZ_Name] = @original_PRIZ_Name AND [PRIZ_Description] = @original_PRIZ_Description" 
				InsertCommand="INSERT INTO [Prize] ([PRIZ_Name], [PRIZ_Description]) VALUES (@PRIZ_Name, @PRIZ_Description)" 
				OldValuesParameterFormatString="original_{0}" 
				SelectCommand="SELECT * FROM [Prize]" 
				UpdateCommand="UPDATE [Prize] SET [PRIZ_Name] = @PRIZ_Name, [PRIZ_Description] = @PRIZ_Description WHERE [PRIZ_ID] = @original_PRIZ_ID">
				<DeleteParameters>
					<asp:Parameter Name="original_PRIZ_ID" Type="Int32" />
					<asp:Parameter Name="original_PRIZ_Name" Type="String" />
					<asp:Parameter Name="original_PRIZ_Description" Type="String" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="PRIZ_Name" Type="String" />
					<asp:Parameter Name="PRIZ_Description" Type="String" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="PRIZ_Name" Type="String" />
					<asp:Parameter Name="PRIZ_Description" Type="String" />
					<asp:Parameter Name="original_PRIZ_ID" Type="Int32" />
					<asp:Parameter Name="original_PRIZ_Name" Type="String" />
					<asp:Parameter Name="original_PRIZ_Description" Type="String" />
				</UpdateParameters>
			</asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
