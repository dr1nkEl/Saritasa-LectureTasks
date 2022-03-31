using System;
using System.Windows.Input;

namespace Saritasa.JiraDayIssues.WPF.Commands;

/// <summary>
/// Command handler class.
/// </summary>
public class RelayCommand : ICommand
{
    private Action action;
    private Func<bool> canExecute;

    /// <summary>
    /// Creates instance of the command handler.
    /// </summary>
    /// <param name="action">Action to be executed by the command.</param>
    /// <param name="canExecute">A bolean property to containing current permissions to execute the command.</param>
    public RelayCommand(Action action, Func<bool> canExecute)
    {
        this.action = action;
        this.canExecute = canExecute;
    }

    /// <summary>
    /// Wires CanExecuteChanged event.
    /// </summary>
    public event EventHandler CanExecuteChanged
    {
        add { CommandManager.RequerySuggested += value; }
        remove { CommandManager.RequerySuggested -= value; }
    }

    /// <summary>
    /// Forcess checking if execute is allowed.
    /// </summary>
    /// <param name="parameter">Parameter.</param>
    /// <returns></returns>
    public bool CanExecute(object parameter)
    {
        CommandManager.InvalidateRequerySuggested();
        return canExecute.Invoke();
    }

    /// <summary>
    /// Execution method.
    /// </summary>
    /// <param name="parameter">Parameter.</param>
    public void Execute(object parameter)
    {
        action();
    }
}
