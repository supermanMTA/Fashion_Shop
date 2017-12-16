namespace Shop_Fashion.Models.Entities
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class MyContext : DbContext
    {
        public MyContext()
            : base("name=MyContext")
        {
        }

        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Contact> Contacts { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<Group> Groups { get; set; }
        public virtual DbSet<OrderDetail> OrderDetails { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<Review> Reviews { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Slide> Slides { get; set; }
        public virtual DbSet<Supplier> Suppliers { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<UserInRole> UserInRoles { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Contact>()
                .Property(e => e.Name)
                .IsFixedLength();

            modelBuilder.Entity<Contact>()
                .Property(e => e.Email)
                .IsFixedLength();

            modelBuilder.Entity<Contact>()
                .Property(e => e.Message)
                .IsFixedLength();

            modelBuilder.Entity<Customer>()
                .Property(e => e.Email)
                .IsFixedLength();

            modelBuilder.Entity<Product>()
                .Property(e => e.Size)
                .IsFixedLength()
                .IsUnicode(false);
        }
    }
}
