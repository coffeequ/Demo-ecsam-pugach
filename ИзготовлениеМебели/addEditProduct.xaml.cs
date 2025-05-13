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
using System.Windows.Shapes;

namespace ИзготовлениеМебели
{
    /// <summary>
    /// Логика взаимодействия для addEditProduct.xaml
    /// </summary>
    public partial class addEditProduct : Window
    {
        Product product;
        public addEditProduct(Product product)
        {
            InitializeComponent();
            this.product = product;
            DataContext = product;
            cbTypeProduct.ItemsSource = MainWindow.созданиеМебелиEntites.ProductType.ToList();
            cbProductMaterialType.ItemsSource = MainWindow.созданиеМебелиEntites.ProductMaterialType.ToList();
        }

        private void btnOnSave(object sender, RoutedEventArgs e)
        {
            try
            {
                if (product.МинСтоимостьДляПартнера < 0)
                {
                    throw new Exception("Минимальная стоимость не должна быть отрицательной");
                }

                if(product.Код == 0)
                {
                    MainWindow.созданиеМебелиEntites.Product.Add(product);
                }
                MainWindow.созданиеМебелиEntites.SaveChanges();
                MessageBox.Show("Сохранения удалось!", "Сохранения", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
        }

        private void btnOnExit(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void btnOnMaps(object sender, RoutedEventArgs e)
        {
            new ViewMapWorkShop(product).Show();
        }
    }
}
