<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalMP.Master" AutoEventWireup="true" CodeBehind="Contatos.aspx.cs" Inherits="AgendaWebApp.Contatos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblInserir" runat="server" Text="Inserir Contatos" Font-Bold="True" Font-Size="Larger"></asp:Label>
    <br />
    <br />
    <asp:Label ID="lblNome" runat="server" Text="Nome:" Font-Bold="True"></asp:Label>
    &nbsp;<asp:TextBox ID="tbNome" runat="server" Width="459px"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="lblEmail" runat="server" Text="E-mail:" Font-Bold="True"></asp:Label>
    &nbsp;<asp:TextBox ID="tbEmail" runat="server" Width="455px"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="lblTelefone" runat="server" Text="Telefone:" Font-Bold="True"></asp:Label>
    &nbsp;<asp:TextBox ID="tbTelefone" runat="server" Width="273px"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="btnInserir" runat="server" Text="Inserir Contato" OnClick="btnInserir_Click" />
    <br />
    <br />
    <asp:Label ID="lblListaC" runat="server" Text="Lista de Contatos" Font-Bold="true"></asp:Label>
    <br />
    <asp:GridView ID="gvContato" runat="server" DataSourceID="SqlDataSourceC" DataKeyNames="Id" AutoGenerateColumns="False" AllowPaging="True" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Width="624px">
        <Columns>
            <asp:CommandField ShowSelectButton="True" ShowEditButton="true" ShowDeleteButton="true"></asp:CommandField>
            <asp:BoundField DataField="id" HeaderText="Id" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
            <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome"></asp:BoundField>
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email"></asp:BoundField>
            <asp:BoundField DataField="telefone" HeaderText="Telefone" SortExpression="telefone"></asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSourceC" ConnectionString="<%$ ConnectionStrings:AgendaDBConnectionString %>" SelectCommand="SELECT * FROM [Contato]" DeleteCommand="DELETE FROM [Contato] WHERE [id] = @id" UpdateCommand="UPDATE [Contato] SET [nome] = @nome, [email] = @email, [telefone] = @telefone WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nome" Type="String"></asp:Parameter>
            <asp:Parameter Name="email" Type="String"></asp:Parameter>
            <asp:Parameter Name="telefone" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="id" Type="Int32" />
            <asp:Parameter Name="nome" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="telefone" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
