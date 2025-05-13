using System;
using System.CodeDom;
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
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public static СозданиеМебелиEntities созданиеМебелиEntites;
        public MainWindow()
        {
            InitializeComponent();

            созданиеМебелиEntites = new СозданиеМебелиEntities();

            myLv.ItemsSource = созданиеМебелиEntites.Product.ToList();
        }

        private void myLv_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Product selectedItem = myLv.SelectedItem as Product;
            new addEditProduct(selectedItem).ShowDialog();
            myLv.ItemsSource = MainWindow.созданиеМебелиEntites.Product.ToList();
        }

        private void btnAdd(object sender, RoutedEventArgs e)
        {
            Product newProduct = new Product();
            new addEditProduct(newProduct).ShowDialog();
            myLv.ItemsSource = MainWindow.созданиеМебелиEntites.Product.ToList();
        }

        private void btnCalculate(object sender, RoutedEventArgs e)
        {
            resCalculate.Content += Calculate(13, 20, 1.06).ToString("f2") + " руб.";
        }

        /// <summary>
        /// Calculate
        /// </summary>
        /// <param name="КодЦеха">Идентификатор цеха</param>
        /// <param name="КодПродукции">Индентификатор продукции</param>
        /// <param name="КоэффициентНорм">Коэффициент нормализации</param>
        /// <returns> double или -1,если не найдена продукция / цех / или коэффициент не поподает в диапазон</returns>
        private double Calculate(int КодЦеха, int КодПродукции, double КоэффициентНорм)
        {
            Product product = MainWindow.созданиеМебелиEntites.Product.Find(КодПродукции);
            WorkShops workShops = MainWindow.созданиеМебелиEntites.WorkShops.Find(КодЦеха);

            if(product != null && workShops != null && КоэффициентНорм >= 1.05 && КоэффициентНорм <= 1.34)
            {
                return Math.Round(product.МинСтоимостьДляПартнера / (workShops.КоличествоЧелДляПроизодства * product.ProductType.Коэффициент * КоэффициентНорм), 2); ;
            }
            else
            {   
                return -1;
            }
        }
    }
}
