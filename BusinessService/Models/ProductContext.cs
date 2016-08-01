using System.Data.Entity;
namespace BusinessService.Models
{
    public class ProductContext : DbContext
    {
        public ProductContext()
            : base("BusinessService")
        {
        }

        public DbSet<Category> Categories { get; set; }
        public DbSet<Product> Products { get; set; }

        //I've added the below line to update the database context class that manages the entity 
        //classes and that provides data access to the database.
        public DbSet<CartItem> ShoppingCartItems { get; set; }
    }
}

////To start using the classes for data access, 
//I must define a context class. As mentioned 
//previously, the context class manages the entity classes 
//    (such as the Product class and the Category class) and 
//        provides data access to the database.