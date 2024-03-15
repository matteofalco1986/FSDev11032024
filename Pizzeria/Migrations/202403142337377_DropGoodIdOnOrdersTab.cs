namespace Pizzeria.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class DropGoodIdOnOrdersTab : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.Orders", "GoodId");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Orders", "GoodId", c => c.Int(nullable: false));
        }
    }
}
