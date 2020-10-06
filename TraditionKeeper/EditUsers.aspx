<%@ Page Language="C#" UnobtrusiveValidationMode="none" AutoEventWireup="true" CodeBehind="EditUsers.aspx.cs" Inherits="TraditionKeeper.EditUsers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Users</title>
</head>
<body>
    <form id="form1" runat="server">
		<div id="EditUsers_Header">
			<asp:Button ID="btnEditUsersExit" runat="server" Text="Exit" OnClick="btnEditUsersExit_Click" />
			<br />
		</div>

		<!-- Body section that includes the main Users database table -->
		<!-- ERROR: Updating doesn't work -->
		<!-- ERROR: White space included on edit textboxes -->
        <div id="EditUsers_Body">
			<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="USER_ID" DataSourceID="SqlDataSource1" GridLines="Vertical" ShowFooter="True">
				<AlternatingRowStyle BackColor="#DCDCDC" />
				<Columns>
					<asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
					<asp:TemplateField HeaderText="USER_ID" InsertVisible="False" SortExpression="USER_ID">
						<EditItemTemplate>
							<asp:Label ID="Label1" runat="server" Text='<%# Eval("USER_ID") %>'></asp:Label>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label1" runat="server" Text='<%# Bind("USER_ID") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:LinkButton ValidationGroup="INSERT" ID="lbtnInsert" runat="server" OnClick="lbtnInsert_Click" ForeColor="Black">Insert</asp:LinkButton>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="USER_ANumber" SortExpression="USER_ANumber">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("USER_ANumber") %>'></asp:TextBox>
							<asp:RequiredFieldValidator ID="rfvEditANumber" runat="server" ErrorMessage="ANumber is required" ControlToValidate="TextBox1" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label2" runat="server" Text='<%# Bind("USER_ANumber") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtInsertANumber" runat="server"></asp:TextBox>
							<asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertANumber" runat="server" ErrorMessage="ANumber is required" ControlToValidate="txtInsertANumber" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="USER_Username" SortExpression="USER_Username">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("USER_Username") %>'></asp:TextBox>
							<asp:RequiredFieldValidator ID="rfvEditUsername" runat="server" ErrorMessage="Username is required" ControlToValidate="TextBox2" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label3" runat="server" Text='<%# Bind("USER_Username") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtInsertUsername" runat="server"></asp:TextBox>
							<asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertUsername" runat="server" ErrorMessage="Username is required" ControlToValidate="txtInsertUsername" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="USER_Password" SortExpression="USER_Password">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("USER_Password") %>'></asp:TextBox>
							<asp:RequiredFieldValidator ID="rfvEditPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="TextBox3" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label4" runat="server" Text='<%# Bind("USER_Password") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtInsertPassword" runat="server"></asp:TextBox>
							<asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertPassword" runat="server" ErrorMessage="Password is required" ControlToValidate="txtInsertPassword" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="USER_FName" SortExpression="USER_FName">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("USER_FName") %>'></asp:TextBox>
							<asp:RequiredFieldValidator ID="rfvEditFName" runat="server" ErrorMessage="First Name is required" ControlToValidate="TextBox4" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label5" runat="server" Text='<%# Bind("USER_FName") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtInsertFName" runat="server"></asp:TextBox>
							<asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertFName" runat="server" ErrorMessage="First Name is required" ControlToValidate="txtInsertFName" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="USER_LName" SortExpression="USER_LName">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("USER_LName") %>'></asp:TextBox>
							<asp:RequiredFieldValidator ID="rfvEditLName" runat="server" ErrorMessage="Last Name is required" ControlToValidate="TextBox5" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label6" runat="server" Text='<%# Bind("USER_LName") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtInsertLName" runat="server"></asp:TextBox>
							<asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertLName" runat="server" ErrorMessage="Last Name is required" ControlToValidate="txtInsertLName" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="USER_Email" SortExpression="USER_Email">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("USER_Email") %>'></asp:TextBox>
							<asp:RequiredFieldValidator ID="rfvEditEmail" runat="server" ErrorMessage="Email is required" ControlToValidate="TextBox6" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label7" runat="server" Text='<%# Bind("USER_Email") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtInsertEmail" runat="server"></asp:TextBox>
							<asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertEmail" runat="server" ErrorMessage="Email is required" ControlToValidate="txtInsertEmail" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="USER_Class" SortExpression="USER_Class">
						<EditItemTemplate>
							<asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("USER_Class") %>'></asp:TextBox>
							<asp:RequiredFieldValidator ID="rfvEditClass" runat="server" ErrorMessage="Class is required" ControlToValidate="TextBox7" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label8" runat="server" Text='<%# Bind("USER_Class") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtInsertClass" runat="server"></asp:TextBox>
							<asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertClass" runat="server" ErrorMessage="Class is required" ControlToValidate="txtInsertClass" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="USER_TraditionCount" SortExpression="USER_TraditionCount">
						<EditItemTemplate>
							<asp:DropDownList ID="DropDownList1" runat="server">
								<asp:ListItem>0</asp:ListItem>
								<asp:ListItem>1</asp:ListItem>
								<asp:ListItem>2</asp:ListItem>
							</asp:DropDownList>
							<asp:RequiredFieldValidator ID="rfvEditTradCount" runat="server" ErrorMessage="Tradition Count is required" ControlToValidate="DropDownList1" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</EditItemTemplate>
						<ItemTemplate>
							<asp:Label ID="Label9" runat="server" Text='<%# Bind("USER_TraditionCount") %>'></asp:Label>
						</ItemTemplate>
						<FooterTemplate>
							<asp:DropDownList ID="ddlInsertTradCount" runat="server">
								<asp:ListItem>0</asp:ListItem>
								<asp:ListItem>1</asp:ListItem>
								<asp:ListItem>2</asp:ListItem>
							</asp:DropDownList>
							<asp:RequiredFieldValidator ValidationGroup="INSERT" ID="rfvInsertTradCount" runat="server" ErrorMessage="Tradition Count is required" ControlToValidate="ddlInsertTradCount" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
						</FooterTemplate>
					</asp:TemplateField>
					<asp:TemplateField HeaderText="USER_IsAdmin" SortExpression="USER_IsAdmin">
						<EditItemTemplate>
							<asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("USER_IsAdmin") %>' />
						</EditItemTemplate>
						<ItemTemplate>
							<asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("USER_IsAdmin") %>' Enabled="false" />
						</ItemTemplate>
						<FooterTemplate>
							<asp:CheckBox ID="ckbInsertAdmin" runat="server" />
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
        </div>

		<!-- Declaration of the SQL Datasource that includes Update, Insert, and Delete functionality -->
    	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:TraditionKeeperConnectionString %>" DeleteCommand="DELETE FROM [User] WHERE [USER_ID] = @original_USER_ID AND [USER_ANumber] = @original_USER_ANumber AND [USER_Username] = @original_USER_Username AND [USER_Password] = @original_USER_Password AND [USER_FName] = @original_USER_FName AND [USER_LName] = @original_USER_LName AND [USER_Email] = @original_USER_Email AND [USER_Class] = @original_USER_Class AND [USER_TraditionCount] = @original_USER_TraditionCount AND [USER_IsAdmin] = @original_USER_IsAdmin" InsertCommand="INSERT INTO [User] ([USER_ANumber], [USER_Username], [USER_Password], [USER_FName], [USER_LName], [USER_Email], [USER_Class], [USER_TraditionCount], [USER_IsAdmin]) VALUES (@USER_ANumber, @USER_Username, @USER_Password, @USER_FName, @USER_LName, @USER_Email, @USER_Class, @USER_TraditionCount, @USER_IsAdmin)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [User]" UpdateCommand="UPDATE [User] SET [USER_ANumber] = @USER_ANumber, [USER_Username] = @USER_Username, [USER_Password] = @USER_Password, [USER_FName] = @USER_FName, [USER_LName] = @USER_LName, [USER_Email] = @USER_Email, [USER_Class] = @USER_Class, [USER_TraditionCount] = @USER_TraditionCount, [USER_IsAdmin] = @USER_IsAdmin WHERE [USER_ID] = @original_USER_ID AND [USER_ANumber] = @original_USER_ANumber AND [USER_Username] = @original_USER_Username AND [USER_Password] = @original_USER_Password AND [USER_FName] = @original_USER_FName AND [USER_LName] = @original_USER_LName AND [USER_Email] = @original_USER_Email AND [USER_Class] = @original_USER_Class AND [USER_TraditionCount] = @original_USER_TraditionCount AND [USER_IsAdmin] = @original_USER_IsAdmin">
			<DeleteParameters>
				<asp:Parameter Name="original_USER_ID" Type="Int32" />
				<asp:Parameter Name="original_USER_ANumber" Type="String" />
				<asp:Parameter Name="original_USER_Username" Type="String" />
				<asp:Parameter Name="original_USER_Password" Type="String" />
				<asp:Parameter Name="original_USER_FName" Type="String" />
				<asp:Parameter Name="original_USER_LName" Type="String" />
				<asp:Parameter Name="original_USER_Email" Type="String" />
				<asp:Parameter Name="original_USER_Class" Type="String" />
				<asp:Parameter Name="original_USER_TraditionCount" Type="Int32" />
				<asp:Parameter Name="original_USER_IsAdmin" Type="Boolean" />
			</DeleteParameters>
			<InsertParameters>
				<asp:Parameter Name="USER_ANumber" Type="String" />
				<asp:Parameter Name="USER_Username" Type="String" />
				<asp:Parameter Name="USER_Password" Type="String" />
				<asp:Parameter Name="USER_FName" Type="String" />
				<asp:Parameter Name="USER_LName" Type="String" />
				<asp:Parameter Name="USER_Email" Type="String" />
				<asp:Parameter Name="USER_Class" Type="String" />
				<asp:Parameter Name="USER_TraditionCount" Type="Int32" />
				<asp:Parameter Name="USER_IsAdmin" Type="Boolean" />
			</InsertParameters>
			<UpdateParameters>
				<asp:Parameter Name="USER_ANumber" Type="String" />
				<asp:Parameter Name="USER_Username" Type="String" />
				<asp:Parameter Name="USER_Password" Type="String" />
				<asp:Parameter Name="USER_FName" Type="String" />
				<asp:Parameter Name="USER_LName" Type="String" />
				<asp:Parameter Name="USER_Email" Type="String" />
				<asp:Parameter Name="USER_Class" Type="String" />
				<asp:Parameter Name="USER_TraditionCount" Type="Int32" />
				<asp:Parameter Name="USER_IsAdmin" Type="Boolean" />
				<asp:Parameter Name="original_USER_ID" Type="Int32" />
				<asp:Parameter Name="original_USER_ANumber" Type="String" />
				<asp:Parameter Name="original_USER_Username" Type="String" />
				<asp:Parameter Name="original_USER_Password" Type="String" />
				<asp:Parameter Name="original_USER_FName" Type="String" />
				<asp:Parameter Name="original_USER_LName" Type="String" />
				<asp:Parameter Name="original_USER_Email" Type="String" />
				<asp:Parameter Name="original_USER_Class" Type="String" />
				<asp:Parameter Name="original_USER_TraditionCount" Type="Int32" />
				<asp:Parameter Name="original_USER_IsAdmin" Type="Boolean" />
			</UpdateParameters>
		</asp:SqlDataSource>
    </form>
</body>
</html>
