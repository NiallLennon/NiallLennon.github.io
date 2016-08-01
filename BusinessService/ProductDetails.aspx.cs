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
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Product> GetProduct([QueryString("productID")] int? productId)
        {
            var _db = new BusinessService.Models.ProductContext();
            IQueryable<Product> query = _db.Products;
            if (productId.HasValue && productId > 0)
            {
                query = query.Where(p => p.ProductID == productId);
            }
            else
            {
                query = null;
            }
            return query;
        }
    }
}

//This code checks for a "productID" query-string value. 
//If a valid query-string value is found, the matching product is displayed. 
//If no query-string is found, or the query-string value is not valid, no product 
//is displayed on the ProductDetails.aspx page.