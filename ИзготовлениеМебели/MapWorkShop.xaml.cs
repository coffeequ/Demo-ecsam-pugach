using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ИзготовлениеМебели
{
    /// <summary>
    /// Логика взаимодействия для MapWorkShop.xaml
    /// </summary>
    public partial class MapWorkShop : Page
    {
        Product product;

        List<WorkShops> workShops;

        List<WorkShops> existsWorkShops;

        List<ProductWorkShops> existsProductWorkShop;
        public MapWorkShop(Product product)
        {
            InitializeComponent();

            this.product = product;

            workShops = MainWindow.созданиеМебелиEntites.WorkShops.ToList();

            existsProductWorkShop = product.ProductWorkShops.ToList();

            foreach (var item in workShops)
            {
                foreach (var item1 in existsProductWorkShop)
                {
                    if(item.Код == item1.Код)
                    {
                        existsWorkShops.Add(item);
                    }
                }
            }


        }

        private void btnExit(object sender, RoutedEventArgs e)
        {

        }
    }
}
