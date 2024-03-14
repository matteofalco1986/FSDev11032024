namespace Pizzeria.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class RequiredFieldsForGoodsAdd : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Goods", "Name", c => c.String(nullable: false, maxLength: 50));
            AlterColumn("dbo.Goods", "Price", c => c.Decimal(nullable: false, storeType: "money"));
            AlterColumn("dbo.Goods", "Ingredients", c => c.String(nullable: false, maxLength: 2500));
        }
        
        public override void Down()
        {

        }
    }
}
