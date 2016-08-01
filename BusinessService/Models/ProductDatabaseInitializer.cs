using System.Collections.Generic;
using System.Data.Entity;

namespace BusinessService.Models
{
    public class ProductDatabaseInitializer : DropCreateDatabaseIfModelChanges<ProductContext>
    {
        protected override void Seed(ProductContext context)
        {
            GetCategories().ForEach(c => context.Categories.Add(c));
            GetProducts().ForEach(p => context.Products.Add(p));
        }

        private static List<Category> GetCategories()
        {
            var categories = new List<Category> {
                new Category
                {
                    CategoryID = 1,
                    CategoryName = "Single Review"
                },
                new Category
                {
                    CategoryID = 2,
                    CategoryName = "Multiple Reviews"
                },

            };

            return categories;
        }

        private static List<Product> GetProducts()
        {
            var products = new List<Product> {
                new Product
                {
                    ProductID = 1,
                    ProductName = "1 document",
                    Description = "This is the cost for the review of one document.", 
                    ImagePath="business.png",
                    UnitPrice = 20.00,
                    CategoryID = 1
               },
                new Product 
                {
                    ProductID = 2,
                    ProductName = "2 documents",
                    Description = "This is the cost for the review of two documents.",
                    ImagePath="business.png",
                    UnitPrice = 30.00,
                     CategoryID = 1
               },
                new Product
                {
                    ProductID = 3,
                    ProductName = "3 documents",
                    Description = "This is the cost for the review of three documents.",
                    ImagePath="business.png",
                    UnitPrice = 50.00,
                    CategoryID = 1
                },
                new Product
                {
                    ProductID = 4,
                    ProductName = "1 day",
                    Description = "This is the rate for 1 twelve hour day of service.",
                    ImagePath="business.png",
                    UnitPrice = 250.00,
                    CategoryID = 2
                },
                new Product
                {
                    ProductID = 5,
                    ProductName = "3 days",
                    Description = "This is the rate for 3 twelve hour days of service.",
                    ImagePath="business.png",
                    UnitPrice = 500.00,
                    CategoryID = 2
                },
                new Product
                {
                    ProductID = 6,
                    ProductName = "5 days",
                    Description = "This is the rate for 5 twelve hour days of service.",
                    ImagePath="business.png",
                    UnitPrice = 750.00,
                    CategoryID = 2
                },


            };

            return products;
        }
    }
}

//I need to run some custom logic to initialize the 
//database the first time the context is used. This will allow 
//seed data to be added to the database so that I can immediately display products and categories.