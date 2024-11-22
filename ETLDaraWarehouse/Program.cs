using ETLDaraWarehouse;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

class Program
{
    static void Main(string[] args)
    {
        // Cadenas de conexión definidas directamente en el código
        var northwindConnectionString =
            "Server=(localdb)\\DESKTOP-95PLPTJ\\MSSQLSERVER01;Database=norwind;Trusted_Connection=True;MultipleActiveResultSets=True;";
        var dataWarehouseConnectionString =
            "Server=(localdb)\\DESKTOP-95PLPTJ\\MSSQLSERVER01;Database=DWHNorthWindOrders;Trusted_Connection=True;MultipleActiveResultSets=True;";

        // Configuración del contenedor de dependencias
        var services = new ServiceCollection();
        services.AddDbContext<NorthwindContext>(options =>
            options.UseSqlServer(northwindConnectionString));
        services.AddDbContext<DataWarehouseContext>(options =>
            options.UseSqlServer(dataWarehouseConnectionString));

        var serviceProvider = services.BuildServiceProvider();

        // Proceso de limpieza de las dimensiones
        var cleaner = new DataCleaner(serviceProvider.GetService<DataWarehouseContext>());
        cleaner.CleanDimensions();


        var etlProcessor = new ETLProcessor(
            serviceProvider.GetService<NorthwindContext>(),
            serviceProvider.GetService<DataWarehouseContext>());
        
        etlProcessor.LoadDimCustomers();
        etlProcessor.LoadEmployees();
        etlProcessor.LoadCategories();
        etlProcessor.LoadShippers();
        etlProcessor.LoadSuppliers();
        etlProcessor.LoadProducts();

    }
}
