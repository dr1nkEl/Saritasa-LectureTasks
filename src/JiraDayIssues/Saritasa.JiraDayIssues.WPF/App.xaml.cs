using McMaster.Extensions.CommandLineUtils;
using NLog;
using NLog.Config;
using Saritasa.JiraDayIssues.WPF.Commands;
using System;
using System.Windows;

namespace Saritasa.JiraDayIssues.WPF;

/// <summary>
/// Interaction logic for App.xaml.
/// </summary>
public partial class App : Application
{
    private void Application_Startup(object sender, StartupEventArgs e)
    {
        LogManager.Configuration = new XmlLoggingConfiguration("NLog.config");
        CommandLineApplication.Execute<ProccessArguments>(e.Args);
        AppDomain.CurrentDomain.UnhandledException += ShowMessageBoxWithException;
    }

    private void ShowMessageBoxWithException(object sender, UnhandledExceptionEventArgs args)
    {
        MessageBox.Show(((Exception)args.ExceptionObject).Message);
    }
}