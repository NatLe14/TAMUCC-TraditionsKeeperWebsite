<%@ Page Language="C#" UnobtrusiveValidationMode="none" AutoEventWireup="true" CodeBehind="EditBuildings.aspx.cs" Inherits="TraditionKeeper.EditBuildings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Buildings</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
			<!-- Body section that includes the main Buildings database table -->
        	<asp:Button ID="btnEditBuildingsExit" runat="server" Text="Exit" OnClick="btnEditBuildingsExit_Click" />
			<br />
			<br />
			<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="BILD_ID" DataSourceID="SqlDataSource1" GridLines="Vertical" ShowFooter="True">
				<AlternatingRowStyle BackColor="#DCDCDC" />
				<Columns>
					<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
					<asp:TemplateField HeaderText="BILD_ID" InsertVisible="False" SortExpression="BILD_ID">
						<EditItemTemplate>
							<asp:Label ID="Label1" runat="server" Text='<%# Eval("BILD_ID") %>'></asp:Label>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label1" runat="server" Text='<%# Bind("BILD_ID") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:LinkButton ValidationGroup="INSERT" ID="lbtnInsert" runat="server" OnClick="lbtnInsert_Click" ForeColor="Black">Insert</asp:LinkButton>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="BILD_Name" SortExpression="BILD_Name">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("BILD_Name") %>'></asp:TextBox>
							<asp:RequiredFieldValidator ID="rfvEditBuildingName" runat="server" ErrorMessage="Building Name is required" ControlToValidate="TextBox1" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label2" runat="server" Text='<%# Bind("BILD_Name") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtInsertBuildingName" runat="server"></asp:TextBox>
							<asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertBuildingName" runat="server" ErrorMessage="Building Name is required" ControlToValidate="txtInsertBuildingName" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="BILD_Description" SortExpression="BILD_Description">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox2" runat="server" Width="1000px" Text='<%# Bind("BILD_Description") %>'></asp:TextBox>
							<asp:RequiredFieldValidator ID="rfvEditBuildingDescription" runat="server" ErrorMessage="Building Description is required" ControlToValidate="TextBox2" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label3" runat="server" Text='<%# Bind("BILD_Description") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtInsertBuildingDescription" runat="server" Width="1000px"></asp:TextBox>
							<asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertBuildingDescription" runat="server" ErrorMessage="Building Description is required" ControlToValidate="txtInsertBuildingDescription" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="BILD_Year" SortExpression="BILD_Year">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("BILD_Year") %>'></asp:TextBox>
							<asp:RequiredFieldValidator ID="rfvEditBuildingYear" runat="server" ErrorMessage="Building Year is required" ControlToValidate="TextBox3" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label4" runat="server" Text='<%# Bind("BILD_Year") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtInsertBuildingYear" runat="server"></asp:TextBox>
							<asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertBuildingYear" runat="server" ErrorMessage="Building Year is required" ControlToValidate="txtInsertBuildingYear" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
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
				DeleteCommand="DELETE FROM [Building] WHERE [BILD_ID] = @original_BILD_ID AND [BILD_Name] = @original_BILD_Name AND [BILD_Description] = @original_BILD_Description AND [BILD_Year] = @original_BILD_Year" 
				InsertCommand="INSERT INTO [Building] ([BILD_Name], [BILD_Description], [BILD_Year]) VALUES (@BILD_Name, @BILD_Description, @BILD_Year)" 
				OldValuesParameterFormatString="original_{0}" 
				SelectCommand="SELECT * FROM [Building]" 
				UpdateCommand="UPDATE [Building] SET [BILD_Name] = @BILD_Name, [BILD_Description] = @BILD_Description, [BILD_Year] = @BILD_Year WHERE [BILD_ID] = @original_BILD_ID">
				<DeleteParameters>
					<asp:Parameter Name="original_BILD_ID" Type="Int32" />
					<asp:Parameter Name="original_BILD_Name" Type="String" />
					<asp:Parameter Name="original_BILD_Description" Type="String" />
					<asp:Parameter Name="original_BILD_Year" Type="String" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="BILD_Name" Type="String" />
					<asp:Parameter Name="BILD_Description" Type="String" />
					<asp:Parameter Name="BILD_Year" Type="String" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="BILD_Name" Type="String" />
					<asp:Parameter Name="BILD_Description" Type="String" />
					<asp:Parameter Name="BILD_Year" Type="String" />
					<asp:Parameter Name="original_BILD_ID" Type="Int32" />
					<asp:Parameter Name="original_BILD_Name" Type="String" />
					<asp:Parameter Name="original_BILD_Description" Type="String" />
					<asp:Parameter Name="original_BILD_Year" Type="String" />
				</UpdateParameters>
			</asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
