using System.ComponentModel.DataAnnotations;

namespace BusinessService.Models
{
    public class CartItem
    {
        [Key]
        public string ItemId { get; set; }

        public string CartId { get; set; }

        public int Quantity { get; set; }

        public System.DateTime DateCreated { get; set; }

        public int ProductId { get; set; }

        public virtual Product Product { get; set; }

    }
}

//The CartItem class contains the schema that will define 
// each product a user adds to the shopping cart. This 
// class is similar to the other schema classes you 
// created earlier in this tutorial series. 
// By convention, Entity Framework Code First expects that 
// the primary key for the CartItem table will be either 
// CartItemId or ID. However, the code overrides the default 
// behavior by using the data annotation [Key] attribute. 
// The Key attribute of the ItemId property specifies that the ItemID property is the primary key.