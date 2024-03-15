using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Pizzeria.Models
{
    public partial class DBContext : DbContext
    {
        public DBContext()
            : base("name=DBContext")
        {
        }

        public virtual DbSet<Good> Goods { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<OrderGood> OrderGoods { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Good>()
                .Property(e => e.Price)
                .HasPrecision(19, 4);

            modelBuilder.Entity<User>()
                .HasMany(e => e.Orders)
                .WithRequired(e => e.User)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Good>()
            .HasMany<Order>(s => s.Orders)
            .WithMany(c => c.Goods)
            .Map(cs =>
            {
                cs.MapLeftKey("GoodId");
                cs.MapRightKey("OrderId");
                cs.ToTable("OrderGoods");
            });

        }
    }
}
