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
    /// Логика взаимодействия для ViewMapWorkShop.xaml
    /// </summary>
    public partial class ViewMapWorkShop : Window
    {
        Product product;

        List<WorkShops> workShops;

        List<WorkShops> res;

        public ViewMapWorkShop(Product product)
        {
            InitializeComponent();

            this.product = product;

            res = new List<WorkShops>();

            var productProductWorkShops = product.ProductWorkShops.ToList();

            workShops = MainWindow.созданиеМебелиEntites.WorkShops.ToList();

            foreach (var item in productProductWorkShops)
            {
                foreach (var item1 in workShops)
                {
                    if(item.КодЦеха == item1.Код)
                    {
                        res.Add(item1);
                    }
                }
            }

            int sumPeople = res.Sum(item => item.КоличествоЧелДляПроизодства);

            //Вывод наименований цехов
            foreach (var item in res)
            {
                lbMapWorks.Items.Add($"Наименование цеха: {item.НазаваниеЦеха}");
                lbMapWorks.Items.Add($"Тип цеха: {item.TypeWorkShops.Наименование}");
                lbMapWorks.Items.Add($"---");
            }

            lbMapWorks.Items.Add($"Задействено людей: {sumPeople}");
        }

        private void btnExit(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
