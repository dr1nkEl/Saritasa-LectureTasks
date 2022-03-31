using Saritasa.JiraDayIssues.WPF.ViewModel;
using System.Windows;

namespace Saritasa.JiraDayIssues.WPF.View;

/// <summary>
/// Interaction logic for MainWindow.xaml.
/// </summary>
public partial class MainWindow : Window
{
    /// <summary>
    /// Constructor.
    /// </summary>
    /// <param name="context">Context.</param>
    public MainWindow(IssueViewModel context)
    {
        this.DataContext = context;
        InitializeComponent();
    }
}
