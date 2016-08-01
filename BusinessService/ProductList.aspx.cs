using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessService.Models;
using System.Web.ModelBinding;

namespace BusinessService
{
    public partial class ProductList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Product> GetProducts([QueryString("id")] int? categoryId)
        {
            var _db = new BusinessService.Models.ProductContext();
            IQueryable<Product> query = _db.Products;
            if (categoryId.HasValue && categoryId > 0)
            {
                query = query.Where(p => p.CategoryID == categoryId);
            }
            return query;
        }
    }
}

//This code shows the GetProducts method that's referenced 
//by the ItemType property of the ListView control in the ProductList.aspx page. 
//To limit the results to a specific category in the database, the code sets the 
//categoryId value from the query string value passed to the ProductList.aspx page 
//when the ProductList.aspx page is navigated to. The QueryStringAttribute class 
//    in the System.Web.ModelBinding namespace is used to retrieve the value of 
//        the query string variable id. This instructs model binding to try to 
//        bind a value from the query string to the categoryId parameter at run time

//When a valid category is passed as a query string to the page, 
//the results of the query are limited to those products in the 
//database that match the categoryId value. For instance, 
//if the URL to the ProductsList.aspx page is the following:

//http://localhost/ProductList.aspx?id=1
//The page displays only the products where the category equals 1.

//If no query string is included when navigating to the ProductList.aspx page, all products will be displayed.
