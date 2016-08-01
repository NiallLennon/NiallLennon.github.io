<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DocManagement.aspx.cs" Inherits="BusinessService.DocManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


<br />
<br />
<br />

    
<div>
<asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true" />
    <br />

<asp:Button ID="Button1" runat="server" Text="Upload" 
    OnClick="Button1_Click" />
<br />
<br />
<br />

<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    OnRowCommand="GridView1_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>
        <asp:TemplateField HeaderText="File" ShowHeader="False">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" 
                    CausesValidation="False" 
                    CommandArgument='<%# Eval("File") %>'
                    CommandName="Download" Text='<%# Eval("File") %>'>
                    </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Size" HeaderText="Size" />
        <asp:BoundField DataField="Type" HeaderText="Type" />
    </Columns>
    <EditRowStyle BackColor="#999999" />
    <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" 
        ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" 
        HorizontalAlign="Center" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" 
        ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#E9E7E2" />
    <SortedAscendingHeaderStyle BackColor="#506C8C" />
    <SortedDescendingCellStyle BackColor="#FFFDF8" />
    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
</asp:GridView>
</div>




    </asp:FormView>


</asp:Content>
