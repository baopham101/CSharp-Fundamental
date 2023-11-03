using System.ComponentModel.DataAnnotations;
namespace Catalog.Entities;

public class Item
{
    [Key]
    public string Id { get; set; }
    public string Name { get; set; }
    public decimal Price { get; set; }
    public DateTimeOffset CreatedDateTime { get; set; }
    public string CreatedBy { get; set; }
}