<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="BusinessService.ShoppingCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div id="ShoppingCartTitle" runat="server" class="ContentHead"><h1>Shopping Cart</h1></div>
    <asp:GridView ID="CartList" runat="server" AutoGenerateColumns="False" ShowFooter="True" GridLines="Vertical" CellPadding="4"
        ItemType="BusinessService.Models.CartItem" SelectMethod="GetShoppingCartItems" 
        CssClass="table table-striped table-bordered" >   
        <Columns>
        <asp:BoundField DataField="ProductID" HeaderText="ID" SortExpression="ProductID" />        
        <asp:BoundField DataField="Product.ProductName" HeaderText="Name" />        
        <asp:BoundField DataField="Product.UnitPrice" HeaderText="Price (each)" DataFormatString="{0:c}"/>     
        <asp:TemplateField   HeaderText="Quantity">            
                <ItemTemplate>
                    <asp:TextBox ID="PurchaseQuantity" Width="40" runat="server" Text="<%#: Item.Quantity %>"></asp:TextBox> 
                </ItemTemplate>        
        </asp:TemplateField>    
        <asp:TemplateField HeaderText="Item Total">            
                <ItemTemplate>
                    <%#: String.Format("{0:c}", ((Convert.ToDouble(Item.Quantity)) *  Convert.ToDouble(Item.Product.UnitPrice)))%>
                </ItemTemplate>        
        </asp:TemplateField> 
        <asp:TemplateField HeaderText="Remove Item">            
                <ItemTemplate>
                    <asp:CheckBox id="Remove" runat="server"></asp:CheckBox>
                </ItemTemplate>        
        </asp:TemplateField>    
        </Columns>    
    </asp:GridView>
    <div>
        <p></p>
        <strong>
            <asp:Label ID="LabelTotalText" runat="server" Text="Order Total: "></asp:Label>
            <asp:Label ID="lblTotal" runat="server" EnableViewState="false"></asp:Label>
        </strong> 
    </div>
    <br />

        <table> 
    <tr>
      <td>
        <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click" />
          
          <br />
          <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Payment.aspx">Payment</asp:LinkButton>
          
      </td>
      <td>

          <br />



          <br />
          <br />




      </td>
    </tr>
    </table>

    <%--When the user clicks the Update button, the UpdateBtn_Click event handler will be called. --%>

</asp:Content>


<%-- All part of tutorial 
    The ShoppingCart.aspx page includes a GridView control named CartList. 
    This control uses model binding to bind the shopping cart data from the 
    database to the GridView control. When you set the ItemType property of the 
    GridView control, the data-binding expression Item is available in the markup of the control 
    and the control becomes strongly typed. As mentioned earlier in this tutorial series, 
    you can select details of the Item object using IntelliSense. To configure a data 
    control to use model binding to select data, you set the SelectMethod property of the control. 
    In the markup above, you set the SelectMethod to use the GetShoppingCartItems method which 
    returns a list of CartItem objects. The GridView data control calls the method at the 
    appropriate time in the page life cycle and automatically binds the returned data. 
    The GetShoppingCartItems method must still be added.--%>