using Catalog.Entities;
using Microsoft.EntityFrameworkCore;
namespace Catalog.Data
{
    public class CatalogContext : DbContext
    {
        public CatalogContext (DbContextOptions<CatalogContext> options)
            : base(options)
        {
        }

        public DbSet<Item> Item { get; set; }
    }
}
