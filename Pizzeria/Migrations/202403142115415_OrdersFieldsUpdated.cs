namespace Pizzeria.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class OrdersFieldsUpdated : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Orders", "Evaso", c => c.Boolean(nullable: false));
            AlterColumn("dbo.Orders", "Quantity", c => c.Int(nullable: false));
            AlterColumn("dbo.Orders", "DeliveryAddress", c => c.String(nullable: false, maxLength: 255));
            AlterColumn("dbo.Orders", "Notes", c => c.String(nullable: false, maxLength: 255));
        }
        
        public override void Down()
        {

        }
    }
}
