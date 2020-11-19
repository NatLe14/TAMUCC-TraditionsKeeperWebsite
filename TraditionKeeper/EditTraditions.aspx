<%@ Page Language="C#" UnobtrusiveValidationMode="none" AutoEventWireup="true" CodeBehind="EditTraditions.aspx.cs" Inherits="TraditionKeeper.EditTraditions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Traditions</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
			<!-- Body section that includes the main Traditions database table -->
        	<asp:Button ID="btnEditTraditionsExit" runat="server" OnClick="btnEditTraditionsExit_Click" Text="Exit" />
			<br />
			<br />
			<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="TRAD_ID" DataSourceID="SqlDataSource1" GridLines="Vertical" ShowFooter="True">
				<AlternatingRowStyle BackColor="#DCDCDC" />
				<Columns>
					<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
					<asp:TemplateField HeaderText="TRAD_ID" InsertVisible="False" SortExpression="TRAD_ID">
						<EditItemTemplate>
							<asp:Label ID="Label1" runat="server" Text='<%# Eval("TRAD_ID") %>'></asp:Label>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label1" runat="server" Text='<%# Bind("TRAD_ID") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:LinkButton ValidationGroup="INSERT" ID="lbtnInsert" runat="server" OnClick="lbtnInsert_Click" ForeColor="Black">Insert</asp:LinkButton>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="TRAD_Name" SortExpression="TRAD_Name">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TRAD_Name") %>'></asp:TextBox>
							<asp:RequiredFieldValidator ID="rfvEditTraditionName" runat="server" ErrorMessage="Tradition Name is required" ControlToValidate="TextBox1" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label2" runat="server" Text='<%# Bind("TRAD_Name") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtInsertTradName" runat="server"></asp:TextBox>
							<asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertTradName" runat="server" ErrorMessage="Tradition Name is required" ControlToValidate="txtInsertTradName" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="TRAD_Description" SortExpression="TRAD_Description">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox2" runat="server" Width="1000px" Text='<%# Bind("TRAD_Description") %>'></asp:TextBox>
							<asp:RequiredFieldValidator ID="rfvEditTraditionDescription" runat="server" ErrorMessage="Tradition Description is required" ControlToValidate="TextBox2" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label3" runat="server" Text='<%# Bind("TRAD_Description") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtInsertTradDescription" runat="server" Width="1000px"></asp:TextBox>
							<asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertTradDescription" runat="server" ErrorMessage="Tradition Description is required" ControlToValidate="txtInsertTradDescription" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="TRAD_Category" SortExpression="TRAD_Category">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("TRAD_Category") %>'></asp:TextBox>
							<asp:RequiredFieldValidator ID="rfvEditTraditionCategory" runat="server" ErrorMessage="Tradition Category is required" ControlToValidate="TextBox3" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label4" runat="server" Text='<%# Bind("TRAD_Category") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtInsertTradCategory" runat="server"></asp:TextBox>
							<asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertTradCategory" runat="server" ErrorMessage="Tradition Category is required" ControlToValidate="txtInsertTradCategory" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
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
				DeleteCommand="DELETE FROM [Tradition] WHERE [TRAD_ID] = @original_TRAD_ID AND [TRAD_Name] = @original_TRAD_Name AND [TRAD_Description] = @original_TRAD_Description AND [TRAD_Category] = @original_TRAD_Category" 
				InsertCommand="INSERT INTO [Tradition] ([TRAD_Name], [TRAD_Description], [TRAD_Category]) VALUES (@TRAD_Name, @TRAD_Description, @TRAD_Category)" 
				OldValuesParameterFormatString="original_{0}" 
				SelectCommand="SELECT * FROM [Tradition]" 
				UpdateCommand="UPDATE [Tradition] SET [TRAD_Name] = @TRAD_Name, [TRAD_Description] = @TRAD_Description, [TRAD_Category] = @TRAD_Category WHERE [TRAD_ID] = @original_TRAD_ID">
				<DeleteParameters>
					<asp:Parameter Name="original_TRAD_ID" Type="Int32" />
					<asp:Parameter Name="original_TRAD_Name" Type="String" />
					<asp:Parameter Name="original_TRAD_Description" Type="String" />
					<asp:Parameter Name="original_TRAD_Category" Type="String" />
				</DeleteParameters>
				<InsertParameters>
					<asp:Parameter Name="TRAD_Name" Type="String" />
					<asp:Parameter Name="TRAD_Description" Type="String" />
					<asp:Parameter Name="TRAD_Category" Type="String" />
				</InsertParameters>
				<UpdateParameters>
					<asp:Parameter Name="TRAD_Name" Type="String" />
					<asp:Parameter Name="TRAD_Description" Type="String" />
					<asp:Parameter Name="TRAD_Category" Type="String" />
					<asp:Parameter Name="original_TRAD_ID" Type="Int32" />
					<asp:Parameter Name="original_TRAD_Name" Type="String" />
					<asp:Parameter Name="original_TRAD_Description" Type="String" />
					<asp:Parameter Name="original_TRAD_Category" Type="String" />
				</UpdateParameters>
			</asp:SqlDataSource>
        	
        </div>
    </form>
</body>
</html>
