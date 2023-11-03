<%@ Page Title="" Language="C#" MasterPageFile="~/PrincipalMP.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="AgendaWebApp.Usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSourceU" DataKeyNames="email" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFF8DC;">
                <td>
                    <asp:Button runat="server" CommandName="Delete" Text="Apagar" ID="DeleteButton" />
                    <asp:Button runat="server" CommandName="Edit" Text="Atualizar" ID="EditButton" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("email") %>' runat="server" ID="emailLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("nome") %>' runat="server" ID="nomeLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("senha") %>' runat="server" ID="senhaLabel" /></td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="background-color: #008A8C; color: #FFFFFF;">
                <td>
                    <asp:Button runat="server" CommandName="Update" Text="Salvar" ID="UpdateButton" />
                    <asp:Button runat="server" CommandName="Cancel" Text="Cancelar" ID="CancelButton" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("email") %>' runat="server" ID="emailLabel1" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("nome") %>' runat="server" ID="nomeTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("senha") %>' runat="server" ID="senhaTextBox" /></td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="background-color: #008A8C; color: #FFFFFF;">
                <td>
                    <asp:Button runat="server" CommandName="Insert" Text="Inserir" ID="InsertButton" />
                    <asp:Button runat="server" CommandName="Cancel" Text="Limpar" ID="CancelButton" />
                </td>
                <td>
                    <asp:TextBox Text='<%# Bind("email") %>' runat="server" ID="emailTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("nome") %>' runat="server" ID="nomeTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("senha") %>' runat="server" ID="senhaTextBox" /></td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="background-color: #DCDCDC; color: #000000;">
                <td>
                    <asp:Button runat="server" CommandName="Delete" Text="Apagar" ID="DeleteButton" />
                    <asp:Button runat="server" CommandName="Edit" Text="Atualizar" ID="EditButton" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("email") %>' runat="server" ID="emailLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("nome") %>' runat="server" ID="nomeLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("senha") %>' runat="server" ID="senhaLabel" /></td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table runat="server" id="itemPlaceholderContainer" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;" border="1">
                            <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                <th runat="server"></th>
                                <th runat="server">E-mail</th>
                                <th runat="server">Nome</th>
                                <th runat="server">Senha</th>
                            </tr>
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                        <asp:DataPager runat="server" ID="DataPager1">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                                <asp:NumericPagerField></asp:NumericPagerField>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False"></asp:NextPreviousPagerField>
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">
                <td>
                    <asp:Button runat="server" CommandName="Delete" Text="Delete" ID="DeleteButton" />
                    <asp:Button runat="server" CommandName="Edit" Text="Edit" ID="EditButton" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("email") %>' runat="server" ID="emailLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("nome") %>' runat="server" ID="nomeLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("senha") %>' runat="server" ID="senhaLabel" /></td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>

    <asp:SqlDataSource runat="server" ID="SqlDataSourceU" OnUpdated="SqlDataSourceU_Updated" OnInserted="SqlDataSourceU_Inserted" ConnectionString="<%$ ConnectionStrings:AgendaDB %>" DeleteCommand="DELETE FROM [Usuario] WHERE [email] = @email" InsertCommand="INSERT INTO [Usuario] ([nome], [senha], [email]) VALUES (@nome, @senha, @email)" SelectCommand="SELECT [email], [nome], [senha] FROM [Usuario]" UpdateCommand="UPDATE [Usuario] SET [nome] = @nome, [senha] = @senha WHERE [email] = @email">
        <DeleteParameters>
            <asp:Parameter Name="email" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nome" Type="String"></asp:Parameter>
            <asp:Parameter Name="senha" Type="String"></asp:Parameter>
            <asp:Parameter Name="email" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="nome" Type="String"></asp:Parameter>
            <asp:Parameter Name="senha" Type="String"></asp:Parameter>
            <asp:Parameter Name="email" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:Label runat="server" ID="lMensg" Font-Bold="True" ForeColor="Red"></asp:Label>
    <asp:Button ID="btnLimpar" runat="server" Text="Limpar Mensagem" OnClick="btnLimpar_Click" />
</asp:Content>
