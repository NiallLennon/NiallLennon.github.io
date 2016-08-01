<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="BusinessService.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:FormView ID="productDetail" runat="server" ItemType="BusinessService.Models.Product" SelectMethod ="GetProduct" RenderOuterTable="false">
        <ItemTemplate>
            <div>
                <h1><%#:Item.ProductName %></h1>
            </div>
            <br />
            <table>
                <tr>
                    <td>
                        <img src="/Catalog/Images/Thumbs/<%#:Item.ImagePath %>" style="border:solid; height:75px"; width="100" alt="<%#:Item.ProductName %>"/>
                   

                        
                        
                         </td>
                    <td>&nbsp;</td>  
                    <td style="vertical-align: top; text-align:left;">
                        <b>Details:</b><br /><%#:Item.Description %>
                        <br />
                        <span><b>Cost:</b>&nbsp;<%#: String.Format("{0:c}", Item.UnitPrice) %></span>
                        <br />
                        <span><b>Product ID:</b>&nbsp;<%#:Item.ProductID %></span>
                        <br />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
</asp:Content>

<%--This code uses a FormView control to display details about an individual product. 
This markup uses methods like those that are used to display data in the ProductList.aspx page. 
The FormView control is used to display a single record at a time from a data source. 
When you use the FormView control, you create templates to display and edit data-bound values. 
The templates contain controls, binding expressions, and formatting that define the look and functionality of the form.--%>
